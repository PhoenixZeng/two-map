package.path = package.path .. ';'
.. '?\\init.lua;'
.. 'script\\?.lua;'
.. 'script\\?\\init.lua;'


require 'script'


function main()
    BJDebugMsg("欢迎进入游戏")
end

main()


