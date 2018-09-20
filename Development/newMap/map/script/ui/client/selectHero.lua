local ui = require 'ui.client.util'
local point = {x = 0,y = 0}
local model_unit = CreateUnit(Player(13),ID 'Hpal',0,0,270)
local class_SelectPanel


class_SelectPanel = extends(panel_class,{
    create = function ()

    end,
})