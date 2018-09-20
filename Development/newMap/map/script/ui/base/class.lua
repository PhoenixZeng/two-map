--[[

    基础类的封装 主要重载一些UI功能为对象形式

]]
--类的继承 子类继承父类
storm = require 'jass.storm'
dzapi = require 'jass.dzapi'
japi  = require 'jass.japi'

game_ui     = dzapi.DzGetGameUI()
game_width  = dzapi.DzGetWindowWidth()
game_height = dzapi.DzGetWindowHeight()

function load_fdf(data)
    storm.save('ui\\Load.fdf',data)
    storm.save('ui\\Load.toc','ui\\Load.fdf\r\n')
    dzapi.DzLoadToc('ui\\Load.toc')
end

function converScreenPosition(x,y)
    x = x / 1920 * 0.8
    y = (1080 - y) / 1080 * 0.6
    return x,y
end

function converScreenSize(width,height)
    width = width / 1920 * 0.8
    height = height / 1080 * 0.6
    return width,height
end


function extends (parent_class,child_class)
    local tbl = {}
    local mt = getmetatable(parent_class)
    if mt ~= nil then 
        tbl.__tostring = mt.__tostring
        tbl.__call = mt.__call
    end
    tbl.__index = parent_class
    setmetatable(child_class,tbl)
    return child_class
end


function event_callback (event_name,controls,...)
    local retval = true
    local object = controls
    while object ~= nil do
        if object.is_show == false then 
            return
        end
        object = object.parent
    end

    if controls[event_name] ~= nil then
        retval = controls[event_name](controls,...)
    end
    if controls.message_stop == true then --停止消息对父类的转发
        return 
    end
    if retval == nil then 
        retval = true
    end
    --将消息转发到父类对象里
    object = controls.parent
    while object ~= nil and retval ~= false do
        local method = object[event_name]
        if method ~= nil then
            retval = method(object,controls,...)
        end
        object = object.parent
    end
end



function get_str_line(str,count)
    local a = 1
    local b = 1
    local c = 0
    local line = 0
    count = count - 3
    str = str:gsub('|c%w%w%w%w%w%w%w%w','')
    str = str:gsub('|r','')
     while (a <= str:len()) do
        local s = str:sub(a,a)
        if s:byte() > 127 then
            c = c+1
            if c == 3 then
                c = 0
            end
        else
            c = 0
        end
        if (b > count and c == 0) or s == '\n' or a == str:len() then
            if s == '\n' then
                s = str:sub(a - b + 1,a - 1)
            else
                s = str:sub(a - b + 1,a)
            end
            line = line + 1
            b = 0
        end
        a = a+1
        b = b+1
    end
    return line
end

handle_system_class = {
    is_show = true,

    create = function ()
        local object = {}
        object.top = 1 
        object.stack = {}
        object.map = {}
        object.id_table = {}
        setmetatable(object,{__index = handle_system_class})
        return object
    end,

    destroy = function (self)
        
    end,
    create_handle = function (self)
        local id = self.top
        local stack = self.stack
        if #stack == 0 then
            id = self.top
            self.top = self.top + 1
        else
            id = stack[#stack]
            table.remove(stack,#stack)
            self.map[id] = nil
        end
        self.id_table[id] = 1
        return id
    end,

    close_handle = function (self,id)
        if self.id_table[id] == nil and self.map[id] ~= nil then
            ui_print('重复回收',id)
        elseif self.id_table[id] == nil then
            ui_print('非法回收',id)
        end
        if self.map[id] == nil and self.id_table[id] ~= nil then
            self.map[id] = 1
            self.id_table[id] = nil
            table.insert(self.stack,id)
        end
    end,


}


ui_base_class = {

    tooltip_list = {}, --存放所有提示框对象的列表

    ui_handle_system = handle_system_class.create(),

    create = function ()
        local handle = ui_base_class.ui_handle_system:create_handle()
        return handle
    end,

    destroy = function (id)
        ui_base_class.ui_handle_system:close_handle(id)
    end,

    
    show = function (self)
        self.is_show = true 
        dzapi.DzFrameShow(self.id,true)
    end,
    
    hide = function (self)
        self.is_show = false
        dzapi.DzFrameShow(self.id,false)
    end,
    

    set_alpha = function (self,value)
        if value <= 1 then 
            value = value * 0xff
        end
        dzapi.DzFrameSetAlpha(self.id,value)
    end,

    set_click = function (self)
        print('点击',self.id)
        dzapi.DzClickFrame(self.id)
    end,

    set_color = function (self,...)
        local arg = {...}
        local color =0
        if #arg == 1 then 
            color = arg[1]
        else 
            local r,g,b,a = table.unpack(arg)
            a = a * 0xff
            color = a * 0x1000000 + r * 0x10000 + g * 0x100 + b
        end
        self.color = color 

        dzapi.DzFrameSetVertexColor(self.id,color)
    end,

    get_alpha = function (self)
        return dzapi.DzFrameGetAlpha(self.id)
    end,

    get_position = function (self)
        return self.x,self.y
    end,

    set_position = function (self,x,y)
        self.x = x 
        self.y = y
        if self.parent == nil then 
            x,y = converScreenPosition(x,y)
            
            dzapi.DzFrameSetAbsolutePoint(self.id,0,x,y)
        else
            x =  x / 1920 * 0.8
            y = -y / 1080 * 0.6
            if self._base == 'TEXT' then 
                local align = self.align or 0
                if type(self.align) == 'string' then
                    align = self.align_map[self.align]
                end
                dzapi.DzFrameSetPoint(self.id,align,self._panel.id,align,0,0)--x,y)
                return
            end 
            dzapi.DzFrameSetPoint(self.id,0,self.parent.id,0,x,y)--x,y)
        end
    end,

    set_control_size = function (self,width,height)
        self.w = width
        self.h = height 
        width,height = converScreenSize(width,height)
        dzapi.DzFrameSetSize(self.id,width,height)
    end,

    set_normal_image = function (self,image_path,flag)
        if image_path == '' then 
            image_path = 'Transparent.tga'
        end
        self.normal_image = image_path
        dzapi.DzFrameSetTexture(self.id,image_path,flag or 0)
    end,

    set_tooltip = function(self,tip,x,y,width,height,font_size,offset)

        ui_base_class.remove_tooltip()

        offset = offset or 1
        local ox,oy
        if self ~= nil then 
            ox,oy = self:get_real_position()
            ox = ox + self.w / 2
        else
            ox = japi.GetMouseVectorX() / 1024
            oy = (-(japi.GetMouseVectorY() - 768)) / 768 
            ox = ox * 1920
            oy = oy * 1080
        end
       
        x = ox + x - width / 2 
        
        local path = 'image\\提示框\\Item_Prompt.tga'
        if type(tip) == 'string' then 
            local y = oy + y - height

            local panel = panel_class.create(path,x,y,width,height)
            local text = panel:add_text(tip,0,font_size,width,64,font_size,1) 
            panel:set_alpha(0.8)
            table.insert(ui_base_class.tooltip_list,panel)
        elseif type(tip) == 'table' then
            for index,data in ipairs(tip) do
                local title = data[1]
                local desc = data[2]
                local line = get_str_line(data[2],13*3-1)
                local max_height = (line + 3) * 27
                local ox = x + (index - 1) * (width + 50 ) * offset
                local y = oy + y - max_height
                if y < 0 then 
                    max_height = max_height + math.abs(y)
                end
                local panel = panel_class.create(path,ox,y,width,max_height)
                panel:set_alpha(0.8)

                local text = panel:add_text(title,0,font_size,width,64,font_size,'top') 
                
                local text2 = panel:add_text(desc,32,64,width,max_height,font_size,'left')
                text2:set_control_size(width-64,max_height)
                table.insert(ui_base_class.tooltip_list,panel)
            end
        end
    end,

    remove_tooltip = function ()
        for index,control in ipairs(ui_base_class.tooltip_list) do 
            control:destroy()
            table.remove(ui_base_class.tooltip_list,index)
        end
    end,

    item_tooltip = function (self,...)
        local arg = {...}
        if #arg == 0 then 
            return 
        end
 
        local tip = {}
        for i=1,#arg do
            tip[#tip + 1] = arg[i]:get_tip()
        end
        ui_base_class.set_tooltip(self,tip,0,0,360,80,15,-1)
    end,

    get_this_class = function (self)
        local metatable = getmetatable(self)
        return metatable.__index
    end,
    
    get_parent_class = function (self)
        local class = self:get_this_class()
        if class ~= nil then
            local metatable = getmetatable(class)
            return metatable.__index
        end
        return nil
    end,

    point_in_rect = function (self,x,y)
        local ox,oy = self:get_real_position()
        if x >= ox and 
            y >= oy and
            x <= ox + self.w and
            y <= oy + self.h 
            
        then
            return true
        end
        return false
    end,

    --获取实际坐标 父控件坐标 + 子控件偏移
    get_real_position = function (self)
        local ox,oy = 0,0
        local object = self 
        while object ~= nil do
            ox = ox + (object.x or 0)
            oy = oy + (object.y or 0)
            object = object.parent
        end
        return ox,oy
    end,

    
    
}

