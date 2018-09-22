
local ui            = require 'ui.client.util'
local equipment     = require 'ui.client.equipment'
local timer         = require 'ui.client.timer'
local game          = require 'ui.base.game'
local unit_class = (require 'ui.client.unit').unit_class
--背包类
local bag_class

--物品类
local item_class 

--分类操作栏
local action_bar_class

local bag = {}


local color_code = {
    ['红'] = 'ff0000',
    ['绿'] = '00ff00', 
    ['蓝'] = '3232cd',--浅蓝
    ['黄'] = 'ffff00',
    ['青'] = '00ffff',
    ['紫'] = '871f78',
    ['橙'] = 'ff7f00',
    ['棕'] = 'a67d3d',
    ['粉'] = 'bc8f8f',
    ['白'] = 'ffffff',
    ['黑'] = '000000',
    ['金'] = 'daa520',

}
local item_type = {'白','绿','蓝','紫','金','红'}

local item_type_color = {
    [1] = color_code['白'],
    [2] = color_code['绿'],
    [3] = color_code['蓝'],
    [4] = color_code['紫'],
    [5] = color_code['金'],
    [6] = color_code['红'],
}


item_class = {
    --存放物品描述的表 
    item_desc_map = {},

    --装备类型
    equipment_type = {'武器','头盔','衣服','裤子','护手','鞋子','项链','玉佩','戒指','手镯'},

    --单位 槽位 名字 数量
    create = function (unit,page_id,slot_id,name,count)
        local item = {
            unit        = unit,         --该物品的拥有者
            name        = name,         --物品名字
            count       = count,        --物品数量
            level       = 0,            --物品等级
            page_id     = page_id,      --物品页面
            slot_id     = slot_id,      --物品槽位
            enable      = true,         --是否禁用
            rand_state  = {},           --随机属性表 列表 {属性名,数值}
        }
        setmetatable(item,{__index = item_class})

        local button = bag.ui.button_list[slot_id]
        if button == nil then
            return
        end
        

        if page_id == unit.this_page and unit == bag.ui.unit then
            item:set_icon(item:get_icon())
            item:set_count(item:get_count())
            button.texture:set_normal_image(item:get_type_icon())
        end

        unit.bag[page_id][slot_id] = item


        return item
    end,

    copy_create = function (unit,page_id,slot_id,old_item)
        local item = item_class.create(unit,page_id,slot_id,old_item.name,old_item.count)
        item:set_enable(old_item:is_enable())
        item:set_level(old_item:get_level())
        item:set_rand_state_table(old_item:get_rand_state_table())
       
        return item
    end,
    
    destroy = function (self)
        local page_id = self.page_id
        local slot_id = self.slot_id

        local button = bag.ui.button_list[slot_id]
        if button == nil then
            return
        end
        
        self.unit.bag[self.page_id][self.slot_id] = nil
        
        
        self.page_id = 0
        self.slot_id = 0

       if page_id == self.unit.this_page and self.unit == bag.ui.unit then

            button:set_normal_image('')
            button.texture:set_normal_image('')
            button.text:set_text('')
        end

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
    end,

    --获取出售价格
    get_sell_price = function (self)
        return self.sell_price or Table.ItemData[self.name].SellPrice or 0
    end,

    --设置出售价格
    set_sell_price = function (self,value)
        self.sell_price = value 
    end,

    set_level = function (self,level)
        self.level = level 
    end,    

    get_level = function (self)
        return self.level
    end,

    get_level_type = function (self)
        local data = Table.ItemData[self.name]
        if data == nil then 
            return 
        end 
        local level_type = data.ItemLevel 
        return level_type
    end,

     --获取随机属性  第index 条随机属性 返回 {属性名,数值}
     get_rand_state = function (self,index)
        return self.rand_state[index]
    end,

    --设置随机属性 第index条随机属性 {属性名,数值}
    set_rand_state = function (self,index,value)
        self.rand_state[index] = value
    end,

    get_rand_state_table = function (self)
        return self.rand_state
    end,

    set_rand_state_table = function (self,rand_state)
        self.rand_state = rand_state
    end,


    is_equipment = function (self)
        local map = item_class.item_type_map
        if map == nil then
            map = {}
            for index,value in ipairs(item_class.equipment_type) do
                map[value] = index
            end
            item_class.item_type_map = map
        end

        return map[self:get_type()] ~= nil 
    end,

    set_icon = function (self,image_path)
        local button = bag.ui.button_list[self.slot_id]
        if button == nil then
            return
        end
        if self.page_id == self.unit.this_page and self.unit == bag.ui.unit then
            button:set_normal_image(image_path)
        end
    end,

    get_icon = function (self)
        return 'image\\图标\\' .. Table.ItemData[self.name].IconName or ''
    end,

    get_type_icon = function (self)
        return 'image\\图标背景\\' .. Table.ItemData[self.name].IconBackground or ''
    end,
    set_count = function (self,count)
        local page_id = self.page_id
        local slot_id = self.slot_id

        local button = bag.ui.button_list[slot_id]
        if button == nil then
            return
        end
        self.count = count
       if page_id == self.unit.this_page and self.unit == bag.ui.unit then
            if self.count > 0 then 
                button.text:set_text(tostring(self.count))
            else
                button.text:set_text('')
            end
        end
    end,

    get_count = function (self)
        return self.count
    end,

    set_enable = function (self,is_enable)
        local page_id = self.page_id
        local slot_id = self.slot_id

        local button = bag.ui.button_list[slot_id]
        if button == nil then
            return
        end
        self.enable = is_enable
   
       if page_id ~= self.unit.this_page and self.unit ~= bag.ui.unit then 
            return
        end
        local alpha = 0.5 * 0xff -- 设置透明
        if self.enable then
            alpha = 0xff -- 设置不透明
        end
        button.text:set_alpha(alpha) 
        button:set_enable(self.enable)
        button:set_enable_drag(self.enable)
    end,

    is_enable =function (self)
        return self.enable
    end,

    --改变物品位置 最后一个参数是 是否清除原位置的按钮图像
    set_position = function (self,page_id,slot_id,is_clean)
        if self.page_id == self.unit.this_page and is_clean and self.unit == bag.ui.unit then
            local button = bag.ui.button_list[self.slot_id]
            button:set_normal_image('')
            button.texture:set_normal_image('')
            button.text:set_text('')
            local page = self.unit:get_page(self.page_id)
            page[self.slot_id] = nil
        end
        if page_id == self.unit.this_page and self.unit == bag.ui.unit then
            local button = bag.ui.button_list[slot_id]
            button:set_normal_image(self:get_icon())
            button.texture:set_normal_image(self:get_type_icon())
            if self.count > 0 then 
                button.text:set_text(tostring(self.count))
            else
                button.text:set_text('')
            end
        end
        self.page_id = page_id
        self.slot_id = slot_id
        local page = self.unit:get_page(page_id)
        page[slot_id] = self
    end,

    get_title = function (self)
        return self:get_name()
    end,

    get_tip = function (self)
        local s = {}
    
        local data = Table.ItemData[self.name]
        if data == nil then 
            return ''
        end
        s[#s + 1] = '类型 : ' .. self:get_type() .. '\n'
        if self:is_equipment() then 
            local color = item_type[self:get_level_type()]
            s[#s + 1] = '等级 : ' .. tostring(self:get_level()) .. '\n'
            s[#s + 1] = '品质 : |cff' .. color_code[color] .. color .. '色|r\n'
        end

        local desc = self.item_desc_map[self.name]
        if desc == nil then 
            desc = data.Description
            desc = desc:gsub("'%s-(.-)%s-:%s-([%+%-]?)%s-(%d+)%s-'",
            function (state_name,flag,value)
                return table.concat({state_name,'|cffdce632',flag,value,'|r'})
            end)
            self.item_desc_map[self.name] = desc
        end
        s[#s + 1] = desc or ''
        if #self.rand_state > 0  then 
            s[#s + 1] = '装备属性 :\n'
            for index,state in ipairs(self.rand_state) do
                s[#s + 1] = '   ' .. state[1] .. ' |cffdce632+' .. tostring(state[2]) .. '|r\n'
            end
        end
        
        return table.concat(s)
    end,
}



bag_class = extends( panel_class , {

    create = function (x,y,row,column,size)
        local interval = size / 4
        local offset = interval / 2
        local value = size + offset
        local slot_size = size + offset
        local button_size = size - offset
        local texture_size = size
        local max_width = row  * value + offset / 2
        local max_height = column * value + offset / 2
        --底层面板
        local path = "image\\背包\\bar_background.tga"
        
        --槽位背景
        local slot_path = "image\\背包\\package-lattice-back-0.tga"
        
       
        local panel = panel_class.create(path,x,y,520,760)
        --禁止鼠标穿透
        panel:add_button('',0,0,panel.w,panel.h):set_enable(false)

         
        extends(bag_class,panel)

        
        local item_bar = panel:add_panel('',0,100,max_width,max_height)
        panel.button_list = {}
        panel.button_map = {}
        for i = 0 ,  column - 1 do
            for k = 0 , row - 1 do
                local x = k * value + offset
                local y = i * value + offset
                --创建一个 槽位背景
                local slot = item_bar:add_panel(slot_path,x,y,slot_size,slot_size)

                local texture = slot:add_texture('',offset/2,offset/2,texture_size,texture_size)
                --创建一个按钮
                local button = slot:add_button('',offset,offset,button_size,button_size)
                button:set_enable_drag(true) --设置按钮可拖拽
                 --创建一个文本用作 物品数量
                local text = slot:add_text('',0,0,slot_size,slot_size,15,8)
                --text:set_color(220,230,50,1)
       
                panel.button_map[button.id] = button
                table.insert(panel.button_list,button)

                button.slot_id = #panel.button_list
                button.text = text
                button.texture = texture
                button.slot = slot

            end
        end
        panel.item_bar = item_bar
        panel.is_show = true 
        panel.row = row
        panel.column = column
        panel.size = size
        panel.item_count = 0
        panel.item_max_count = row * column



        --创建一个可拖动的标题按钮
        panel.title_button = panel:add_title_button('','背包',0,0,panel.w,80,25)

        --添加一个关闭按钮
        panel.close_button = panel:add_close_button()

        local oy = item_bar.y + item_bar.h + 15

 --[[
         --上一页按钮
        panel.previous_button = panel:add_previous_page_button(10,oy,120,48)
        
        --中间的当前页面的文本

        panel.page_text = panel:add_text('1',125,oy,48,32,21,'center')
        panel.page_text:set_color(220,230,50,1)
        --下一页按钮
        panel.next_button = panel:add_next_page_button(173,oy,120,48)
]]

        --出售物品按钮 
        panel.sell_button = panel:add_sell_button(240,oy,120,48)
        
        --整理背包按钮  排序
        panel.sort_button = panel:add_sort_button(380,oy,120,48)


        --玩家金钱按钮 还有文本
        local gold_icon = panel:add_texture('image\\背包\\bar_glod_lcon.tga',20,oy,32,32)
        local gold_text = panel:add_text('0',70,oy,200,32,12,'left')
        gold_text:set_color(220,230,50,1)

        panel.gold_text = gold_text
        
        
        return panel
    end,

    --显示的时候刷新一下界面
    show = function (self)
        panel_class.show(self)
        self:update_page(self.unit)
    end,

    --隐藏背包的时候 顺带把出售面板按钮也隐藏掉
    hide = function (self)
        panel_class.hide(self)
        self.sell_panel_button:hide()
    end,

    --添加一个出售按钮 点击显示出一块面板 用来出售物品
    add_sell_button = function (self,x,y,width,height)
        local path = "image\\背包\\package-lattice-back-0.tga"
        local button = self:add_button(path,x,y,width,height)
        button:add_text('出售',0,2,width,height,12,'center')

        local sell_panel = self:add_button('image\\背包\\bar_drag_frame.tga',-280,self.h / 2 - 200,250,400)
        sell_panel:add_text('拖\n\n拽\n\n到\n\n此\n\n处\n\n出\n\n售',sell_panel.w / 2 - 16,40,32,300,12,'center')
        --按钮点击
        sell_panel:hide()

        self.sell_panel_button = sell_panel
        button.panel = sell_panel

        button.on_button_clicked = function (self)
            if self.panel.is_show then 
                self.panel:hide()
            else 
                self.panel:show()
            end 
            return false 
        end 
        --按钮文本提示
        button.on_button_mouse_enter = function (self)
            self:set_tooltip("可以出售身上的物品",0,0,240,64,16) 
            return false 
        end 
        return button

    end,
    

    --添加重新排列物品按钮
    add_sort_button = function (self,x,y,width,height)
        local path = "image\\背包\\package-lattice-back-0.tga"
        local button = self:add_button(path,x,y,width,height)
        button:add_text('整理',0,2,width,height,12,'center')

        --按钮点击
        button.on_button_clicked = function (self)
            local object = self.parent
            local unit = object.unit
            if unit ~= nil  then
               object:sort()
            end
            return false 
        end 
        --按钮文本提示
        button.on_button_mouse_enter = function (self)
            self:set_tooltip("点击整理背包",0,0,240,64,16) 
            return false 
        end 
        return button
    end,

    --添加下一页按钮
    add_next_page_button = function (self,x,y,width,height)
        local path = "image\\背包\\package-lattice-back-0.tga"
        local button = self:add_button(path,x,y,width,height)
        button:add_text('下一页',0,2,width,height,12,'center')
        --按钮点击
        button.on_button_clicked = function (self)
            local object = self.parent
            local unit = object.unit
            if unit ~= nil and unit.this_page < unit.max_page then
                unit.this_page = unit.this_page + 1
                object:show_bag_page(unit,unit.this_page)
            end
            return false 
        end 
        --按钮文本提示
        button.on_button_mouse_enter = function (self)
            self:set_tooltip("查看下一页",0,0,240,64,16) 
            return false 
        end 
        return button
    end,
    --添加上一页按钮
    add_previous_page_button = function (self,x,y,width,height)
        local path = "image\\背包\\package-lattice-back-0.tga"
        local button = self:add_button(path,x,y,width,height)
        button:add_text('上一页',0,2,width,height,12,'center')
        button.messate_stop = true
        button:set_enable(false)
        --按钮点击
        button.on_button_clicked = function (self)
            local object = self.parent
            local unit = object.unit
            if unit ~= nil and unit.this_page > 1 then
                unit.this_page = unit.this_page - 1
                object:show_bag_page(unit,unit.this_page)
            end
            return false 
        end 
        --按钮文本提示
        button.on_button_mouse_enter = function (self)
            self:set_tooltip("查看上一页",0,0,240,64,16) 
        end 
        return button
    end,


    update_page = function (self,unit)
        local page = unit:get_show_page()
        for index,button in ipairs(self.button_list) do
            local item = page[button.slot_id]
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
                button.texture:set_normal_image('')
                button:set_normal_image('')
                text:set_text('')
                text:set_alpha(0xff) --设置透明
            end
        end
    end,
    --显示背包指定页面
    show_bag_page = function (self,unit,page_id)
        local prev_bool = true
        local next_bool = true

        unit.this_page = page_id

        if page_id == 1 then
            prev_bool = false
        elseif page_id == unit.max_page then
            next_bool = false
        end
        --self.previous_button:set_enable(prev_bool)
        --self.next_button:set_enable(next_bool)
        --self.page_text:set_text(page_id)


        self:update_page(unit)


        local info = {
            type = 'bag',
            func_name = 'show_bag_page',
            params = {
                [1] = unit.handle,
                [2] = page_id
            }
        }
        ui.send_message(info)
    end,

    
    --排序 整理一下背包
    sort = function (self)
        local unit = self.unit
        if unit == nil then
            return 
        end
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
                if slot_id == self.item_max_count then
                    slot_id = 0
                    page_id = page_id + 1
                    if page_id > unit.max_page then
                        break
                    end
                end
            end
            
        end

        local info = {
            type = 'bag',
            func_name = 'sort', --发送到服务端 那边同步排序
            params = {
                [1] = self.unit.handle,
            }
        }
        
        ui.send_message(info)

        self:show_bag_page(self.unit,1) --整理背包后 切回第一页
    end,

    
    --从其他界面拖拽物品到背包里
    on_drag_bag_item = function (self,item,x,y)
        local target = nil
        if self.item_bar:point_in_rect(x,y) == false then --不在第二层面板里
            return 
        end
        for index,button in ipairs(self.button_list) do
            local slot = button.slot
            if slot:point_in_rect(x,y) then
                target = button
                break
            end
        end
 
        if target == nil then 
            return 
        end
        if item.equipment_slot_id == nil then 
            return 
        end
        equipment.ui:remove_item(item.equipment_slot_id,self.unit.this_page,target.slot_id)
   
    end,

    --拖放结束事件 拖动的按钮  目标按钮
    on_button_drag_and_drop = function (self,button,target_button)
        if button == target_button then 
            return 
        end 
        if self.unit == nil then
            return
        end
        local page = self.unit:get_show_page()
        local source_slot = button.slot_id
        local source_item = page[source_slot]
        if source_item == nil then 
            return 
        end
        if source_item:is_enable() == false then
            return
        end
        
        local x = japi.GetMouseVectorX() / 1024 * 1920
        local y = (-(japi.GetMouseVectorY() - 768)) / 768 * 1080
        --判断目标按钮是空 且 鼠标位置 在界面位置之外
        if target_button == nil  then 
            if self:point_in_rect(x,y) == false then 
                --('丢弃')
                local page_id = source_item.page_id
                local slot_id = source_item.slot_id
                local info = {
                    type = 'bag',
                    func_name = 'discard',
                    params = {
                        [1] = source_item.unit.handle,
                        [2] = page_id,
                        [3] = slot_id,
                    }
                }
                ui.send_message(info)
                source_item:destroy()
            end
        elseif target_button.slot_id == nil then

            --('拖到无关的按钮里了')


             --拖拽到出售面板按钮上了
             if target_button == self.sell_panel_button then 

                local info = {
                    type = 'bag',
                    func_name = 'sell_item',
                    params = {
                        [1] = source_item.unit.handle,
                        [2] = source_item.page_id,
                        [3] = source_item.slot_id,
                    }
                }
                ui.send_message(info)
                --删除客户端物品 并给服务端发消息  通知那边出售物品
                source_item:destroy()
            end 

  
        else 
            --交换
            
            local x,y = ui.get_mouse_pos()
            if equipment.ui ~= nil and equipment.ui.is_show == true and equipment.ui:point_in_rect(x,y) then --判断装备栏是否显示
                --判断拖动的位置 是否在装备栏里
                equipment.ui:on_drag_bag_item(source_item,x,y)
                return
            end



            if target_button ~= nil and self:point_in_rect(target_button:get_real_position()) == false then 
                return
            end


            local target_slot = target_button.slot_id
            local target_item = page[target_slot]
            if source_item:is_enable() == false or target_item ~= nil and target_item:is_enable() == false then
                print('物品被占用，暂时无法移动')
                return
            end
            source_item:set_position(self.unit.this_page,target_slot,true)
            if target_item ~= nil then
                target_item:set_position(self.unit.this_page,source_slot,false)
            end
            local info = {
                type = 'bag',
                func_name = 'move',
                params = {
                    [1] = source_item.unit.handle,
                    [2] = button.slot_id,
                    [3] = target_button.slot_id,
                }
            }
            ui.send_message(info)
        end
    end,

    

    --鼠标进入
    on_button_mouse_enter = function (self,button)

        if button.slot_id == nil then 
            return 
        end 

        if self.unit == nil then
            return
        end

        local page = self.unit:get_show_page()

        local item = page[button.slot_id]
        if item == nil then
            return
        end
        button:item_tooltip(item)
        
        --print('鼠标进入',tostring(self))
    end,


    --按钮点击事件 self 是当前面板 button是按钮
    on_button_clicked = function (self,button)
        local info = {
            type = 'bag',
            func_name = 'test',
            params = {
                [1] = '参数1',
                [2] = '参数2',
                [3] = '参数3',
            }
        }
        ui.send_message(info)
        print('点击',self,button)

    end,

    
    --鼠标右键事件
    on_button_right_clicked = function (self,button)
        local slot_id = button.slot_id
        local unit = self.unit
        if unit == nil then
            return
        end
        local page = unit:get_show_page()

        local item = page[slot_id]
        if item == nil then
            return
        end
        if item:is_enable() == false then 
            return 
        end
        if item:is_equipment() then
            if equipment.ui.is_show == false then
                equipment.ui:show()
            end
            equipment.ui:add_item(item)
        end
    end,

})
bag.item_class = item_class

bag.item_map = {}

bag.event = {


    on_select_unit = function (handle)
        local unit = unit_class.get_object(handle)
        bag.ui.unit = unit
        --如果是显示的 刷新
        if bag.ui.is_show then 
            bag.ui:update_page(unit)
        end 
    end,

    on_open_bag = function (handle)
        local unit = unit_class.get_object(handle)
        bag.ui.unit = unit
        bag.ui:show()
    end,

    on_close_bag = function ()
        bag.ui:hide()
    end,

    on_init = function (handle)
        local unit = unit_class.get_object(handle)
        --equipment.ui.unit = unit
        --bag.ui.unit = unit
    end,
    on_create = function (handle,name,count,page_id,slot_id)
        local unit = unit_class.get_object(handle)
        item_class.create(unit,page_id,slot_id,name,count)
    end,
    
    on_copy_create = function (handle,page_id,slot_id,item)
        local unit = unit_class.get_object(handle)
        item_class.copy_create(unit,page_id,slot_id,item)
    end,

    on_destroy = function (handle,item_handle)
        local unit = unit_class.get_object(handle) 
        local item = unit:get_item(page_id,slot_id)
        if item ~= nil then 
            item:destroy()
        end
    end,

    on_discard = function (item_handle,item)
        setmetatable(item,{__index = item_class})
        bag.item_map[item_handle] = item
    end,

    on_discard_clear = function (item_handle)
        bag.item_map[item_handle] = nil
        ui_base_class.remove_tooltip()
    end,
    on_set_count = function (handle,page_id,slot_id,count)
        local unit = unit_class.get_object(handle)
        local item = unit:get_item(page_id,slot_id)
        if item ~= nil then 
            item:set_count(count)
        end
    end,

    on_set_level = function (handle,page_id,slot_id,level)
        local unit = unit_class.get_object(handle)
        local item = unit:get_item(page_id,slot_id)
        if item ~= nil then 
            item:set_level(level)
        end
    end,

    on_set_enable = function (handle,page_id,slot_id,enable)
        local unit = unit_class.get_object(handle)
        local item = unit:get_item(page_id,slot_id)
        if item ~= nil then 
            item:set_enable(enable)
        end
    end,

    on_set_rand_state = function (handle,page_id,slot_id,index,value)
        local unit = unit_class.get_object(handle)
        local item = unit:get_item(page_id,slot_id)
        if item ~= nil then 
            item:set_rand_state(index,value)
        end
    end,

    on_set_rand_state_table = function (handle,page_id,slot_id,rand_state)
        local unit = unit_class.get_object(handle)
        local item = unit:get_item(page_id,slot_id)
        if item ~= nil then 
            item:set_rand_state_table(rand_state)
        end
    end,

    on_set_buy_price = function (handle,page_id,slot_id,price)
        local unit = unit_class.get_object(handle)
        local item = unit:get_item(page_id,slot_id)
        if item ~= nil then 
            item:set_buy_price(price)
        end
    end,

    on_set_sell_price = function (handle,page_id,slot_id,price)
        local unit = unit_class.get_object(handle)
        local item = unit:get_item(page_id,slot_id)
        if item ~= nil then 
            item:set_sell_price(price)
        end
    end,

    on_update_gold = function (gold)
        if bag.ui ~= nil then 
            bag.ui.gold_text:set_text(tostring(gold))
        end 
    end,


}


local function cencel_select(handle)

end

--鼠标指向物品事件
bag.on_item_mouse_enter = function (item_handle)
    local item = bag.item_map[GetHandleId(item_handle)] 
    if item ~= nil then 
        ui_base_class.item_tooltip(nil,item)
    end
end 

--鼠标离开物品事件
bag.on_item_mouse_leave = function (item_handle)
    ui_base_class.remove_tooltip()
end


bag.on_item_clicked = function (item_handle)
    local item = bag.item_map[GetHandleId(item_handle)] 
    if item ~= nil then 
        print('点击',item:get_name())
        ui_base_class.item_tooltip(nil,item)
    end
end

bag.on_unit_clicked = function (unit_handle)
    if bag.ui.unit == nil then 
        return 
    end 
    if GetHandleId(unit_handle) ~= bag.ui.unit.handle then 
        local info = {}
        info.time = 0
        timer.create(info,0.001,true,function (self,info)
            SelectUnit(ConvertUnitState(bag.ui.unit.handle),true)
            if info.time > 100 then 
                self:stop()
            else
                info.time = info.time + 1
            end
        end)
    end
end


bag.on_key_down = function (code)
    if code == KEY.TAB then 
        if bag.ui.unit ~= nil then 
            if bag.ui.is_show then 
                bag.ui:hide()
            else 
                bag.ui:show()
            end 
           
        end 
    end 

end 



ui.register_event('bag',bag.event)
game.register_event(bag)
ui.bag = bag

local function initialize()
    local unit = unit_class.get_object(1)
    local object = bag_class.create(1200,200,6,7,74)
    object:hide()
 
    object.unit = unit
    bag.ui = object

    --bag.add_item(unit,'面条',10)
    --bag.add_item(unit,'酒',10)
    
end


initialize()


return bag