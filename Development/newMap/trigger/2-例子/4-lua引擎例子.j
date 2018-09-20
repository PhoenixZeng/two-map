//TESH.scrollpos=0
//TESH.alwaysfold=0
<?import('wenhao.lua')[[
    local dzapi = require 'jass.dzapi'
    local console = require 'jass.console'
    console.enable = true
    print = console.write

    setmetatable(_G,{__index=dzapi})
    
    local frame = 0
    local ClickTimes = 0
    local gameUI = DzGetGameUI()
    
    --载入自己的fdf列表文件
    DzLoadToc("ui\\custom.toc")
    --从fdf模版中创建按钮
    frame = DzCreateFrame("TestButton",gameUI,0)
    --显示0表示没创建成功
    print(frame)
    --将按钮移动至屏幕中央
    DzFrameSetPoint(frame,4,gameUI,4,0,0)
    --给按钮注册点击事件（异步的）
    DzFrameSetScriptByCode(frame,1,function ()
        --获取被点击的按钮（直接取鼠标指向的frame）
        local frame = DzGetMouseFocus()
        --获取这个按钮的文本组件
        local text = DzFrameFindByName("ButtonText",0)
        --点击次数累加
        ClickTimes = ClickTimes + 1
        print(ClickTimes)
        --修改这个组件的文本
        DzFrameSetText(text,"点我（"..ClickTimes.."）")
        
    end,false)
    --注册鼠标移动事件
    DzTriggerRegisterMouseMoveEventByCode(nil,false,function ()
        print(DzGetMouseX(),DzGetMouseY())
    end)
]]?>