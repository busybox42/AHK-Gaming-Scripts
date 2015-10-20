SetWorkingDir %A_ScriptDir%
IniFile:=A_ScriptDir "\include\rift.ini"
#Include %A_ScriptDir%\include\skill_true.ahk
#Include %A_ScriptDir%\include\bomb_true.ahk
#Include %A_ScriptDir%\include\skill_false.ahk
#Include %A_ScriptDir%\include\buff_check.ahk

;-----------------------------------
; Save Last Spec Played
;-----------------------------------
if FileExist(A_ScriptDir "\spec.tmp")
	FileDelete, %A_ScriptDir%\spec.tmp
	FileAppend, Sab, %A_ScriptDir%\spec.tmp

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
; Sab Vars
IniRead, FinisherKey, %IniFile%, Sab, FinisherKey
IniRead, BuildKey, %IniFile%, Sab, BuildKey
IniRead, BombColor, %IniFile%, Sab, BombColor
IniRead, BombX, %IniFile%, Sab, BombX
IniRead, BombY, %IniFile%, Sab, BombY
IniRead, BombKey, %IniFile%, Sab, BombKey
IniRead, TrapKey, %IniFile%, Sab, TrapKey
IniRead, TrapX, %IniFile%, Sab, TrapX
IniRead, TrapY, %IniFile%, Sab, TrapY
IniRead, TrapColor, %IniFile%, Sab, TrapColor
IniRead, TrapSleep, %IniFile%, Sab, TrapSleep


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
	#Include %A_ScriptDir%\include\switch.ahk
	
;-----------------------------------  
; Buff Up
;-----------------------------------
	$=:: 
	Loop 1
	{
		#Include %A_ScriptDir%\include\buff_check.ahk
		buff_check(TrapX, TrapY, TrapColor, TrapKey, TrapSleep)	
		Sleep 1000
	}
	Return	
	
;-----------------------------------
; Combat Loops
;-----------------------------------
	stop = 0
	$NumPad1::
	stop = 1
	SendInput {NumPad1}
	sleep 100
	SendInput {Click}
	Return
	
	$NumPad2::
	stop = 0
	skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
	skill_false_check(FinishX, FinishY, FinishColor, BuildKey)
	Loop 
	{
		; check to see if we're in combat
		PixelSearch, Px, Py, 1100, 647, 1190, 666, AttackColor, 10, fast, RGB
		if ErrorLevel ; nope no red lettering, target is dead
			break
		else
		{
			#Include %A_ScriptDir%\include\skill_true.ahk
			#Include %A_ScriptDir%\include\bomb_true.ahk
			#Include %A_ScriptDir%\include\skill_false.ahk
			#Include %A_ScriptDir%\include\buff_check.ahk
			If stop = 1
				break
			skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			skill_false_check(FinishX, FinishY, FinishColor, BuildKey)
			buff_check(TrapX, TrapY, TrapColor, TrapKey, TrapSleep)
			Sleep 100  
		}
	}
	Return
}