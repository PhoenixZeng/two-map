
local trigger = CreateTrigger()


for i = 0,11 do
    TriggerRegisterPlayerEventEndCinematic(trigger,Player(i))
end

TriggerAddAction(trigger,function ()
   
end)

