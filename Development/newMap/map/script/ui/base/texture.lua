require 'ui.base.panel'



texture_class = extends( panel_class,{
    --图片 类型 和基类
    _type  = 'panel',
    _base  = 'BACKDROP',

    texture_map = {},
    create = function (image_path,x,y,width,height)
        local index = ui_base_class.create()
        local ui = {
            x = x,
            y = y,
            w = width,
            h = height,
            children = {},
            _index = index,
            _name = "texture_object_" .. tostring(index)
        }
        extends(texture_class,ui)
        if ui.texture_map[ui._name] ~= nil then 
            ui_base_class.destroy(ui._index)
            log.error('创建图片失败 字符串id已存在')
            return 
        end 
     
        ui.id = dzapi.DzCreateFrameByTagName( ui._base, ui._name, game_ui, ui._type,0)
        if ui.id == nil or ui.id == 0 then 
            ui_base_class.destroy(ui._index)
            log.error('创建图片失败')
            return 
        end
  
        ui.texture_map[ui._name] = ui
        ui.texture_map[ui.id] = ui

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
        self.texture_map[self.id] = nil 
        self.texture_map[self._name] = nil
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
            children = {},
            _index = index,
            _name = "texture_object_" .. tostring(index)
        }
        extends(texture_class,ui)

        if ui.texture_map[ui._name] ~= nil then 
            ui_base_class.destroy(ui._index)
            log.error('创建图片失败 字符串id已存在')
            return 
        end 
     
        ui.id = dzapi.DzCreateFrameByTagName( ui._base, ui._name, parent.id, ui._type,0)
        if ui.id == nil or ui.id == 0 then 
            ui_base_class.destroy(ui._index)
            log.error('创建图片失败')
            return 
        end
   
        table.insert(parent.children,ui)

        ui.texture_map[ui._name] = ui
        ui.texture_map[ui.id] = ui
        ui.parent = parent
        
        ui:set_position(x,y)
        ui:set_control_size(width,height)
        ui:set_normal_image(image_path)
        return ui
    end,
})

local mt = getmetatable(texture_class)

mt.__tostring = function (self)
    local str = string.format('图像 %d',self.id)
    return str
end
