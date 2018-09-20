require 'ui.base.class'

panel_class = extends( ui_base_class,{

    --背景 类型 和基类
    _type  = 'panel',
    _base  = 'BACKDROP',

    panel_map = {},
    create = function (image_path,x,y,width,height)
        local index = ui_base_class.create()
        local ui = {
            x = x,
            y = y,
            w = width,
            h = height,
            normal_image = image_path,
            children = {},
            _index = index,
            _name = "panel_object_" .. tostring(index)
        }
        extends(panel_class,ui)

        if ui.panel_map[ui._name] ~= nil then 
            ui_base_class.destroy(ui._index)
            log.error('创建背景失败 字符串id已存在')
            return 
        end 
     
        ui.id = dzapi.DzCreateFrameByTagName( ui._base, ui._name, game_ui, ui._type,0)
        if ui.id == nil or ui.id == 0 then 
            ui_base_class.destroy(ui._index)
            log.error('创建背景失败')
            return 
        end
  
        ui.panel_map[ui._name] = ui
        ui.panel_map[ui.id] = ui

        ui:set_position(x,y)
        ui:set_control_size(width,height)
        ui:set_normal_image(image_path)
        return ui
    end,

    destroy = function (self)
        if self.id == nil or self.id == 0 then 
            return 
        end
        dzapi.DzDestroyFrame(self.id)
        ui_base_class.destroy(self._index)
        self.panel_map[self.id] = nil 
        self.panel_map[self._name] = nil
        self.id = nil

        for index,object in ipairs(self.children) do
            object:destroy()
        end

    end,

    add_child = function (parent,image_path,x,y,width,height)
        local index = ui_base_class.create()
        local ui = {
            x = x,
            y = y,
            w = width,
            h = height,
            normal_image = image_path,
            children = {},
            _index = index,
            _name = "panel_object_" .. tostring(index)
        }
        extends(panel_class,ui)
        if ui.panel_map[ui._name] ~= nil then 
            ui_base_class.destroy(ui._index)
            log.error('创建背景失败 字符串id已存在')
            return 
        end 
     
        ui.id = dzapi.DzCreateFrameByTagName( ui._base, ui._name, parent.id, ui._type,0)
        if ui.id == nil or ui.id == 0 then 
            ui_base_class.destroy(ui._index)
            log.error('创建背景失败')
            return 
        end
   
        table.insert(parent.children,ui)

        ui.panel_map[ui._name] = ui
        ui.panel_map[ui.id] = ui
        ui.parent = parent
        
        ui:set_position(x,y)
        ui:set_control_size(width,height)
        ui:set_normal_image(image_path)
        return ui
    end,

    
    add_panel = function (...)
        return panel_class.add_child(...)
    end,

    add_button = function (...)
        return button_class.add_child(...)
    end,

    add_text = function (...)
        return text_class.add_child(...)
    end,

    add_texture = function (...)
        return texture_class.add_child(...)
    end,
    add_sprite = function (...)
        return sprite_class.add_child(...)
    end,
    add_edit = function (...)
        return edit_class.add_child(...)
    end,

     --添加一个可以拖动的标题 来拖动整个界面
    add_title_button = function (self,image_path,title,x,y,width,height,font_size)
        local button = self:add_button(image_path,x,y,width,height)
        button.text = button:add_text(title,0,0,width,height,font_size,4)
        button.message_stop = true
        button:set_enable_drag(true)

        --移动
        button.on_button_update_drag = function (self,icon_button,x,y)
            icon_button:set_control_size(0,0)
            self.parent:set_position(x,y)
            return false 
        end
        return button
    end,

})

local mt = getmetatable(panel_class)

mt.__tostring = function (self)
    local str = string.format('面板 %d',self.id)
    return str
end