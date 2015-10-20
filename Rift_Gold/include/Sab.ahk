;-----------------------------------
; Save Last Spec Played
;-----------------------------------
if FileExist("C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp")
	FileDelete, C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp
	FileAppend, MM, C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp

SetWorkingDir %A_ScriptDir%
IniFile:=A_ScriptDir "\include\rift.ini"
#Include %A_ScriptDir%\include\skill_true.ahk
#Include %A_ScriptDir%\include\skill_false.ahk
#Include %A_ScriptDir%\include\buff_check.ahk

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

;-----------------------------------
; Run if Rift is in the forground
;----------------------------------- 
#ifWinActive RIFT
{
	$NumPad3::
	skill_true_check(FinishX, FinishY, FinishColor, FinisherHealKey)
	skill_false_check(FinishX, FinishY, FinishColor, HealBuildKey)
	Loop 
	{
		; check to see if we're in combat
		PixelSearch, Px, Py, 1100, 647, 1190, 666, AttackColor, 10, fast, RGB
		if ErrorLevel ; nope no red lettering, target is dead
			break
		else
		{
			#Include %A_ScriptDir%\include\skill_true.ahk
			#Include %A_ScriptDir%\include\skill_false.ahk
			skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			skill_false_check(FinishX, FinishY, FinishColor, BuildKey)
			Sleep 300  
		}
	}
	Return
}