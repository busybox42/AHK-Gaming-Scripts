#SingleInstance force
#NoTrayIcon

IniRead, Toggle_Key, %A_ScriptDir%\Info & Files\settings.ini, all, TK, tab
IniRead, Target_Lock, %A_ScriptDir%\Info & Files\settings.ini, all, TL, x
IniRead, Settings_Key, %A_ScriptDir%\Info & Files\settings.ini, all, SEK, insert
IniRead, Left_Click, %A_ScriptDir%\Info & Files\settings.ini, all, LC, 9
IniRead, Right_Click, %A_ScriptDir%\Info & Files\settings.ini, all, RC, 0
IniRead, Mouse_Wheel_Up, %A_ScriptDir%\Info & Files\settings.ini, all, MWU, f1
IniRead, Mouse_Wheel_Down, %A_ScriptDir%\Info & Files\settings.ini, all, MWD, f2
IniRead, Shift_Left_Click, %A_ScriptDir%\Info & Files\settings.ini, all, SLC, -
IniRead, Shift_Right_Click, %A_ScriptDir%\Info & Files\settings.ini, all, SRC, =
IniRead, Control_Left_Click, %A_ScriptDir%\Info & Files\settings.ini, all, CLC, [
IniRead, Control_Right_Click, %A_ScriptDir%\Info & Files\settings.ini, all, CRC, ]
IniRead, Alt_Left_Click, %A_ScriptDir%\Info & Files\settings.ini, all, ALC, f9
IniRead, Alt_Right_Click, %A_ScriptDir%\Info & Files\settings.ini, all, ARC, f10
IniRead, Shift_Mouse_Wheel_Up, %A_ScriptDir%\Info & Files\settings.ini, all, SMWU, f3
IniRead, Shift_Mouse_Wheel_Down, %A_ScriptDir%\Info & Files\settings.ini, all, SMWD, f4
IniRead, Control_Mouse_Wheel_Up, %A_ScriptDir%\Info & Files\settings.ini, all, CMWU, f5
IniRead, Control_Mouse_Wheel_Down, %A_ScriptDir%\Info & Files\settings.ini, all, CMWD, f6
IniRead, Alt_Mouse_Wheel_Up, %A_ScriptDir%\Info & Files\settings.ini, all, AMWU, f7
IniRead, Alt_Mouse_Wheel_Down, %A_ScriptDir%\Info & Files\settings.ini, all, AMWD, f8
IniRead, Inventory_Key, %A_ScriptDir%\Info & Files\settings.ini, all, IK, i
IniRead, Map_Key, %A_ScriptDir%\Info & Files\settings.ini, all, MK, m
IniRead, Hero_Key, %A_ScriptDir%\Info & Files\settings.ini, all, HK, h
IniRead, Guild_Key, %A_ScriptDir%\Info & Files\settings.ini, all, GK, g
IniRead, Trade_Key, %A_ScriptDir%\Info & Files\settings.ini, all, TRK, o
IniRead, Wvw_Key, %A_ScriptDir%\Info & Files\settings.ini, all, WK, b
IniRead, Social_Key, %A_ScriptDir%\Info & Files\settings.ini, all, SK, y
IniRead, Escape_Key, %A_ScriptDir%\Info & Files\settings.ini, all, EK, Esc
IniRead, Command_Key, %A_ScriptDir%\Info & Files\settings.ini, all, CK, /
IniRead, Reply_Key, %A_ScriptDir%\Info & Files\settings.ini, all, RK, BS
IniRead, Chat_Key, %A_ScriptDir%\Info & Files\settings.ini, all, CHK, Enter
IniRead, Invite_Key, %A_ScriptDir%\Info & Files\settings.ini, all, INK, p
IniRead, CH_Size, %A_ScriptDir%\Info & Files\settings.ini, all, CHSI, Medium
IniRead, CH_Style, %A_ScriptDir%\Info & Files\settings.ini, all, CHST, Cross
IniRead, CH_Colour, %A_ScriptDir%\Info & Files\settings.ini, all, CHC, Green
IniRead, CH_Height, %A_ScriptDir%\Info & Files\settings.ini, all, CHH, 0.4

c1x = 110
c2x = 350
c3x = 600
r1y = 95
r2y = 372
ch1y = 377
s1x = 564
s1y = 14
e1x = 653
e1y = 14
b1x = 240
b1y = 52

Gui 1:+owner
Gui +AlwaysOnTop
Gui, -Caption
Gui, Margin, x0, y0
Gui, Add, Picture,, %A_ScriptDir%\Info & Files\set-back.png
Gui, Add, Edit, w100 x%c1x% y%r1y% vTKS, %Toggle_Key%
Gui, Add, Edit, w100 y+6 vTLS, %Target_Lock%
Gui, Add, Edit, w100 y+6 vSEKS, %Settings_Key%
Gui, Add, Edit, w100 y+15 vLCS, %Left_Click%
Gui, Add, Edit, w100 y+6 vRCS, %Right_Click%
Gui, Add, Edit, w100 y+15 vMWUS, %Mouse_Wheel_Up%
Gui, Add, Edit, w100 y+6 vMWDS, %Mouse_Wheel_Down%
Gui, Add, Edit, w100 x%c2x% y%r1y% vSCLS, %Shift_Left_Click%
Gui, Add, Edit, w100 y+6 vSRCS, %Shift_Right_Click%
Gui, Add, Edit, w100 y+15 vCLCS, %Control_Left_Click%
Gui, Add, Edit, w100 y+6 vCRCS, %Control_Right_Click%
Gui, Add, Edit, w100 y+15 vALCS, %Alt_Left_Click%
Gui, Add, Edit, w100 y+6 vARCS, %Alt_Right_Click%
Gui, Add, Edit, w100 x%c3x% y%r1y% vSMWUS, %Shift_Mouse_Wheel_Up%
Gui, Add, Edit, w100 y+6 vSMWDS, %Shift_Mouse_Wheel_Down%
Gui, Add, Edit, w100 y+15 vCMWUS, %Control_Mouse_Wheel_Up%
Gui, Add, Edit, w100 y+6 vCMWDS, %Control_Mouse_Wheel_Down%
Gui, Add, Edit, w100 y+15 vAMWUS, %Alt_Mouse_Wheel_Up%
Gui, Add, Edit, w100 y+6 vAMWDS, %Alt_Mouse_Wheel_Down%
Gui, Add, Edit, w100 x%c1x% y%r2y% vIKS, %Inventory_Key%
Gui, Add, Edit, w100 y+6 vMKS, %Map_Key%
Gui, Add, Edit, w100 y+6 vHKS, %Hero_Key%
Gui, Add, Edit, w100 y+6 vGKS, %Guild_Key%
Gui, Add, Edit, w100 y+6 vTRKS, %Trade_Key%
Gui, Add, Edit, w100 y+6 vWKS, %Wvw_Key%
Gui, Add, Edit, w100 x%c2x% y%r2y% vSKS, %Social_Key%
Gui, Add, Edit, w100 y+6 vEKS, %Escape_Key%
Gui, Add, Edit, w100 y+6 vCKS, %Command_Key%
Gui, Add, Edit, w100 y+6 vRKS, %Reply_Key%
Gui, Add, Edit, w100 y+6 vCHKS, %Chat_Key%
Gui, Add, Edit, w100 y+6 vINKS, %Invite_Key%
Gui, Add, DropDownList, x%c3x% y%ch1y% vCHSIS, Large||Medium||Small||%CH_Size%||
Gui, Add, DropDownList, y+10 vCHSTS, Circle||Cross||X|Tri||%CH_Style%||
Gui, Add, DropDownList, y+10 vCHCS, Red|Blue|Yellow|Orange|Green|Purple|Black||%CH_Colour%||
Gui, Add, DropDownList, y+10 vCHHS, 0.30|0.35|0.40|0.45|0.50|0.55|0.60||%CH_Height%||
Gui, Add, Button, x%s1x% y%s1y% default, Save
Gui, Add, Button, x%e1x% y%e1y% default, Exit
Gui, Add, Button, x%b1x% y%b1y% default, Click Here
Gui, Show,, Combat Mode Settings
return

ButtonClickHere:
Run, http://www.autohotkey.com/docs/KeyList.htm
Run, http://www.autohotkey.com/docs/Hotkeys.htm
Return

ButtonSave:
Gui, Submit, nohide
IniWrite, %TKS%, %A_ScriptDir%\Info & Files\settings.ini, all, TK
IniWrite, %TLS%, %A_ScriptDir%\Info & Files\settings.ini, all, TL
IniWrite, %SEKS%, %A_ScriptDir%\Info & Files\settings.ini, all, SEK
IniWrite, %LCS%, %A_ScriptDir%\Info & Files\settings.ini, all, LC
IniWrite, %RCS%, %A_ScriptDir%\Info & Files\settings.ini, all, RC
IniWrite, %MWUS%, %A_ScriptDir%\Info & Files\settings.ini, all, MWU
IniWrite, %MWDS%, %A_ScriptDir%\Info & Files\settings.ini, all, MWD
IniWrite, %SCLS%, %A_ScriptDir%\Info & Files\settings.ini, all, SLC
IniWrite, %SRCS%, %A_ScriptDir%\Info & Files\settings.ini, all, SRC
IniWrite, %CLCS%, %A_ScriptDir%\Info & Files\settings.ini, all, CLC
IniWrite, %CRCS%, %A_ScriptDir%\Info & Files\settings.ini, all, CRC
IniWrite, %ALCS%, %A_ScriptDir%\Info & Files\settings.ini, all, ALC
IniWrite, %ARCS%, %A_ScriptDir%\Info & Files\settings.ini, all, ARC
IniWrite, %SMWUS%, %A_ScriptDir%\Info & Files\settings.ini, all, SMWU
IniWrite, %SMWDS%, %A_ScriptDir%\Info & Files\settings.ini, all, SMWD
IniWrite, %CMWUS%, %A_ScriptDir%\Info & Files\settings.ini, all, CMWU
IniWrite, %CMWDS%, %A_ScriptDir%\Info & Files\settings.ini, all, CMWD
IniWrite, %AMWUS%, %A_ScriptDir%\Info & Files\settings.ini, all, AMWU
IniWrite, %AMWDS%, %A_ScriptDir%\Info & Files\settings.ini, all, AMWD
IniWrite, %IKS%, %A_ScriptDir%\Info & Files\settings.ini, all, IK
IniWrite, %MKS%, %A_ScriptDir%\Info & Files\settings.ini, all, MK
IniWrite, %HKS%, %A_ScriptDir%\Info & Files\settings.ini, all, HK
IniWrite, %GKS%, %A_ScriptDir%\Info & Files\settings.ini, all, GK
IniWrite, %TRKS%, %A_ScriptDir%\Info & Files\settings.ini, all, TRK
IniWrite, %WKS%, %A_ScriptDir%\Info & Files\settings.ini, all, WK
IniWrite, %SKS%, %A_ScriptDir%\Info & Files\settings.ini, all, SK
IniWrite, %EKS%, %A_ScriptDir%\Info & Files\settings.ini, all, EK
IniWrite, %CKS%, %A_ScriptDir%\Info & Files\settings.ini, all, CK
IniWrite, %RKS%, %A_ScriptDir%\Info & Files\settings.ini, all, RK
IniWrite, %CHKS%, %A_ScriptDir%\Info & Files\settings.ini, all, CHK
IniWrite, %INKS%, %A_ScriptDir%\Info & Files\settings.ini, all, INK
IniWrite, %CHSIS%, %A_ScriptDir%\Info & Files\settings.ini, all, CHSI
IniWrite, %CHSTS%, %A_ScriptDir%\Info & Files\settings.ini, all, CHST
IniWrite, %CHCS%, %A_ScriptDir%\Info & Files\settings.ini, all, CHC
IniWrite, %CHHS%, %A_ScriptDir%\Info & Files\settings.ini, all, CHH
Run, GW2CM.ahk
Return

ButtonExit:
ExitApp