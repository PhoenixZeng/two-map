//TESH.scrollpos=0
//TESH.alwaysfold=0
#ifdef YDWEEffectIncluded
#else
    #define OPEN
    #define YDWEAbilityStateIncluded
    #define YDWEEffectIncluded
    #define YDWEJapiUnitIncluded
    #define YDWEEventDamageDataIncluded
    #define YDWEYDWEJapiScriptIncluded
    #define YDWEYDWEJapiOtherIncluded
#endif


library japi requires JapiConstantLib

    native SetHeroLevels        takes code f returns nothing  
    native TeleportCaptain      takes real x, real y returns nothing
    native GetUnitGoldCost      takes integer unitid returns integer
    globals 
        public hashtable ht=InitHashtable()
        private integer key=StringHash("jass")
    endglobals
    
    #ifdef OPEN
        #define public /**/
    #endif
    
    public function Call takes string str returns nothing
        call UnitId(str)
    endfunction
    //获取鼠标在地图中的x轴
    public function GetMouseX takes nothing returns real
        call SaveStr(ht,key,0,"()R")
        call Call("GetMouseX")
        return LoadReal(ht,key,0)
    endfunction
    //获取鼠标在地图中的y轴
    public function GetMouseY takes nothing returns real
        call SaveStr(ht,key,0,"()R")
        call Call("GetMouseY")
        return LoadReal(ht,key,0)
    endfunction
    
    
    
    
    //==========================================================================
    public function EXGetUnitAbility takes unit u,integer abilityId returns integer
        call SaveInteger(ht,key,1,GetHandleId(u))
        call SaveInteger(ht,key,2,abilityId)
        call SaveStr(ht,key,0,"(II)I")
        call Call("EXGetUnitAbility")
        return LoadInteger(ht,key,0)
    endfunction
    
    // yd japi ==================================================================
    // 技能----------------------------------------------------
    
    ///<summary>技能属性 [JAPI]</summary>
	public function YDWEGetUnitAbilityState takes unit u, integer abilcode, integer data_type returns real
        call SaveInteger(ht,key,1,EXGetUnitAbility(u, abilcode))
        call SaveInteger(ht,key,2,data_type)
        call SaveStr(ht,key,0,"(II)R")
        call Call("EXGetAbilityState")
		return LoadReal(ht,key,0)
	endfunction
	///<summary>技能数据 (整数) [JAPI]</summary>
	public function YDWEGetUnitAbilityDataInteger takes unit u, integer abilcode, integer level, integer data_type returns integer
        call SaveInteger(ht,key,1,EXGetUnitAbility(u, abilcode))
        call SaveInteger(ht,key,2,level)
        call SaveInteger(ht,key,3,data_type)
        call SaveStr(ht,key,0,"(III)I")
        call Call("EXGetAbilityDataInteger")
		return LoadInteger(ht,key,0)
	endfunction
	///<summary>技能数据 (实数) [JAPI]</summary>
	public function YDWEGetUnitAbilityDataReal takes unit u, integer abilcode, integer level, integer data_type returns real
        call SaveInteger(ht,key,1,EXGetUnitAbility(u, abilcode))
        call SaveInteger(ht,key,2,level)
        call SaveInteger(ht,key,3,data_type)
        call SaveStr(ht,key,0,"(III)R")
        call Call("EXGetAbilityDataReal")
		return LoadReal(ht,key,0)
    endfunction
	///<summary>技能数据 (字符串) [JAPI]</summary>
	public function YDWEGetUnitAbilityDataString takes unit u, integer abilcode, integer level, integer data_type returns string
        call SaveInteger(ht,key,1,EXGetUnitAbility(u, abilcode))
        call SaveInteger(ht,key,2,level)
        call SaveInteger(ht,key,3,data_type)
        call SaveStr(ht,key,0,"(III)S")
        call Call("EXGetAbilityDataString")
		return LoadStr(ht,key,0)
	endfunction
	///<summary>设置技能属性 [JAPI]</summary>
	public function YDWESetUnitAbilityState takes unit u, integer abilcode, integer data_type, real value returns nothing
        call SaveInteger(ht,key,1,EXGetUnitAbility(u, abilcode))
        call SaveInteger(ht,key,2,data_type)
        call SaveReal(ht,key,3,value)
        call SaveStr(ht,key,0,"(IIR)V")
        call Call("EXSetAbilityState")
    endfunction
	///<summary>设置技能数据 (整数) [JAPI]</summary>
	public function YDWESetUnitAbilityDataInteger takes unit u, integer abilcode, integer level, integer data_type, integer value returns nothing
        call SaveInteger(ht,key,1,EXGetUnitAbility(u, abilcode))
        call SaveInteger(ht,key,2,level)
        call SaveInteger(ht,key,3,data_type)
        call SaveInteger(ht,key,4,value)
        call SaveStr(ht,key,0,"(IIII)V")
        call Call("EXSetAbilityDataInteger")
    endfunction
	///<summary>设置技能数据 (实数) [JAPI]</summary>
	public function YDWESetUnitAbilityDataReal takes unit u, integer abilcode, integer level, integer data_type, real value returns nothing
        call SaveInteger(ht,key,1,EXGetUnitAbility(u, abilcode))
        call SaveInteger(ht,key,2,level)
        call SaveInteger(ht,key,3,data_type)
        call SaveReal(ht,key,4,value)
        call SaveStr(ht,key,0,"(IIIR)V")
        call Call("EXSetAbilityDataReal")
    endfunction
	///<summary>设置技能数据 (字符串) [JAPI]</summary>
	public function YDWESetUnitAbilityDataString takes unit u, integer abilcode, integer level, integer data_type, string value returns nothing
        call SaveInteger(ht,key,1,EXGetUnitAbility(u, abilcode))
        call SaveInteger(ht,key,2,level)
        call SaveInteger(ht,key,3,data_type)
        call SaveStr(ht,key,4,value)
        call SaveStr(ht,key,0,"(IIIS)V")
        call Call("EXSetAbilityDataString")
    endfunction
	
    
    //设置技能变身数据A
    public function EXSetAbilityAEmeDataA takes integer ability_handle,integer value returns boolean
        call SaveInteger(ht,key,1,ability_handle)
        call SaveInteger(ht,key,2,value)
        call SaveStr(ht,key,0,"(II)B")
        call Call("EXSetAbilityAEmeDataA")
        return LoadBoolean(ht,key,0)
    endfunction
    
    //单位变身
    public function YDWEUnitTransform takes unit u, integer abilcode, integer targetid returns nothing
		call UnitAddAbility(u, abilcode)
		call YDWESetUnitAbilityDataInteger(u, abilcode, 1, 117, GetUnitTypeId(u))
		call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), GetUnitTypeId(u))
		call UnitRemoveAbility(u, abilcode)
		call UnitAddAbility(u, abilcode)
		call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), targetid)
		call UnitRemoveAbility(u, abilcode)
	endfunction
    
    // 单位-------------------------------------------------------
    
    //暂停单位
    public function EXPauseUnit takes unit unit_handle,boolean flag returns nothing
        call SaveInteger(ht,key,1,GetHandleId(unit_handle))
        call SaveBoolean(ht,key,2,flag)
        call SaveStr(ht,key,0,"(IB)V")
        call Call("EXPauseUnit")
    endfunction
    
    //获取单位字符串
    public function EXGetUnitString takes integer unitcode, integer Type returns string
        call SaveInteger(ht,key,1,unitcode)
        call SaveInteger(ht,key,2,Type)
        call SaveStr(ht,key,0,"(II)S")
        call Call("EXGetUnitString")
        return LoadStr(ht,key,0)
    endfunction
    
       //设置单位字符串
    public function EXSetUnitString takes integer unitcode,integer Type,string value returns boolean
        call SaveInteger(ht,key,1,unitcode)
        call SaveInteger(ht,key,2,Type)
        call SaveStr(ht,key,3,value)
        call SaveStr(ht,key,0,"(IIS)B")
        call Call("EXSetUnitString")
        return LoadBoolean(ht,key,0)
    endfunction
    
    //获取单位实数
    public function EXGetUnitReal takes integer unitcode, integer Type returns real
        call SaveInteger(ht,key,1,unitcode)
        call SaveInteger(ht,key,2,Type)
        call SaveStr(ht,key,0,"(II)R")
        call Call("EXGetUnitReal")
        return LoadReal(ht,key,0)
    endfunction
    
    //设置单位实数
    public function EXSetUnitReal takes integer unitcode,integer Type,real value returns boolean
        call SaveInteger(ht,key,1,unitcode)
        call SaveInteger(ht,key,2,Type)
        call SaveReal(ht,key,3,value)
        call SaveStr(ht,key,0,"(IIR)B")
        call Call("EXSetUnitReal")
        return LoadBoolean(ht,key,0)
    endfunction
    
    
    //获取单位整数
    public function EXGetUnitInteger takes integer unitcode, integer Type returns integer
        call SaveInteger(ht,key,1,unitcode)
        call SaveInteger(ht,key,2,Type)
        call SaveStr(ht,key,0,"(II)I")
        call Call("EXGetUnitInteger")
        return LoadInteger(ht,key,0)
    endfunction
    
    //设置单位整数
    public function EXSetUnitInteger takes integer unitcode,integer Type,integer value returns boolean
        call SaveInteger(ht,key,1,unitcode)
        call SaveInteger(ht,key,2,Type)
        call SaveInteger(ht,key,3,value)
        call SaveStr(ht,key,0,"(III)B")
        call Call("EXSetUnitInteger")
        return LoadBoolean(ht,key,0)
    endfunction
    
        //获取单位数组字符串
    public function EXGetUnitArrayString takes integer unitcode, integer Type,integer index returns string
        call SaveInteger(ht,key,1,unitcode)
        call SaveInteger(ht,key,2,Type)
        call SaveInteger(ht,key,3,index)
        call SaveStr(ht,key,0,"(III)S")
        call Call("EXGetUnitArrayString")
        return LoadStr(ht,key,0)
    endfunction
    
    //设置单位数组字符串
    public function EXSetUnitArrayString takes integer unitcode,integer Type,integer index,string value returns boolean
        call SaveInteger(ht,key,1,unitcode)
        call SaveInteger(ht,key,2,Type)
        call SaveInteger(ht,key,3,index)
        call SaveStr(ht,key,4,value)
        call SaveStr(ht,key,0,"(IIIS)B")
        call Call("EXSetUnitArrayString")
        return LoadBoolean(ht,key,0)
    endfunction
    //设置单位面向角度(立即转向)
    public function EXSetUnitFacing takes unit unit_handle,real angle returns nothing
        call SaveInteger(ht,key,1,GetHandleId(unit_handle))
        call SaveReal(ht,key,2,angle)
        call SaveStr(ht,key,0,"(IR)V")
        call Call("EXSetUnitFacing")
    endfunction
    
    //设置单位碰撞类型
    public function EXSetUnitCollisionType takes boolean enable,unit unit_handle,integer Type returns nothing
        call SaveBoolean(ht,key,1,enable)
        call SaveInteger(ht,key,2,GetHandleId(unit_handle))
        call SaveInteger(ht,key,3,Type)
        call SaveStr(ht,key,0,"(BII)V")
        call Call("EXSetUnitCollisionType")
    endfunction
    
    //设置单位移动类型
    public function EXSetUnitMoveType takes unit unit_handle,integer Type returns nothing
        call SaveInteger(ht,key,1,GetHandleId(unit_handle))
        call SaveInteger(ht,key,2,Type)
        call SaveStr(ht,key,0,"(II)V")
        call Call("EXSetUnitMoveType")
    endfunction
    
    //单位添加眩晕
    public function YDWEUnitAddStun takes unit u returns nothing
		call EXPauseUnit(u, true)
	endfunction
    
    //单位删除眩晕
	public function YDWEUnitRemoveStun takes unit u returns nothing
		call EXPauseUnit(u, false)
	endfunction
    
    //获取伤害数据
    public function EXGetEventDamageData takes integer Type returns integer
        //call SaveInteger(ht,key,1,Type)
        //call SaveStr(ht,key,0,"(I)I")
        //call Call("EXGetEventDamageData")
        //return LoadInteger(ht,key,0)
        return GetUnitGoldCost(Type)
    endfunction
	
    //设置伤害
    public function EXSetEventDamage takes real Damage returns boolean
        //call SaveReal(ht,key,1,Damage)
        //call SaveStr(ht,key,0,"(R)B")
        //call Call("EXSetEventDamage")
        //return LoadBoolean(ht,key,0)
        call TeleportCaptain(Damage,0.00)
        return true
    endfunction
    
    //判断是否是物理伤害
    public function YDWEIsEventPhysicalDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(1)
	endfunction

    //判断是否是攻击伤害
	public function YDWEIsEventAttackDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(2)
	endfunction
	
    //判断是否是范围伤害
	public function YDWEIsEventRangedDamage takes nothing  returns boolean
		return 0 != EXGetEventDamageData(3)
	endfunction
	
    //判断伤害类型
	public function YDWEIsEventDamageType takes damagetype damageType returns boolean
		return damageType == ConvertDamageType(EXGetEventDamageData(4))
	endfunction
    
    //判断武器类型
	public function YDWEIsEventWeaponType takes weapontype weaponType returns boolean
		return weaponType == ConvertWeaponType(EXGetEventDamageData(5))
	endfunction
	
    //判断攻击类型
	public function YDWEIsEventAttackType takes attacktype attackType returns boolean
		return attackType == ConvertAttackType(EXGetEventDamageData(6))
	endfunction

	//设置伤害
	public function YDWESetEventDamage takes real amount returns boolean
		return EXSetEventDamage(amount)
	endfunction
    
    // 物品----------------------------------------------------
    
    ///<summary>设置物品数据 (字符串) [JAPI]</summary>
    public function YDWESetItemDataString takes integer ItemTypeId,integer Type,string Value returns nothing
        call SaveStr(ht,key,0,"(IIS)V")
        call SaveInteger(ht,key,1,ItemTypeId)
        call SaveInteger(ht,key,2,Type)
        call SaveStr(ht,key,3,Value)
        call Call("EXSetItemDataString")
    endfunction
    ///<summary>获取物品数据 (字符串) [JAPI]</summary>
    public function YDWEGetItemDataString takes integer ItemTypeId,integer Type returns string
        call SaveStr(ht,key,0,"(II)S")
        call SaveInteger(ht,key,1,ItemTypeId)
        call SaveInteger(ht,key,2,Type)
        call Call("EXGetItemDataString")
        return LoadStr(ht,key,0)
    endfunction
    
    //特效--------------------------------------------------------
    
    ///<summary>设置特效坐标 [JAPI]</summary>
    public function EXSetEffectXY takes effect Handle,real x,real y returns nothing
        call SaveStr(ht,key,0,"(IRR)V")
        call SaveInteger(ht,key,1,GetHandleId(Handle))
        call SaveReal(ht,key,2,x)
        call SaveReal(ht,key,3,y)
        call Call("EXSetEffectXY")
    endfunction
    
    ///<summary>设置特效Z轴 [JAPI]</summary>
    public function EXSetEffectZ takes effect Handle, real z returns nothing
        call SaveStr(ht,key,0,"(IRR)V")
        call SaveInteger(ht,key,1,GetHandleId(Handle))
        call SaveReal(ht,key,2,z)
		call Call("EXSetEffectZ")
	endfunction
    
    ///<summary>获取特效X轴 [JAPI]</summary>
    public function EXGetEffectX takes effect Handle returns real
        call SaveStr(ht,key,0,"(I)R")
        call SaveInteger(ht,key,1,GetHandleId(Handle))
        call Call("EXGetEffectX")
        return LoadReal(ht,key,0)
	endfunction
    
    ///<summary>获取特效Y轴 [JAPI]</summary>
	public function EXGetEffectY takes effect Handle returns real
        call SaveStr(ht,key,0,"(I)R")
        call SaveInteger(ht,key,1,GetHandleId(Handle))
        call Call("EXGetEffectY")
        return LoadReal(ht,key,0)
	endfunction
    
    ///<summary>获取特效Z轴 [JAPI]</summary>
	public function EXGetEffectZ takes effect Handle returns real
        call SaveStr(ht,key,0,"(I)R")
        call SaveInteger(ht,key,1,GetHandleId(Handle))
        call Call("EXGetEffectZ")
		return LoadReal(ht,key,0)
	endfunction
    
    ///<summary>设置特效尺寸 [JAPI]</summary>
	public function EXSetEffectSize takes effect Handle, real size returns nothing
		call SaveStr(ht,key,0,"(IR)V")
        call SaveInteger(ht,key,1,GetHandleId(Handle))
        call SaveReal(ht,key,2,size)
        call Call("EXSetEffectSize")
	endfunction
    
    ///<summary>获取特效尺寸 [JAPI]</summary>
	public function EXGetEffectSize takes effect Handle returns real
        call SaveStr(ht,key,0,"(I)R")
        call SaveInteger(ht,key,1,GetHandleId(Handle))
        call Call("EXGetEffectSize")
		return LoadReal(ht,key,0)
	endfunction
    
    ///<summary>设置特效X旋转轴 [JAPI]</summary>
	public function EXEffectMatRotateX takes effect Handle, real x returns nothing
        call SaveStr(ht,key,0,"(IR)V")
        call SaveInteger(ht,key,1,GetHandleId(Handle))
        call SaveReal(ht,key,2,x)
        call Call("EXEffectMatRotateX")
	endfunction
    
    ///<summary>设置特效Y旋转轴 [JAPI]</summary>
	public function EXEffectMatRotateY takes effect Handle, real y returns nothing
        call SaveStr(ht,key,0,"(IR)V")
        call SaveInteger(ht,key,1,GetHandleId(Handle))
        call SaveReal(ht,key,2,y)
        call Call("EXEffectMatRotateY")
	endfunction
    
    ///<summary>设置特效Z旋转轴 [JAPI]</summary>
	public function EXEffectMatRotateZ takes effect Handle, real z returns nothing
        call SaveStr(ht,key,0,"(IR)V")
        call SaveInteger(ht,key,1,GetHandleId(Handle))
        call SaveReal(ht,key,2,z)
        call Call("EXEffectMatRotateZ")
	endfunction
    
    ///<summary>设置特效比例 [JAPI]</summary>
	public function EXEffectMatScale takes effect Handle, real x, real y, real z returns nothing
        call SaveStr(ht,key,0,"(IRRR)V")
        call SaveInteger(ht,key,1,GetHandleId(Handle))
        call SaveReal(ht,key,2,x)
        call SaveReal(ht,key,3,y)
        call SaveReal(ht,key,4,z)
        call Call("EXEffectMatScale")
	endfunction
    
    ///<summary>设置特效重置 [JAPI]</summary>
	public function EXEffectMatReset takes effect Handle returns nothing
        call SaveStr(ht,key,0,"(I)V")
        call SaveInteger(ht,key,1,GetHandleId(Handle))
        call Call("EXEffectMatReset")
	endfunction
    
    ///<summary>设置特效速率 [JAPI]</summary>
	public function EXSetEffectSpeed takes effect Handle, real speed returns nothing
        call SaveStr(ht,key,0,"(IR)V")
        call SaveInteger(ht,key,1,GetHandleId(Handle))
        call SaveReal(ht,key,2,speed)
        call Call("EXSetEffectSpeed")
	endfunction
    
    ///<summary>设置可追踪物坐标 [JAPI]</summary>
    public function EXSetTrackableXY takes trackable Handle,real x,real y returns nothing
        call SaveStr(ht,key,0,"(IRR)V")
        call SaveInteger(ht,key,1,GetHandleId(Handle))
        call SaveReal(ht,key,2,x)
        call SaveReal(ht,key,3,y)
        call Call("EXSetEffectXY")
    endfunction
    
    
    ///<summary>获取可追踪物X轴 [JAPI]</summary>
    public function EXGetTrackableX takes trackable Handle returns real
        call SaveStr(ht,key,0,"(I)R")
        call SaveInteger(ht,key,1,GetHandleId(Handle))
        call Call("EXGetEffectX")
        return LoadReal(ht,key,0)
	endfunction
    
    ///<summary>获取可追踪物Y轴 [JAPI]</summary>
	public function EXGetTrackableY takes trackable Handle returns real
        call SaveStr(ht,key,0,"(I)R")
        call SaveInteger(ht,key,1,GetHandleId(Handle))
        call Call("EXGetEffectY")
        return LoadReal(ht,key,0)
	endfunction
    
    
    
    public function EXExecuteScript takes string str returns string
        call SaveStr(ht,key,0,"(S)S")
        call SaveStr(ht,key,1,str)
        call Call("EXExecuteScript")
        return LoadStr(ht,key,0)
    endfunction
    //-----------------模拟聊天----------------------------
    public function EXDisplayChat takes player p, integer chat_recipient, string message returns nothing
        call SaveStr(ht,key,0,"(IIS)V")
        call SaveInteger(ht,key,1,GetHandleId(p))
        call SaveInteger(ht,key,2,chat_recipient)
        call SaveStr(ht,key,3,message)
        call Call("EXDisplayChat")
    endfunction
	public function YDWEDisplayChat takes player p, integer chat_recipient, string message returns nothing
		call EXDisplayChat(p, chat_recipient, message)
	endfunction
    
    //-----------版本描述-------------------------------------
    
    //获取地图名字
    public function GetMapName takes nothing returns string
        call SaveStr(ht,key,0,"()S")
        call Call("GetMapName")
        return LoadStr(ht,key,0)
    endfunction
    
    //获取魔兽版本
    public function GetGameVersion takes nothing returns integer
        call SaveStr(ht,key,0,"()I")
        call Call("GetGameVersion")
        return LoadInteger(ht,key,0)
    endfunction
    
    //获取插件版本
    public function GetPluginVersion takes nothing returns string
        call SaveStr(ht,key,0,"()S")
        call Call("GetPluginVersion")
        return LoadStr(ht,key,0)
    endfunction
    
    public function GetFuncAddr takes code f returns integer
        call SetHeroLevels(f)
        return LoadInteger(ht,key,0)
    endfunction

    public function japiDoNothing takes nothing returns nothing
        
    endfunction
    
    public function func_bind_trigger_name takes code functions,string name returns nothing
        call SaveStr(ht,key,0,"(IS)V")
        call SaveInteger(ht,key,1,GetFuncAddr(functions))
        call SaveStr(ht,key,2,name)
        call Call("func_bind_trigger_name")
    endfunction
    

    public function open_code_run_logs takes boolean open returns nothing
        local string l=""
        set l=l+"(function () "
        set l=l+    "lfunc={}  lfunc_name={}"
        set l=l+    "save_lfunc_info=function (func,name,index)index=1<<index lfunc[func]=index lfunc_name[index]=name end "
        set l=l+    "save_lfunc_info('GetLocalPlayer','[本地玩家]',0)"
        set l=l+    "save_lfunc_info('GetFps','[获取帧数]',1)"
        set l=l+    "save_lfunc_info('GetChatState','[聊天状态]',2)"
        set l=l+    "save_lfunc_info('GetCameraTargetPositionLoc','[当前镜头目标点]',3)"
        set l=l+    "save_lfunc_info('GetCameraTargetPositionX','[当前镜头目标X坐标]',4)"
        set l=l+    "save_lfunc_info('GetCameraTargetPositionY','[当前镜头目标Y坐标]',5)"
        set l=l+    "save_lfunc_info('GetCameraTargetPositionZ','[当前镜头目标Z坐标]',6)"
        
        set l=l+    "save_lfunc_info('GetCameraEyePositionLoc','[当前镜头源位置]',7)"
        set l=l+    "save_lfunc_info('GetCameraEyePositionX','[当前镜头源X坐标]',8)"
        set l=l+    "save_lfunc_info('GetCameraEyePositionY','[当前镜头源Y坐标]',9)"
        set l=l+    "save_lfunc_info('GetCameraEyePositionZ','[当前镜头源Z坐标]',10)"
        
        set l=l+    "save_lfunc_info('GetMouseX','[获取鼠标X轴]',11)"
        set l=l+    "save_lfunc_info('GetMouseY','[获取鼠标Y轴]',12)"
        set l=l+    "save_lfunc_info('GetMouseVectorX','[获取鼠标屏幕X轴]',13)"
        set l=l+    "save_lfunc_info('GetMouseVectorY','[获取鼠标屏幕Y轴]',14)"
        
        set l=l+"end)() or '' "
        call EXExecuteScript(l)
        
        set l=""
        
        set l=l+"(function () "
        
        set l=l+    "get_jass_func_info=function (func_name) "
        set l=l+        " return lfunc[func_name] or 0 "
        set l=l+    "end "
        
        set l=l+    "get_jass_func_msg=function (func_name_index)"
        set l=l+        " return lfunc_name[func_name_index] or '' "
        set l=l+    "end "
        
        set l=l+    "local storm=require 'jass.storm' "
        set l=l+    "local ss=storm.load('war3map.j') "
        set l=l+    "ss:gsub('function%s+([%w_]+)%s+ta"+"kes(.-)endfunction',function (name,code)\n"
        set l=l+        "code=code:gsub('function%s+','function_'):gsub('/"+"/[^\\n]-\\n','')\n"
        set l=l+        "code:gsub('([%w_]+)',function (str) "
        set l=l+            "if lfunc[str]~=nil then "
        set l=l+                "local flag=lfunc[name] or 0 "
        set l=l+             "lfunc[name]=flag | lfunc[str] "
        set l=l+            "end "
        set l=l+        "end) "
        set l=l+    "end) "
        set l=l+    "ss=nil  return '' "
        set l=l+"end)() or '' "

        call EXExecuteScript(l)
        call SaveStr(ht,key,0,"(B)V")
        call SaveBoolean(ht,key,1,open)
        call Call("open_code_run_logs")
    endfunction
    
    
    
    public function initializePlugin takes nothing returns integer
        call ExecuteFunc("japiDoNothing")
        call StartCampaignAI( Player(PLAYER_NEUTRAL_AGGRESSIVE), "callback" )
        call Call(I2S(GetHandleId(ht)))
        call SaveStr(ht,key,0,"(I)V")
        call SaveInteger(ht,key,1,GetFuncAddr(function japiDoNothing))
        call Call("SaveFunc")
        call ExecuteFunc("japiDoNothing")
        return 0
    endfunction
endlibrary
<?
    variable=''
    init_variable=''
    for i=1,32 do
        variable=variable..' integer array i_'..i..'\n'
        init_variable=init_variable..' set i_'..i..'[8191]=0\n'
    end
?>

library JapiConstantLib 
    globals
        <?=variable?>
    endglobals
    function JapiConstantLib_init_memory takes nothing returns nothing
        <?=init_variable?>
    endfunction
    function JapiConstantLib_init takes nothing returns integer 
        call ExecuteFunc("JapiConstantLib_init_memory")
        return 1
    endfunction
endlibrary

<?
    function init_plugin(jass)
        return jass:gsub('(main takes nothing returns nothing%s+)',[[%1
        local integer init_plugin_memory=JapiConstantLib_init()
        local integer init_plugin_execute=initializePlugin()
        ]])
    end
?>
#define SetCameraBounds(a,b,c,d,e,f,g,h) JapiConstantLib_init() YDNL call initializePlugin() YDNL call SetCameraBounds(a,b,c,d,e,f,g,h)


#ifdef OPEN
    #undef public 
#endif
