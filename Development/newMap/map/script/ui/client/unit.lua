local ui = require 'ui.client.util'

local unit = {}
local unit_class 
unit_class = {

    unit_map = {},

    get_object = function (handle)
        if handle == nil then
            return
        end
        local self = unit_class.unit_map[handle]
        if self == nil then
            self = {}
            unit_class.unit_map[handle] = self
            self.handle = handle

            self.this_page = 1      --当前页面 初始为 1
            self.max_page = 1       --最大页面 
            self.max_slot = 42      --槽位数量
            self.bag = {}
            self.equipment = {}
            for i = self.this_page,self.max_page do
                self.bag[i] = {}
            end 
            setmetatable(self,{__index = unit_class})
        end
        return self
    end,

    get_bag = function (self)
        return self.bag
    end,

    get_equipment = function (self)
        return self.equipment
    end,

    get_equipment_bar_item = function (self,slot_id)
        return self:get_equipment()[slot_id]
    end,

    get_page = function (self,page_id)
        return self.bag[page_id or self.this_page]
    end,

    --获取要显示的页面 先判断 fake 假的页面是否存在 否则才显示完整的页面
    get_show_page = function (self,page_id)
        page_id = page_id or self.this_page

        if self.fake_bag ~= nil then
            local page = self.fake_bag[page_id] or {}
            self.fake_bag[page_id] = page
            return page
        end

        return self:get_page(page_id)
    end,

    get_item = function (self,page_id,slot_id)
        if slot_id == nil then 
            slot_id = page_id
            page_id = self.this_page
        end
        return self.bag[page_id][slot_id]
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

    

    add_item = function (self,item_name,item_count)
        local tbl = self:get_nil_slot(1) --获取一个空的槽位
        if tbl == nil then 
            print('物品栏已经满了')
            return 
        end
        if type(item_name) == 'table' then 
            return ui.bag.item_class.copy_create(self,tbl[1][1],tbl[1][2],item_name)
        end
        local data = Table.ItemData[item_name]
        if data == nil then 
            print(item_name,'数据不存在 添加物品失败')
        end
        item_count = item_count or 0 
        local max_stack = data.MaxStack
        if max_stack ~= nil then --如果是可叠加物品 要搜索已有的物品 进行叠加到最大值
            for page_id = 1,self.max_page do 
                for slot_id = 1,self.max_slot do 
                    local item = self:get_item(page_id,slot_id)
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
    
        return ui.bag.item_class.create(self,tbl[1][1],tbl[1][2],item_name,item_count)
    end,

}
unit.unit_class = unit_class
setmetatable(unit_class,hero_class)


return unit