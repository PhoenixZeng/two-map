require 'ui.base.class'
require 'ui.base.panel'
local edit_fpf = [[
    Frame "EDITBOX" "edit%d" {
        EditTextFrame "edit_text%d",
        Frame "TEXT" "edit_text%d" {
            LayerStyle "IGNORETRACKEVENTS",
            FrameFont "MasterFont", %f, "", 
        }
    }
]]

local edit_map = {}

local function load_edit(fpf,size)
    if edit_map[size] ~= nil then 
        return 
    end
    size = math.modf(size)
    edit_map[size] = 1
    local data = string.format(fpf,size,size,size,size/1000)
    load_fdf(data)
end


edit_class = extends( panel_class,{

    --文本框 类型 和 基类
    _type   = 'edit',
    _base   = 'EDITBOX',

    edit_map = {},
    --align 对齐
    create = function (image_path,x,y,width,height,font_size)
        font_size = font_size or 100
        local index = ui_base_class.create()
        local ui = {
            x = x,
            y = y,
            w = width,
            h = height,
            children = {},
            _index = index,
            _name = "edit_object_" .. tostring(index)
        }
        extends(edit_class,ui)
        if ui.edit_map[ui._name] ~= nil then 
            ui_base_class.destroy(ui._index)
            log.error('文本框创建失败 字符串id已经存在')
            return 
        end 
  
        local panel = panel_class.create(image_path,x,y,width,height)
        if panel == nil then 
            log.error('文本框背景创建失败')
            return
        end
        ui._panel = panel 
        load_edit(edit_fpf,font_size)
        ui._type = string.format('%s%d',ui._type,font_size)

        ui.id = dzapi.DzCreateFrameByTagName( ui._base, ui._name, panel.id, ui._type,align or 0)
        if ui.id == nil or ui.id == 0 then 
            panel:destroy()
            ui_base_class.destroy(ui._index)
            log.error('创建文本框失败')
            return 
        end

        

        ui.edit_map[ui._name] = ui
        ui.edit_map[ui.id] = ui
        ui:set_position(x,y)
        ui:set_control_size(width,height)
       -- ui:set_text(edit)
        return ui
    end,

    destroy = function (self)
        if self.id == nil or self.id == 0 then 
            return 
        end
        self._panel:destroy()
        dzapi.DzDestroyFrame(self.id)
        ui_base_class.destroy(self._index)
        self.edit_map[self.id] = nil 
        self.edit_map[self._name] = nil
        self.id = nil
        for index,object in ipairs(self.children) do
            object:destroy()
        end
    end,

    add_child = function (parent,image_path,x,y,width,height,font_size)
        font_size = font_size or 16
        local index = ui_base_class.create()
        local ui = {
            x = x,
            y = y,
            w = width,
            h = height,
            children = {},
            _index = index,
            _name = "edit_object_" .. tostring(index)
        }
        extends(edit_class,ui)

        if ui.edit_map[ui._name] ~= nil then 
            ui_base_class.destroy(ui._index)
            log.error('创建文本框失败 字符串id已存在')
            return 
        end 

        local panel = parent:add_panel(image_path,x,y,width,height)
        if panel == nil then 
            log.error('文本框背景创建失败')
            return
        end
        ui._panel = panel
        load_edit(edit_fpf,font_size)
        ui._type = string.format('%s%d',ui._type,font_size)
        ui.id = dzapi.DzCreateFrameByTagName( ui._base, ui._name, panel.id, ui._type,0)
        if ui.id == nil or ui.id == 0 then 
            panel:destroy()
            ui_base_class.destroy(ui._index)
            log.error('创建文本框失败')
            return 
        end
        
        table.insert(parent.children,ui)
        ui.edit_map[ui._name] = ui
        ui.edit_map[ui.id] = ui
        ui.parent = parent

        ui:set_position(x,y)
        ui:set_control_size(width,height)
        --ui:set_text(edit)

        return ui
    end,

    set_text = function (self,edit)
        dzapi.DzFrameSetText(self.id,edit)
    end,

    get_text = function (self)
        return dzapi.DzFrameGetText(self.id)
    end,

    set_focus = function (self,is_enable)
        if is_enable then 
            japi.SetEditFocus(self.id)
            japi.SendMessage(0x207,0,0)
            japi.SendMessage(0x208,0,0)
            dzapi.DzFrameSetFocus(self.id,is_enable)
            for i=1,self:get_text():len() do
                japi.SendMessage(0x100,KEY.RIGHT,0)
                japi.SendMessage(0x101,KEY.RIGHT,1,0)
            end
        else
            dzapi.DzFrameSetFocus(self.id,is_enable)
        end
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

local mt = getmetatable(edit_class)

mt.__tostring = function (self)
    local str = string.format('文本框 %d',self.id)
    return str
end

