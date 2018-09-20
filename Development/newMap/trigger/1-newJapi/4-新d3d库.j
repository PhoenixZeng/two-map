//TESH.scrollpos=0
//TESH.alwaysfold=0
library d3d requires japi
    globals
        private constant hashtable ht=japi_ht
        private constant integer key=StringHash("jass")
    endglobals
    
    private function Call takes string str returns nothing
        call UnitId(str)
    endfunction
    
    //==================获取鼠标相对魔兽窗口的坐标==========================
    // 不会因为窗口的改变大小或移动而影响的相对坐标
    
    //获取鼠标在屏幕的x轴
    function GetMouseVectorX takes nothing returns real
        call SaveStr(ht,key,0,"()R")
        call Call("GetMouseVectorX")
        return         LoadReal(ht,key,0)
    endfunction
    
    //获取鼠标在屏幕的y轴
    function GetMouseVectorY takes nothing returns real
        call SaveStr(ht,key,0,"()R")
        call Call("GetMouseVectorY")
        return         LoadReal(ht,key,0)
    endfunction
    
    //获取魔兽窗口宽
    function GetWindowWidth takes nothing returns integer
        call SaveStr(ht,key,0,"()I")
        call Call("GetWindowWidth")
        return         LoadInteger(ht,key,0)
    endfunction
    
    //获取魔兽窗口高
    function GetWindowHeight takes nothing returns integer
        call SaveStr(ht,key,0,"()I")
        call Call("GetWindowHeight")
        return         LoadInteger(ht,key,0)
    endfunction
    
    //16进制函数
    function Hex takes integer i returns string
        call SaveStr(ht,key,0,"(I)S")
        call SaveInteger(ht,key,1,i)
        call Call("Hex")
    return         LoadStr(ht,key,0)
    endfunction
    
    //==================字体类================================
    //创建字体
    function CreateFont takes nothing returns integer
        call SaveStr(ht,key,0,"()I")
        call Call("CreateFont")
        return         LoadInteger(ht,key,0)
    endfunction
    
    //销毁字体
    function DestroyFont takes integer font returns nothing
        call SaveStr(ht,key,0,"(I)V")
        call Call("DestroyFont")
    endfunction
    
    //获取字体宽
    function GetFontWidth takes integer font returns integer
        call SaveStr(ht,key,0,"(I)I")
        call SaveInteger(ht,key,1,font)
        call Call("GetFontWidth")
        return         LoadInteger(ht,key,0)
    endfunction
    
    //设置字体宽
    function SetFontWidth takes integer font,integer value returns nothing
        call SaveStr(ht,key,0,"(II)V")
        call SaveInteger(ht,key,1,font)
        call SaveInteger(ht,key,2,value)
        call Call("SetFontWidth")
    endfunction
    
    //获取字体高
    function GetFontHeight takes integer font returns integer
        call SaveStr(ht,key,0,"(I)I")
        call SaveInteger(ht,key,1,font)
        call Call("GetFontHeight")
        return         LoadInteger(ht,key,0)
    endfunction
    
    //设置字体高
    function SetFontHeight takes integer font,integer value returns nothing
        call SaveStr(ht,key,0,"(II)V")
        call SaveInteger(ht,key,1,font)
        call SaveInteger(ht,key,2,value)
        call Call("SetFontHeight")
    endfunction
    
    //获取字体粗细
    function GetFontWeight takes integer font returns integer
        call SaveStr(ht,key,0,"(I)I")
        call SaveInteger(ht,key,1,font)
        call Call("GetFontWeight")
        return         LoadInteger(ht,key,0)
    endfunction
    
    //设置字体粗细
    function SetFontWeight takes integer font,integer value returns nothing
        call SaveStr(ht,key,0,"(II)V")
        call SaveInteger(ht,key,1,font)
        call SaveInteger(ht,key,2,value)
        call Call("SetFontWeight")
    endfunction
    
    //设置字体是否倾斜
    function SetFontItalic takes integer font,boolean value returns nothing
        call SaveStr(ht,key,0,"(IB)V")
        call SaveInteger(ht,key,1,font)
        call SaveBoolean(ht,key,2,value)
        call Call("SetFontItalic")
    endfunction
    
    //获取字体类型
    function GetFontFaceName takes integer font returns string
        call SaveStr(ht,key,0,"(I)S")
        call SaveInteger(ht,key,1,font)
        call Call("GetFontFaceName")
        return         LoadStr(ht,key,0)
    endfunction
    
    //设置字体类型
    function SetFontFaceName takes integer font,string value returns nothing
        call SaveStr(ht,key,0,"(IS)V")
        call SaveInteger(ht,key,1,font)
        call SaveStr(ht,key,2,value)
        call Call("SetFontFaceName")
    endfunction
    
    //==============写字类===========================
    //创建文字 参数是 字体 内容 屏幕坐标x y 存活时间 颜色值
    function CreateText takes integer font,string str,real x,real y,real time,integer color returns integer
        call SaveStr(ht,key,0,"(ISRRRI)I")
        call SaveInteger(ht,key,1,font)
        call SaveStr(ht,key,2,str)
        call SaveReal(ht,key,3,x)
        call SaveReal(ht,key,4,y)
        call SaveReal(ht,key,5,time)
        call SaveInteger(ht,key,6,color)
        call Call("CreateText")
        return         LoadInteger(ht,key,0)
    endfunction
    
    //获取文字内容
    function GetTextString takes integer text returns string
        call SaveStr(ht,key,0,"(I)S")
        call SaveInteger(ht,key,1,text)
        call Call("GetTextString")
        return         LoadStr(ht,key,0)
    endfunction
    
    //设置文字内容
    function SetTextString takes integer text,string str returns nothing
        call SaveStr(ht,key,0,"(IS)V")
        call SaveInteger(ht,key,1,text)
        call SaveStr(ht,key,2,str)
        call Call("SetTextString")
    endfunction
    
    //获取文字坐标x轴
    function GetTextX takes integer text returns real
        call SaveStr(ht,key,0,"(I)R")
        call SaveInteger(ht,key,1,text)
        call Call("GetTextX")
        return         LoadReal(ht,key,0)
    endfunction
    
    //设置文字坐标x轴
    function SetTextX takes integer text,real x returns nothing
        call SaveStr(ht,key,0,"(IR)V")
        call SaveInteger(ht,key,1,text)
        call SaveReal(ht,key,2,x)
        call Call("SetTextX")
    endfunction
    
    //获取文字坐标y轴
    function GetTextY takes integer text returns real
        call SaveStr(ht,key,0,"(I)R")
        call SaveInteger(ht,key,1,text)
        call Call("GetTextY")
        return         LoadReal(ht,key,0)
    endfunction
    
    //设置文字坐标y轴
    function SetTextY takes integer text,real y returns nothing
        call SaveStr(ht,key,0,"(IR)V")
        call SaveInteger(ht,key,1,text)
        call SaveReal(ht,key,2,y)
        call Call("SetTextY")
    endfunction
    
    //获取文字剩余存活时间
    function GetTextTime takes integer text returns real
        call SaveStr(ht,key,0,"(I)R")
        call SaveInteger(ht,key,1,text)
        call Call("GetTextTime")
        return         LoadReal(ht,key,0)
    endfunction
    
    //设置文字剩余存活时间
    function SetTextTime takes integer text,real value returns nothing
        call SaveStr(ht,key,0,"(IR)V")
        call SaveInteger(ht,key,1,text)
        call SaveReal(ht,key,2,value)
        call Call("SetTextTime")
    endfunction
    
    //获取文字颜色 16进制 0xFFFFFFFF 前2位表示透明 后6位表示 红绿蓝
    function GetTextColor takes integer text returns integer
        call SaveStr(ht,key,0,"(I)I")
        call SaveInteger(ht,key,1,text)
        call Call("GetTextColor")
        return         LoadInteger(ht,key,0)
    endfunction
    
    //设置文字颜色 16进制
    function SetTextColor takes integer text,integer value returns nothing
        call SaveStr(ht,key,0,"(II)V")
        call SaveInteger(ht,key,1,text)
        call SaveInteger(ht,key,2,value)
        call Call("SetTextColor")
    endfunction
    
    //创建屏幕图像 图像路径 相对魔兽窗口x轴 相对魔兽窗口y轴 相对魔兽窗口 宽度 相对魔兽窗口 高度 等级
    function CreateTexture takes string path,real x,real y,real width,real height,integer color,integer level returns integer
        call SaveStr(ht,key,0,"(SRRRRII)I")
        call SaveStr(ht,key,1,path)
        call SaveReal(ht,key,2,x)
        call SaveReal(ht,key,3,y)
        call SaveReal(ht,key,4,width)
        call SaveReal(ht,key,5,height)
        call SaveInteger(ht,key,6,color)
        call SaveInteger(ht,key,7,level)
        call Call("CreateTexture")
        return         LoadInteger(ht,key,0)
    endfunction
    
    //删除图像
    function DestroyTexture takes integer texture returns nothing
        call SaveStr(ht,key,0,"(I)V")
        call SaveInteger(ht,key,1,texture)
        call Call("DestroyTexture")
    endfunction
    
    //获取图像相对魔兽窗口坐标x轴
    function GetTextureX takes integer texture returns real
        call SaveStr(ht,key,0,"(I)R")
        call SaveInteger(ht,key,1,texture)
        call Call("GetTextureX")
        return         LoadReal(ht,key,0)
    endfunction
    
    //设置图像相对魔兽窗口坐标x轴
    function SetTextureX takes integer texture,real value returns nothing
        call SaveStr(ht,key,0,"(IR)V")
        call SaveInteger(ht,key,1,texture)
        call SaveReal(ht,key,2,value)
        call Call("SetTextureX")
    endfunction
    
    //获取图像相对魔兽窗口坐标y轴
    function GetTextureY takes integer texture returns real
        call SaveStr(ht,key,0,"(I)R")
        call SaveInteger(ht,key,1,texture)
        call Call("GetTextureY")
        return         LoadReal(ht,key,0)
    endfunction
    
    //设置图像相对魔兽窗口坐标y轴
    function SetTextureY takes integer texture,real value returns nothing
        call SaveStr(ht,key,0,"(IR)V")
        call SaveInteger(ht,key,1,texture)
        call SaveReal(ht,key,2,value)
        call Call("SetTextureY")
    endfunction
    
    //获取图像相对魔兽窗口 宽度
    function GetTextureWidth takes integer texture returns real
        call SaveStr(ht,key,0,"(I)R")
        call SaveInteger(ht,key,1,texture)
        call Call("GetTextureWidth")
        return         LoadReal(ht,key,0)
    endfunction
    
    //设置图像相对魔兽窗口 宽度
    function SetTextureWidth takes integer texture,real value returns nothing
        call SaveStr(ht,key,0,"(IR)V")
        call SaveInteger(ht,key,1,texture)
        call SaveReal(ht,key,2,value)
        call Call("SetTextureWidth")
    endfunction
    
    //获取图像相对魔兽窗口 高度
    function GetTextureHeight takes integer texture returns real
        call SaveStr(ht,key,0,"(I)R")
        call SaveInteger(ht,key,1,texture)
        call Call("GetTextureHeight")
        return         LoadReal(ht,key,0)
    endfunction
    
    //设置图像相对魔兽窗口 高度
    function SetTextureHeight takes integer texture,real value returns nothing
        call SaveStr(ht,key,0,"(IR)V")
        call SaveInteger(ht,key,1,texture)
        call SaveReal(ht,key,2,value)
        call Call("SetTextureHeight")
    endfunction
    
    //获取图像颜色
    function GetTextureColor takes integer texture returns integer
        call SaveStr(ht,key,0,"(I)I")
        call SaveInteger(ht,key,1,texture)
        call Call("GetTextureColor")
        return         LoadInteger(ht,key,0)
    endfunction
    
    //设置图像颜色
    function SetTextureColor takes integer texture,integer value returns nothing
        call SaveStr(ht,key,0,"(II)V")
        call SaveInteger(ht,key,1,texture)
        call SaveInteger(ht,key,2,value)
        call Call("SetTextureColor")
    endfunction
    
    //获取图像级别 级别越高 越上层显示
    function GetTextureLevel takes integer texture returns integer
        call SaveStr(ht,key,0,"(I)I")
        call SaveInteger(ht,key,1,texture)
        call Call("GetTextureLevel")
        return         LoadInteger(ht,key,0)
    endfunction
    
    //设置图像级别 级别越高越上层显示
    function SetTextureLevel takes integer texture,integer value returns nothing
        call SaveStr(ht,key,0,"(II)V")
        call SaveInteger(ht,key,1,texture)
        call SaveInteger(ht,key,2,value)
        call Call("SetTextureLevel")
    endfunction
    
    //获取图像旋转角度
    function GetTextureRotation takes integer texture returns real
        call SaveStr(ht,key,0,"(I)R")
        call SaveInteger(ht,key,1,texture)
        call Call("GetTextureRotation")
        return         LoadReal(ht,key,0)
    endfunction
    
    //设置图像旋转角度  参数 图像,角度  角度制
    function SetTextureRotation takes integer texture,real value returns nothing
        call SaveStr(ht,key,0,"(IR)V")
        call SaveInteger(ht,key,1,texture)
        call SaveReal(ht,key,2,value)
        call Call("SetTextureRotation")
    endfunction
    
    //获取图像像素的 宽
    function GetTexturePixelWidth takes integer texture returns real
        call SaveStr(ht,key,0,"(I)R")
        call SaveInteger(ht,key,1,texture)
        call Call("GetTexturePixelWidth")
        return         LoadReal(ht,key,0)
    endfunction
    
    //获取图像像素的 高  可以在  宽 * 高的矩形里进行切割
    function GetTexturePixelHeight takes integer texture returns real
        call SaveStr(ht,key,0,"(I)R")
        call SaveInteger(ht,key,1,texture)
        call Call("GetTexturePixelWidth")
        return         LoadReal(ht,key,0)
    endfunction
    
    //获取图形切割区域 默认完整的图形区域
    //注意！ 返回的rect 是handle 记得用 RemoveRect 排泄
    function GetTextureSrcRect takes integer texture returns rect
        call SaveStr(ht,key,0,"(I)Hrect;")
        call SaveInteger(ht,key,1,texture)
        call Call("GetTextureSrcRect")
        return         LoadRectHandle(ht,key,0)
    endfunction
    
    //设置图形切割区域  在原图片上按 rect 矩形进行切割
    //rect的范围应该这样描绘 local rect r=Rect(左,下,右,上) 来决定切割这个区域 
    //比如 128*256的图片 完整的图片的 矩形应该是 左=0 下=0 右=128 上=256
    // 左上右下 表示 图片像素里的 宽跟高的范围
    function SetTextureSrcRect takes integer texture,rect value returns nothing
        call SaveStr(ht,key,0,"(IHrect;)V")
        call SaveInteger(ht,key,1,texture)
        call SaveRectHandle(ht,key,2,value)
        call Call("SetTextureSrcRect")
    endfunction
    
    //更改图像图形  参数 图像句柄 新的图形路径
    function SetTexture takes integer texture,string value returns nothing
        call SaveStr(ht,key,0,"(IS)V")
        call SaveInteger(ht,key,1,texture)
        call SaveStr(ht,key,2,value)
        call Call("SetTexture")
    endfunction
    
    //设置图像是否显示 隐藏 true显示  false隐藏
    function SetTextureShow takes integer texture,boolean value returns nothing
        call SaveStr(ht,key,0,"(IB)V")
        call SaveInteger(ht,key,1,texture)
        call SaveBoolean(ht,key,2,value)
        call Call("SetTextureShow")
    endfunction
    
    //设置图像是否响应事件 默认true 为开启触发状态 false为关闭触发
    function SetTextureTrigger takes integer texture,boolean value returns nothing
        call SaveStr(ht,key,0,"(IB)V")
        call SaveInteger(ht,key,1,texture)
        call SaveBoolean(ht,key,2,value)
        call Call("SetTextureTrigger")
    endfunction
    
    //开启图像的触发器
    function EnableTextureTrigger takes integer texture returns nothing
        call SetTextureTrigger(texture,true)
    endfunction
    
    //关闭图像的触发器
    function DisableTextureTrigger takes integer texture returns nothing
        call SetTextureTrigger(texture,false)
    endfunction
    
    //获取 图片中心点X轴
    function GetTextureCenterX takes integer texture returns real
        return         GetTextureX(texture) + GetTextureWidth(texture) / 2
    endfunction
    
    //获取 图片中心点y轴
    function GetTextureCenterY takes integer texture returns real
        return         GetTextureY(texture) + GetTextureHeight(texture) / 2
    endfunction
    
    //获取 图片左下角X轴
    function GetTextureMinX takes integer texture returns real
        return         GetTextureX(texture)
    endfunction
    
    //获取 图片左下角y轴
    function GetTextureMinY takes integer texture returns real
        return         GetTextureY(texture)
    endfunction
    
    //获取 图片右上角X轴
    function GetTextureMaxX takes integer texture returns real
        return         GetTextureX(texture) + GetTextureWidth(texture)
    endfunction
    
    //获取 图片右上角y轴
    function GetTextureMaxY takes integer texture returns real
        return         GetTextureY(texture) + GetTextureHeight(texture)
    endfunction
    
    //==================================================
    //给图像添加事件  
    //第一个参数是图像地址
    //第二个参数是按键值   
    //第三个参数是 按下时回调的函数 
    //第四个参数是 弹起时回调的函数
    //鼠标移动事件 则是 第3个参数 是进入图形区域时调用 离开图形区域时调用第4个参数
    //返回事件句柄
    //==================================================
    function TextureAddEvent takes integer texture,integer order,code wCallBack,code lCallBack returns integer
        call SaveStr(ht,key,0,"(IIII)I")
        call SaveInteger(ht,key,1,texture)
        call SaveInteger(ht,key,2,order)
        call SaveInteger(ht,key,3,GetFuncAddr(wCallBack))
        call SaveInteger(ht,key,4,GetFuncAddr(lCallBack))
        call Call("TextureAddEvent")
        return         LoadInteger(ht,key,0)
    endfunction
    
    //图像删除事件 参数 图像句柄 事件句柄
    function TextureRemoveEvent takes integer texture,integer Event returns nothing
        call SaveStr(ht,key,0,"(II)V")
        call SaveInteger(ht,key,1,texture)
        call SaveInteger(ht,key,2,Event)
        call Call("TextureRemoveEvent")
    endfunction
    
    //设置键位状态 指定键位 按下或弹起状态  true为按下 false为弹起
    function SetKeyboard takes integer Key,boolean up returns nothing
        call SaveStr(ht,key,0,"(IB)V")
        call SaveInteger(ht,key,1,Key)
        call SaveBoolean(ht,key,2,up)
        call Call("SetKeyboard")
    endfunction
    
    // 模拟按键  按下 弹起 模拟1次点击
    function ClickKeyboard takes integer Key returns nothing
        call SetKeyboard(Key,true)
        call SetKeyboard(Key,false)
    endfunction
    
    //=========================图像事件响应动作====================
    
    function GetEventIndex takes nothing returns integer
        return         GetHandleId(GetExpiredTimer())
    endfunction
    
    //获取响应的键位
    function GetTriggerKeyboard takes nothing returns integer
        return         LoadInteger(ht,GetEventIndex(),0x100)
    endfunction
    
    //获取触发图像
    function GetTriggerTexture takes nothing returns integer
        return         LoadInteger(ht,GetEventIndex(),0xff)
    endfunction
    
    //获取响应事件
    function GetTriggerEvent takes nothing returns integer
        return         LoadInteger(ht,GetEventIndex(),0xfe)
    endfunction
    
    // 获取响应的键盘操作 按下为true 弹起为false
    function GetTriggerKeyboardAction takes nothing returns boolean
        if            (LoadInteger(ht,GetEventIndex(),0x101)==0) then
            return         false
        endif
        return         true
    endfunction
    
    //====================魔兽控制台UI=============================
    //设置是否隐藏控制台UI true为隐藏 false为恢复
    function ShowConsole takes boolean show returns nothing
        call SaveStr(ht,key,0,"(B)V")
        call SaveBoolean(ht,key,1,show)
        call Call("ShowConsole")
    endfunction
    
    //获取小地图图形位置X轴向量
    function GetLittleMapX takes nothing returns real
        call SaveStr(ht,key,0,"()R")
        call Call("GetLittleMapX")
        return         LoadReal(ht,key,0)
    endfunction
    
    //设置小地图图形位置X轴向量
    function SetLittleMapX takes real value returns nothing
        call SaveStr(ht,key,0,"(R)V")
        call SaveReal(ht,key,1,value)
        call Call("SetLittleMapX")
    endfunction
    
    //获取小地图图形位置y轴向量
    function GetLittleMapY takes nothing returns real
        call SaveStr(ht,key,0,"()R")
        call Call("GetLittleMapY")
        return         LoadReal(ht,key,0)
    endfunction
    
    //设置小地图图形位置Y轴向量
    function SetLittleMapY takes real value returns nothing
        call SaveStr(ht,key,0,"(R)V")
        call SaveReal(ht,key,1,value)
        call Call("SetLittleMapY")
    endfunction
    
    //====================字体结构体的封装=============================
    struct LOGFONT
        integer font
        method operator lfHeight takes nothing returns integer
            return         GetFontHeight(font)
        endmethod
        method operator lfHeight= takes integer value returns nothing
            call SetFontHeight(font,value)
        endmethod
        method operator lfWidth takes nothing returns integer
            return         GetFontWidth(font)
        endmethod
        method operator lfWidth= takes integer value returns nothing
            call SetFontWidth(font,value)
        endmethod
        method operator lfWeight takes nothing returns integer
            return         GetFontWeight(font)
        endmethod
        method operator lfWeight= takes integer value returns nothing
            call SetFontWeight(font,value)
        endmethod
        method operator lfItalic= takes boolean value returns nothing
            call SetFontItalic(font,value)
        endmethod
        method operator lfFaceName takes nothing returns string
            return         GetFontFaceName(font)
        endmethod
        method operator lfFaceName= takes string str returns nothing
            call SetFontFaceName(font,str)
        endmethod
        static method create takes nothing returns LOGFONT
            local LOGFONT logfont=LOGFONT.allocate()
            set logfont.font=CreateFont()
            return         logfont
        endmethod
        method onDestroy takes nothing returns nothing
            call DestroyFont(font)
        endmethod
        method Text takes string str,real x,real y,real time,integer color returns integer
            return         CreateText(font,str,x,y,time,color)
        endmethod
    endstruct
    
endlibrary