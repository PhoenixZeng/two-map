require 'ui.base.class'
require 'ui.base.panel'

local font = [[
    Frame "TEXT" "text%d" {
        LayerStyle "IGNORETRACKEVENTS",
        FrameFont "resource\fonts\mtp.ttf", %f, "", 
    }
]]


local font_map = {}

local function load_font(font,size)
    if font_map[size] ~= nil then 
        return 
    end
    size = math.modf(size)
    font_map[size] = 1
    local data = string.format(font,size,size/1000)
    load_fdf(data)
end

text_class = extends( panel_class,{

    --文字 类型 和 基类
    _type   = 'text',
    _base   = 'TEXT',

    text_map = {},

    align_map = {
        topleft         = 0,
        top             = 1,
        topright        = 2,
        left            = 3,
        center          = 4,
        right           = 5,
        buttomleft      = 6,
        button          = 7,
        buttomright     = 8
    },

    --align 对齐
    create = function (text,x,y,width,height,font_size,align)
        font_size = font_size or 100
        local index = ui_base_class.create()
        local ui = {
            x = x,
            y = y,
            w = width,
            h = height,
            align = align or 0,
            children = {},
            _index = index,
            _name = "text_object_" .. tostring(index)
        }
        extends(text_class,ui)
        if ui.text_map[ui._name] ~= nil then 
            ui_base_class.destroy(ui._index)
            log.error('文字创建失败 字符串id已经存在')
            return 
        end 
  
        local panel = panel_class.create('',0,0,width,height)
        if panel == nil then 
            log.error('文字背景创建失败')
            return
        end
        ui._panel = panel 
        load_font(font,font_size)
        ui._type = string.format('%s%d',ui._type,font_size)
        ui.id = dzapi.DzCreateFrameByTagName( ui._base, ui._name, panel.id, ui._type,align or 0)
        if ui.id == nil or ui.id == 0 then 
            panel:destroy()
            ui_base_class.destroy(ui._index)
            log.error('创建文字失败')
            return 
        end

        

        ui.text_map[ui._name] = ui
        ui.text_map[ui.id] = ui
        ui:set_position(x,y)
        --ui:set_control_size(width,height)
        ui:set_text(text)
        return ui
    end,

    destroy = function (self)
        if self.id == nil or self.id == 0 then 
            return 
        end
        self._panel:destroy()
        dzapi.DzDestroyFrame(self.id)
        ui_base_class.destroy(self._index)
        self.text_map[self.id] = nil 
        self.text_map[self._name] = nil
        self.id = nil
        for index,object in ipairs(self.children) do
            object:destroy()
        end
    end,

    add_child = function (parent,text,x,y,width,height,font_size,align)
        font_size = font_size or 16
        local index = ui_base_class.create()
        local ui = {
            x = x,
            y = y,
            w = width,
            h = height,
            children = {},
            align = align or 0,
            _index = index,
            _name = "text_object_" .. tostring(index)
        }
        extends(text_class,ui)

        if ui.text_map[ui._name] ~= nil then 
            ui_base_class.destroy(ui._index)
            log.error('创建文字失败 字符串id已存在')
            return 
        end 

        local panel = parent:add_panel('',0,0,width,height)
        if panel == nil then 
            log.error('文字背景创建失败')
            return
        end
        ui._panel = panel
        if type(font_size) == 'boolean' then 
            ui._type = 'old_text'
        else
            load_font(font,font_size)
            ui._type = string.format('%s%d',ui._type,font_size)
        end
        ui.id = dzapi.DzCreateFrameByTagName( ui._base, ui._name, panel.id, ui._type,0)
        if ui.id == nil or ui.id == 0 then 
            panel:destroy()
            ui_base_class.destroy(ui._index)
            log.error('创建文字失败')
            return 
        end
        
        table.insert(parent.children,ui)
        ui.text_map[ui._name] = ui
        ui.text_map[ui.id] = ui
        ui.parent = parent

        ui:set_position(x,y)
        --ui:set_control_size(width,height)
        ui:set_text(text)

        return ui
    end,

    set_text = function (self,text)
        dzapi.DzFrameSetText(self.id,text)
    end,

    get_text = function (self)
        return dzapi.DzFrameGetText(self.id)
    end,

    set_text_size = function (self,size)
        dzapi.DzFrameSetTextSizeLimit(self.id,size)
    end,

    get_text_size = function (self)
        return dzapi.DzFrameGetTextSizeLimit(self.id)
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
        dzapi.DzFrameSetTextColor(self.id,color)
    end,
    set_control_size = function (self,width,height)
        ui_base_class.set_control_size(self,width,height)
        self._panel:set_control_size(width,height)
    end,

})
--批量重载方法
for name,func in pairs(ui_base_class) do
    if rawget(text_class,name) == nil then 
        text_class[name] = function (self,...)
            func(self,...)
            func(self._panel,...)
        end
    end
end
local mt = getmetatable(text_class)

mt.__tostring = function (self)
    local str = string.format('文本 %d',self.id)
    return str
end

