local ui    = require 'ui.client.util'


local equipment = {}
local equipment_bar_class

local type_table = {
    [1] = '项链' , [2] = '手镯' ,
    [3] = '头盔' , [4] = '武器' ,
    [5] = '衣服' , [6] = '裤子' ,
    [7] = '护手' , [8] = '鞋子' ,
}



local type_icon = {
    ['项链'] = 'image\\背包\\装备\\项链.tga',
    ['手镯'] = 'image\\背包\\装备\\手镯.tga',
    ['头盔'] = 'image\\背包\\装备\\头盔.tga',
    ['武器'] = 'image\\背包\\装备\\武器.tga',
    ['衣服'] = 'image\\背包\\装备\\衣服.tga',
    ['裤子'] = 'image\\背包\\装备\\裤子.tga',
    ['护手'] = 'image\\背包\\装备\\护手.tga',
    ['鞋子'] = 'image\\背包\\装备\\鞋子.tga',


    ['玉佩'] = 'image\\背包\\装备\\玉佩.tga',
    ['戒指'] = 'image\\背包\\装备\\戒指.tga',
    ['腰带'] = 'image\\背包\\装备\\腰带.tga',
    ['武器2']= 'image\\背包\\装备\\武器2.tga',
}

equipment_bar_class = extends( panel_class , {
    create = function (x,y,size)
        local interval = size / 4
        local value = size + interval
        local offset = interval / 2
        local slot_size = size + offset
        local button_size = size - offset
        local width = (slot_size + offset) * 2
        local height = (slot_size + offset) * 3

        --底层面板
        local path = "image\\背包\\package-background.tga"
        
        --槽位背景
        local slot_path = "image\\背包\\package-lattice-back-0.tga"

        
        local panel = panel_class.create(path,x,y,620,720)

        --禁止鼠标穿透
        panel:add_button('',0,0,panel.w,panel.h):set_enable(false)
   
        local model = panel:add_sprite('HeroMountainKing2.mdx',100,0,panel.w,panel.h)
        --print(model.id)
        --dzapi.DzFrameSetScale(model.id,30)
        panel.title_button = panel:add_title_button('','装备栏',0,0,620,64)

        local x = offset + 40
        local y = offset + 150
        panel.item_map = {}
        panel.button_list = {}
        for index,type_name in ipairs(type_table) do
            
            local slot = panel:add_panel(slot_path,x,y,slot_size,slot_size)

            local texture = slot:add_texture('',0,0,slot_size,slot_size)

            --创建一个按钮
            local button = slot:add_button("",offset,offset,button_size,button_size)
            button:set_enable_drag(true) --设置按钮可拖动


            --local text = button:add_text(type_name,0,0,button_size,button_size,15,'center')


            button.item_type = type_name
            table.insert(panel.button_list,button)
            button.slot_id = #panel.button_list

            --button.type_text = text
            button.texture = texture
            button.slot = slot

            local icon = type_icon[type_table[button.slot_id]]
            button:set_normal_image(icon)
            if index % 2 == 0 then
                x = offset + 40
                y = y + slot_size + 20
            else 
                x = slot_size + offset + 330
            end
        end
        panel.state_info_table = bind_state_table
        panel.state_tip_table = bind_tip_table
        bind_state_table = {}
        bind_tip_table = {}
        panel = extends(equipment_bar_class,panel)
        return panel
    end,


    create_item = function (self,item,slot_id)
        local button = self.button_list[slot_id]
        if button == nil then 
            return
        end
        button.item = item
        item.equipment_slot_id = slot_id
        self.item_map[slot_id] = item
        self.item_map[item:get_type()] = item

        button:set_normal_image(item:get_icon())
        button.texture:set_normal_image(item:get_type_icon())
        
        --button.type_text:set_text('')
    end,

    add_item = function (self,item)
        if item == nil or item:get_type() == nil then
            return
        end
        for index,button in ipairs(self.button_list) do
            if button.item_type == item:get_type() then
                self:add_slot_item(index,item)
                return
            end
        end
        print('没有符合类型的空栏位。')
    end,

    add_slot_item = function (self,slot_id,item)
        local button = self.button_list[slot_id]
        if button == nil then 
            return
        end
        if item == nil or item:get_type() == nil then 
            return
        end
        if button.item_type ~= item:get_type() then 
            print('该装备不能放在这个栏位。')
            return 
        end
        local old_item = button.item 
        self:create_item(item,slot_id)
        self.unit = item.unit
        
        local info = {
            type = 'equipment',
            func_name = 'on_use_equipment',
            params = {
                [1] = item.unit.handle,
                [2] = slot_id,
                [3] = item.page_id,
                [4] = item.slot_id
            }
        }
        
        ui.send_message(info)  
        local page_id = item.page_id 
        local slot_id = item.slot_id
        item:destroy()
        if old_item ~= nil then 
            ui.bag.item_class.copy_create(self.unit,page_id,slot_id,old_item)
        end 
        
    end,

    remove_item = function (self,equipment_slot_id,page_id,slot_id)
        local button = self.button_list[equipment_slot_id]
        if button == nil then 
            return
        end
        local item = button.item
        if item == nil then
            return 
        end
        local pos = item.unit:get_nil_slot(1) 
        if #pos == nil then 
            return
        end
        
        if page_id == nil or slot_id == nil then 
            page_id = pos[1][1]
            slot_id = pos[1][2]
        end
        ui.bag.item_class.copy_create(self.unit,page_id,slot_id,item)
        
        self.item_map[slot_id] = nil
        self.item_map[item:get_type()] = nil
        button.item = nil
        local icon = type_icon[type_table[equipment_slot_id]]
        button:set_normal_image(icon)
        --button.type_text:set_text(button.item_type)
        button.texture:set_normal_image('')

        local info = {
            type = 'equipment',
            func_name = 'on_remove_equipment',
            params = {
                [1] = self.unit.handle,
                [2] = equipment_slot_id,
                [3] = page_id,
                [4] = slot_id
            }
        }
        ui.send_message(info)  

        return true
    end,

    remove_item_list = function (self)
        for index,button in ipairs(self.button_list) do
            local icon = type_icon[type_table[button.slot_id]]
            button:set_normal_image(icon)
            button:stop_animation()
            button.texture:set_normal_image('')
            --button.type_text:set_text(button.item_type)
            button.item = nil
        end
    end,

    --背包拖拽物品事件 跨界面拖拽物品 需要从坐标上判断拖拽的目标按钮
    on_drag_bag_item = function (self,item,x,y)
        local button = nil

        for index,object in ipairs(self.button_list) do
            --判断坐标点在当前对象的区域内
            if object:point_in_rect(x,y) then
                button = object
                break
            end
        end
        if button == nil then
            return
        end

        if item == nil and item:get_type() ~= button.item_type then
            print('该装备不能放在这个栏位。')
            return
        end
        
        self:add_slot_item(button.slot_id,item)
    end,
    --拖放结束事件 拖动的按钮  目标按钮
    on_button_drag_and_drop = function (self,button,target_button)
        if button.item == nil then 
            return 
        end

        local x,y = ui.get_mouse_pos()
        --拖回背包里
        if ui.bag.ui ~= nil and ui.bag.ui.is_show == true and ui.bag.ui:point_in_rect(x,y) then
            ui.bag.ui:on_drag_bag_item(button.item,x,y)
        end
 
    end,
    --鼠标右键事件 右键 卸下物品
    on_button_right_clicked = function (self,button)
        if self:remove_item(button.slot_id) then
            if ui.bag.ui.is_show then
            else
                ui.bag.ui:show()
            end
        end
    end,

    --指向事件 指向显示说明
    on_button_mouse_enter = function (self,button)
        local item = button.item 
        if item == nil then 
            return
        end
        button:item_tooltip(item)
    end,

    
})

equipment.event = {

}

ui.register_event('equipment',equipment.event)

ui.equipment = equipment
local function initialize()
    local object = equipment_bar_class.create(200,200,96)
    object:hide()

    equipment.ui = object


end

initialize()


return equipment