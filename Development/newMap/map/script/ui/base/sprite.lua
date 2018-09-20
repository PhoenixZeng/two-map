require 'ui.base.class'
require 'ui.base.panel'
local ui = require 'ui.client.util'
local model = [[
    Frame "SPRITE" "model%i" {
        BackgroundArt "%s",
        //SetAllPoints,
    }
]]
local model_map = {}

local function load_model(model_path)
    local hash = math.abs(ui.get_hash(model_path))
    if model_map[hash] ~= nil then 
        return 
    end
    model_map[hash] = 1
    local data = string.format(model,hash,model_path)
    load_fdf(data)
    return hash
end

sprite_class = extends( panel_class,{

    --模型 类型 和 基类
    _type   = 'model',
    _base   = 'SPRITE',

    sprite_map = {},


    --align 对齐
    create = function (model,x,y,width,height)
        local index = ui_base_class.create()
        local ui = {
            x = x,
            y = y,
            w = width,
            h = height,
            align = 4,
            children = {},
            _index = index,
            _name = "sprite_object_" .. tostring(index)
        }
        extends(sprite_class,ui)
        if ui.sprite_map[ui._name] ~= nil then 
            ui_base_class.destroy(ui._index)
            log.error('模型创建失败 字符串id已经存在')
            return 
        end 
  
        local panel = panel_class.create('',0,0,width,height)
        if panel == nil then 
            log.error('模型背景创建失败')
            return
        end
        ui._panel = panel 
        local hash = load_model(model_path)
        ui._type = string.format('%s%d',ui._type,hash)
        
        print(ui._type)
        ui.id = dzapi.DzCreateFrameByTagName( ui._base, ui._name, panel.id, ui._type,4)
        if ui.id == nil or ui.id == 0 then 
            panel:destroy()
            ui_base_class.destroy(ui._index)
            log.error('创建模型失败')
            return 
        end


        ui.sprite_map[ui._name] = ui
        ui.sprite_map[ui.id] = ui
        ui:set_position(x,y)
        --ui:set_control_size(width,height)
        return ui
    end,

    destroy = function (self)
        if self.id == nil or self.id == 0 then 
            return 
        end
        self._panel:destroy()
        dzapi.DzDestroyFrame(self.id)
        ui_base_class.destroy(self._index)
        self.sprite_map[self.id] = nil 
        self.sprite_map[self._name] = nil
        self.id = nil
        for index,object in ipairs(self.children) do
            object:destroy()
        end
    end,

    add_child = function (parent,model_path,x,y,width,height)
        local index = ui_base_class.create()
        local ui = {
            x = x,
            y = y,
            w = width,
            h = height,
            children = {},
            align = 'right',
            _index = index,
            _name = "sprite_object_" .. tostring(index)
        }
        extends(sprite_class,ui)

        if ui.sprite_map[ui._name] ~= nil then 
            ui_base_class.destroy(ui._index)
            log.error('创建模型失败 字符串id已存在')
            return 
        end 

        local panel = parent:add_panel('',0,0,width,height)
        if panel == nil then 
            log.error('模型背景创建失败')
            return
        end
        ui._panel = panel
        local hash = load_model(model_path)
        ui._type = string.format('%s%d',ui._type,hash)
        ui.id = dzapi.DzCreateFrameByTagName( ui._base, ui._name, panel.id, ui._type,0)
        if ui.id == nil or ui.id == 0 then 
            panel:destroy()
            ui_base_class.destroy(ui._index)
            log.error('创建模型失败')
            return 
        end
        
        table.insert(parent.children,ui)
        ui.sprite_map[ui._name] = ui
        ui.sprite_map[ui.id] = ui
        ui.parent = parent
 
        ui:set_position(x,y)
        ui:set_control_size(width,height)
        --ui:set_text(text)
        --dzapi.DzFrameSetPoint(ui.id,4,panel.id,4,0,-panel.h)
        return ui
    end,

    set_position = function (self,x,y)
        self._panel:set_position(x,y)
        local x = -self. w / 2 + self.parent.x + self.parent.w / 2 + x
        local y =  -1080 + self.parent.y + self.parent.h + y
        panel_class.set_position(self,x,y)
    end,

    set_control_size = function (self,width,height)
        panel_class.set_control_size(self,width,height)
        self._panel:set_control_size(width,height)
    end,

})

local mt = getmetatable(sprite_class)

mt.__tostring = function (self)
    local str = string.format('模型 %d',self.id)
    return str
end

