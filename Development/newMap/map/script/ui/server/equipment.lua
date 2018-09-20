local bag = require 'ui.server.bag'
local ui = require 'ui.server.util'
local equipment = {}
for i=1,12 do 
    local player = ac.player(i)
    player.equipment = {}
end



equipment.event = {

    on_use_equipment = function (unit_handle,equipment_slot_id,page_id,slot_id)
        local player = ac.player(GetPlayerId(ui.player) + 1)
        local unit = bag.unit_map[unit_handle]
 
        if unit == nil then 
            return 
        end 
        local item = unit:get_item(page_id,slot_id)

        if item == nil then 
            return 
        end
        local old_item = player.equipment[equipment_slot_id]

        player.equipment[equipment_slot_id] = item 
        unit.bag[page_id][slot_id] = nil
        item.page_id = 0
        item.slot_id = 0
        item.equipment_slot_id = equipment_slot_id
        equipment.on_use_equipment(unit,item)
        if old_item ~= nil then 
            unit.bag[page_id][slot_id] = old_item
            old_item.page_id = page_id
            old_item.slot_id = slot_id
            old_item.equipment_slot_id = nil
            equipment.on_remove_equipment(unit,old_item)
        end
    end,

    on_remove_equipment = function (unit_handle,equipment_slot_id,page_id,slot_id)
        local player = ac.player(GetPlayerId(ui.player) + 1)
        local unit = bag.unit_map[unit_handle]
        if unit == nil then 
            return 
        end 
        local item = player.equipment[equipment_slot_id]
        if item == nil then 
            return 
        end
        
        if unit.bag[page_id][slot_id] ~= nil then 
            return 
        end 
        unit.bag[page_id][slot_id] = item
        item.page_id = page_id
        item.slot_id = slot_id
        player.equipment[equipment_slot_id] = nil
        item.equipment_slot_id = nil
        equipment.on_remove_equipment(unit,item)
    end,
}

--单位装备事件 
equipment.on_use_equipment = function (unit,item)
    print(unit.handle,'装备',item:get_name())
    local base_state = item:get_base_state()
    if base_state ~= nil then 
        for index,state in ipairs(base_state) do
            unit:add(state.name,state.value)
        end
    end
    for index,state in ipairs(item:get_rand_state_table()) do
        unit:add(state[1],state[2])
    end

end

--单位移除装备事件 
equipment.on_remove_equipment = function (unit,item)
    local base_state = item:get_base_state()
    if base_state ~= nil then 
        for index,state in ipairs(base_state) do
            unit:add(state.name,-state.value)
        end
    end
    for index,state in ipairs(item:get_rand_state_table()) do
        unit:add(state[1],-state[2])
    end
    print(unit.handle,'移除',item:get_name())
end

local function initialize()

    ui.register_event('equipment',equipment.event)

end

initialize()

return equipment