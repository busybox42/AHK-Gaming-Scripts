SetWorkingDir %A_ScriptDir%
IniFile:=A_ScriptDir "\include\rift.ini"
#Include %A_ScriptDir%\include\skill_true.ahk
#Include %A_ScriptDir%\include\skill_false.ahk
#Include %A_ScriptDir%\include\buff_check.ahk


;-----------------------------------
; Save Last Spec Played
;-----------------------------------
if FileExist(A_ScriptDir "\warrior.tmp")
	FileDelete, %A_ScriptDir%\warrior.tmp
	FileAppend, Warlord, %A_ScriptDir%\warrior.tmp

;-----------------------------------
; Variables
;-----------------------------------
; Common Vars 
IniRead, AttackColor, %IniFile%, Common, AttackColor
IniRead, FinishColor, %IniFile%, Common, FinishColor
IniRead, FinishX, %IniFile%, Common, FinishX
IniRead, FinishY, %IniFile%, Common, FinishY
IniRead, InteruptColor, %IniFile%, Common, InteruptColor
IniRead, InteruptX, %IniFile%, Common, InteruptX
IniRead, InteruptY, %IniFile%, Common, InteruptY
; Warlord Vars
IniRead, WColor, %IniFile%, War, WColor
IniRead, WSleep, %IniFile%, War, WSleep
IniRead, RPX, %IniFile%, War, RPX
IniRead, RPY, %IniFile%, War, RPY
IniRead, RPKey, %IniFile%, War, RPKey
IniRead, AoWX, %IniFile%, War, AoWX
IniRead, AoWY, %IniFile%, War, AoWY
IniRead, AoWKey, %IniFile%, War, AoWKey
IniRead, SBX, %IniFile%, War, SBX
IniRead, SBY, %IniFile%, War, SBY
IniRead, SBKey, %IniFile%, War, SBKey
IniRead, ECX, %IniFile%, War, ECX
IniRead, ECY, %IniFile%, War, ECY
IniRead, ECKey, %IniFile%, War, ECKey
IniRead, FinisherKey, %IniFile%, War, FinisherKey
IniRead, BuildKey, %IniFile%, War, BuildKey
IniRead, InteruptKey, %IniFile%, War, InteruptKey


Pause::Pause
Xbutton2::Reload

;-----------------------------------
; Run if Rift is in the forground
;----------------------------------- 
#ifWinActive RIFT
{

;----------------------------------- 	
; Change Scripts 
;----------------------------------- 
	#Include %A_ScriptDir%\include\war_switch.ahk
	
;-----------------------------------  
; Buff Up
;-----------------------------------
	$=:: 
	Loop 1
	{

		#Include %A_ScriptDir%\include\buff_check.ahk
		buff_check(RPX, RPY, WColor, RPKey, WSleep)
		buff_check(AoWX, AoWY, WColor, AoWKey, WSleep)
		buff_check(SBX, SBY, WColor, SBKey, WSleep)
		buff_check(ECX, ECY, WColor, ECKey, WSleep)
		Sleep 1000
	}
	Return

;-----------------------------------
; Combat Loops
;-----------------------------------
	$NumPad1::
	skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
	skill_false_check(FinishX, FinishY, FinishColor, BuildKey)
	Loop 
	{
		; check to see if we're in combat
		PixelSearch, Px, Py, 1102, 651, 1190, 669, AttackColor, 10, fast, RGB
		if ErrorLevel ; nope no red lettering, target is dead
		{
			SendInput ^5
			break
		}	
		else
		{
			#Include %A_ScriptDir%\include\skill_true.ahk
			#Include %A_ScriptDir%\include\skill_false.ahk
			#Include %A_ScriptDir%\include\buff_check.ahk
			skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			buff_check(RPX, RPY, WColor, RPKey, WSleep)
			buff_check(AoWX, AoWY, WColor, AoWKey, WSleep)
			buff_check(SBX, SBY, WColor, SBKey, WSleep)
			buff_check(ECX, ECY, WColor, ECKey, WSleep)			
			skill_false_check(FinishX, FinishY, FinishColor, BuildKey)
		}
	}
	Return
}	