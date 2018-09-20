//TESH.scrollpos=0
//TESH.alwaysfold=0
/*

japi引用的常量库 由于wave宏定义 只对以下的代码有效

请将常量库里所有内容复制到  自定义脚本代码区
*/


    #define KEY_MOUSE_MOVE     0x200 //鼠标移动 进入区域运行第3个函数 离开区域运行第4个参数
    #define KEY_MOUSE_LEFT_UP      0x201 //鼠标左键按下  TextureAddEvent运行第3个参数
    #define KEY_MOUSE_LEFT_DOWN    0x202 //鼠标左键弹起  TextureAddEvent运行第4个参数
    #define KEY_MOUSE_RIGHT_UP     0x204 //鼠标右键按下  TextureAddEvent运行第3个参数
    #define KEY_MOUSE_RIGHT_DOWN   0x205 //鼠标右键弹起  TextureAddEvent运行第4个参数
        
    //键盘键位 
    //以下键位 按下 运行 TextureAddEvent 的第3个参数
    //弹起 运行 第4个参数
    
    //大键盘数字键
    #define KEY_0        0x30
    #define KEY_1        0x31
    #define KEY_2        0x32
    #define KEY_3        0x33
    #define KEY_4        0x34
    #define KEY_5        0x35
    #define KEY_6        0x36
    #define KEY_7        0x37
    #define KEY_8        0x38
    #define KEY_9        0x39
    
    //小键盘 数字键
    #define KEY_NUM_0         0x60
    #define KEY_NUM_1         0x61
    #define KEY_NUM_2         0x62
    #define KEY_NUM_3         0x63
    #define KEY_NUM_4         0x64
    #define KEY_NUM_5         0x65
    #define KEY_NUM_6         0x66
    #define KEY_NUM_7         0x67
    #define KEY_NUM_8         0x68
    #define KEY_NUM_9         0x69
    
    #define KEY_A        'A'
    #define KEY_B        'B'
    #define KEY_C        'C'
    #define KEY_D        'D'
    #define KEY_E        'E'
    #define KEY_F        'F'
    #define KEY_G        'G'
    #define KEY_H        'H'
    #define KEY_I        'I'
    #define KEY_J        'J'
    #define KEY_K        'K'
    #define KEY_L        'L'
    #define KEY_M        'M'
    #define KEY_N        'N'
    #define KEY_O        'O'
    #define KEY_P        'P'
    #define KEY_Q        'Q'
    #define KEY_R        'R'
    #define KEY_S        'S'
    #define KEY_T        'T'
    #define KEY_U        'U'
    #define KEY_V        'V'
    #define KEY_W        'W'
    #define KEY_X        'X'
    #define KEY_Y        'Y'
    #define KEY_Z        'Z'
    
    #define KEY_F1            0x70
    #define KEY_F2            0x71
    #define KEY_F3            0x72
    #define KEY_F4            0x73
    #define KEY_F5            0x74
    #define KEY_F6            0x75
    #define KEY_F7            0x76
    #define KEY_F8            0x77
    #define KEY_F9            0x78
    #define KEY_F10           0x79
    #define KEY_F11           0x7a
    #define KEY_F12           0x7b
    
    
    #define KEY_TAB           0x9
    #define KEY_ENTER         0xd //回车键
    #define KEY_SHLFT         0x10
    #define KEY_CTRL          0x11
    #define KEY_ALT           0x12
    #define KEY_ESC           0x1b
    #define KEY_SPACE         0x20 //空格键
    
    #define KEY_SLASH         0xbf // 正斜杠 \\ 
    #define KEY_BACKSLASH     0xdc //反斜杠 //
    
    //魔兽版本 用GetGameVersion 来获取当前版本 来对比以下具体版本做出相应操作
    #define version_124b   6374
    #define version_124e   6387
    #define version_126    6401  
    #define version_127a   7000
    #define version_127b   7085
    #define version_128a   7205

    //-----------模拟聊天------------------
    #define CHAT_RECIPIENT_ALL    0    // [所有人]
    #define CHAT_RECIPIENT_ALLIES      1    // [盟友]
    #define CHAT_RECIPIENT_OBSERVERS   2    // [观看者]
    #define CHAT_RECIPIENT_REFEREES    2    // [裁判]
    #define CHAT_RECIPIENT_PRIVATE     3    // [私人的]
    
    //---------技能数据类型---------------
    
    ///<summary>冷却时间</summary>
    #define ABILITY_STATE_COOLDOWN 1

    ///<summary>目标允许</summary>
    #define ABILITY_DATA_TARGS 100

    ///<summary>施放时间</summary>
    #define ABILITY_DATA_CAST 101

    ///<summary>持续时间</summary>
    #define ABILITY_DATA_DUR 102

    ///<summary>持续时间</summary>
    #define ABILITY_DATA_HERODUR 103

    ///<summary>魔法消耗</summary>
    #define ABILITY_DATA_COST 104

    ///<summary>施放间隔</summary>
    #define ABILITY_DATA_COOL 105

    ///<summary>影响区域</summary>
    #define ABILITY_DATA_AREA 106

    ///<summary>施法距离</summary>
    #define ABILITY_DATA_RNG 107

    ///<summary>数据A</summary>
    #define ABILITY_DATA_DATA_A 108

    ///<summary>数据B</summary>
    #define ABILITY_DATA_DATA_B 109

    ///<summary>数据C</summary>
    #define ABILITY_DATA_DATA_C 110

    ///<summary>数据D</summary>
    #define ABILITY_DATA_DATA_D 111

    ///<summary>数据E</summary>
    #define ABILITY_DATA_DATA_E 112

    ///<summary>数据F</summary>
    #define ABILITY_DATA_DATA_F 113

    ///<summary>数据G</summary>
    #define ABILITY_DATA_DATA_G 114

    ///<summary>数据H</summary>
    #define ABILITY_DATA_DATA_H 115

    ///<summary>数据I</summary>
    #define ABILITY_DATA_DATA_I 116

    ///<summary>单位类型</summary>
    #define ABILITY_DATA_UNITID 117

    ///<summary>热键</summary>
    #define ABILITY_DATA_HOTKET 200

    ///<summary>关闭热键</summary>
    #define ABILITY_DATA_UNHOTKET 201

    ///<summary>学习热键</summary>
    #define ABILITY_DATA_RESEARCH_HOTKEY 202

    ///<summary>名字</summary>
    #define ABILITY_DATA_NAME 203

    ///<summary>图标</summary>
    #define ABILITY_DATA_ART 204

    ///<summary>目标效果</summary>
    #define ABILITY_DATA_TARGET_ART 205

    ///<summary>施法者效果</summary>
    #define ABILITY_DATA_CASTER_ART 206

    ///<summary>目标点效果</summary>
    #define ABILITY_DATA_EFFECT_ART 207

    ///<summary>区域效果</summary>
    #define ABILITY_DATA_AREAEFFECT_ART 208

    ///<summary>投射物</summary>
    #define ABILITY_DATA_MISSILE_ART 209

    ///<summary>特殊效果</summary>
    #define ABILITY_DATA_SPECIAL_ART 210

    ///<summary>闪电效果</summary>
    #define ABILITY_DATA_LIGHTNING_EFFECT 211

    ///<summary>buff提示</summary>
    #define ABILITY_DATA_BUFF_TIP 212

    ///<summary>buff提示</summary>
    #define ABILITY_DATA_BUFF_UBERTIP 213

    ///<summary>学习提示</summary>
    #define ABILITY_DATA_RESEARCH_TIP 214

    ///<summary>提示</summary>
    #define ABILITY_DATA_TIP 215

    ///<summary>关闭提示</summary>
    #define ABILITY_DATA_UNTIP 216

    ///<summary>学习提示</summary>
    #define ABILITY_DATA_RESEARCH_UBERTIP 217

    ///<summary>提示</summary>
    #define ABILITY_DATA_UBERTIP 218

    ///<summary>关闭提示</summary>
    #define ABILITY_DATA_UNUBERTIP 219

    #define ABILITY_DATA_UNART 220
    
    #define ABILITY_DATA_RESEARCH_ART 221

    //----------物品数据类型----------------------

    ///<summary>物品图标</summary>
    #define ITEM_DATA_ART 1

    ///<summary>物品提示</summary>
    #define ITEM_DATA_TIP 2

    ///<summary>物品扩展提示</summary>
    #define ITEM_DATA_UBERTIP 3

    ///<summary>物品名字</summary>
    #define ITEM_DATA_NAME 4

    ///<summary>物品说明</summary>
    #define ITEM_DATA_DESCRIPTION 5


    //------------单位数据类型--------------
    ///<summary>攻击1 伤害骰子数量</summary>
    #define UNIT_STATE_ATTACK1_DAMAGE_DICE 0x10

    ///<summary>攻击1 伤害骰子面数</summary>
    #define UNIT_STATE_ATTACK1_DAMAGE_SIDE 0x11

    ///<summary>攻击1 基础伤害</summary>
    #define UNIT_STATE_ATTACK1_DAMAGE_BASE 0x12

    ///<summary>攻击1 升级奖励</summary>
    #define UNIT_STATE_ATTACK1_DAMAGE_BONUS 0x13

    ///<summary>攻击1 最小伤害</summary>
    #define UNIT_STATE_ATTACK1_DAMAGE_MIN 0x14

    ///<summary>攻击1 最大伤害</summary>
    #define UNIT_STATE_ATTACK1_DAMAGE_MAX 0x15

    ///<summary>攻击1 全伤害范围</summary>
    #define UNIT_STATE_ATTACK1_RANGE 0x16

    ///<summary>装甲</summary>
    #define UNIT_STATE_ARMOR 0x20

    // attack 1 attribute adds
    ///<summary>攻击1 伤害衰减参数</summary>
    #define UNIT_STATE_ATTACK1_DAMAGE_LOSS_FACTOR 0x21

    ///<summary>攻击1 武器声音</summary>
    #define UNIT_STATE_ATTACK1_WEAPON_SOUND 0x22

    ///<summary>攻击1 攻击类型</summary>
    #define UNIT_STATE_ATTACK1_ATTACK_TYPE 0x23

    ///<summary>攻击1 最大目标数</summary>
    #define UNIT_STATE_ATTACK1_MAX_TARGETS 0x24

    ///<summary>攻击1 攻击间隔</summary>
    #define UNIT_STATE_ATTACK1_INTERVAL 0x25

    ///<summary>攻击1 攻击延迟/summary>
    #define UNIT_STATE_ATTACK1_INITIAL_DELAY 0x26

    ///<summary>攻击1 弹射弧度</summary>
    #define UNIT_STATE_ATTACK1_BACK_SWING 0x28

    ///<summary>攻击1 攻击范围缓冲</summary>
    #define UNIT_STATE_ATTACK1_RANGE_BUFFER 0x27

    ///<summary>攻击1 目标允许</summary>
    #define UNIT_STATE_ATTACK1_TARGET_TYPES 0x29

    ///<summary>攻击1 溅出区域</summary>
    #define UNIT_STATE_ATTACK1_SPILL_DIST 0x56

    ///<summary>攻击1 溅出半径</summary>
    #define UNIT_STATE_ATTACK1_SPILL_RADIUS 0x57

    ///<summary>攻击1 武器类型</summary>
    #define UNIT_STATE_ATTACK1_WEAPON_TYPE 0x58

    // attack 2 attributes (sorted in a sequencial order based on memory address)
    ///<summary>攻击2 伤害骰子数量</summary>
    #define UNIT_STATE_ATTACK2_DAMAGE_DICE 0x30

    ///<summary>攻击2 伤害骰子面数</summary>
    #define UNIT_STATE_ATTACK2_DAMAGE_SIDE 0x31

    ///<summary>攻击2 基础伤害</summary>
    #define UNIT_STATE_ATTACK2_DAMAGE_BASE 0x32

    ///<summary>攻击2 升级奖励</summary>
    #define UNIT_STATE_ATTACK2_DAMAGE_BONUS 0x33

    ///<summary>攻击2 伤害衰减参数</summary>
    #define UNIT_STATE_ATTACK2_DAMAGE_LOSS_FACTOR 0x34

    ///<summary>攻击2 武器声音</summary>
    #define UNIT_STATE_ATTACK2_WEAPON_SOUND 0x35

    ///<summary>攻击2 攻击类型</summary>
    #define UNIT_STATE_ATTACK2_ATTACK_TYPE 0x36

    ///<summary>攻击2 最大目标数</summary>
    #define UNIT_STATE_ATTACK2_MAX_TARGETS 0x37

    ///<summary>攻击2 攻击间隔</summary>
    #define UNIT_STATE_ATTACK2_INTERVAL 0x38

    ///<summary>攻击2 攻击延迟</summary>
    #define UNIT_STATE_ATTACK2_INITIAL_DELAY 0x39

    ///<summary>攻击2 攻击范围</summary>
    #define UNIT_STATE_ATTACK2_RANGE 0x40

    ///<summary>攻击2 攻击缓冲</summary>
    #define UNIT_STATE_ATTACK2_RANGE_BUFFER 0x41

    ///<summary>攻击2 最小伤害</summary>
    #define UNIT_STATE_ATTACK2_DAMAGE_MIN 0x42

    ///<summary>攻击2 最大伤害</summary>
    #define UNIT_STATE_ATTACK2_DAMAGE_MAX 0x43

    ///<summary>攻击2 弹射弧度</summary>
    #define UNIT_STATE_ATTACK2_BACK_SWING 0x44

    ///<summary>攻击2 目标允许类型</summary>
    #define UNIT_STATE_ATTACK2_TARGET_TYPES 0x45

    ///<summary>攻击2 溅出区域</summary>
    #define UNIT_STATE_ATTACK2_SPILL_DIST 0x46

    ///<summary>攻击2 溅出半径</summary>
    #define UNIT_STATE_ATTACK2_SPILL_RADIUS 0x47

    ///<summary>攻击2 武器类型</summary>
    #define UNIT_STATE_ATTACK2_WEAPON_TYPE 0x59

    ///<summary>装甲类型</summary>
    #define UNIT_STATE_ARMOR_TYPE 0x50

    #define UNIT_STATE_RATE_OF_FIRE 0x51 // global attack rate of unit, work on both attacks
    #define UNIT_STATE_ACQUISITION_RANGE 0x52 // how far the unit will automatically look for targets
    #define UNIT_STATE_LIFE_REGEN 0x53
    #define UNIT_STATE_MANA_REGEN 0x54

    #define UNIT_STATE_MIN_RANGE 0x55
    #define UNIT_STATE_AS_TARGET_TYPE 0x60
    #define UNIT_STATE_TYPE 0x61
    
    


