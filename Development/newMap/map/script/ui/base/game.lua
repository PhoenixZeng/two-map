local hook = require 'jass.hook'
local japi = require 'jass.japi'


local base
local left_is_down = false
local right_is_down = false
local is_active = true
local width,height = 0,0
local pointer


local game_event = {}


--事件函数名
local event_name = nil

--条件函数表 如果逻辑不成立 事件将不转发
local event_boolexpr = {}
--回调的事件表
local callback_table = nil


--事件回调
game_event_callback = function (name,...)

    local hash_table = {}
    for index,event_table in ipairs(game_event) do
        local func = event_table[name]
        if func ~= nil then 
            func(...)
        end 
    end
end

game = {}
game.register_event = function(module)
    table.insert(game_event, module)
end




local function get_handle_type (handle)
    if handle == nil then 
        return nil
    end 

    if GetHandleId(handle) == 0x100000 then 
        return nil 
    end

    local retval
    RemoveSavedHandle(ht,1,1)
    SaveFogStateHandle(ht,1,1,handle)
    if LoadItemHandle(ht,1,1) ~= nil then 
        retval = 1
    elseif LoadUnitHandle(ht,1,1) ~= nil then
        retval = 2
    end
    RemoveSavedHandle(ht,1,1)
    return retval
end

ht = InitHashtable()

--创建一个异步运行的计时器 用来检测拖拽时间
local timer = CreateTimer()
TimerStart(timer,0,false,function ()end)


--创建一个同步的计时器 来检测 窗口是否被激活
--如果不为激活 则响应鼠标弹起事件
TimerStart(CreateTimer(),0.1,true,function ()
    local object = japi.GetTargetObject()
    if object ~= nil then 
        if object ~= pointer  then 
            local type = get_handle_type(pointer)

            if type == 1 then 
                base.on_item_mouse_leave(pointer)
                
            elseif type == 2 then 
                base.on_unit_mouse_leave(pointer)
            end
            type = get_handle_type(object)
            
            if type == 1 then 
                base.on_item_mouse_enter(object)
            elseif type == 2 then
                base.on_unit_mouse_enter(object)
            end
            pointer = object
        end
    end
    
    if dzapi.DzIsWindowActive() == false and is_active == true then 
        is_active = false
        if left_is_down or right_is_down then 
            base.on_mouse_up()
            base.on_mouse_right_up()
        end
    else
        is_active = true
    end
end)


--鼠标按下的时候 把响应的按钮收集起来 以便弹起的时候 来响应弹起事件
local left_button_list = {}
local right_button_list = {}

local event = {}

local function register_event(event_id,callback)
    event[event_id] = callback
end



--创建一个按钮 用来当做拖拽时的影子
local texture = nil
base = {
    
    on_mouse_down = function ()
        local id = dzapi.DzGetMouseFocus()
        local button = button_class.button_map[id]

        left_is_down = true

        if button ~= nil then
            event_callback('on_button_mousedown',button)
            table.insert(left_button_list,button)

            if button.is_drag == true then 
                
                width,height = button.w,button.h
                TimerStart(timer,0.15,false,function ()
                    if left_is_down == true then 
                        if texture ~= nil then 
                            base.on_mouse_up()
                        end

                        local x = japi.GetMouseVectorX() / 1024 * 1920
                        local y = (-(japi.GetMouseVectorY() - 768)) / 768 * 1080
                        x = x - button.w / 2
                        y = y - button.h / 2
                        texture = texture_class.create(button.normal_image,x,y,width,height)
                        texture.button = button
                        texture:set_alpha(100)
                        event_callback('on_button_begin_drag',button)
                    end
                end)

            end
        end

    end,

    on_mouse_up = function ()
        local id = dzapi.DzGetMouseFocus()
        local button = button_class.button_map[id]

        left_is_down = false
        if texture ~= nil then 
            if button == texture.button then 
                event_callback('on_button_drag_and_drop',texture.button)
            else
                event_callback('on_button_drag_and_drop',texture.button,button)
            end
            texture:destroy()
            texture = nil
        end 
        for index,object in ipairs(left_button_list) do
            if object ~= button then 
                event_callback('on_button_mouseup',object)
            else
                event_callback('on_button_mouseup',object)
                if object.is_enable then
                    event_callback('on_button_clicked',object)
                end
            end
            table.remove(left_button_list,index)
        end

        local handle = japi.GetTargetObject()
        local type = get_handle_type(handle)
        if type == 1 then 
            game_event_callback('on_item_clicked',handle)
        elseif type == 2 then 
            game_event_callback('on_unit_clicked',handle)
        end

    end,

    on_mouse_right_down = function ()
        local id = dzapi.DzGetMouseFocus()
        local button = button_class.button_map[id]

        right_is_down = true

        if button ~= nil then 
            event_callback('on_button_right_mousedown',button)
            table.insert(right_button_list,button)
        end 

    end,

    on_mouse_right_up = function ()
        local id = dzapi.DzGetMouseFocus()
        local button = button_class.button_map[id]

        right_is_down = false 

        for index,object in ipairs(right_button_list) do
            if object ~= button then 
                event_callback('on_button_right_mouseup',object)
            else
                event_callback('on_button_right_mouseup',object)
                event_callback('on_button_right_clicked',button)
            end
            table.remove(right_button_list,index)
        end

        local handle = japi.GetTargetObject()
        local type = get_handle_type(handle)
        if type == 1 then 
            game_event_callback('on_item_right_clicked',handle)
        elseif type == 2 then 
            game_event_callback('on_unit_right_clicked',handle)
        end

    end,

    on_mouse_move = function ()
        
        local x = japi.GetMouseVectorX() / 1024
        local y = (-(japi.GetMouseVectorY() - 768)) / 768 
        x = x * 1920
        y = y * 1080
        if texture ~= nil then 
            local button = texture.button
            texture:set_position(x - texture.w / 2,y - texture.h / 2)
            event_callback('on_button_update_drag',button,texture,x - button.w / 2,y - button.h / 2)
        end 
        for id,button in pairs(button_class.button_map) do
            local ox,oy = button:get_real_position()
         
            if x >= ox and  y >= oy and x <= ox + button.w and y <= oy + button.h then
                if button.is_enter == nil then 
                    event_callback('on_button_mouse_enter',button)
                    button.is_enter = true
                end
            elseif button.is_enter == true then 
                ui_base_class.remove_tooltip()
                event_callback('on_button_mouse_leave',button)
                button.is_enter = nil
            end
            
        end
    end,

    on_mouse_wheeldelta = function ()
        --game_event_callback('on_mouse_wheeldelta',dzapi.GetWheelDelta())
    end,

    on_key_down = function ()
        game_event_callback('on_key_down',dzapi.DzGetTriggerKey())
    end,

    on_key_up = function ()
        game_event_callback('on_key_up',dzapi.DzGetTriggerKey())
    end,

    --指向物品事件
    on_item_mouse_enter = function (item_handle)
        game_event_callback('on_item_mouse_enter',item_handle)
        --print('进入物品',item_handle)
    end,

    --离开物品事件
    on_item_mouse_leave = function (item_handle)
        game_event_callback('on_item_mouse_leave',item_handle)
        --print('离开物品',item_handle)
    end,

    --指向单位事件
    on_unit_mouse_enter = function (unit_handle)
        game_event_callback('on_unit_mouse_enter',unit_handle)
        --print('进入单位',unit_handle)
    end,
 
    --离开单位事件
    on_unit_mouse_leave = function (unit_handle)
        game_event_callback('on_unit_mouse_leave',unit_handle)
        --print('离开单位',unit_handle)
    end,

   
    on_update_window_size = function ()
        game_event_callback('on_update_window_size')
    end
}

register_event(1,base.on_mouse_down)
register_event(2,base.on_mouse_up)
register_event(3,base.on_mouse_right_down)
register_event(4,base.on_mouse_right_up)
register_event(5,base.on_mouse_move)
register_event(6,base.on_mouse_wheeldelta)
register_event(7,base.on_key_down)
register_event(8,base.on_key_up)
register_event(9,base.on_update_window_size)



function hook.SetTeams(event_id)
    if event[event_id] ~= nil then 
        event[event_id]()
    end 
end


return game