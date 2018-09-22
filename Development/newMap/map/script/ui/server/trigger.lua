local ui = require 'ui.server.util'
local bag = require 'ui.server.bag'
local trg = CreateTrigger()


--注册同步事件
dzapi.DzTriggerRegisterSyncData(trg,"ui",false)
TriggerAddAction(trg,function ()
    local message = dzapi.DzGetTriggerSyncData()
    local player = dzapi.DzGetTriggerSyncPlayer()
    ui.on_custom_ui_event(player,message)
end)

--注册拾取物品触发
trg = CreateTrigger()
TriggerRegisterAnyUnitEventBJ(trg, EVENT_PLAYER_UNIT_PICKUP_ITEM )
TriggerAddAction(trg,function ()
    local handle = GetManipulatedItem()
    local unit_handle = GetTriggerUnit()
    local hero = bag.unit_map[GetHandleId(unit_handle)]
    local item = bag.item_map[GetHandleId(handle)]
    if hero ~= nil and item ~= nil then 
        local pos = hero:get_nil_slot(1) --获取一个空槽位
        if pos ~= nil then 
            hero:add_item(item)
            print(handle)
            RemoveItem(GetManipulatedItem())
        else 
            print('捡起物品失败 背包满了')
        end
    end
end)

--注册选择单位触发 选择单位的时候 刷新背包
trg = CreateTrigger()
for i=0,11 do
    TriggerRegisterPlayerSelectionEventBJ(trg,Player(i),true)
end
TriggerAddAction(trg,function ()
    local unit = GetTriggerUnit()
    local player = GetTriggerPlayer()
    local group = GetUnitsSelectedAll(player)
    local count = CountUnitsInGroup(group)
    GroupClear(group)
    DestroyGroup(group)

    if count > 1 then 
        local info = {
            type = 'bag',
            func_name = 'on_close_bag',
        }
        ui.send_message(player,info)
        return 
    end 
    if GetOwningPlayer(unit) == player and IsUnitType(unit, UNIT_TYPE_HERO) then 
        local info = {
            type = 'bag',
            func_name = 'on_select_unit',
            params = {
                [1] = GetHandleId(unit),
            }
        }
        ui.send_message(player,info)
    end 
end)

function register_item_destroy_event(item_handle)
    local trg = CreateTrigger()
    TriggerRegisterDeathEvent(trg,item_handle)
    TriggerAddAction(trg,function ()
        local handle = GetTriggerWidget()
        if bag.item_map[GetHandleId(handle)] then 
            local info = {
                type = 'bag',
                func_name = 'on_discard_clear',
                params = {
                    [1] = GetHandleId(handle),
                }
            }
            ui.send_message(nil,info)
            bag.item_map[GetHandleId(handle)] = nil
            DestroyTrigger(trg)
            print('清除',handle)
        end
    end)
end