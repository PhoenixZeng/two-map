local client = require 'ui.client.util'


local ui = extends(client,{})



ui.event = {}


ui.register_event = function (name,event_table)
    ui.event[name]=event_table
end


ui.send_message = function (player,info)
    if info == nil and type(info) ~= 'table' then 
        return
    end
    if GetLocalPlayer() == player or player == nil then 
        local msg = string.format("ui,%s",ui.encode(info))
        client.on_custom_ui_event(msg)
    end
end

ui.on_custom_ui_event = function (player,message)
    if string.sub(message,1,3)~="ui," then
		return
    end

    local data = message:sub(4,message:len())
    local info_table = ui.decode(data)
    if info_table == nil then
        return
    end
    local event_type = info_table.type
    local func_name = info_table.func_name
    local params = info_table.params
    if event_type and func_name then
        local event_table = ui.event[event_type]
        if event_table ~= nil then
            local func = event_table[func_name]
            if func ~= nil then
                ui.player = player
                if params == nil then
                    func()
                else
                    func(table.unpack(params,1,#params))
                end
            end
        end
    end

end

return ui