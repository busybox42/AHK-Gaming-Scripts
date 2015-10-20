SetWorkingDir %A_ScriptDir%
IniFile:=A_ScriptDir "\include\rift.ini"
#Include %A_ScriptDir%\include\skill_true.ahk
#Include %A_ScriptDir%\include\skill_false.ahk
#Include %A_ScriptDir%\include\buff_check.ahk

;-----------------------------------
; Save Last Spec Played
;-----------------------------------
if FileExist(A_ScriptDir "\spec.tmp")
	FileDelete, %A_ScriptDir%\spec.tmp
	FileAppend, Solo, %A_ScriptDir%\spec.tmp

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
; Solo Vars
IniRead, CombatPrepColor, %IniFile%, Solo, CombatPrepColor
IniRead, CombatPrepKey, %IniFile%, Solo, CombatPrepKey
IniRead, CombatPrepX, %IniFile%, Solo, CombatPrepX
IniRead, CombatPrepY, %IniFile%, Solo, CombatPrepY
IniRead, CombatPrepSleep, %IniFile%, Solo, CombatPrepSleep
IniRead, PlaneResColor, %IniFile%, Solo, PlaneResColor
IniRead, PlaneResKey, %IniFile%, Solo, PlaneResKey
IniRead, PlaneResX, %IniFile%, Solo, PlaneResY
IniRead, PlaneResY, %IniFile%, Solo, PlaneResY
IniRead, PlaneResSleep, %IniFile%, Solo, PlaneResSleep
IniRead, CuritiveEngColor, %IniFile%, Solo, CuritiveEngColor
IniRead, CuritiveEngKey, %IniFile%, Solo, CuritiveEngKey
IniRead, CuritiveEngX, %IniFile%, Solo, CuritiveEngX
IniRead, CuritiveEngY, %IniFile%, Solo, CuritiveEngY
IniRead, CuritiveEngSleep, %IniFile%, Solo, CuritiveEngSleep

;-----------------------------------
; Run if Rift is in the forground
;----------------------------------- 
#ifWinActive RIFT
{

;----------------------------------- 	
; Change Scripts 
;----------------------------------- 
	$+1::
	Loop 
	{
		If not (GetKeyState("Shift") and GetKeyState("1", "P"))
			break
		SendInput, +1
		Run %A_ScriptDir%\Bard.ahk
		ExitApp
	}
	Return
	
	$+2::
	Loop 
	{
		If not (GetKeyState("Shift") and GetKeyState("2", "P"))
			break
		SendInput, +2
		Run %A_ScriptDir%\MM.ahk
		ExitApp
	}
	Return
	
	$+3::
	Loop 
	{
		If not (GetKeyState("Shift") and GetKeyState("3", "P"))
			break
		SendInput, +3
		Run %A_ScriptDir%\solo.ahk
		ExitApp
	}
	Return
	
	$+4::
	Loop 
	{
		If not (GetKeyState("Shift") and GetKeyState("4", "P"))
			break
		SendInput, +4
		Run %A_ScriptDir%\SoloBard.ahk
		ExitApp
	}
	Return
	
	$+5::
	Loop 
	{
		If not (GetKeyState("Shift") and GetKeyState("5", "P"))
			break
		SendInput, +5
		Run %A_ScriptDir%\Sab.ahk
		ExitApp
	}
	Return

;-----------------------------------  
; Buff Up
;-----------------------------------
	$=:: 
	Loop 1
	{
		#Include %A_ScriptDir%\include\buff_check.ahk
		buff_check(CombatPrepX, CombatPrepY, CombatPrepColor, CombatPrepKey, CombatPrepSleep)
		Sleep 1000
		buff_check(PlaneResX, PlaneResY, PlaneResColor, PlaneResKey, PlaneResSleep)
		Sleep 1000
		buff_check(CuritiveEngX, CuritiveEngY, CuritiveEngColor, CuritiveEngKey, CuritiveEngSleep)	
		Sleep 1000
	}
	Return

	
	
}	