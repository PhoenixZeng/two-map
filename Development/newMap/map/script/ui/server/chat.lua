local ui = require 'ui.server.util'
local hook = require 'jass.hook'
local chat = {}
local boolexpr_map = {
    
    ['盟友'] = function (player,target) 
        return player == target or player:is_ally(target)
    end,

    ['所有人'] = function (player,target) 
        return true
    end,

    ['自己'] = function (player,target)
        return player == target
    end,

    ['公告'] = function (player,target)
        return true
    end,
}

chat.event = {
    input = function (str,type)
        chat.display_text(ui.player,str,type)
    end,
}

chat.display_text = function (player_handle,str,type)
    local player = ac.player(GetPlayerId(player_handle) + 1)
    local boolexpr = boolexpr_map[type]
    if boolexpr == nil then 
        return 
    end 
    --如果bool为true，聊天信息不连接玩家名字，伪系统消息
    local msg 
    if type == '盟友' or type == '所有人' then 
        msg = string.format('%s : %s',player:get_name(),str)
    else 
        msg = str
    end
    for i = 1,11 do 
        local target = ac.player(i)
        if boolexpr(player,target) then
            local info = {
                type = 'chat',
                func_name = 'on_send',
                params = {
                    [1] = msg,
                    [2] = type
                }
            }
            ui.send_message(target.handle,info)
        end
    end
end 

function hook.DisplayTextToPlayer(player,x,y,text)
    local str = string.format('|cffff3030公告 ：|r %s',text)
    chat.display_text(player,str,'自己')
end

--ac.player(1):setName('|cffa00000问号|r') --测试玩家名字颜色

ui.register_event('chat',chat.event)