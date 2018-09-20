globals
//globals from BzAPI:
constant boolean LIBRARY_BzAPI=true
trigger array BzAPI__DamageEventQueue
integer BzAPI__DamageEventNumber= 0
//endglobals from BzAPI
//globals from JapiConstantLib:
constant boolean LIBRARY_JapiConstantLib=true
integer array i_1
integer array i_2
integer array i_3
integer array i_4
integer array i_5
integer array i_6
integer array i_7
integer array i_8
integer array i_9
integer array i_10
integer array i_11
integer array i_12
integer array i_13
integer array i_14
integer array i_15
integer array i_16
integer array i_17
integer array i_18
integer array i_19
integer array i_20
integer array i_21
integer array i_22
integer array i_23
integer array i_24
integer array i_25
integer array i_26
integer array i_27
integer array i_28
integer array i_29
integer array i_30
integer array i_31
integer array i_32

//endglobals from JapiConstantLib
//globals from YDTriggerSaveLoadSystem:
constant boolean LIBRARY_YDTriggerSaveLoadSystem=true
hashtable YDHT
hashtable YDLOC
//endglobals from YDTriggerSaveLoadSystem
//globals from japi:
constant boolean LIBRARY_japi=true
hashtable japi_ht=InitHashtable()
integer japi__key=StringHash("jass")
//endglobals from japi
//globals from LocalActionLib:
constant boolean LIBRARY_LocalActionLib=true
constant hashtable LocalActionLib__ht=japi_ht
constant integer LocalActionLib__key=StringHash("jass")
//endglobals from LocalActionLib
//globals from d3d:
constant boolean LIBRARY_d3d=true
constant hashtable d3d__ht=japi_ht
constant integer d3d__key=StringHash("jass")
//endglobals from d3d
    // User-defined
unit udg_unit= null
item udg_item= null
destructable udg_destructable= null
integer udg_i= 0
    // Generated
trigger gg_trg_japi_________u= null
trigger gg_trg____japi___u= null
trigger gg_trg____d3d___u= null
trigger gg_trg_______japi___u= null
trigger gg_trg___________________u= null
trigger gg_trg_api_2_0= null
trigger gg_trg_lua____________u= null
trigger gg_trg_______lua______u= null
trigger gg_trg__________u= null

trigger l__library_init

//JASSHelper struct globals:
constant integer si__LOGFONT=1
integer si__LOGFONT_F=0
integer si__LOGFONT_I=0
integer array si__LOGFONT_V
integer array s__LOGFONT_font
trigger st__LOGFONT_onDestroy
integer f__arg_this

endglobals
    native DzGetMouseTerrainX takes nothing returns real
    native DzGetMouseTerrainY takes nothing returns real
    native DzGetMouseTerrainZ takes nothing returns real
    native DzIsMouseOverUI takes nothing returns boolean
    native DzGetMouseX takes nothing returns integer
    native DzGetMouseY takes nothing returns integer
    native DzGetMouseXRelative takes nothing returns integer
    native DzGetMouseYRelative takes nothing returns integer
    native DzSetMousePos takes integer x, integer y returns nothing
    native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
    native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzGetTriggerKey takes nothing returns integer
    native DzGetWheelDelta takes nothing returns integer
    native DzIsKeyDown takes integer iKey returns boolean
    native DzGetTriggerKeyPlayer takes nothing returns player
    native DzGetWindowWidth takes nothing returns integer
    native DzGetWindowHeight takes nothing returns integer
    native DzGetWindowX takes nothing returns integer
    native DzGetWindowY takes nothing returns integer
    native DzTriggerRegisterWindowResizeEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterWindowResizeEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzIsWindowActive takes nothing returns boolean
    native DzDestructablePosition takes destructable d, real x, real y returns nothing
    native DzSetUnitPosition takes unit whichUnit, real x, real y returns nothing
    native DzExecuteFunc takes string funcName returns nothing
    native DzGetUnitUnderMouse takes nothing returns unit
    native DzSetUnitTexture takes unit whichUnit, string path, integer texId returns nothing
    native DzSetMemory takes integer address, real value returns nothing
    native DzSetUnitID takes unit whichUnit, integer id returns nothing
    native DzSetUnitModel takes unit whichUnit, string path returns nothing
    native DzSetWar3MapMap takes string map returns nothing
    native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing
    native DzSyncData takes string prefix, string data returns nothing
    native DzGetTriggerSyncData takes nothing returns string
    native DzGetTriggerSyncPlayer takes nothing returns player
    native DzFrameHideInterface takes nothing returns nothing
    native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing
    native DzFrameGetPortrait takes nothing returns integer
    native DzFrameGetMinimap takes nothing returns integer
    native DzFrameGetCommandBarButton takes integer row, integer column returns integer
    native DzFrameGetHeroBarButton takes integer buttonId returns integer
    native DzFrameGetHeroHPBar takes integer buttonId returns integer
    native DzFrameGetHeroManaBar takes integer buttonId returns integer
    native DzFrameGetItemBarButton takes integer buttonId returns integer
    native DzFrameGetMinimapButton takes integer buttonId returns integer
    native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer
    native DzFrameGetTooltip takes nothing returns integer
    native DzFrameGetChatMessage takes nothing returns integer
    native DzFrameGetUnitMessage takes nothing returns integer
    native DzFrameGetTopMessage takes nothing returns integer
    native DzGetColor takes integer r, integer g, integer b, integer a returns integer
    native DzFrameSetUpdateCallback takes string func returns nothing
    native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing
    native DzFrameShow takes integer frame, boolean enable returns nothing
    native DzCreateFrame takes string frame, integer parent, integer id returns integer
    native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer
    native DzDestroyFrame takes integer frame returns nothing
    native DzLoadToc takes string fileName returns nothing
    native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing
    native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing
    native DzFrameClearAllPoints takes integer frame returns nothing
    native DzFrameSetEnable takes integer name, boolean enable returns nothing
    native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
    native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
    native DzGetTriggerUIEventPlayer takes nothing returns player
    native DzGetTriggerUIEventFrame takes nothing returns integer
    native DzFrameFindByName takes string name, integer id returns integer
    native DzSimpleFrameFindByName takes string name, integer id returns integer
    native DzSimpleFontStringFindByName takes string name, integer id returns integer
    native DzSimpleTextureFindByName takes string name, integer id returns integer
    native DzGetGameUI takes nothing returns integer
    native DzClickFrame takes integer frame returns nothing
    native DzSetCustomFovFix takes real value returns nothing
    native DzEnableWideScreen takes boolean enable returns nothing
    native DzFrameSetText takes integer frame, string text returns nothing
    native DzFrameGetText takes integer frame returns string
    native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing
    native DzFrameGetTextSizeLimit takes integer frame returns integer
    native DzFrameSetTextColor takes integer frame, integer color returns nothing
    native DzGetMouseFocus takes nothing returns integer
    native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean
    native DzFrameSetFocus takes integer frame, boolean enable returns boolean
    native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing
    native DzFrameGetEnable takes integer frame returns boolean
    native DzFrameSetAlpha takes integer frame, integer alpha returns nothing
    native DzFrameGetAlpha takes integer frame returns integer
    native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing
    native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing
    native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing
    native DzFrameSetScale takes integer frame, real scale returns nothing
    native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing
    native DzFrameCageMouse takes integer frame, boolean enable returns nothing
    native DzFrameGetValue takes integer frame returns real
    native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing
    native DzFrameSetStepValue takes integer frame, real step returns nothing
    native DzFrameSetValue takes integer frame, real value returns nothing
    native DzFrameSetSize takes integer frame, real w, real h returns nothing
    native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer
    native DzFrameSetVertexColor takes integer frame, integer color returns nothing
    native SetHeroLevels takes code f returns nothing 
    native TeleportCaptain takes real x, real y returns nothing
    native GetUnitGoldCost takes integer unitid returns integer


//Generated method caller for LOGFONT.onDestroy
function sc__LOGFONT_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__LOGFONT_onDestroy)
endfunction

//Generated allocator of LOGFONT
function s__LOGFONT__allocate takes nothing returns integer
 local integer this=si__LOGFONT_F
    if (this!=0) then
        set si__LOGFONT_F=si__LOGFONT_V[this]
    else
        set si__LOGFONT_I=si__LOGFONT_I+1
        set this=si__LOGFONT_I
    endif
    if (this>8190) then
        return 0
    endif

    set si__LOGFONT_V[this]=-1
 return this
endfunction

//Generated destructor of LOGFONT
function sc__LOGFONT_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__LOGFONT_V[this]!=-1) then
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__LOGFONT_onDestroy)
    set si__LOGFONT_V[this]=si__LOGFONT_F
    set si__LOGFONT_F=this
endfunction

//library BzAPI:
    //hardware




























    //plus









    //sync




    //gui
































































    function DzTriggerRegisterMouseEventTrg takes trigger trg,integer status,integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterKeyEventTrg takes trigger trg,integer status,integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterKeyEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterMouseMoveEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseMoveEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterMouseWheelEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseWheelEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterWindowResizeEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterWindowResizeEvent(trg, true, null)
    endfunction
    function DzF2I takes integer i returns integer
        return i
    endfunction
    function DzI2F takes integer i returns integer
        return i
    endfunction
    function DzK2I takes integer i returns integer
        return i
    endfunction
    function DzI2K takes integer i returns integer
        return i
    endfunction

//library BzAPI ends
//library JapiConstantLib:
    function JapiConstantLib_init_memory takes nothing returns nothing
         set i_1[8191]=0
 set i_2[8191]=0
 set i_3[8191]=0
 set i_4[8191]=0
 set i_5[8191]=0
 set i_6[8191]=0
 set i_7[8191]=0
 set i_8[8191]=0
 set i_9[8191]=0
 set i_10[8191]=0
 set i_11[8191]=0
 set i_12[8191]=0
 set i_13[8191]=0
 set i_14[8191]=0
 set i_15[8191]=0
 set i_16[8191]=0
 set i_17[8191]=0
 set i_18[8191]=0
 set i_19[8191]=0
 set i_20[8191]=0
 set i_21[8191]=0
 set i_22[8191]=0
 set i_23[8191]=0
 set i_24[8191]=0
 set i_25[8191]=0
 set i_26[8191]=0
 set i_27[8191]=0
 set i_28[8191]=0
 set i_29[8191]=0
 set i_30[8191]=0
 set i_31[8191]=0
 set i_32[8191]=0

    endfunction
    function JapiConstantLib_init takes nothing returns integer
        call ExecuteFunc("JapiConstantLib_init_memory")
        return 1
    endfunction

//library JapiConstantLib ends
//library YDTriggerSaveLoadSystem:
    function YDTriggerSaveLoadSystem__Init takes nothing returns nothing
            set YDHT=InitHashtable()
        set YDLOC=InitHashtable()
    endfunction

//library YDTriggerSaveLoadSystem ends
//library japi:



    
    
     function Call takes string str returns nothing
        call UnitId(str)
    endfunction
    //获取鼠标在地图中的x轴
     function GetMouseX takes nothing returns real
        call SaveStr(japi_ht, japi__key, 0, "()R")
        call UnitId(("GetMouseX")) // INLINED!!
        return LoadReal(japi_ht, japi__key, 0)
    endfunction
    //获取鼠标在地图中的y轴
     function GetMouseY takes nothing returns real
        call SaveStr(japi_ht, japi__key, 0, "()R")
        call UnitId(("GetMouseY")) // INLINED!!
        return LoadReal(japi_ht, japi__key, 0)
    endfunction
    
    
    
    
    //==========================================================================
     function EXGetUnitAbility takes unit u,integer abilityId returns integer
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(u))
        call SaveInteger(japi_ht, japi__key, 2, abilityId)
        call SaveStr(japi_ht, japi__key, 0, "(II)I")
        call UnitId(("EXGetUnitAbility")) // INLINED!!
        return LoadInteger(japi_ht, japi__key, 0)
    endfunction
    
    // yd japi ==================================================================
    // 技能----------------------------------------------------
    
    ///<summary>技能属性 [JAPI]</summary>
  function YDWEGetUnitAbilityState takes unit u,integer abilcode,integer data_type returns real
        call SaveInteger(japi_ht, japi__key, 1, EXGetUnitAbility(u , abilcode))
        call SaveInteger(japi_ht, japi__key, 2, data_type)
        call SaveStr(japi_ht, japi__key, 0, "(II)R")
        call UnitId(("EXGetAbilityState")) // INLINED!!
		return LoadReal(japi_ht, japi__key, 0)
	endfunction
	///<summary>技能数据 (整数) [JAPI]</summary>
  function YDWEGetUnitAbilityDataInteger takes unit u,integer abilcode,integer level,integer data_type returns integer
        call SaveInteger(japi_ht, japi__key, 1, EXGetUnitAbility(u , abilcode))
        call SaveInteger(japi_ht, japi__key, 2, level)
        call SaveInteger(japi_ht, japi__key, 3, data_type)
        call SaveStr(japi_ht, japi__key, 0, "(III)I")
        call UnitId(("EXGetAbilityDataInteger")) // INLINED!!
		return LoadInteger(japi_ht, japi__key, 0)
	endfunction
	///<summary>技能数据 (实数) [JAPI]</summary>
  function YDWEGetUnitAbilityDataReal takes unit u,integer abilcode,integer level,integer data_type returns real
        call SaveInteger(japi_ht, japi__key, 1, EXGetUnitAbility(u , abilcode))
        call SaveInteger(japi_ht, japi__key, 2, level)
        call SaveInteger(japi_ht, japi__key, 3, data_type)
        call SaveStr(japi_ht, japi__key, 0, "(III)R")
        call UnitId(("EXGetAbilityDataReal")) // INLINED!!
		return LoadReal(japi_ht, japi__key, 0)
    endfunction
	///<summary>技能数据 (字符串) [JAPI]</summary>
  function YDWEGetUnitAbilityDataString takes unit u,integer abilcode,integer level,integer data_type returns string
        call SaveInteger(japi_ht, japi__key, 1, EXGetUnitAbility(u , abilcode))
        call SaveInteger(japi_ht, japi__key, 2, level)
        call SaveInteger(japi_ht, japi__key, 3, data_type)
        call SaveStr(japi_ht, japi__key, 0, "(III)S")
        call UnitId(("EXGetAbilityDataString")) // INLINED!!
		return LoadStr(japi_ht, japi__key, 0)
	endfunction
	///<summary>设置技能属性 [JAPI]</summary>
  function YDWESetUnitAbilityState takes unit u,integer abilcode,integer data_type,real value returns nothing
        call SaveInteger(japi_ht, japi__key, 1, EXGetUnitAbility(u , abilcode))
        call SaveInteger(japi_ht, japi__key, 2, data_type)
        call SaveReal(japi_ht, japi__key, 3, value)
        call SaveStr(japi_ht, japi__key, 0, "(IIR)V")
        call UnitId(("EXSetAbilityState")) // INLINED!!
    endfunction
	///<summary>设置技能数据 (整数) [JAPI]</summary>
  function YDWESetUnitAbilityDataInteger takes unit u,integer abilcode,integer level,integer data_type,integer value returns nothing
        call SaveInteger(japi_ht, japi__key, 1, EXGetUnitAbility(u , abilcode))
        call SaveInteger(japi_ht, japi__key, 2, level)
        call SaveInteger(japi_ht, japi__key, 3, data_type)
        call SaveInteger(japi_ht, japi__key, 4, value)
        call SaveStr(japi_ht, japi__key, 0, "(IIII)V")
        call UnitId(("EXSetAbilityDataInteger")) // INLINED!!
    endfunction
	///<summary>设置技能数据 (实数) [JAPI]</summary>
  function YDWESetUnitAbilityDataReal takes unit u,integer abilcode,integer level,integer data_type,real value returns nothing
        call SaveInteger(japi_ht, japi__key, 1, EXGetUnitAbility(u , abilcode))
        call SaveInteger(japi_ht, japi__key, 2, level)
        call SaveInteger(japi_ht, japi__key, 3, data_type)
        call SaveReal(japi_ht, japi__key, 4, value)
        call SaveStr(japi_ht, japi__key, 0, "(IIIR)V")
        call UnitId(("EXSetAbilityDataReal")) // INLINED!!
    endfunction
	///<summary>设置技能数据 (字符串) [JAPI]</summary>
  function YDWESetUnitAbilityDataString takes unit u,integer abilcode,integer level,integer data_type,string value returns nothing
        call SaveInteger(japi_ht, japi__key, 1, EXGetUnitAbility(u , abilcode))
        call SaveInteger(japi_ht, japi__key, 2, level)
        call SaveInteger(japi_ht, japi__key, 3, data_type)
        call SaveStr(japi_ht, japi__key, 4, value)
        call SaveStr(japi_ht, japi__key, 0, "(IIIS)V")
        call UnitId(("EXSetAbilityDataString")) // INLINED!!
    endfunction
	
    
    //设置技能变身数据A
     function EXSetAbilityAEmeDataA takes integer ability_handle,integer value returns boolean
        call SaveInteger(japi_ht, japi__key, 1, ability_handle)
        call SaveInteger(japi_ht, japi__key, 2, value)
        call SaveStr(japi_ht, japi__key, 0, "(II)B")
        call UnitId(("EXSetAbilityAEmeDataA")) // INLINED!!
        return LoadBoolean(japi_ht, japi__key, 0)
    endfunction
    
    //单位变身
     function YDWEUnitTransform takes unit u,integer abilcode,integer targetid returns nothing
		call UnitAddAbility(u, abilcode)
		call YDWESetUnitAbilityDataInteger(u , abilcode , 1 , 117 , GetUnitTypeId(u))
		call EXSetAbilityAEmeDataA(EXGetUnitAbility(u , abilcode) , GetUnitTypeId(u))
		call UnitRemoveAbility(u, abilcode)
		call UnitAddAbility(u, abilcode)
		call EXSetAbilityAEmeDataA(EXGetUnitAbility(u , abilcode) , targetid)
		call UnitRemoveAbility(u, abilcode)
	endfunction
    
    // 单位-------------------------------------------------------
    
    //暂停单位
     function EXPauseUnit takes unit unit_handle,boolean flag returns nothing
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(unit_handle))
        call SaveBoolean(japi_ht, japi__key, 2, flag)
        call SaveStr(japi_ht, japi__key, 0, "(IB)V")
        call UnitId(("EXPauseUnit")) // INLINED!!
    endfunction
    
    //获取单位字符串
     function EXGetUnitString takes integer unitcode,integer Type returns string
        call SaveInteger(japi_ht, japi__key, 1, unitcode)
        call SaveInteger(japi_ht, japi__key, 2, Type)
        call SaveStr(japi_ht, japi__key, 0, "(II)S")
        call UnitId(("EXGetUnitString")) // INLINED!!
        return LoadStr(japi_ht, japi__key, 0)
    endfunction
    
       //设置单位字符串
     function EXSetUnitString takes integer unitcode,integer Type,string value returns boolean
        call SaveInteger(japi_ht, japi__key, 1, unitcode)
        call SaveInteger(japi_ht, japi__key, 2, Type)
        call SaveStr(japi_ht, japi__key, 3, value)
        call SaveStr(japi_ht, japi__key, 0, "(IIS)B")
        call UnitId(("EXSetUnitString")) // INLINED!!
        return LoadBoolean(japi_ht, japi__key, 0)
    endfunction
    
    //获取单位实数
     function EXGetUnitReal takes integer unitcode,integer Type returns real
        call SaveInteger(japi_ht, japi__key, 1, unitcode)
        call SaveInteger(japi_ht, japi__key, 2, Type)
        call SaveStr(japi_ht, japi__key, 0, "(II)R")
        call UnitId(("EXGetUnitReal")) // INLINED!!
        return LoadReal(japi_ht, japi__key, 0)
    endfunction
    
    //设置单位实数
     function EXSetUnitReal takes integer unitcode,integer Type,real value returns boolean
        call SaveInteger(japi_ht, japi__key, 1, unitcode)
        call SaveInteger(japi_ht, japi__key, 2, Type)
        call SaveReal(japi_ht, japi__key, 3, value)
        call SaveStr(japi_ht, japi__key, 0, "(IIR)B")
        call UnitId(("EXSetUnitReal")) // INLINED!!
        return LoadBoolean(japi_ht, japi__key, 0)
    endfunction
    
    
    //获取单位整数
     function EXGetUnitInteger takes integer unitcode,integer Type returns integer
        call SaveInteger(japi_ht, japi__key, 1, unitcode)
        call SaveInteger(japi_ht, japi__key, 2, Type)
        call SaveStr(japi_ht, japi__key, 0, "(II)I")
        call UnitId(("EXGetUnitInteger")) // INLINED!!
        return LoadInteger(japi_ht, japi__key, 0)
    endfunction
    
    //设置单位整数
     function EXSetUnitInteger takes integer unitcode,integer Type,integer value returns boolean
        call SaveInteger(japi_ht, japi__key, 1, unitcode)
        call SaveInteger(japi_ht, japi__key, 2, Type)
        call SaveInteger(japi_ht, japi__key, 3, value)
        call SaveStr(japi_ht, japi__key, 0, "(III)B")
        call UnitId(("EXSetUnitInteger")) // INLINED!!
        return LoadBoolean(japi_ht, japi__key, 0)
    endfunction
    
        //获取单位数组字符串
     function EXGetUnitArrayString takes integer unitcode,integer Type,integer index returns string
        call SaveInteger(japi_ht, japi__key, 1, unitcode)
        call SaveInteger(japi_ht, japi__key, 2, Type)
        call SaveInteger(japi_ht, japi__key, 3, index)
        call SaveStr(japi_ht, japi__key, 0, "(III)S")
        call UnitId(("EXGetUnitArrayString")) // INLINED!!
        return LoadStr(japi_ht, japi__key, 0)
    endfunction
    
    //设置单位数组字符串
     function EXSetUnitArrayString takes integer unitcode,integer Type,integer index,string value returns boolean
        call SaveInteger(japi_ht, japi__key, 1, unitcode)
        call SaveInteger(japi_ht, japi__key, 2, Type)
        call SaveInteger(japi_ht, japi__key, 3, index)
        call SaveStr(japi_ht, japi__key, 4, value)
        call SaveStr(japi_ht, japi__key, 0, "(IIIS)B")
        call UnitId(("EXSetUnitArrayString")) // INLINED!!
        return LoadBoolean(japi_ht, japi__key, 0)
    endfunction
    //设置单位面向角度(立即转向)
     function EXSetUnitFacing takes unit unit_handle,real angle returns nothing
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(unit_handle))
        call SaveReal(japi_ht, japi__key, 2, angle)
        call SaveStr(japi_ht, japi__key, 0, "(IR)V")
        call UnitId(("EXSetUnitFacing")) // INLINED!!
    endfunction
    
    //设置单位碰撞类型
     function EXSetUnitCollisionType takes boolean enable,unit unit_handle,integer Type returns nothing
        call SaveBoolean(japi_ht, japi__key, 1, enable)
        call SaveInteger(japi_ht, japi__key, 2, GetHandleId(unit_handle))
        call SaveInteger(japi_ht, japi__key, 3, Type)
        call SaveStr(japi_ht, japi__key, 0, "(BII)V")
        call UnitId(("EXSetUnitCollisionType")) // INLINED!!
    endfunction
    
    //设置单位移动类型
     function EXSetUnitMoveType takes unit unit_handle,integer Type returns nothing
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(unit_handle))
        call SaveInteger(japi_ht, japi__key, 2, Type)
        call SaveStr(japi_ht, japi__key, 0, "(II)V")
        call UnitId(("EXSetUnitMoveType")) // INLINED!!
    endfunction
    
    //单位添加眩晕
     function YDWEUnitAddStun takes unit u returns nothing
		call EXPauseUnit(u , true)
	endfunction
    
    //单位删除眩晕
  function YDWEUnitRemoveStun takes unit u returns nothing
		call EXPauseUnit(u , false)
	endfunction
    
    //获取伤害数据
     function EXGetEventDamageData takes integer Type returns integer
        //call SaveInteger(ht,key,1,Type)
        //call SaveStr(ht,key,0,"(I)I")
        //call Call("EXGetEventDamageData")
        //return LoadInteger(ht,key,0)
        return GetUnitGoldCost(Type)
    endfunction
	
    //设置伤害
     function EXSetEventDamage takes real Damage returns boolean
        //call SaveReal(ht,key,1,Damage)
        //call SaveStr(ht,key,0,"(R)B")
        //call Call("EXSetEventDamage")
        //return LoadBoolean(ht,key,0)
        call TeleportCaptain(Damage, 0.00)
        return true
    endfunction
    
    //判断是否是物理伤害
     function YDWEIsEventPhysicalDamage takes nothing returns boolean
		return 0 != (GetUnitGoldCost((1))) // INLINED!!
	endfunction
    //判断是否是攻击伤害
  function YDWEIsEventAttackDamage takes nothing returns boolean
		return 0 != (GetUnitGoldCost((2))) // INLINED!!
	endfunction
	
    //判断是否是范围伤害
  function YDWEIsEventRangedDamage takes nothing returns boolean
		return 0 != (GetUnitGoldCost((3))) // INLINED!!
	endfunction
	
    //判断伤害类型
  function YDWEIsEventDamageType takes damagetype damageType returns boolean
		return damageType == ConvertDamageType((GetUnitGoldCost((4)))) // INLINED!!
	endfunction
    
    //判断武器类型
  function YDWEIsEventWeaponType takes weapontype weaponType returns boolean
		return weaponType == ConvertWeaponType((GetUnitGoldCost((5)))) // INLINED!!
	endfunction
	
    //判断攻击类型
  function YDWEIsEventAttackType takes attacktype attackType returns boolean
		return attackType == ConvertAttackType((GetUnitGoldCost((6)))) // INLINED!!
	endfunction
	//设置伤害
  function YDWESetEventDamage takes real amount returns boolean
		return EXSetEventDamage(amount)
	endfunction
    
    // 物品----------------------------------------------------
    
    ///<summary>设置物品数据 (字符串) [JAPI]</summary>
     function YDWESetItemDataString takes integer ItemTypeId,integer Type,string Value returns nothing
        call SaveStr(japi_ht, japi__key, 0, "(IIS)V")
        call SaveInteger(japi_ht, japi__key, 1, ItemTypeId)
        call SaveInteger(japi_ht, japi__key, 2, Type)
        call SaveStr(japi_ht, japi__key, 3, Value)
        call UnitId(("EXSetItemDataString")) // INLINED!!
    endfunction
    ///<summary>获取物品数据 (字符串) [JAPI]</summary>
     function YDWEGetItemDataString takes integer ItemTypeId,integer Type returns string
        call SaveStr(japi_ht, japi__key, 0, "(II)S")
        call SaveInteger(japi_ht, japi__key, 1, ItemTypeId)
        call SaveInteger(japi_ht, japi__key, 2, Type)
        call UnitId(("EXGetItemDataString")) // INLINED!!
        return LoadStr(japi_ht, japi__key, 0)
    endfunction
    
    //特效--------------------------------------------------------
    
    ///<summary>设置特效坐标 [JAPI]</summary>
     function EXSetEffectXY takes effect Handle,real x,real y returns nothing
        call SaveStr(japi_ht, japi__key, 0, "(IRR)V")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(Handle))
        call SaveReal(japi_ht, japi__key, 2, x)
        call SaveReal(japi_ht, japi__key, 3, y)
        call UnitId(("EXSetEffectXY")) // INLINED!!
    endfunction
    
    ///<summary>设置特效Z轴 [JAPI]</summary>
     function EXSetEffectZ takes effect Handle,real z returns nothing
        call SaveStr(japi_ht, japi__key, 0, "(IRR)V")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(Handle))
        call SaveReal(japi_ht, japi__key, 2, z)
		call UnitId(("EXSetEffectZ")) // INLINED!!
	endfunction
    
    ///<summary>获取特效X轴 [JAPI]</summary>
     function EXGetEffectX takes effect Handle returns real
        call SaveStr(japi_ht, japi__key, 0, "(I)R")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(Handle))
        call UnitId(("EXGetEffectX")) // INLINED!!
        return LoadReal(japi_ht, japi__key, 0)
	endfunction
    
    ///<summary>获取特效Y轴 [JAPI]</summary>
  function EXGetEffectY takes effect Handle returns real
        call SaveStr(japi_ht, japi__key, 0, "(I)R")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(Handle))
        call UnitId(("EXGetEffectY")) // INLINED!!
        return LoadReal(japi_ht, japi__key, 0)
	endfunction
    
    ///<summary>获取特效Z轴 [JAPI]</summary>
  function EXGetEffectZ takes effect Handle returns real
        call SaveStr(japi_ht, japi__key, 0, "(I)R")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(Handle))
        call UnitId(("EXGetEffectZ")) // INLINED!!
		return LoadReal(japi_ht, japi__key, 0)
	endfunction
    
    ///<summary>设置特效尺寸 [JAPI]</summary>
  function EXSetEffectSize takes effect Handle,real size returns nothing
		call SaveStr(japi_ht, japi__key, 0, "(IR)V")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(Handle))
        call SaveReal(japi_ht, japi__key, 2, size)
        call UnitId(("EXSetEffectSize")) // INLINED!!
	endfunction
    
    ///<summary>获取特效尺寸 [JAPI]</summary>
  function EXGetEffectSize takes effect Handle returns real
        call SaveStr(japi_ht, japi__key, 0, "(I)R")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(Handle))
        call UnitId(("EXGetEffectSize")) // INLINED!!
		return LoadReal(japi_ht, japi__key, 0)
	endfunction
    
    ///<summary>设置特效X旋转轴 [JAPI]</summary>
  function EXEffectMatRotateX takes effect Handle,real x returns nothing
        call SaveStr(japi_ht, japi__key, 0, "(IR)V")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(Handle))
        call SaveReal(japi_ht, japi__key, 2, x)
        call UnitId(("EXEffectMatRotateX")) // INLINED!!
	endfunction
    
    ///<summary>设置特效Y旋转轴 [JAPI]</summary>
  function EXEffectMatRotateY takes effect Handle,real y returns nothing
        call SaveStr(japi_ht, japi__key, 0, "(IR)V")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(Handle))
        call SaveReal(japi_ht, japi__key, 2, y)
        call UnitId(("EXEffectMatRotateY")) // INLINED!!
	endfunction
    
    ///<summary>设置特效Z旋转轴 [JAPI]</summary>
  function EXEffectMatRotateZ takes effect Handle,real z returns nothing
        call SaveStr(japi_ht, japi__key, 0, "(IR)V")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(Handle))
        call SaveReal(japi_ht, japi__key, 2, z)
        call UnitId(("EXEffectMatRotateZ")) // INLINED!!
	endfunction
    
    ///<summary>设置特效比例 [JAPI]</summary>
  function EXEffectMatScale takes effect Handle,real x,real y,real z returns nothing
        call SaveStr(japi_ht, japi__key, 0, "(IRRR)V")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(Handle))
        call SaveReal(japi_ht, japi__key, 2, x)
        call SaveReal(japi_ht, japi__key, 3, y)
        call SaveReal(japi_ht, japi__key, 4, z)
        call UnitId(("EXEffectMatScale")) // INLINED!!
	endfunction
    
    ///<summary>设置特效重置 [JAPI]</summary>
  function EXEffectMatReset takes effect Handle returns nothing
        call SaveStr(japi_ht, japi__key, 0, "(I)V")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(Handle))
        call UnitId(("EXEffectMatReset")) // INLINED!!
	endfunction
    
    ///<summary>设置特效速率 [JAPI]</summary>
  function EXSetEffectSpeed takes effect Handle,real speed returns nothing
        call SaveStr(japi_ht, japi__key, 0, "(IR)V")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(Handle))
        call SaveReal(japi_ht, japi__key, 2, speed)
        call UnitId(("EXSetEffectSpeed")) // INLINED!!
	endfunction
    
    ///<summary>设置可追踪物坐标 [JAPI]</summary>
     function EXSetTrackableXY takes trackable Handle,real x,real y returns nothing
        call SaveStr(japi_ht, japi__key, 0, "(IRR)V")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(Handle))
        call SaveReal(japi_ht, japi__key, 2, x)
        call SaveReal(japi_ht, japi__key, 3, y)
        call UnitId(("EXSetEffectXY")) // INLINED!!
    endfunction
    
    
    ///<summary>获取可追踪物X轴 [JAPI]</summary>
     function EXGetTrackableX takes trackable Handle returns real
        call SaveStr(japi_ht, japi__key, 0, "(I)R")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(Handle))
        call UnitId(("EXGetEffectX")) // INLINED!!
        return LoadReal(japi_ht, japi__key, 0)
	endfunction
    
    ///<summary>获取可追踪物Y轴 [JAPI]</summary>
  function EXGetTrackableY takes trackable Handle returns real
        call SaveStr(japi_ht, japi__key, 0, "(I)R")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(Handle))
        call UnitId(("EXGetEffectY")) // INLINED!!
        return LoadReal(japi_ht, japi__key, 0)
	endfunction
    
    
    
     function EXExecuteScript takes string str returns string
        call SaveStr(japi_ht, japi__key, 0, "(S)S")
        call SaveStr(japi_ht, japi__key, 1, str)
        call UnitId(("EXExecuteScript")) // INLINED!!
        return LoadStr(japi_ht, japi__key, 0)
    endfunction
    //-----------------模拟聊天----------------------------
     function EXDisplayChat takes player p,integer chat_recipient,string message returns nothing
        call SaveStr(japi_ht, japi__key, 0, "(IIS)V")
        call SaveInteger(japi_ht, japi__key, 1, GetHandleId(p))
        call SaveInteger(japi_ht, japi__key, 2, chat_recipient)
        call SaveStr(japi_ht, japi__key, 3, message)
        call UnitId(("EXDisplayChat")) // INLINED!!
    endfunction
  function YDWEDisplayChat takes player p,integer chat_recipient,string message returns nothing
		call EXDisplayChat(p , chat_recipient , message)
	endfunction
    
    //-----------版本描述-------------------------------------
    
    //获取地图名字
     function GetMapName takes nothing returns string
        call SaveStr(japi_ht, japi__key, 0, "()S")
        call UnitId(("GetMapName")) // INLINED!!
        return LoadStr(japi_ht, japi__key, 0)
    endfunction
    
    //获取魔兽版本
     function GetGameVersion takes nothing returns integer
        call SaveStr(japi_ht, japi__key, 0, "()I")
        call UnitId(("GetGameVersion")) // INLINED!!
        return LoadInteger(japi_ht, japi__key, 0)
    endfunction
    
    //获取插件版本
     function GetPluginVersion takes nothing returns string
        call SaveStr(japi_ht, japi__key, 0, "()S")
        call UnitId(("GetPluginVersion")) // INLINED!!
        return LoadStr(japi_ht, japi__key, 0)
    endfunction
    
     function GetFuncAddr takes code f returns integer
        call SetHeroLevels(f)
        return LoadInteger(japi_ht, japi__key, 0)
    endfunction
     function japiDoNothing takes nothing returns nothing
        
    endfunction
    
     function func_bind_trigger_name takes code functions,string name returns nothing
        call SaveStr(japi_ht, japi__key, 0, "(IS)V")
        call SaveInteger(japi_ht, japi__key, 1, GetFuncAddr(functions))
        call SaveStr(japi_ht, japi__key, 2, name)
        call UnitId(("func_bind_trigger_name")) // INLINED!!
    endfunction
    
     function open_code_run_logs takes boolean open returns nothing
        local string l=""
        set l=l + "(function () "
        set l=l + "lfunc={}  lfunc_name={}"
        set l=l + "save_lfunc_info=function (func,name,index)index=1<<index lfunc[func]=index lfunc_name[index]=name end "
        set l=l + "save_lfunc_info('GetLocalPlayer','[本地玩家]',0)"
        set l=l + "save_lfunc_info('GetFps','[获取帧数]',1)"
        set l=l + "save_lfunc_info('GetChatState','[聊天状态]',2)"
        set l=l + "save_lfunc_info('GetCameraTargetPositionLoc','[当前镜头目标点]',3)"
        set l=l + "save_lfunc_info('GetCameraTargetPositionX','[当前镜头目标X坐标]',4)"
        set l=l + "save_lfunc_info('GetCameraTargetPositionY','[当前镜头目标Y坐标]',5)"
        set l=l + "save_lfunc_info('GetCameraTargetPositionZ','[当前镜头目标Z坐标]',6)"
        
        set l=l + "save_lfunc_info('GetCameraEyePositionLoc','[当前镜头源位置]',7)"
        set l=l + "save_lfunc_info('GetCameraEyePositionX','[当前镜头源X坐标]',8)"
        set l=l + "save_lfunc_info('GetCameraEyePositionY','[当前镜头源Y坐标]',9)"
        set l=l + "save_lfunc_info('GetCameraEyePositionZ','[当前镜头源Z坐标]',10)"
        
        set l=l + "save_lfunc_info('GetMouseX','[获取鼠标X轴]',11)"
        set l=l + "save_lfunc_info('GetMouseY','[获取鼠标Y轴]',12)"
        set l=l + "save_lfunc_info('GetMouseVectorX','[获取鼠标屏幕X轴]',13)"
        set l=l + "save_lfunc_info('GetMouseVectorY','[获取鼠标屏幕Y轴]',14)"
        
        set l=l + "end)() or '' "
        call EXExecuteScript(l)
        
        set l=""
        
        set l=l + "(function () "
        
        set l=l + "get_jass_func_info=function (func_name) "
        set l=l + " return lfunc[func_name] or 0 "
        set l=l + "end "
        
        set l=l + "get_jass_func_msg=function (func_name_index)"
        set l=l + " return lfunc_name[func_name_index] or '' "
        set l=l + "end "
        
        set l=l + "local storm=require 'jass.storm' "
        set l=l + "local ss=storm.load('war3map.j') "
        set l=l + "ss:gsub('function%s+([%w_]+)%s+takes(.-)endfunction',function (name,code)\n"
        set l=l + "code=code:gsub('function%s+','function_'):gsub('//[^\\n]-\\n','')\n"
        set l=l + "code:gsub('([%w_]+)',function (str) "
        set l=l + "if lfunc[str]~=nil then "
        set l=l + "local flag=lfunc[name] or 0 "
        set l=l + "lfunc[name]=flag | lfunc[str] "
        set l=l + "end "
        set l=l + "end) "
        set l=l + "end) "
        set l=l + "ss=nil  return '' "
        set l=l + "end)() or '' "
        call EXExecuteScript(l)
        call SaveStr(japi_ht, japi__key, 0, "(B)V")
        call SaveBoolean(japi_ht, japi__key, 1, open)
        call UnitId(("open_code_run_logs")) // INLINED!!
    endfunction
    
    
    
     function initializePlugin takes nothing returns integer
        call ExecuteFunc("japiDoNothing")
        call StartCampaignAI(Player(PLAYER_NEUTRAL_AGGRESSIVE), "callback")
        call UnitId((I2S(GetHandleId(japi_ht)))) // INLINED!!
        call SaveStr(japi_ht, japi__key, 0, "(I)V")
        call SaveInteger(japi_ht, japi__key, 1, GetFuncAddr(function japiDoNothing))
        call UnitId(("SaveFunc")) // INLINED!!
        call ExecuteFunc("japiDoNothing")
        return 0
    endfunction

//library japi ends
//library LocalActionLib:
    function LocalActionLib__Call takes string str returns nothing
        call UnitId(str)
    endfunction
    
    //本地发布无目标命令
    function LocalOrder takes integer order,integer flags returns nothing
        call SaveStr(LocalActionLib__ht, LocalActionLib__key, 0, "(II)V")
        call SaveInteger(LocalActionLib__ht, LocalActionLib__key, 1, order)
        call SaveInteger(LocalActionLib__ht, LocalActionLib__key, 2, flags)
        call UnitId(("LocalOrder")) // INLINED!!
    endfunction
    
    //本地发布坐标命令
    function LocalPointOrder takes integer order,real x,real y,integer flags returns nothing
        call SaveStr(LocalActionLib__ht, LocalActionLib__key, 0, "(IRRI)V")
        call SaveInteger(LocalActionLib__ht, LocalActionLib__key, 1, order)
        call SaveReal(LocalActionLib__ht, LocalActionLib__key, 2, x)
        call SaveReal(LocalActionLib__ht, LocalActionLib__key, 3, y)
        call SaveInteger(LocalActionLib__ht, LocalActionLib__key, 4, flags)
        call UnitId(("LocalPointOrder")) // INLINED!!
    endfunction
    
    //本地发布目标命令
    function LocalTargetOrder takes integer order,widget object,integer flags returns nothing
        call SaveStr(LocalActionLib__ht, LocalActionLib__key, 0, "(IHwidget;I)V")
        call SaveInteger(LocalActionLib__ht, LocalActionLib__key, 1, order)
        call SaveWidgetHandle(LocalActionLib__ht, LocalActionLib__key, 2, object)
        call SaveInteger(LocalActionLib__ht, LocalActionLib__key, 3, flags)
        call UnitId(("LocalTargetOrder")) // INLINED!!
    endfunction
    
    //获取玩家当前选择的单位
    function GetPlayerSelectedUnit takes player p returns unit
        call SaveStr(LocalActionLib__ht, LocalActionLib__key, 0, "(I)Hunit;")
        call RemoveSavedHandle(LocalActionLib__ht, LocalActionLib__key, 0)
        call SaveInteger(LocalActionLib__ht, LocalActionLib__key, 1, GetHandleId(p))
        call UnitId(("GetPlayerSelectedUnit")) // INLINED!!
        return LoadUnitHandle(LocalActionLib__ht, LocalActionLib__key, 0)
    endfunction
    
    //获取玩家当前鼠标指向的单位
    function GetTargetUnit takes nothing returns unit
        call SaveStr(LocalActionLib__ht, LocalActionLib__key, 0, "(V)Hunit;")
        call RemoveSavedHandle(LocalActionLib__ht, LocalActionLib__key, 0)
        call UnitId(("GetTargetObject")) // INLINED!!
        return LoadUnitHandle(LocalActionLib__ht, LocalActionLib__key, 0)
    endfunction
    
    //获取玩家当前鼠标指向的物品
    function GetTargetItem takes nothing returns item
        call SaveStr(LocalActionLib__ht, LocalActionLib__key, 0, "(V)Hitem;")
        call RemoveSavedHandle(LocalActionLib__ht, LocalActionLib__key, 0)
        call UnitId(("GetTargetObject")) // INLINED!!
        return LoadItemHandle(LocalActionLib__ht, LocalActionLib__key, 0)
    endfunction
    
    //获取玩家当前鼠标指向的 可选择的可破坏物
    function GetTargetDestructable takes nothing returns destructable
        call SaveStr(LocalActionLib__ht, LocalActionLib__key, 0, "(V)Hdestructable;")
        call RemoveSavedHandle(LocalActionLib__ht, LocalActionLib__key, 0)
        call UnitId(("GetTargetObject")) // INLINED!!
        return LoadDestructableHandle(LocalActionLib__ht, LocalActionLib__key, 0)
    endfunction
    
    // 设置单位技能按钮是否显示   false 即隐藏 隐藏之后无法发布命令 跟玩家禁用相同
    //使用不会打断命令  可以 在发布命令的时候  显示 发布命令 隐藏 即可
    function SetUnitAbilityButtonShow takes unit u,integer id,boolean show returns nothing
        call SaveStr(LocalActionLib__ht, LocalActionLib__key, 0, "(IIB)V")
        call SaveInteger(LocalActionLib__ht, LocalActionLib__key, 1, GetHandleId(u))
        call SaveInteger(LocalActionLib__ht, LocalActionLib__key, 2, id)
        call SaveBoolean(LocalActionLib__ht, LocalActionLib__key, 3, show)
        call UnitId(("SetUnitAbilityButtonShow")) // INLINED!!
    endfunction
    
    //设置 是否显示FPS  显示状态下 调用false 可以隐藏 ，相反可以显示
    function ShowFpsText takes boolean Open returns nothing
        call SaveStr(LocalActionLib__ht, LocalActionLib__key, 0, "(B)V")
        call SaveBoolean(LocalActionLib__ht, LocalActionLib__key, 1, Open)
        call UnitId(("ShowFpsText")) // INLINED!!
    endfunction
    
    //获取当前游戏的 fps值  即 游戏画面的帧数
    function GetFps takes nothing returns real
        call SaveStr(LocalActionLib__ht, LocalActionLib__key, 0, "()R")
        call UnitId(("GetFps")) // INLINED!!
        return LoadReal(LocalActionLib__ht, LocalActionLib__key, 0)
    endfunction
    
    //获取聊天状态  有聊天输入框的情况下 返回true  没有返回false 
    //可以通过 d3d库里的模拟按键 模拟按下ESC 或者enter 来禁止玩家聊天
    function GetChatState takes nothing returns boolean
        call SaveStr(LocalActionLib__ht, LocalActionLib__key, 0, "()B")
        call UnitId(("GetChatState")) // INLINED!!
        return LoadBoolean(LocalActionLib__ht, LocalActionLib__key, 0)
    endfunction
  

//library LocalActionLib ends
//library d3d:
    
    function d3d__Call takes string str returns nothing
        call UnitId(str)
    endfunction
    
    //==================获取鼠标相对魔兽窗口的坐标==========================
    // 不会因为窗口的改变大小或移动而影响的相对坐标
    
    //获取鼠标在屏幕的x轴
    function GetMouseVectorX takes nothing returns real
        call SaveStr(d3d__ht, d3d__key, 0, "()R")
        call UnitId(("GetMouseVectorX")) // INLINED!!
        return LoadReal(d3d__ht, d3d__key, 0)
    endfunction
    
    //获取鼠标在屏幕的y轴
    function GetMouseVectorY takes nothing returns real
        call SaveStr(d3d__ht, d3d__key, 0, "()R")
        call UnitId(("GetMouseVectorY")) // INLINED!!
        return LoadReal(d3d__ht, d3d__key, 0)
    endfunction
    
    //获取魔兽窗口宽
    function GetWindowWidth takes nothing returns integer
        call SaveStr(d3d__ht, d3d__key, 0, "()I")
        call UnitId(("GetWindowWidth")) // INLINED!!
        return LoadInteger(d3d__ht, d3d__key, 0)
    endfunction
    
    //获取魔兽窗口高
    function GetWindowHeight takes nothing returns integer
        call SaveStr(d3d__ht, d3d__key, 0, "()I")
        call UnitId(("GetWindowHeight")) // INLINED!!
        return LoadInteger(d3d__ht, d3d__key, 0)
    endfunction
    
    //16进制函数
    function Hex takes integer i returns string
        call SaveStr(d3d__ht, d3d__key, 0, "(I)S")
        call SaveInteger(d3d__ht, d3d__key, 1, i)
        call UnitId(("Hex")) // INLINED!!
    return LoadStr(d3d__ht, d3d__key, 0)
    endfunction
    
    //==================字体类================================
    //创建字体
    function CreateFont takes nothing returns integer
        call SaveStr(d3d__ht, d3d__key, 0, "()I")
        call UnitId(("CreateFont")) // INLINED!!
        return LoadInteger(d3d__ht, d3d__key, 0)
    endfunction
    
    //销毁字体
    function DestroyFont takes integer font returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(I)V")
        call UnitId(("DestroyFont")) // INLINED!!
    endfunction
    
    //获取字体宽
    function GetFontWidth takes integer font returns integer
        call SaveStr(d3d__ht, d3d__key, 0, "(I)I")
        call SaveInteger(d3d__ht, d3d__key, 1, font)
        call UnitId(("GetFontWidth")) // INLINED!!
        return LoadInteger(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置字体宽
    function SetFontWidth takes integer font,integer value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(II)V")
        call SaveInteger(d3d__ht, d3d__key, 1, font)
        call SaveInteger(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetFontWidth")) // INLINED!!
    endfunction
    
    //获取字体高
    function GetFontHeight takes integer font returns integer
        call SaveStr(d3d__ht, d3d__key, 0, "(I)I")
        call SaveInteger(d3d__ht, d3d__key, 1, font)
        call UnitId(("GetFontHeight")) // INLINED!!
        return LoadInteger(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置字体高
    function SetFontHeight takes integer font,integer value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(II)V")
        call SaveInteger(d3d__ht, d3d__key, 1, font)
        call SaveInteger(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetFontHeight")) // INLINED!!
    endfunction
    
    //获取字体粗细
    function GetFontWeight takes integer font returns integer
        call SaveStr(d3d__ht, d3d__key, 0, "(I)I")
        call SaveInteger(d3d__ht, d3d__key, 1, font)
        call UnitId(("GetFontWeight")) // INLINED!!
        return LoadInteger(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置字体粗细
    function SetFontWeight takes integer font,integer value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(II)V")
        call SaveInteger(d3d__ht, d3d__key, 1, font)
        call SaveInteger(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetFontWeight")) // INLINED!!
    endfunction
    
    //设置字体是否倾斜
    function SetFontItalic takes integer font,boolean value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(IB)V")
        call SaveInteger(d3d__ht, d3d__key, 1, font)
        call SaveBoolean(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetFontItalic")) // INLINED!!
    endfunction
    
    //获取字体类型
    function GetFontFaceName takes integer font returns string
        call SaveStr(d3d__ht, d3d__key, 0, "(I)S")
        call SaveInteger(d3d__ht, d3d__key, 1, font)
        call UnitId(("GetFontFaceName")) // INLINED!!
        return LoadStr(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置字体类型
    function SetFontFaceName takes integer font,string value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(IS)V")
        call SaveInteger(d3d__ht, d3d__key, 1, font)
        call SaveStr(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetFontFaceName")) // INLINED!!
    endfunction
    
    //==============写字类===========================
    //创建文字 参数是 字体 内容 屏幕坐标x y 存活时间 颜色值
    function CreateText takes integer font,string str,real x,real y,real time,integer color returns integer
        call SaveStr(d3d__ht, d3d__key, 0, "(ISRRRI)I")
        call SaveInteger(d3d__ht, d3d__key, 1, font)
        call SaveStr(d3d__ht, d3d__key, 2, str)
        call SaveReal(d3d__ht, d3d__key, 3, x)
        call SaveReal(d3d__ht, d3d__key, 4, y)
        call SaveReal(d3d__ht, d3d__key, 5, time)
        call SaveInteger(d3d__ht, d3d__key, 6, color)
        call UnitId(("CreateText")) // INLINED!!
        return LoadInteger(d3d__ht, d3d__key, 0)
    endfunction
    
    //获取文字内容
    function GetTextString takes integer text returns string
        call SaveStr(d3d__ht, d3d__key, 0, "(I)S")
        call SaveInteger(d3d__ht, d3d__key, 1, text)
        call UnitId(("GetTextString")) // INLINED!!
        return LoadStr(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置文字内容
    function SetTextString takes integer text,string str returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(IS)V")
        call SaveInteger(d3d__ht, d3d__key, 1, text)
        call SaveStr(d3d__ht, d3d__key, 2, str)
        call UnitId(("SetTextString")) // INLINED!!
    endfunction
    
    //获取文字坐标x轴
    function GetTextX takes integer text returns real
        call SaveStr(d3d__ht, d3d__key, 0, "(I)R")
        call SaveInteger(d3d__ht, d3d__key, 1, text)
        call UnitId(("GetTextX")) // INLINED!!
        return LoadReal(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置文字坐标x轴
    function SetTextX takes integer text,real x returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(IR)V")
        call SaveInteger(d3d__ht, d3d__key, 1, text)
        call SaveReal(d3d__ht, d3d__key, 2, x)
        call UnitId(("SetTextX")) // INLINED!!
    endfunction
    
    //获取文字坐标y轴
    function GetTextY takes integer text returns real
        call SaveStr(d3d__ht, d3d__key, 0, "(I)R")
        call SaveInteger(d3d__ht, d3d__key, 1, text)
        call UnitId(("GetTextY")) // INLINED!!
        return LoadReal(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置文字坐标y轴
    function SetTextY takes integer text,real y returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(IR)V")
        call SaveInteger(d3d__ht, d3d__key, 1, text)
        call SaveReal(d3d__ht, d3d__key, 2, y)
        call UnitId(("SetTextY")) // INLINED!!
    endfunction
    
    //获取文字剩余存活时间
    function GetTextTime takes integer text returns real
        call SaveStr(d3d__ht, d3d__key, 0, "(I)R")
        call SaveInteger(d3d__ht, d3d__key, 1, text)
        call UnitId(("GetTextTime")) // INLINED!!
        return LoadReal(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置文字剩余存活时间
    function SetTextTime takes integer text,real value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(IR)V")
        call SaveInteger(d3d__ht, d3d__key, 1, text)
        call SaveReal(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetTextTime")) // INLINED!!
    endfunction
    
    //获取文字颜色 16进制 0xFFFFFFFF 前2位表示透明 后6位表示 红绿蓝
    function GetTextColor takes integer text returns integer
        call SaveStr(d3d__ht, d3d__key, 0, "(I)I")
        call SaveInteger(d3d__ht, d3d__key, 1, text)
        call UnitId(("GetTextColor")) // INLINED!!
        return LoadInteger(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置文字颜色 16进制
    function SetTextColor takes integer text,integer value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(II)V")
        call SaveInteger(d3d__ht, d3d__key, 1, text)
        call SaveInteger(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetTextColor")) // INLINED!!
    endfunction
    
    //创建屏幕图像 图像路径 相对魔兽窗口x轴 相对魔兽窗口y轴 相对魔兽窗口 宽度 相对魔兽窗口 高度 等级
    function CreateTexture takes string path,real x,real y,real width,real height,integer color,integer level returns integer
        call SaveStr(d3d__ht, d3d__key, 0, "(SRRRRII)I")
        call SaveStr(d3d__ht, d3d__key, 1, path)
        call SaveReal(d3d__ht, d3d__key, 2, x)
        call SaveReal(d3d__ht, d3d__key, 3, y)
        call SaveReal(d3d__ht, d3d__key, 4, width)
        call SaveReal(d3d__ht, d3d__key, 5, height)
        call SaveInteger(d3d__ht, d3d__key, 6, color)
        call SaveInteger(d3d__ht, d3d__key, 7, level)
        call UnitId(("CreateTexture")) // INLINED!!
        return LoadInteger(d3d__ht, d3d__key, 0)
    endfunction
    
    //删除图像
    function DestroyTexture takes integer texture returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(I)V")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call UnitId(("DestroyTexture")) // INLINED!!
    endfunction
    
    //获取图像相对魔兽窗口坐标x轴
    function GetTextureX takes integer texture returns real
        call SaveStr(d3d__ht, d3d__key, 0, "(I)R")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call UnitId(("GetTextureX")) // INLINED!!
        return LoadReal(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置图像相对魔兽窗口坐标x轴
    function SetTextureX takes integer texture,real value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(IR)V")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call SaveReal(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetTextureX")) // INLINED!!
    endfunction
    
    //获取图像相对魔兽窗口坐标y轴
    function GetTextureY takes integer texture returns real
        call SaveStr(d3d__ht, d3d__key, 0, "(I)R")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call UnitId(("GetTextureY")) // INLINED!!
        return LoadReal(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置图像相对魔兽窗口坐标y轴
    function SetTextureY takes integer texture,real value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(IR)V")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call SaveReal(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetTextureY")) // INLINED!!
    endfunction
    
    //获取图像相对魔兽窗口 宽度
    function GetTextureWidth takes integer texture returns real
        call SaveStr(d3d__ht, d3d__key, 0, "(I)R")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call UnitId(("GetTextureWidth")) // INLINED!!
        return LoadReal(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置图像相对魔兽窗口 宽度
    function SetTextureWidth takes integer texture,real value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(IR)V")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call SaveReal(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetTextureWidth")) // INLINED!!
    endfunction
    
    //获取图像相对魔兽窗口 高度
    function GetTextureHeight takes integer texture returns real
        call SaveStr(d3d__ht, d3d__key, 0, "(I)R")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call UnitId(("GetTextureHeight")) // INLINED!!
        return LoadReal(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置图像相对魔兽窗口 高度
    function SetTextureHeight takes integer texture,real value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(IR)V")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call SaveReal(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetTextureHeight")) // INLINED!!
    endfunction
    
    //获取图像颜色
    function GetTextureColor takes integer texture returns integer
        call SaveStr(d3d__ht, d3d__key, 0, "(I)I")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call UnitId(("GetTextureColor")) // INLINED!!
        return LoadInteger(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置图像颜色
    function SetTextureColor takes integer texture,integer value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(II)V")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call SaveInteger(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetTextureColor")) // INLINED!!
    endfunction
    
    //获取图像级别 级别越高 越上层显示
    function GetTextureLevel takes integer texture returns integer
        call SaveStr(d3d__ht, d3d__key, 0, "(I)I")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call UnitId(("GetTextureLevel")) // INLINED!!
        return LoadInteger(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置图像级别 级别越高越上层显示
    function SetTextureLevel takes integer texture,integer value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(II)V")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call SaveInteger(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetTextureLevel")) // INLINED!!
    endfunction
    
    //获取图像旋转角度
    function GetTextureRotation takes integer texture returns real
        call SaveStr(d3d__ht, d3d__key, 0, "(I)R")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call UnitId(("GetTextureRotation")) // INLINED!!
        return LoadReal(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置图像旋转角度  参数 图像,角度  角度制
    function SetTextureRotation takes integer texture,real value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(IR)V")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call SaveReal(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetTextureRotation")) // INLINED!!
    endfunction
    
    //获取图像像素的 宽
    function GetTexturePixelWidth takes integer texture returns real
        call SaveStr(d3d__ht, d3d__key, 0, "(I)R")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call UnitId(("GetTexturePixelWidth")) // INLINED!!
        return LoadReal(d3d__ht, d3d__key, 0)
    endfunction
    
    //获取图像像素的 高  可以在  宽 * 高的矩形里进行切割
    function GetTexturePixelHeight takes integer texture returns real
        call SaveStr(d3d__ht, d3d__key, 0, "(I)R")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call UnitId(("GetTexturePixelWidth")) // INLINED!!
        return LoadReal(d3d__ht, d3d__key, 0)
    endfunction
    
    //获取图形切割区域 默认完整的图形区域
    //注意！ 返回的rect 是handle 记得用 RemoveRect 排泄
    function GetTextureSrcRect takes integer texture returns rect
        call SaveStr(d3d__ht, d3d__key, 0, "(I)Hrect;")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call UnitId(("GetTextureSrcRect")) // INLINED!!
        return LoadRectHandle(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置图形切割区域  在原图片上按 rect 矩形进行切割
    //rect的范围应该这样描绘 local rect r=Rect(左,下,右,上) 来决定切割这个区域 
    //比如 128*256的图片 完整的图片的 矩形应该是 左=0 下=0 右=128 上=256
    // 左上右下 表示 图片像素里的 宽跟高的范围
    function SetTextureSrcRect takes integer texture,rect value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(IHrect;)V")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call SaveRectHandle(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetTextureSrcRect")) // INLINED!!
    endfunction
    
    //更改图像图形  参数 图像句柄 新的图形路径
    function SetTexture takes integer texture,string value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(IS)V")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call SaveStr(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetTexture")) // INLINED!!
    endfunction
    
    //设置图像是否显示 隐藏 true显示  false隐藏
    function SetTextureShow takes integer texture,boolean value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(IB)V")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call SaveBoolean(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetTextureShow")) // INLINED!!
    endfunction
    
    //设置图像是否响应事件 默认true 为开启触发状态 false为关闭触发
    function SetTextureTrigger takes integer texture,boolean value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(IB)V")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call SaveBoolean(d3d__ht, d3d__key, 2, value)
        call UnitId(("SetTextureTrigger")) // INLINED!!
    endfunction
    
    //开启图像的触发器
    function EnableTextureTrigger takes integer texture returns nothing
        call SetTextureTrigger(texture , true)
    endfunction
    
    //关闭图像的触发器
    function DisableTextureTrigger takes integer texture returns nothing
        call SetTextureTrigger(texture , false)
    endfunction
    
    //获取 图片中心点X轴
    function GetTextureCenterX takes integer texture returns real
        return GetTextureX(texture) + GetTextureWidth(texture) / 2
    endfunction
    
    //获取 图片中心点y轴
    function GetTextureCenterY takes integer texture returns real
        return GetTextureY(texture) + GetTextureHeight(texture) / 2
    endfunction
    
    //获取 图片左下角X轴
    function GetTextureMinX takes integer texture returns real
        return GetTextureX(texture)
    endfunction
    
    //获取 图片左下角y轴
    function GetTextureMinY takes integer texture returns real
        return GetTextureY(texture)
    endfunction
    
    //获取 图片右上角X轴
    function GetTextureMaxX takes integer texture returns real
        return GetTextureX(texture) + GetTextureWidth(texture)
    endfunction
    
    //获取 图片右上角y轴
    function GetTextureMaxY takes integer texture returns real
        return GetTextureY(texture) + GetTextureHeight(texture)
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
        call SaveStr(d3d__ht, d3d__key, 0, "(IIII)I")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call SaveInteger(d3d__ht, d3d__key, 2, order)
        call SaveInteger(d3d__ht, d3d__key, 3, GetFuncAddr(wCallBack))
        call SaveInteger(d3d__ht, d3d__key, 4, GetFuncAddr(lCallBack))
        call UnitId(("TextureAddEvent")) // INLINED!!
        return LoadInteger(d3d__ht, d3d__key, 0)
    endfunction
    
    //图像删除事件 参数 图像句柄 事件句柄
    function TextureRemoveEvent takes integer texture,integer Event returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(II)V")
        call SaveInteger(d3d__ht, d3d__key, 1, texture)
        call SaveInteger(d3d__ht, d3d__key, 2, Event)
        call UnitId(("TextureRemoveEvent")) // INLINED!!
    endfunction
    
    //设置键位状态 指定键位 按下或弹起状态  true为按下 false为弹起
    function SetKeyboard takes integer Key,boolean up returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(IB)V")
        call SaveInteger(d3d__ht, d3d__key, 1, Key)
        call SaveBoolean(d3d__ht, d3d__key, 2, up)
        call UnitId(("SetKeyboard")) // INLINED!!
    endfunction
    
    // 模拟按键  按下 弹起 模拟1次点击
    function ClickKeyboard takes integer Key returns nothing
        call SetKeyboard(Key , true)
        call SetKeyboard(Key , false)
    endfunction
    
    //=========================图像事件响应动作====================
    
    function GetEventIndex takes nothing returns integer
        return GetHandleId(GetExpiredTimer())
    endfunction
    
    //获取响应的键位
    function GetTriggerKeyboard takes nothing returns integer
        return LoadInteger(d3d__ht, (GetHandleId(GetExpiredTimer())), 0x100) // INLINED!!
    endfunction
    
    //获取触发图像
    function GetTriggerTexture takes nothing returns integer
        return LoadInteger(d3d__ht, (GetHandleId(GetExpiredTimer())), 0xff) // INLINED!!
    endfunction
    
    //获取响应事件
    function GetTriggerEvent takes nothing returns integer
        return LoadInteger(d3d__ht, (GetHandleId(GetExpiredTimer())), 0xfe) // INLINED!!
    endfunction
    
    // 获取响应的键盘操作 按下为true 弹起为false
    function GetTriggerKeyboardAction takes nothing returns boolean
        if ( LoadInteger(d3d__ht, (GetHandleId(GetExpiredTimer())), 0x101) == 0 ) then // INLINED!!
            return false
        endif
        return true
    endfunction
    
    //====================魔兽控制台UI=============================
    //设置是否隐藏控制台UI true为隐藏 false为恢复
    function ShowConsole takes boolean show returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(B)V")
        call SaveBoolean(d3d__ht, d3d__key, 1, show)
        call UnitId(("ShowConsole")) // INLINED!!
    endfunction
    
    //获取小地图图形位置X轴向量
    function GetLittleMapX takes nothing returns real
        call SaveStr(d3d__ht, d3d__key, 0, "()R")
        call UnitId(("GetLittleMapX")) // INLINED!!
        return LoadReal(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置小地图图形位置X轴向量
    function SetLittleMapX takes real value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(R)V")
        call SaveReal(d3d__ht, d3d__key, 1, value)
        call UnitId(("SetLittleMapX")) // INLINED!!
    endfunction
    
    //获取小地图图形位置y轴向量
    function GetLittleMapY takes nothing returns real
        call SaveStr(d3d__ht, d3d__key, 0, "()R")
        call UnitId(("GetLittleMapY")) // INLINED!!
        return LoadReal(d3d__ht, d3d__key, 0)
    endfunction
    
    //设置小地图图形位置Y轴向量
    function SetLittleMapY takes real value returns nothing
        call SaveStr(d3d__ht, d3d__key, 0, "(R)V")
        call SaveReal(d3d__ht, d3d__key, 1, value)
        call UnitId(("SetLittleMapY")) // INLINED!!
    endfunction
    
    //====================字体结构体的封装=============================
        function s__LOGFONT__get_lfHeight takes integer this returns integer
            return GetFontHeight(s__LOGFONT_font[this])
        endfunction
        function s__LOGFONT__set_lfHeight takes integer this,integer value returns nothing
            call SetFontHeight(s__LOGFONT_font[this] , value)
        endfunction
        function s__LOGFONT__get_lfWidth takes integer this returns integer
            return GetFontWidth(s__LOGFONT_font[this])
        endfunction
        function s__LOGFONT__set_lfWidth takes integer this,integer value returns nothing
            call SetFontWidth(s__LOGFONT_font[this] , value)
        endfunction
        function s__LOGFONT__get_lfWeight takes integer this returns integer
            return GetFontWeight(s__LOGFONT_font[this])
        endfunction
        function s__LOGFONT__set_lfWeight takes integer this,integer value returns nothing
            call SetFontWeight(s__LOGFONT_font[this] , value)
        endfunction
        function s__LOGFONT__set_lfItalic takes integer this,boolean value returns nothing
            call SetFontItalic(s__LOGFONT_font[this] , value)
        endfunction
        function s__LOGFONT__get_lfFaceName takes integer this returns string
            return GetFontFaceName(s__LOGFONT_font[this])
        endfunction
        function s__LOGFONT__set_lfFaceName takes integer this,string str returns nothing
            call SetFontFaceName(s__LOGFONT_font[this] , str)
        endfunction
        function s__LOGFONT_create takes nothing returns integer
            local integer logfont=s__LOGFONT__allocate()
            set s__LOGFONT_font[logfont]=CreateFont()
            return logfont
        endfunction
        function s__LOGFONT_onDestroy takes integer this returns nothing
            call DestroyFont(s__LOGFONT_font[this])
        endfunction

//Generated destructor of LOGFONT
function s__LOGFONT_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__LOGFONT_V[this]!=-1) then
        return
    endif
    call DestroyFont(s__LOGFONT_font[(this)]) // INLINED!!
    set si__LOGFONT_V[this]=si__LOGFONT_F
    set si__LOGFONT_F=this
endfunction
        function s__LOGFONT_Text takes integer this,string str,real x,real y,real time,integer color returns integer
            return CreateText(s__LOGFONT_font[this] , str , x , y , time , color)
        endfunction
    

//library d3d ends
//===========================================================================
// 
// 内置Japi1.36
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Thu Jul 05 17:03:34 2018
//   Map Author: 作者：问号 
// 
//===========================================================================
//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************
function InitGlobals takes nothing returns nothing
    set udg_i=0
endfunction
//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************
//TESH.scrollpos=0
//TESH.alwaysfold=0
//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************
//===========================================================================
// Trigger: japi常量库
//
//   
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0

        
    //键盘键位 
    //以下键位 按下 运行 TextureAddEvent 的第3个参数
    //弹起 运行 第4个参数
    
    //大键盘数字键
    
    //小键盘 数字键
    
    
    
    
    
    
    //魔兽版本 用GetGameVersion 来获取当前版本 来对比以下具体版本做出相应操作
    //-----------模拟聊天------------------
    
    //---------技能数据类型---------------
    
    ///<summary>冷却时间</summary>
    ///<summary>目标允许</summary>
    ///<summary>施放时间</summary>
    ///<summary>持续时间</summary>
    ///<summary>持续时间</summary>
    ///<summary>魔法消耗</summary>
    ///<summary>施放间隔</summary>
    ///<summary>影响区域</summary>
    ///<summary>施法距离</summary>
    ///<summary>数据A</summary>
    ///<summary>数据B</summary>
    ///<summary>数据C</summary>
    ///<summary>数据D</summary>
    ///<summary>数据E</summary>
    ///<summary>数据F</summary>
    ///<summary>数据G</summary>
    ///<summary>数据H</summary>
    ///<summary>数据I</summary>
    ///<summary>单位类型</summary>
    ///<summary>热键</summary>
    ///<summary>关闭热键</summary>
    ///<summary>学习热键</summary>
    ///<summary>名字</summary>
    ///<summary>图标</summary>
    ///<summary>目标效果</summary>
    ///<summary>施法者效果</summary>
    ///<summary>目标点效果</summary>
    ///<summary>区域效果</summary>
    ///<summary>投射物</summary>
    ///<summary>特殊效果</summary>
    ///<summary>闪电效果</summary>
    ///<summary>buff提示</summary>
    ///<summary>buff提示</summary>
    ///<summary>学习提示</summary>
    ///<summary>提示</summary>
    ///<summary>关闭提示</summary>
    ///<summary>学习提示</summary>
    ///<summary>提示</summary>
    ///<summary>关闭提示</summary>
    
    //----------物品数据类型----------------------
    ///<summary>物品图标</summary>
    ///<summary>物品提示</summary>
    ///<summary>物品扩展提示</summary>
    ///<summary>物品名字</summary>
    ///<summary>物品说明</summary>
    //------------单位数据类型--------------
    ///<summary>攻击1 伤害骰子数量</summary>
    ///<summary>攻击1 伤害骰子面数</summary>
    ///<summary>攻击1 基础伤害</summary>
    ///<summary>攻击1 升级奖励</summary>
    ///<summary>攻击1 最小伤害</summary>
    ///<summary>攻击1 最大伤害</summary>
    ///<summary>攻击1 全伤害范围</summary>
    ///<summary>装甲</summary>
    // attack 1 attribute adds
    ///<summary>攻击1 伤害衰减参数</summary>
    ///<summary>攻击1 武器声音</summary>
    ///<summary>攻击1 攻击类型</summary>
    ///<summary>攻击1 最大目标数</summary>
    ///<summary>攻击1 攻击间隔</summary>
    ///<summary>攻击1 攻击延迟/summary>
    ///<summary>攻击1 弹射弧度</summary>
    ///<summary>攻击1 攻击范围缓冲</summary>
    ///<summary>攻击1 目标允许</summary>
    ///<summary>攻击1 溅出区域</summary>
    ///<summary>攻击1 溅出半径</summary>
    ///<summary>攻击1 武器类型</summary>
    // attack 2 attributes (sorted in a sequencial order based on memory address)
    ///<summary>攻击2 伤害骰子数量</summary>
    ///<summary>攻击2 伤害骰子面数</summary>
    ///<summary>攻击2 基础伤害</summary>
    ///<summary>攻击2 升级奖励</summary>
    ///<summary>攻击2 伤害衰减参数</summary>
    ///<summary>攻击2 武器声音</summary>
    ///<summary>攻击2 攻击类型</summary>
    ///<summary>攻击2 最大目标数</summary>
    ///<summary>攻击2 攻击间隔</summary>
    ///<summary>攻击2 攻击延迟</summary>
    ///<summary>攻击2 攻击范围</summary>
    ///<summary>攻击2 攻击缓冲</summary>
    ///<summary>攻击2 最小伤害</summary>
    ///<summary>攻击2 最大伤害</summary>
    ///<summary>攻击2 弹射弧度</summary>
    ///<summary>攻击2 目标允许类型</summary>
    ///<summary>攻击2 溅出区域</summary>
    ///<summary>攻击2 溅出半径</summary>
    ///<summary>攻击2 武器类型</summary>
    ///<summary>装甲类型</summary>
    
    
//===========================================================================
// Trigger: 新japi库
//
// 11
//===========================================================================
//TESH.scrollpos=464
//TESH.alwaysfold=0


//===========================================================================
// Trigger: 新d3d库
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
// Trigger: 异步japi库
//
//  1
//===========================================================================
//TESH.scrollpos=111
//TESH.alwaysfold=0

//这个库里面的japi 是在本地玩家 异步的情况下运行的动作 ,不可在非异步的环境下运行
//数据需要同步之后再使用
//运行完之后 会自动同步 在触发响应之后做动作
// 本地消息的FLAG
// 这4个消息标志可以相加组合
//使用方法 本地坐标命令(命令id,坐标x轴,坐标y轴,FLAG_INSTANT + FLAG_ONLY) flag标签为   瞬发+独立
//===========================================================================
// Trigger: 判断版本例子
//
//     1  
//===========================================================================
function Trig___________________uActions takes nothing returns nothing
    // 获取当前魔兽版本
    local integer Version=GetGameVersion()
    call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, ( "插件版本：" + GetPluginVersion() ))
    call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, ( "地图名字：" + GetMapName() ))
    // 对比魔兽版本
    if ( ( Version == 6374 ) ) then
        call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, "魔兽版本:1.24b")
    else
    endif
    if ( ( Version == 6387 ) ) then
        call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, "魔兽版本:1.24e")
    else
    endif
    if ( ( Version == 6401 ) ) then
        call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, "魔兽版本:1.26")
    else
    endif
    if ( ( Version == 7000 ) ) then
        call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, "魔兽版本:1.27a")
    else
    endif
    if ( ( Version == 7085 ) ) then
        call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, "魔兽版本:1.27b")
    else
    endif
    if ( ( Version == 7205 ) ) then
        call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, "魔兽版本:1.28a")
    else
    endif
endfunction
//===========================================================================
function InitTrig___________________u takes nothing returns nothing
    set gg_trg___________________u=CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg___________________u, 0.00)
    call TriggerAddAction(gg_trg___________________u, function Trig___________________uActions)
endfunction
//===========================================================================
// Trigger: api 2.0
//===========================================================================
//TESH.scrollpos=322
//TESH.alwaysfold=0
//hardware
//获取鼠标在游戏内的坐标X

//获取鼠标在游戏内的坐标Y

//获取鼠标在游戏内的坐标Z

//鼠标是否在游戏内

//获取鼠标屏幕坐标X

//获取鼠标屏幕坐标Y

//获取鼠标游戏窗口坐标X

//获取鼠标游戏窗口坐标Y

//设置鼠标位置

//注册鼠标点击触发（sync为true时，调用TriggerExecute。为false时，直接运行action函数，可以异步不掉线，action里不要有同步操作）


//注册键盘点击触发


//注册鼠标滚轮触发


//注册鼠标移动触发


//获取触发器的按键码

//获取滚轮delta

//判断按键是否按下

//获取触发key的玩家

//获取war3窗口宽度

//获取war3窗口高度

//获取war3窗口X坐标

//获取war3窗口Y坐标

//注册war3窗口大小变化事件


//判断窗口是否激活

//plus
//设置可摧毁物位置

//设置单位位置-本地调用

//异步执行函数

//取鼠标指向的unit

//设置unit的贴图

//设置内存数值

//设置单位ID

//设置单位模型

//设置小地图背景图片

//sync
//注册数据同步trigger

//同步游戏数据

//获取同步的数据

//获取同步数据的玩家

//gui
/////////////////////////////// 原生UI修改
//隐藏界面元素

//修改游戏世界窗口位置

//头像

//小地图

//技能按钮

//英雄按钮

//英雄血条

//英雄蓝条

//道具按钮

//小地图按钮

//左上菜单按钮

//鼠标提示

//聊天信息

//unit message

//top message

///////////////////////////////
//取rgba色值

//设置界面更新回调（非同步）


//显示/隐藏Frame

//创建frame

//创建SimpleFrame

//销毁frame

//加载toc

//设置frame相对位置

//设置frame绝对位置

//清空frame锚点

//设置frame禁用/启用

//注册UI事件回调


//获取触发ui的玩家

//获取触发的Frame

//查找frame

//查找SimpleFrame

//查找String

//查找Texture

//获取game ui

//点击frame

//自定义屏幕比例

//使用宽屏模式

//设置文字（支持EditBox, TextFrame, TextArea, SimpleFontString、GlueEditBoxWar3、SlashChatBox、TimerTextFrame、TextButtonFrame、GlueTextButton）

//获取文字（支持EditBox, TextFrame, TextArea, SimpleFontString）

//设置字数限制（支持EditBox）

//获取字数限制（支持EditBox）

//设置文字颜色（支持TextFrame, EditBox）

//获取鼠标所在位置的ui控件指针

//设置所有锚点到目标frame上

//设置焦点

//设置模型（支持Sprite、Model、StatusBar）

//获取控件是否启用

//设置透明度（0-255）

//获取透明度

//设置动画

//设置动画进度（autocast为false是可用）

//设置texture（支持Backdrop、SimpleStatusBar）

//设置缩放

//设置tooltip

//鼠标限制在ui内

//获取当前值（支持Slider、SimpleStatusBar、StatusBar）

//设置最大最小值（支持Slider、SimpleStatusBar、StatusBar）

//设置Step值（支持Slider）

//设置当前值（支持Slider、SimpleStatusBar、StatusBar）

//设置frame大小

//根据tag创建frame

//设置颜色（支持SimpleStatusBar）

//===========================================================================
// Trigger: 初始化
//===========================================================================
function Trig__________uFunc002MT takes nothing returns nothing
    call SetTeams(1)
endfunction
function Trig__________uFunc003MT takes nothing returns nothing
    call SetTeams(2)
endfunction
function Trig__________uFunc004MT takes nothing returns nothing
    call SetTeams(3)
endfunction
function Trig__________uFunc005MT takes nothing returns nothing
    call SetTeams(4)
endfunction
function Trig__________uFunc006MMT takes nothing returns nothing
    call SetTeams(5)
endfunction
function Trig__________uFunc007WT takes nothing returns nothing
    call SetTeams(6)
endfunction
function Trig__________uFunc009Func002KT takes nothing returns nothing
    call SetTeams(7)
endfunction
function Trig__________uFunc009Func003KT takes nothing returns nothing
    call SetTeams(8)
endfunction
function Trig__________uFunc010WRT takes nothing returns nothing
    call SetTeams(9)
endfunction
function Trig__________uActions takes nothing returns nothing
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call AbilityId("exec-lua:main")
    if GetLocalPlayer() == GetLocalPlayer() then
    	call DzTriggerRegisterMouseEventByCode(null, 1, 1, false, function Trig__________uFunc002MT)
    endif
    if GetLocalPlayer() == GetLocalPlayer() then
    	call DzTriggerRegisterMouseEventByCode(null, 1, 0, false, function Trig__________uFunc003MT)
    endif
    if GetLocalPlayer() == GetLocalPlayer() then
    	call DzTriggerRegisterMouseEventByCode(null, 2, 1, false, function Trig__________uFunc004MT)
    endif
    if GetLocalPlayer() == GetLocalPlayer() then
    	call DzTriggerRegisterMouseEventByCode(null, 2, 0, false, function Trig__________uFunc005MT)
    endif
    if GetLocalPlayer() == GetLocalPlayer() then
    	call DzTriggerRegisterMouseMoveEventByCode(null, false, function Trig__________uFunc006MMT)
    endif
    if GetLocalPlayer() == GetLocalPlayer() then
    	call DzTriggerRegisterMouseWheelEventByCode(null, false, function Trig__________uFunc007WT)
    endif
    set bj_forLoopAIndex=0
    set bj_forLoopAIndexEnd=255
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_i=bj_forLoopAIndex
        if GetLocalPlayer() == GetLocalPlayer() then
        	call DzTriggerRegisterKeyEventByCode(null, udg_i, 1, false, function Trig__________uFunc009Func002KT)
        endif
        if GetLocalPlayer() == GetLocalPlayer() then
        	call DzTriggerRegisterKeyEventByCode(null, udg_i, 0, false, function Trig__________uFunc009Func003KT)
        endif
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
    if GetLocalPlayer() == GetLocalPlayer() then
    	call DzTriggerRegisterWindowResizeEventByCode(null, false, function Trig__________uFunc010WRT)
    endif
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig__________u takes nothing returns nothing
    set gg_trg__________u=CreateTrigger()
    call TriggerAddAction(gg_trg__________u, function Trig__________uActions)
endfunction
//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    //Function not found: call InitTrig_japi_________u()
    //Function not found: call InitTrig____japi___u()
    //Function not found: call InitTrig____d3d___u()
    //Function not found: call InitTrig_______japi___u()
    call InitTrig___________________u()
    //Function not found: call InitTrig_api_2_0()
    call InitTrig__________u()
endfunction
//===========================================================================
function RunInitializationTriggers takes nothing returns nothing
    call ConditionalTriggerExecute(gg_trg_api_2_0)
    call ConditionalTriggerExecute(gg_trg__________u)
endfunction
//***************************************************************************
//*
//*  Players
//*
//***************************************************************************
function InitCustomPlayerSlots takes nothing returns nothing
    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(0), true)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)
    // Player 1
    call SetPlayerStartLocation(Player(1), 1)
    call SetPlayerColor(Player(1), ConvertPlayerColor(1))
    call SetPlayerRacePreference(Player(1), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(1), true)
    call SetPlayerController(Player(1), MAP_CONTROL_USER)
endfunction
function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_009
    call SetPlayerTeam(Player(0), 0)
    call SetPlayerTeam(Player(1), 0)
endfunction
function InitAllyPriorities takes nothing returns nothing
    call SetStartLocPrioCount(0, 1)
    call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(1, 1)
    call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
endfunction
//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================
function main takes nothing returns nothing
    call JapiConstantLib_init()
 call initializePlugin()
 call SetCameraBounds(- 3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("LordaeronSummerDay")
    call SetAmbientNightSound("LordaeronSummerNight")
    call SetMapMusic("Music", true, 0)
    call InitBlizzard()

call ExecuteFunc("jasshelper__initstructs280306059")
call ExecuteFunc("YDTriggerSaveLoadSystem__Init")

    set udg_i=0 // INLINED!!
    call InitCustomTriggers()
    call RunInitializationTriggers()
endfunction
//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************
function config takes nothing returns nothing
    call SetMapName("内置Japi1.36")
    call SetMapDescription("作者：问号 ")
    call SetPlayers(2)
    call SetTeams(2)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
    call DefineStartLocation(0, 2752.0, - 3008.0)
    call DefineStartLocation(1, 2112.0, - 2240.0)
    // Player setup
    call InitCustomPlayerSlots()
    call SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER)
    call SetPlayerSlotAvailable(Player(1), MAP_CONTROL_USER)
    call InitGenericPlayerSlots()
    call InitAllyPriorities()
endfunction




//Struct method generated initializers/callers:
function sa__LOGFONT_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            call DestroyFont(s__LOGFONT_font[this])
   return true
endfunction

function jasshelper__initstructs280306059 takes nothing returns nothing
    set st__LOGFONT_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__LOGFONT_onDestroy,Condition( function sa__LOGFONT_onDestroy))


endfunction

