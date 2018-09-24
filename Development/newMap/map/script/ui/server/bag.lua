local ui = require 'ui.server.util'

local bag = {}

local item_class 

item_class = {
    create = function (unit,page_id,slot_id,name,count)
        
        if unit:get_bag()[page_id][slot_id] ~= nil then 
            print('创建物品失败,该位置已有物品',page_id,slot_id)
            return 
        end 

        local item = {
            player      = unit:get_owner().handle,
            unit        = unit,         --该物品的拥有者
            name        = name,         --物品名字
            count       = count,        --物品数量
            level       = 0,            --强化等级
            page_id     = page_id,      --物品页面
            slot_id     = slot_id,      --物品槽位
            enable      = true,         --是否禁用
            rand_state  = {},           --随机属性表 列表 {属性名,数值}
        }
        setmetatable(item,{__index = item_class})
        local info = {
            type = 'bag',
            func_name = 'on_create',
            params = {
                [1] = GetHandleId(unit.handle),
                [2] = name,
                [3] = count,
                [4] = page_id,
                [5] = slot_id
            }
        }
        ui.send_message(item.player,info)
        item:add_rand_state()

        item.unit:get_bag()[page_id][slot_id] = item
        return item
    end,

    copy_create = function (unit,page_id,slot_id,old_item)
        if unit:get_bag()[page_id][slot_id] ~= nil then 
            print('创建物品失败,该位置已有物品',page_id,slot_id)
            return 
        end 
        local item = item_class.create(unit,page_id,slot_id,old_item.name,old_item.count)
        item:set_enable(old_item.enable)
        item:set_level(old_item:get_level())
        item:set_rand_state_table(old_item:get_rand_state_table())

        return item
    end,

    destroy = function (self)
        local info = {
            type = 'bag',
            func_name = 'on_destroy',
            params = {
                [1] = GetHandleId(self.unit.handle),
                [2] = self.page_id,
                [3] = self.slot_id
            }
        }
        ui.send_message(self.player,info)
        self.unit:get_bag()[self.page_id][self.slot_id] = nil
        
    end,

    get_name = function (self)
        return self.name
    end,

    get_type = function (self)
        local data = Table.ItemData[self.name]
        if data == nil then 
            return ''
        end
        return data.ItemType
    end,
    
    --获取购买价格
    get_buy_price = function (self)
        return self.buy_price or Table.ItemData[self.name].BuyPrice or 0
    end,
    
    set_buy_price = function (self,value)
        self.buy_price = value

        local info = {
            type = 'bag',
            func_name = 'on_set_buy_price',
            params = {
                [1] = GetHandleId(self.unit.handle),
                [2] = self.page_id,
                [3] = self.slot_id,
                [4] = self.buy_price,
            }
        }
        ui.send_message(self.player,info)

    end,

    
    --获取出售价格
    get_sell_price = function (self)
        return self.sell_price or Table.ItemData[self.name].SellPrice or 0
    end,
    
    --设置出售价格
    set_sell_price = function (self,value)
        self.sell_price = value 

        local info = {
            type = 'bag',
            func_name = 'on_set_sell_price',
            params = {
                [1] = GetHandleId(self.unit.handle),
                [2] = self.page_id,
                [3] = self.slot_id,
                [4] = self.sell_price,
            }
        }
        ui.send_message(self.player,info)
    end,
    
    get_count = function (self)
        return self.count
    end,

    set_count = function (self,count)
        count = math.modf(count)
        self.count = count 
        local info = {
            type = 'bag',
            func_name = 'on_set_count',
            params = {
                [1] = GetHandleId(self.unit.handle),
                [2] = self.page_id,
                [3] = self.slot_id,
                [4] = self.count,
            }
        }
        ui.send_message(self.player,info)
    end,

    get_level = function (self)
        return self.level
    end,

    set_level = function (self,level)
        level = math.modf(level)
        self.level = level 
        local info = {
            type = 'bag',
            func_name = 'on_set_level',
            params = {
                [1] = GetHandleId(self.unit.handle),
                [2] = self.page_id,
                [3] = self.slot_id,
                [4] = self.level,
            }
        }
        ui.send_message(self.player,info)
    end,

    get_level_type = function (self)
        local data = Table.ItemData[self.name]
        if data == nil then 
            return 
        end 
        local level_type = data.ItemLevel 
        return level_type
    end,
    add_rand_state = function (self)
        local level_type = self:get_level_type()
        if level_type == nil then 
            return 
        end 
        local state_table = Table.ItemData['随机属性表']
        local list = {}
        for name,data in pairs(state_table) do
            list[#list + 1] = {name,data}
        end
        local rand_state = {}
        for i = 1,level_type do
            local index = math.random(#list)
            local state = list[index]
            local data = state[2][level_type]
           
            rand_state[#rand_state + 1] = {state[1],math.random(data[1],data[2])}
            table.remove(list,index)
        end
        self:set_rand_state_table(rand_state)
    end,

    --获取随机属性  第index 条随机属性 返回 {属性名,数值}
    get_rand_state = function (self,index)
        return self.rand_state[index]
    end,

    --设置随机属性 第index条随机属性 {属性名,数值}
    set_rand_state = function (self,index,value)
        self.rand_state[index] = value
        local info = {
            type = 'bag',
            func_name = 'on_set_rand_state',
            params = {
                [1] = GetHandleId(self.unit.handle),
                [2] = self.page_id,
                [3] = self.slot_id,
                [4] = index,
                [5] = value,
            }
        }
        ui.send_message(self.player,info)
    end,

    --设置随机属性 按照名字设置具体数值
    set_name_rand_state = function (self,name,value)
        local index = 0
        for index,state in pairs(self.rand_state) do
            if state[1] == name then 
                index = index
                break
            end
        end
        self:set_rand_state(index,value)
    end,
    get_rand_state_table = function (self)
        return self.rand_state
    end,

    set_rand_state_table = function (self,rand_state)
        self.rand_state = rand_state
        local info = {
            type = 'bag',
            func_name = 'on_set_rand_state_table',
            params = {
                [1] = GetHandleId(self.unit.handle),
                [2] = self.page_id,
                [3] = self.slot_id,
                [4] = rand_state
            }
        }
        ui.send_message(self.player,info)
    end,


    is_enable = function (self)
        return self.enable
    end,

    set_enable = function (self,enable)

        self.enable = enable 
        local info = {
            type = 'bag',
            func_name = 'on_set_enable',
            params = {
                [1] = GetHandleId(self.unit.handle),
                [2] = self.page_id,
                [3] = self.slot_id,
                [4] = self.enable,
            }
        }
        ui.send_message(self.player,info)
    end,

    --获取基础属性 返回一个数组 存放属性{name = 属性名,value = 数值}
    get_base_state = function (self)
        local data = Table.ItemData[self.name]
        if data == nil then 
            return 
        end
        local desc = data.Description
        if desc == nil then 
            return 
        end
        local tbl = {}
        for name,value in desc:gmatch("'%s-(.-)%s-:%s-%+?%s-(%-?%d+)%s-'") do
            tbl[#tbl + 1] = {name = name,value = tonumber(value)}
        end
        return tbl
    end,
}



bag.event = {
    test = function (a,b,c)
        print(a,b,c)
    end,
    move = function (unit_handle,source_slot_id,target_slot_id)
        local unit = bag.unit_map[unit_handle]
        if unit == nil then 
            return 
        end 
        local source_item = unit:get_item(source_slot_id)
        if source_item == nil then 
            return 
        end
        local page = unit:get_page()

        local target_item = unit:get_item(target_slot_id)

        page[target_slot_id] = source_item
        source_item.slot_id = target_slot_id

        page[source_slot_id] = target_item
        if target_item ~= nil then 
            target_item.slot_id = source_slot_id
        end
    end,

    discard = function (unit_handle,page_id,slot_id)

        local unit = bag.unit_map[unit_handle]
        if unit == nil then 
            return 
        end 
        local item = unit:get_item(page_id,slot_id)
        if item == nil then 
            return 
        end

        local point = unit:get_point()
        local item_handle = CreateItem(base.string2id('ratc'),point[1],point[2])
        bag.item_map[GetHandleId(item_handle)] = item
        item.player = nil 
        item.unit = nil
        local info = {
            type = 'bag',
            func_name = 'on_discard',
            params = {
                [1] = GetHandleId(item_handle),
                [2] = item
            }
        }
        ui.send_message(nil,info)
        unit:get_bag()[page_id][slot_id] = nil
        register_item_destroy_event(item_handle)
    end,

    sell_item = function (unit_handle,page_id,slot_id)
        local unit = bag.unit_map[unit_handle]
        if unit == nil then 
            print('出售物品失败 没有单位')
            return 
        end 
        local item = unit:get_item(page_id,slot_id)
        if item == nil then 
            print('出售物品失败 没有物品')
            return 
        end
        print(ui.player,'出售',item:get_name())
        local price = item:get_sell_price()

        AdjustPlayerStateBJ( price, ui.player, PLAYER_STATE_RESOURCE_GOLD)
        item:destroy()

    end,


    show_bag_page = function (unit_handle,page_id)
        local unit = bag.unit_map[unit_handle]
        if unit == nil then 
            return 
        end 
        unit.this_page = page_id
    end,

    sort = function (unit_handle)
        local unit = bag.unit_map[unit_handle]
        if unit == nil then 
            return 
        end 
        unit:sort_item()
    end,


}



unit_method = {

    get_bag = function (self)
        return self.bag
    end,

    get_page = function (self,page_id)
        return self:get_bag()[page_id or self.this_page]
    end,

    get_item = function (self,page_id,slot_id)
        if slot_id == nil then 
            slot_id = page_id
            page_id = self.this_page
        end
        return self.bag[page_id][slot_id]
    end,

    get_equipment = function (self)
        return self.equipment
    end,

    get_equipment_bar_item = function (self,slot_id)
        return self:get_equipment()[slot_id]
    end,

    open_bag = function (unit)
        local info = {
            type = 'bag',
            func_name = 'on_open_bag',
            params = {
                [1] = GetHandleId(unit.handle),
            }
        }
        ui.send_message(unit:get_owner().handle,info)

    end,


    close_bag = function (unit)
        local info = {
            type = 'bag',
            func_name = 'on_close_bag',
        }
        ui.send_message(unit:get_owner().handle,info)

    end,



    add_item = function (unit,item_name,item_count)
        local tbl = unit:get_nil_slot(1) --获取一个空的槽位
        if tbl == nil then 
            print('物品栏已经满了')
            return 
        end
        if type(item_name) == 'table' then 
            return item_class.copy_create(unit,tbl[1][1],tbl[1][2],item_name)
        end
        local data = Table.ItemData[item_name]
        if data == nil then 
            print(item_name,'数据不存在 添加物品失败')
        end
        item_count = item_count or 0 
        local max_stack = data.MaxStack
        if max_stack ~= nil then --如果是可叠加物品 要搜索已有的物品 进行叠加到最大值
            for page_id = 1,unit.max_page do 
                for slot_id = 1,unit.max_slot do 
                    local item = unit:get_item(page_id,slot_id)
                    if (item ~= nil and item:is_enable() 
                        and item:get_name() == item_name and item:get_count() < max_stack)
                    then 
                        if item.count + item_count > max_stack then 
                            item_count = item_count + max_stack - item.count 
                            item:set_count(max_stack)
                        else
                            item:set_count(item:get_count() + item_count)
                            item_count = 0
                        end
                        if item_count < 0 then 
                            return
                        end
                    end
                end
            end
        else --如果不是叠加物品 则物品数量设置为0
            item_count = 0
        end
    
        return item_class.create(unit,tbl[1][1],tbl[1][2],item_name,item_count)
    end,
    --整理背包 排序物品
    sort_item = function (unit)
        local item_list = {}
        local item_map = {}
        local bag = unit:get_bag()
        for key1,page in pairs(bag) do --遍历背包里的页面
            for key2,item in pairs(page) do --遍历页面中的物品
                if item ~= nil then
                    local data = item_map[item.name] or {}
                    local list = data.list or {}
                    table.insert(list,item)
                    data.list = list
                    data.name = item.name
                    item_map[item.name] = data
                    bag[key1][key2] = nil
                end
            end
        end
        for key,data in pairs(item_map) do
            table.insert(item_list,data)
        end
        table.sort(item_list,function (a,b)
            return a.name < b.name
        end)

        local add = function (list,max_stack) --将列表里的物品 按数量进行叠加
            local last_item = nil
            for index,item in ipairs(list) do 
                if last_item == nil then 
                    last_item = item
                else
                    local last_count = last_item:get_count()
                    local this_count = item:get_count()
                    if last_count + this_count > max_stack then
                        this_count = last_count + this_count - max_stack
                        item.count = this_count
                        last_item.count = max_stack
                        last_item = item
                    else
                        last_item.count = last_count + this_count
                        table.remove(list,index)
                    end
                end
            end
        end
        for index,data in ipairs(item_list) do 
            local max_stack = Table.ItemData[data.name].MaxStack
            if max_stack ~= nil then
                add(data.list,max_stack)
            end
            table.sort(data.list,function (a,b)
                return a.level > b.level
            end)
        end

        local page_id = 1
        local slot_id = 0
        for index,data in ipairs(item_list) do
            for index,item in ipairs(data.list) do 
                local page = unit:get_page(page_id)
                slot_id = slot_id + 1
                page[slot_id] = item
                item.page_id = page_id
                item.slot_id = slot_id
                if slot_id == unit.max_slot then
                    slot_id = 0
                    page_id = page_id + 1
                    if page_id > unit.max_page then
                        break
                    end
                end
            end
            
        end
    end,

    --获取指定数量的空槽位
    get_nil_slot = function (self,count)
        local bag = self:get_bag()
        local tbl = {}
        for page_id = 1,self.max_page do
            for slot_id = 1,self.max_slot do
                local item = self:get_item(page_id,slot_id)
                if item == nil then 
                    tbl[#tbl + 1] = {page_id,slot_id}
                    if #tbl >= count then 
                        return tbl
                    end
                end
            end
        end
    end,
}


bag.unit_map = {}

bag.item_map = {}

bag.init_bag = function (unit)
    for name,method in pairs(unit_method) do
        if unit[name] == nil then 
            unit[name] = method
        else
            print('已经有',name,'方法了')
        end
    end

    bag.unit_map[GetHandleId(unit.handle)] = unit
  
    unit.this_page = 1      --当前页面 初始为 1
    unit.max_page = 1       --最大页面 
    unit.max_slot = 42      --槽位数量
    unit.bag = {}
    unit.equipment = {}
    for i = unit.this_page,unit.max_page do
        unit.bag[i] = {}
    end 
    local info = {
        type = 'bag',
        func_name = 'on_set_enable',
        params = {
            [1] = unit.handle,
        }
    }
    ui.send_message(unit:get_owner(),info)
end

local hero = ac.player(1):create_unit('Hpal',ac.point(300,300),30)
bag.init_bag(hero)

hero:add_item('酒',10)
hero:add_item('面条',10)
hero:add_item('酒',10)
hero:add_item('羽毛',10)
hero:add_item('和田玉',10)
for i=1,10 do
    hero:add_item('衣服',10)
end

hero:add_restriction('无敌')

local hero = ac.player(1):create_unit('Hpal',ac.point(400,300),30)
bag.init_bag(hero)

hero:add_item('酒',10)
hero:add_item('面条',10)
hero:add_item('酒',10)
hero:add_item('羽毛',10)
hero:add_item('和田玉',10)
for i=1,10 do
    hero:add_item('衣服',10)
end

local hero = ac.player(1):create_unit('Hpal',ac.point(400,300),30)
hero:add_restriction('无敌')
bag.init_bag(hero)

hero:add_item('羽毛',10)
hero:add_item('和田玉',10)
hero:add_item('衣服',10)
for i=1,10 do
    hero:add_item('衣服',10)
end


--开一个计时器 发送玩家金钱给背包客户端

local timer = CreateTimer()
TimerStart(timer,0.5,true,function ()
    for i = 0,11 do 
        local player = Player(i)
        local gold = GetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD)

        local info = {
            type = 'bag',
            func_name = 'on_update_gold',
            params = {
                [1] = gold,
            }
        }
        ui.send_message(player,info)
    end 
end)
ui.bag = bag 


ui.register_event('bag',bag.event)

return bag