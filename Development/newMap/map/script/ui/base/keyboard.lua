  KEY =  {
        --大键盘数字键
    [0] = 0x30,
    [1] = 0x31,
    [2] = 0x32,
    [3] = 0x33,
    [4] = 0x34,
    [5] = 0x35,
    [6] = 0x36,
    [7] = 0x37,
    [8] = 0x38,
    [9] = 0x39,

    --小键盘 数字键
    NUM_0 = 0x60,
    NUM_1 = 0x61,
    NUM_2 = 0x62,
    NUM_3 = 0x63,
    NUM_4 = 0x64,
    NUM_5 = 0x65,
    NUM_6 = 0x66,
    NUM_7 = 0x67,
    NUM_8 = 0x68,
    NUM_9 = 0x69,

    A = ('A'):byte(),
    B = ('B'):byte(),
    C = ('C'):byte(),
    D = ('D'):byte(),
    E = ('E'):byte(),
    F = ('F'):byte(),
    G = ('G'):byte(),
    H = ('H'):byte(),
    I = ('I'):byte(),
    J = ('J'):byte(),
    K = ('K'):byte(),
    L = ('L'):byte(),
    M = ('M'):byte(),
    N = ('L'):byte(),
    O = ('O'):byte(),
    P = ('P'):byte(),
    Q = ('Q'):byte(),
    R = ('R'):byte(),
    S = ('S'):byte(),
    T = ('T'):byte(),
    U = ('U'):byte(),
    V = ('V'):byte(),
    W = ('W'):byte(),
    X = ('X'):byte(),
    Y = ('Y'):byte(),
    Z = ('Z'):byte(),

    F1    = 0x70,
    F2    = 0x71,
    F3    = 0x72,
    F4    = 0x73,
    F5    = 0x74,
    F6    = 0x75,
    F7    = 0x76,
    F8    = 0x77,
    F9    = 0x78,
    F10   = 0x79,
    F11   = 0x7a,
    F12   = 0x7b,

    TAB   = 0x9,
    ENTER = 0xd, --回车键
    SHLFT = 0x10,
    CTRL  = 0x11,
    ALT   = 0x12,
    ESC   = 0x1b,
    SPACE = 0x20, --空格键

    SLASH = 0xbf, -- 正斜杠 \\ 
    BACKSLASH         = 0xdc, --反斜杠 //

    LEFT    = 0x25,
    TOP     = 0x26,
    RIGHT   = 0x27,
    BOTTOM  = 0x28,
}
KEY_STR = {}
for name,value in pairs(KEY) do
    KEY_STR[value] = name
end
