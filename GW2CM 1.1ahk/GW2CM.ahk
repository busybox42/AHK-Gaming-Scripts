#SingleInstance force

Menu, Tray, Icon, Info & Files/GW2CM icon.ico
Menu, Tray, NoStandard
Menu, Tray, Add, Check for updates, _check
Menu, Tray, Add, Settings, _settings
Menu, Tray, Add, Exit, _exit
onexit _exit

IniRead, Toggle_Key, %A_ScriptDir%\Info & Files\settings.ini, all, TK
IniRead, Target_Lock, %A_ScriptDir%\Info & Files\settings.ini, all, TL, x
IniRead, Settings_Key, %A_ScriptDir%\Info & Files\settings.ini, all, SEK, Insert
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

x_state := 0

Y_CsrPos := A_ScreenHeight*CH_Height

Center_X := Round(A_ScreenWidth/2-(x_Width/2))
Center_Y := Round(Y_CsrPos-(x_Height/2))

CH := (Y_CsrPos-50)

#MaxHotkeysPerInterval 1000

Hotkey, IfWinActive, Guild Wars 2
Hotkey,%Toggle_key%,toggle_button, UseErrorLevel 2
Hotkey,%Target_Lock%,target_button, UseErrorLevel 2
Hotkey,%Settings_Key%,settings, UseErrorLevel 2
Hotkey,%Inventory_Key%,inventory, UseErrorLevel 2
Hotkey,%Map_Key%,map, UseErrorLevel 2
Hotkey,%Hero_Key%,hero, UseErrorLevel 2
Hotkey,%Guild_Key%,guild, UseErrorLevel 2
Hotkey,%Trade_Key%,trade, UseErrorLevel 2
Hotkey,%Wvw_Key%,wvw, UseErrorLevel 2
Hotkey,%Social_Key%,social, UseErrorLevel 2
Hotkey,%Escape_Key%,escape, UseErrorLevel 2
Hotkey,%Command_Key%,command, UseErrorLevel 2
Hotkey,%Reply_Key%,reply, UseErrorLevel 2
Hotkey,%Chat_Key%,chat, UseErrorLevel 2
Hotkey,%Invite_Key%,invite, UseErrorLevel 2
Return

#IfWinActive Guild Wars 2

toggle_button:
if (x_state == 0)
{
   x_state := 1
   BlockInput, MouseMove
   DllCall("SetCursorPos", int, (A_ScreenWidth/2-4) , int, (Y_CsrPos))
   Send {RButton down}
   MouseMove 4, 0, 0, R
   BlockInput, MouseMoveOff
   ;SplashImage, Info & Files/Crosshairs/%CH_Size%%CH_Style%%CH_Colour%.bmp,y%CH% b,,,Crs
   SplashImage, Info & Files/Crosshairs/SmallCircleBlue.bmp,y%CH% b,,,Crs
   WinSet, TransColor, White, Crs
   SplashImage, Show,,,Crs
   Sleep, 300
Return
}
   SplashImage, Off
   x_state := 0
   Send, {RButton UP}
return

target_button:
if (x_state == 1)
{
  Send, {%Target_Lock% Up}
  Sleep, 20
  Send, {%Target_Lock% Down}
  Sleep, 100
Return
}
  Send, {%Target_Lock%}
Return

settings:
  SplashImage, Off
  x_state := 0
  Send, {RButton Up}
  Run, igs.ahk
Return

$LButton::
If (x_state == 1)
{
    Send, {%Left_Click%}
Return
}
  Click down left
  KeyWait, LButton
  Click up left
Return

$RButton::
If (x_state == 1)
{
    Send, {%Right_Click%}
Return
}
  Click down right
  KeyWait, RButton
  Click up right
Return

inventory:
if (x_state == 1)
{
  SplashImage, Off
  x_state := 0
  Send, {RButton Up}
  Send, {%Inventory_Key%}
Return
}
  Send, {%Inventory_Key%}
Return

map:
if (x_state == 1)
{
  SplashImage, Off
  x_state := 0
  Send, {RButton Up}
  Send, {%Map_Key%}
Return
}
  Send, {%Map_Key%}
Return

hero:
if (x_state == 1)
{
  SplashImage, Off
  x_state := 0
  Send, {RButton Up}
  Send, {%Hero_Key%}
Return
}
  Send, {%Hero_Key%}
Return

guild:
if (x_state == 1)
{
  SplashImage, Off
  x_state := 0
  Send, {RButton Up}
  Send, {%Guild_Key%}
Return
}
  Send, {%Guild_Key%}
Return

trade:
if (x_state == 1)
{
  SplashImage, Off
  x_state := 0
  Send, {RButton Up}
  Send, {%Trade_Key%}
Return
}
  Send, {%Trade_Key%}
Return

wvw:
if (x_state == 1)
{
  SplashImage, Off
  x_state := 0
  Send, {RButton Up}
  Send, {%Wvw_Key%}
Return
}
  Send, {%Wvw_Key%}
Return

social:
if (x_state == 1)
{
  SplashImage, Off
  x_state := 0
  Send, {RButton Up}
  Send, {%Social_Key%}
Return
}
  Send, {%Social_Key%}
Return

escape:
if (x_state == 1)
{
  SplashImage, Off
  x_state := 0
  Send, {RButton Up}
  Send, {%Escape_Key%}
Return
}
  Send, {%Escape_Key%}
Return

command:
if (x_state == 1)
{
  SplashImage, Off
  x_state := 0
  Send, {RButton Up}
  Send, {%Command_Key%}
Return
}
  Send, {%Command_Key%}
Return

reply:
if (x_state == 1)
{
  SplashImage, Off
  x_state := 0
  Send, {RButton Up}
  Send, {%Reply_Key%}
Return
}
  Send, {%Reply_Key%}
Return

chat:
if (x_state == 1)
{
  SplashImage, Off
  x_state := 0
  Send, {RButton Up}
  Send, {%Chat_Key%}
Return
}
  Send, {%Chat_Key%}
Return

invite:
if (x_state == 1)
{
  SplashImage, Off
  x_state := 0
  Send, {RButton Up}
  Send, {%Invite_Key%}
Return
}
  Send, {%Invite_Key%}
Return

$+LButton::
If (x_state == 1)
{
  Send, {%Shift_Left_Click%}
Return  
}
  Send, {Shift down}
  Click down
  KeyWait, LButton
  Click up
  Send, {Shift up}
Return

$+RButton::
If (x_state == 1)
{
  Send, {%Shift_Right_Click%}
Return
}
  Send, {Shift down}
  Click down right
  KeyWait, RButton
  Click up right
  Send, {Shift up}
Return

$^LButton::
If (x_state == 1)
{
  Send, {%Ctrl_Left_Click%}  
Return
}
  Send, {Control down}
  Click down
  KeyWait, LButton
  Click up
  Send, {Control up}
Return

$^RButton::
If (x_state == 1)
{
  Send, {%Ctrl_Right_Click%}  
Return
}
  Send, {Control down}
  Click down right
  KeyWait, RButton
  Click up right
  Send, {Control up}
Return

$!LButton::
If (x_state == 1)
{
  Send, {%Alt_Left_Click%}   
Return
}
  Send, {Alt down}
  Click down
  KeyWait, LButton
  Click up
  Send, {Alt up}
Return

$!RButton::
If (x_state == 1)
{
  Send, {%Alt_Right_Click%}
Return
}
  Send, {Alt down}
  Click down right
  KeyWait, RButton
  Click up right
  Send, {Alt up}
Return

$WheelUp::
If (x_state == 1)
{
  Send, {%Mouse_Wheel_Up%}
Return
}
  Send, {WheelUp}
Return

$WheelDown::
If (x_state == 1)
{
  Send, {%Mouse_Wheel_Down%}
Return
}
  Send, {WheelDown}
Return

$+WheelUp::
If (x_state == 1)
{
  Send, {%Shift_Mouse_Wheel_Up%}
Return
}
  Send, {+WheelUp}
Return

$+WheelDown::
If (x_state == 1)
{
  Send, {%Shift_Mouse_Wheel_Down%}
Return
}
  Send, {+WheelDown}
Return

$^WheelUp::
If (x_state == 1)
{
  Send, {%Ctrl_Mouse_Wheel_Up%}
Return
}
  Send, {^WheelUp}
Return

$^WheelDown::
If (x_state == 1)
{
  Send, {%Ctrl_Mouse_Wheel_Down%}
Return
}
  Send, {^WheelDown}
Return

$!WheelUp::
If (x_state == 1)
{
  Send, {%Alt_Mouse_Wheel_Up%}
Return
}
  Send, {!WheelUp}
Return

$!WheelDown::
If (x_state == 1)
{
  Send, {%Alt_Mouse_Wheel_Down%}
Return
}
  Send, {!WheelDown}
Return

~!TAB::
~^!DEL::
If (x_state == 1)
  SplashImage, Off
  x_state := 0
  Send, {RButton Up}
Return

~LWin::
  SplashImage, Off
  x_state := 0
  Send, {RButton Up}
  Send, {LWin}
Return

~RWin::
If (x_state == 1)
  SplashImage, Off
  x_state := 0
  Send, {RButton Up}
  Send, {RWin}
Return

#IfWinActive

_check:
Run, http://www.pvp-project.com/combatmode
Return

_settings:
Run, igs.ahk
Return

_exit:
Process, Close, igs.ahk
ExitApp
Return