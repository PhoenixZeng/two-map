local runtime = require 'jass.runtime'
local console = require 'jass.console'

local tostring = tostring
local debug    = debug

console.enable = true

if console.enable then 
    print = console.write
else
    print = function  (...)
        local args={...}
        local s = ''
        for index = 1 , #args do 
            s = s..tostring(args[index])..'   '
        end
        BJDebugMsg(s)
    end
end

runtime.handle_level = 2
runtime.sleep = true
runtime.error_handle = function(msg)
    print("---------------------------------------")
    print("              LUA ERROR!!              ")
    print("---------------------------------------")
    print(tostring(msg) .. "\n")
    print(debug.traceback())
    print("---------------------------------------")
end
