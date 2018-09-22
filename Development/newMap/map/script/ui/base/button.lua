require 'ui.base.class'
require 'ui.base.panel'


button_class = extends( panel_class,{

    --按钮 类型 和 基类
    _type   = 'TestButton',
    _base   = 'GLUETEXTBUTTON',

    button_map = {},

    create = function (image_path,x,y,width,height)
        
        local index = ui_base_class.create()
        local ui = {
            x = x,
            y = y,
            w = width,
            h = height,
            is_enable = true,
            normal_image = image_path,
            children = {},
            _index = index,
            _name = "button_object_" .. tostring(index)
        }
        extends(button_class,ui)
        if ui.button_map[ui._name] ~= nil then 
            ui_base_class.destroy(ui._index)
            log.error('按钮创建失败 字符串id已经存在')
            return nil
        end 
     
        ui.id = dzapi.DzCreateFrameByTagName( ui._base, ui._name, game_ui, ui._type,0)

        if ui.id == nil or ui.id == 0 then 
            ui_base_class.destroy(ui._index)
            log.error('创建按钮失败')
            return 
        end

        local panel = ui:add_panel(image_path,0,0,width,height)
        if panel == nil then 
            ui:destroy()
            log.error('按钮背景创建失败')
            return
        end
        table.remove(ui.children,1)
        ui._panel = panel 

        ui.button_map[ui._name] = ui
        ui.button_map[ui.id] = ui
        ui:set_position(x,y)
        ui:set_control_size(width,height)

        return ui
    end,

    destroy = function (self)
        if self.id == nil or self.id == 0 then 
            return 
        end
        dzapi.DzDestroyFrame(self.id)
        ui_base_class.destroy(self._index)
        self.button_map[self.id] = nil 
        self.button_map[self._name] = nil
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
            is_enable = true,
            normal_image = image_path,
            children = {},
            _index = index,
            _name = "button_object_" .. tostring(index)
        }
        extends(button_class,ui)

        if ui.button_map[ui._name] ~= nil then 
            ui_base_class.destroy(ui._index)
            log.error('创建按钮失败 字符串id已存在')
            return 
        end 
        ui.id = dzapi.DzCreateFrameByTagName( ui._base, ui._name, parent.id, ui._type,0)

        if ui.id == nil or ui.id == 0 then 
            ui_base_class.destroy(ui._index)
            log.error('创建按钮失败')
            return 
        end

        local panel = ui:add_panel(image_path,0,0,width,height)
        if panel == nil then 
            ui:destroy()
            log.error('按钮背景创建失败')
            return
        end

        table.remove(ui.children,1)
        table.insert(parent.children,ui)
        ui._panel = panel
        ui.button_map[ui._name] = ui
        ui.button_map[ui.id] = ui
        ui.parent = parent

        ui:set_position(x,y)
        ui:set_control_size(width,height)
  
        return ui
    end,

 
    set_enable = function (self,is_enable)
        self.is_enable = is_enable
        if is_enable then 
            if self._normal ~= nil then 
                self._normal:destroy()
                self._normal = nil
            end
        else
            if self._normal == nil then 
                self._normal = self:add_texture('image\\提示框\\Item_Prompt.tga',0,0,self.w,self.h)
                self._normal:set_alpha(0.7)
            end
        end
    end,

    set_message_stop = function (self,is_stop)
        self.message_stop = is_stop
    end,

    set_enable_drag = function (self,enable)
        self.is_drag = enable
    end,

    set_normal_image = function (self,image_path,flag)
        self.normal_image = image_path
        self._panel:set_normal_image(image_path,flag)
    end,


    -----------------所有按钮事件------------------

    --[[
    --左键点击
    on_button_clicked = function (self)
        print('左键点击',tostring(self))
    end,

    --左键按下
    on_button_mousedown = function (self)
        print('左键按下',tostring(self))
    end,

    --左键弹起
    on_button_mouseup = function (self)
        print('左键弹起',tostring(self))
    end,

    --右键点击
    on_button_right_clicked = function (self)
        print('右键点击',tostring(self))
    end,

    --右键按下
    on_button_right_mousedown = function (self)
        print('右键按下',tostring(self))
    end,

    --右键弹起
    on_button_right_mouseup = function (self)
        print('右键弹起',tostring(self))
    end,

    --鼠标进入
    on_button_mouse_enter = function (self)
        print('鼠标进入',tostring(self))
    end,

    --鼠标离开
    on_button_mouse_leave = function (self)
        print('鼠标离开',tostring(self))
    end,

    --开始拖拽按钮
    on_button_begin_drag = function (self)
        print('开始拖拽按钮',tostring(self))
    end,
    
    --拖拽结束
    -- self 自身拖拽的按钮  target 拖拽点上的按钮  如果拖到空地 target则为nil
    on_button_drag_and_drop = function (self,target)
        print('拖拽结束',tostring(self),tostring(target))
    end,

    --拖拽更新事件 icon为拖拽时生成的texture图像 可以改变大小 图像内容 不要自己删除。 
    -- x,y 为鼠标坐标
    on_button_update_drag = function (self,icon,x,y)
        print('拖拽更新事件',tostring(self),tostring(icon),x,y)
    end,]]

})

local mt = getmetatable(button_class)

mt.__tostring = function (self)
    local str = string.format('按钮 %d',self.id)
    return str
end
