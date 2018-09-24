local ui            = require 'ui.client.util'
local game          = require 'ui.base.game'
local unit_class    = (require 'ui.client.unit').unit_class
local equipment = {}
local equipment_bar_class
local target_equipment_bar_class



local attribute = {
    '攻击', '护甲', '攻击间隔', '攻击速度', 
    '攻击范围',	'移动速度',	'减耗',	'冷却缩减',	'吸血',	'溅射',	
    '格挡',	'格挡伤害',	'暴击',	'暴击伤害',	'破甲',	'穿透',	'护盾',
}

local type_table = {
    [1] = '项链' , [2] = '手镯' ,
    [3] = '头盔' , [4] = '武器' ,
    [5] = '衣服' , [6] = '裤子' ,
    [7] = '护手' , [8] = '鞋子' ,
}



local type_icon = {
    ['项链'] = 'image\\装备栏\\项链.tga',
    ['手镯'] = 'image\\装备栏\\手镯.tga',
    ['头盔'] = 'image\\装备栏\\头盔.tga',
    ['武器'] = 'image\\装备栏\\武器.tga',
    ['衣服'] = 'image\\装备栏\\衣服.tga',
    ['裤子'] = 'image\\装备栏\\裤子.tga',
    ['护手'] = 'image\\装备栏\\护手.tga',
    ['鞋子'] = 'image\\装备栏\\鞋子.tga',


    ['玉佩'] = 'image\\装备栏\\玉佩.tga',
    ['戒指'] = 'image\\装备栏\\戒指.tga',
    ['腰带'] = 'image\\装备栏\\腰带.tga',
    ['武器2']= 'image\\装备栏\\武器2.tga',
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
        local path = "image\\装备栏\\equ_background.tga"
        
        --槽位背景
        local slot_path = "image\\背包\\package-lattice-back-0.tga"

        
        local panel = panel_class.create(path,x,y,800,680)

        --禁止鼠标穿透
        panel:add_button('',0,0,panel.w,panel.h):set_enable(false)
   
        --local model = panel:add_sprite('HeroMountainKing2.mdx',100,0,panel.w,panel.h)
        --print(model.id)
        --dzapi.DzFrameSetScale(model.id,30)
        panel.title_button = panel:add_title_button('','装备栏',0,0,800,64)

        --添加一个关闭按钮
        panel.close_button = panel:add_close_button()

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


            local text = button:add_text("",0,0,slot_size,slot_size,15,'buttomright')


            button.item_type = type_name
            table.insert(panel.button_list,button)
            button.slot_id = #panel.button_list

            button.text = text
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

        local text_map = {}
        for index,name in pairs(attribute) do 
            local y = index * 32 + 60
            local title = panel:add_text(name .. ' : ',560,y,200,32,12,'left')
            local text = panel:add_text('0',680,y,200,32,12,'left')
            text_map[name] = text
        end 
        panel.text_map = text_map
        
        panel.state_info_table = bind_state_table
        panel.state_tip_table = bind_tip_table
        bind_state_table = {}
        bind_tip_table = {}
        panel = extends(equipment_bar_class,panel)
        return panel
    end,

     --显示的时候刷新一下界面
     show = function (self)
        panel_class.show(self)
        if self.unit ~= nil then 
            self:update(self.unit)
        end 
    end,

    create_item = function (self,item,slot_id)
        local button = self.button_list[slot_id]
        if button == nil then 
            return
        end
        item.equipment_slot_id = slot_id
        local map = item.unit:get_equipment()
        map[item:get_type()] = item
        map[slot_id] = item 

        if self.unit == item.unit then 
            button:set_normal_image(item:get_icon())
            button.texture:set_normal_image(item:get_type_icon())

            if item.count > 0 then 
                button.text:set_text(tostring(item.count))
            else
                button.text:set_text('')
            end

        end 
        
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
        local old_item = item.unit:get_equipment_bar_item(slot_id)
        self:create_item(item,slot_id)
        
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

        local map = self.unit:get_equipment()

        local item = map[equipment_slot_id]
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
    
        map[equipment_slot_id] = nil
        map[item:get_type()] = nil

        local icon = type_icon[type_table[equipment_slot_id]]
        button:set_normal_image(icon)
        button.text:set_text("")
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
        end
    end,

    update = function (self,unit)
        local map = unit:get_equipment()
        for index,button in ipairs(self.button_list) do 
            local item = map[button.item_type]
            local text = button.text
            if item ~= nil then
                button:set_normal_image(item:get_icon())
                button.texture:set_normal_image(item:get_type_icon())

                if item.count > 0 then 
                    text:set_text(tostring(item.count))
                else
                    text:set_text('')
                end
                button:set_enable(item:is_enable())
                button:set_enable_drag(item:is_enable())
                if item:is_enable() == true then
                    text:set_alpha(0xff) --设置透明
                else
                    text:set_alpha(0xff*0.5)  --设置透明
                end

            else
                local icon = type_icon[button.item_type]
                button.texture:set_normal_image('')
                button:set_normal_image(icon)
                text:set_text('')
                text:set_alpha(0xff) --设置透明
            end
        end 
        self:update_state(unit)
    end,

    update_state = function (self,unit)
        for index,name in pairs(attribute) do 
            local text = self.text_map[name]
            local value = unit.state[name]
            if text ~= nil then 
                if value == nil then 
                    text:set_text('0')
                else 
                    --格式化字符串 只保留小数点后2位数字
                    local str = string.format('%.2f',value)
                    text:set_text(str)
                end 
            end 
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

        if button.slot_id == nil or self.unit == nil then 
            return 
        end

        local item = self.unit:get_equipment_bar_item(button.slot_id)
        if item == nil then 
            return 
        end 

        local x,y = ui.get_mouse_pos()
        --拖回背包里
        if ui.bag.ui ~= nil and ui.bag.ui.is_show == true and ui.bag.ui:point_in_rect(x,y) then
            ui.bag.ui:on_drag_bag_item(item,x,y)
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
        if button.slot_id == nil or self.unit == nil then 
            return 
        end 
        local item = self.unit:get_equipment_bar_item(button.slot_id)
        if item == nil then 
            return
        end
        button:item_tooltip(item)
    end,

    
})

--继承装备栏
target_equipment_bar_class = extends(equipment_bar_class,{

    create = function (x,y,size) 
        local panel = equipment_bar_class.create(x,y,size)
        return extends(target_equipment_bar_class,panel)
    end,
    
    show = function (self)
        if self.unit ~= nil then 
            self.title_button.text:set_text(GetUnitName(self.unit:get_handle()))
        end 
        equipment_bar_class.show(self)
    end,
    --屏蔽以下几个事件
    on_drag_bag_item = function (self,item,x,y)
    end,
    on_button_drag_and_drop = function (self,button,target_button)
    end,

    on_button_right_clicked = function (self,button)
    end,

    --重写指向事件 指向对比说明
    on_button_mouse_enter = function (self,button)
        if button.slot_id == nil or self.unit == nil then 
            return 
        end 
        local item = self.unit:get_equipment_bar_item(button.slot_id)
        if item == nil then 
            return
        end
        local my_item
        if equipment.ui.unit ~= nil then 
            my_item = equipment.ui.unit:get_equipment_bar_item(button.slot_id)
        end 
        button:item_tooltip(item,my_item)
    end,
})

equipment.event = {
    on_use_equipment = function (handle,slot_id,item)
        local unit = unit_class.get_object(handle)
        local type = type_table[slot_id]

        item.unit = unit
        setmetatable(item,{__index = ui.bag.item_class})
        unit.equipment[type] = item 
        unit.equipment[slot_id] = item

    end,

    on_remove_equipment = function (handle,slot_id)
        local unit = unit_class.get_object(handle)
        local type = type_table[slot_id]
        unit.equipment[type] = nil 
        unit.equipment[slot_id] = nil
    end,
}



local ALT = false 
local SelectUnit = nil
equipment.on_key_down = function (code)

    if code == KEY.ALT then 
        ALT = true 
        if SelectUnit ~= nil then 

            if equipment.ui.unit == SelectUnit then 
                equipment.ui:show() 
            else 
                equipment.target_ui.unit = SelectUnit
                equipment.target_ui:show()

            end 
            
        end 
    elseif code == KEY.ESC then 
        equipment.ui:hide()
        equipment.target_ui:hide()
    end 
    if code == KEY.R and ALT then 
        if equipment.ui.unit ~= nil then 
            if equipment.ui.is_show then 
                equipment.ui:hide()
            else 
                equipment.ui:show()
            end 
           
        end
    end 

end 

equipment.on_key_up = function (code)
    if code == KEY.ALT then 
        ALT = false 
    end 
end 

-- 指向单位事件
equipment.on_unit_mouse_enter = function (handle)

    local handle_id = GetHandleId(handle)

    SelectUnit = unit_class.unit_map[handle_id]
    --按住alt键
    if ALT and SelectUnit ~= nil  then 

        if equipment.ui.unit == SelectUnit then 
            equipment.ui:show()
        else 
            equipment.target_ui.unit = SelectUnit
            equipment.target_ui:show()
        end 
    end 
end 

-- 离开单位事件
equipment.on_unit_mouse_leave = function (handle)
    SelectUnit = nil
end



ui.register_event('equipment',equipment.event)
game.register_event(equipment)

ui.equipment = equipment
local function initialize()
    local object = equipment_bar_class.create(200,200,64)
    object:hide()

    equipment.ui = object

    local object = target_equipment_bar_class.create(1100,200,64)
    object:hide()

    equipment.target_ui = object


end

initialize()


return equipment