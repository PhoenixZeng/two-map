local game  = require 'ui.base.game'
local ui    = require 'ui.client.util'
local timer = require 'ui.client.timer' 
local chat = {}
local chat_class

function sub_str_line(str,count)
    local a,b,c = 1,1,0
    local line = 0
	local last_color = ''
	local buffer = {}
    local lines = {}
    count = count - 1
	while (a <= str:len()) do
        local s = str:sub(a,a)

		if s == '|' then
			local next = str:sub(a+1,a+1)
			if next == 'c' then
				last_color = str:sub(a,a+9)
                buffer[#buffer + 1] = str:sub(a,a+9)
                a = a + 9
                c = 0
			elseif next == 'r' then
				last_color = ''
                buffer[#buffer + 1] = str:sub(a,a+1)
                a = a + 1
                c = 0
            elseif next == 'n' then 
                b = 0
                a = a + 1
                c = 0
            end
        elseif s == '{' and str:sub(a+3,a+3) == '}' then 
                buffer[#buffer + 1] = str:sub(a,a+3)
                a = a + 3
                b = b + 1
                c = 0
        else

            c = c + 1
            if s:byte() > 127 then
                if c >= 3 then
                   c = 0
                   b = b + 0.8475
                end
            else
                    b = b + 0.5
                    c = 0
            end
            if s ~= '\n' then
				buffer[#buffer + 1] = s
            end
        end

        if (c == 0 and b > count) or s == '\n' or a >= str:len() then
            b = 0
            if #buffer > 0 then 
                if last_color ~= '' then
                    buffer[#buffer + 1] = '|r'
                end
                line = line + 1
                lines[line] = table.concat(buffer)
                buffer = {}
                buffer[#buffer + 1] = last_color
                
            end 
        end

        a = a + 1
    end
    return lines,line
end

function get_str_width (str)
    local a,b,c = 1,0,0
	while (a <= str:len()) do
        local s = str:sub(a,a)

		if s == '|' then
			local next = str:sub(a+1,a+1)
			if next == 'c' then
                a = a + 9
                c = 0
			elseif next == 'r' then
                a = a + 1
                c = 0
            end
        else
            c = c + 1
            if s:byte() > 127 then
                if c >= 3 then
                   c = 0
                   b = b + 19.23076923076923
                end
            else
                    b = b + 10.8695652173913
                    c = 0
            end
        end

        a = a + 1
    end
    return b
end
icon_class = extends(panel_class,{
    create = function (parent)
        local width = 384
        local height = 300 
        local x = parent.w  - width / 2
        local y = parent.h - height
        local path = 'image\\提示框\\Item_Prompt.tga'
        local panel = parent:add_panel('',x,y,width,height)
        local texture = panel:add_texture(path,0,0,width,height)
        texture:set_alpha(0.8)
        extends(icon_class,panel)
        local list = {}
        for row = 1,8 do 
            for column = 1,6 do 
                local index = #list + 1
                local x = row * 48 - 36
                local y = column * 48 - 36
                local icon = panel:add_button('image\\表情\\'..index..'.tga',x,y,32,32)
                icon.slot_id = index 
                list[#list + 1] = icon
            end 
        end
        panel.button_list = list 
        return panel
    end,


    on_button_clicked = function (self,button)
        if button.slot_id ==nil then 
            return
        end 
        local edit = self.parent.edit
        local str = string.format('%s{%02d}',edit:get_text(),button.slot_id)
        edit:set_text(str)
        self:destroy()
        self.parent.icon_panel = nil
        timer.create(edit,0.1,false,function ()
            edit:set_focus(true)
        end)
        return false 
    end,

})

chat_class = extends(panel_class,{
    create = function ()
        local path = 'image\\提示框\\256-256A.tga'
        local width = 500
        local height = 450 
        local panel = panel_class.create(path,0,1080-height -100-200,width,height-48) --聊天界面位置
        extends(chat_class,panel)
        --panel:set_alpha(0.5)
        --
        panel.message_list = {}

        local text_list = {}
        local x = 0
        local y = panel.h - 25
        for line = 1,16 do 
            
            local text = panel:add_text('',x,y,23*25,25,true,'left')
            text_list[line] = text
            text.icon_list = {}
            y = y - 25
        end 
        panel.text_list = text_list

    
      
        local path = 'image\\背包\\package-lattice-back-0.tga'
        local button = panel:add_button(path,0,height-48,96,48)
        button.text = button:add_text('盟友',0,0,96,48,12,'center')
        panel.button = button

        local all_button = panel:add_button(path,0,height,96,48)
        all_button.text = all_button:add_text('所有人',0,0,96,48,12,'center')
        all_button:hide()
        panel.all_button = all_button


        local path = 'image\\提示框\\Item_Prompt.tga'
        local texture = panel:add_texture(path,96,height-48,width-96,48,8)
        texture:set_alpha(0.5)


        local edit = panel:add_edit('',96,height-48,width-96,48,8)
        edit.texture = texture

        panel.edit = edit
        

        
        panel.icon_button = panel:add_button(path,panel.w-32,panel.h,32,32)
        panel.icon_button:add_texture('image\\表情\\23.tga',0,0,32,32)
        
        panel:show_edit(false)
  
        return panel
    end,

    show_edit = function (self,is_show)
        if is_show then 
            self.edit:show()
            self.edit.texture:show()
            self.button:show()
            self.icon_button:show()
        else
            self.edit:hide()
            self.edit.texture:hide()
            self.button:hide()
            self.all_button:hide()
            self.icon_button:hide()
            if self.icon_panel ~= nil then 
                self.icon_panel:destroy()
            end 

            local str = self.edit:get_text()
            if str:len() == 0 then 
                return 
            end 
            local info = {
                type = 'chat',
                func_name = 'input',
                params = {
                    [1] = str,
                    [2] = self.button.text:get_text()
                }
            }
            ui.send_message(info)

            self.edit:set_text('')
        end
     
    end,

    update = function (self)
        local list = self.message_list
        for index,text in ipairs(self.text_list) do 
            local s = list[#list - index + 1]
            for index,icon in ipairs(text.icon_list) do 
                icon:hide()
                icon:destroy()
            end
            text.icon_list = {}
            if s ~= nil then 
                local pos,pos2 = s:find('{%d%d}')
                local last_pos = 0
                while (pos ~= nil) do 
                    local str = s:sub(last_pos,pos-1)
                    local id = tonumber(s:sub(pos+1,pos2-1))
                    s = str .. '  ' .. s:sub(pos2+1,s:len())
                    if id ~= nil then 
                        local path = 'image\\表情\\' .. tostring(id) .. '.tga'
                        --local data = 20.8 * 0.8 * 1920 / dzapi.DzGetWindowWidth()
                        local width = 24--* 0.8 * 1920 / dzapi.DzGetWindowWidth()
                        local height = 24
                        local x = get_str_width(str) --* data
                        local y = text.y
                        local icon = self:add_texture(path,x,y,width,height)
                        table.insert(text.icon_list,icon)
                    end
                    pos,pos2 = s:find('{%d%d}',pos2-1)
                end
                text:set_text(s)
            else 
                text:set_text('')
            end
        end
    end,

    send = function (self,str,type)
        if str == nil then 
            return 
        end 
        if str:len() == 0 then 
            return 
        end 
        local list = self.message_list
        local lines = sub_str_line(str,23)
        for line,str in ipairs(lines) do 
            list[#list + 1] = str
        end 
        if #lines == 0 then 
            print('空的')
            return 
        end 
        self:update()
    end,

    set_type = function (self)
        if self.button.text:get_text() == '盟友' then 
            self.button.text:set_text('所有人')
            self.all_button.text:set_text('盟友')
        else
            self.button.text:set_text('盟友')
            self.all_button.text:set_text('所有人')
        end
        timer.create(self,0.1,false,function ()
            self.edit:set_focus(true)
        end)

        
        

    end,


    on_button_clicked = function (self,button)
        if button == self.button then 
            if self.all_button.is_show then 
                self.all_button:hide()
                self.edit:set_text('')
                timer.create(nil,0.1,false,function ()
                    self.edit:set_focus(true)
                end)
            else 
                self.all_button:show()
            end 
        elseif button == self.all_button then 
            local source = self.button
            local str = source.text:get_text()
            source.text:set_text(button.text:get_text())
            button.text:set_text(str)
            button:hide()
            self.edit:set_text('')
            
            timer.create(nil,0.1,false,function ()
                self.edit:set_focus(true)
            end)
        elseif button == self.icon_button then 

            if self.icon_panel == nil then 
                self.icon_panel = icon_class.create(self)
            else
                self.icon_panel:destroy()
                self.icon_panel = nil
            end 
        end
        
    end,

})
local chat_panel = chat_class.create()
chat_panel.edit.is_show = false
chat.ui = chat_panel
chat.event = {
    on_send = function (msg,type)
        chat_panel:send(msg,type)
    end
}


chat.on_key_down = function (id)
    if id == KEY.F2 then 
        japi.SetEditFocus(chat_panel.edit.id)
    elseif id == KEY.F3 then 
    end
    if id == KEY.ENTER then 
        if chat_panel.edit.is_show then
            chat_panel.edit.is_show = false
            chat_panel:show_edit(false)
            chat_panel.edit:set_focus(false)
          
        else
            chat_panel.edit.is_show = true
            chat_panel:show_edit(true)
            chat_panel.edit:set_focus(true)
        end
    elseif id == KEY.TAB and chat_panel.edit.is_show then 
        chat_panel:set_type()
    end
end


chat.on_key_up = function (id)
    if id == KEY.ENTER then 

    end

end

chat.on_update_window_size = function ()
    print(dzapi.DzGetWindowWidth(),dzapi.DzGetWindowHeight())
    chat_panel:update()

end

local lib = require 'jass.message'
function lib.hook(msg)
    if msg.type == 'key_down' and msg.code == 513 then 
        return false 
    end
    return true
end 

game.register_event(chat)
ui.register_event('chat',chat.event)

--local data = 21.739/ dzapi.DzGetWindowWidth() * 0.8
--print(data)