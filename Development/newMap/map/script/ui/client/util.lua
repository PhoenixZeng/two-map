
local ui = {}



ui.event = {}

ui.hashtable = {}

ui.init = function () --预存数据表里的物体的名字
    for file_type,file_data in pairs(Table) do
        for name,value in pairs(file_data) do
            local hash = ui.get_hash(name)
            local value = ui.hashtable[hash]
            if value ~= nil and value ~= name then 
                print(name,'哈希值发生碰撞了',name,value)
            else 
                ui.hashtable[hash] = name
            end
        end
    end
end

ui.get_str = function (hash)
    return ui.hashtable[hash]
end

ui.get_hash = function (str)
    local function uint32_t (int)
        return int & 0xffffffff
    end
    local hash = uint32_t(5381)
    local length = str:len()
    for i = 1,length do
        local byte = str:sub(i,i):byte()
        hash = uint32_t(uint32_t(uint32_t(hash << 5) + hash) + byte)
    end
    return hash
end


ui.register_event = function (name,event_table)
    ui.event[name]=event_table
end


ui.send_message = function (info)
    if info == nil and type(info) ~= 'table' then 
        return
    end
    local msg = string.format("ui,%s",ui.encode(info))
    dzapi.DzSyncData("ui",msg)
end

ui.on_custom_ui_event = function (message)
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

ui.get_mouse_pos = function ()
    local x = japi.GetMouseVectorX() / 1024
    local y = (-(japi.GetMouseVectorY() - 768)) / 768 
    x = x * 1920
    y = y * 1080
    return x,y
end

ui.set_mouse_pos = function (x,y)
    x = x / 1920 * 1024
    y = 768 - y / 1080 * 768
    japi.SetMousePos(x,y)
end 

--将lua表编码成字符串
ui.encode = function (tbl)
    local type = type
    local pairs = pairs
    local format = string.format
    local find = string.find
    local tostring = tostring
    local tonumber = tonumber
    local mark = {}
    local buf = {}
    local count = 0
    local function dump(v)
        local tp = type(v)
        if mark[v] then
            error('表结构中有循环引用')
        end
        mark[v] = true
        buf[#buf+1] = '{'
        local ator = pairs 
        if #v > 0 then 
            ator = ipairs
        end
        for k, v in ator(v) do
            count = count + 1
            if count > 1000 then
                error('表太大了')
            end
            local tp = type(k)
            if tp == 'number' then
                if ator == pairs then 
                    buf[#buf+1] = format('[%s]=', k)
                end 
            elseif tp == 'string' then
                if find(k, '[^%w_]') then
                    buf[#buf+1] = format('[%q]=', k)
                else
                    buf[#buf+1] = k..'='
                end
            else
                error('不支持的键类型：'..tp)
            end
            local tp = type(v)
            if tp == 'table' then
                dump(v)
                buf[#buf+1] = ','
            elseif tp == 'number' then
                buf[#buf+1] = format('%q,', v)
            elseif tp == 'string' then
                buf[#buf+1] = format('%q,', v)
            elseif tp == 'boolean' then
                buf[#buf+1] = format('%s,', v)
            else
                log.error('不支持的值类型：'..tp)
            end
        end
        buf[#buf+1] = '}'
    end
    dump(tbl)
    return table.concat(buf)
end

--将字符串 加载为lua表
ui.decode = function (buf)
    local f, err = load('return '..buf)
    if not f then
        print(err)
        return nil
    end
    local suc, res = pcall(f)
    if not suc then
        print(res)
        return nil
    end
    return res
end

ui.copy_table = function (old)
    local new = {}
    for key,value in pairs(old) do
        if type(value) == 'table' then
            new[key] = ui.copy_table(value)
        else
            new[key] = value
        end
    end
    return new
end

ui.get_table_size = function (tbl)
    local count = 0 
    for key,value in pairs(tbl) do
        count = count + 1
    end
    return count
end

ui.init()

return ui