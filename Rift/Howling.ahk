SetWorkingDir %A_ScriptDir%
IniFile:=A_ScriptDir "\include\rift.ini"
#Include %A_ScriptDir%\include\skill_true.ahk
#Include %A_ScriptDir%\include\skill_false.ahk
#Include %A_ScriptDir%\include\buff_check.ahk
#Include %A_ScriptDir%\include\howl_check.ahk

;-----------------------------------
; Save Last Spec Played
;-----------------------------------
if FileExist(A_ScriptDir "\spec.tmp")
	FileDelete, %A_ScriptDir%\spec.tmp
	FileAppend, Howler, %A_ScriptDir%\spec.tmp

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
; Howling Vars
IniRead, PredatoryX, %IniFile%, Howling, PredatoryX
IniRead, PredatoryY, %IniFile%, Howling, PredatoryY
IniRead, PredatoryColor, %IniFile%, Howling, PredatoryColor
IniRead, PredatoryKey, %IniFile%, Howling, PredatoryKey
IniRead, CombatX, %IniFile%, Howling, CombatX
IniRead, CombatY, %IniFile%, Howling, CombatY
IniRead, CombatColor, %IniFile%, Howling, CombatColor
IniRead, CombatKey, %IniFile%, Howling, CombatKey
IniRead, VirulentX, %IniFile%, Howling, VirulentX
IniRead, VirulentY, %IniFile%, Howling, VirulentY
IniRead, VirulentColor, %IniFile%, Howling, VirulentColor
IniRead, VirulentKey, %IniFile%, Howling, VirulentKey
IniRead, FinisherKey, %IniFile%, Howling, FinisherKey
IniRead, QuickKey, %IniFile%, Howling, QuickKey
IniRead, KeenKey, %IniFile%, Howling, KeenKey
IniRead, HeadKey, %IniFile%, Howling, HeadKey
IniRead, PrecisionKey, %IniFile%, Howling, PrecisionKey
IniRead, DualismKey, %IniFile%, Howling, DualismKey

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
		buff_check(PredatoryX, PredatoryY, PredatoryColor, PredatoryKey, PredatorySleep)
		Sleep 1000
		buff_check(CombatX, CombatY, CombatColor, CombatKey, CombatSleep)
		Sleep 1000
		buff_check(VirulentX, VirulentY, VirulentColor, VirulentKey, VirulentSleep)	
		Sleep 1000
	}
	Return

;-----------------------------------
; Combat Loops
;-----------------------------------	

	$NumPad1::
	howl_check(FinishX, FinishY, FinishColor, FinisherKey, DualismKey)
	skill_true_check(FinishX, FinishY, FinishColor, HeadKey)
	skill_false_check(FinishX, FinishY, FinishColor, QuickKey)
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
			#Include %A_ScriptDir%\include\buff_check.ahk
			#Include %A_ScriptDir%\include\howl_check.ahk
			howl_check(FinishX, FinishY, FinishColor, FinisherKey, DualismKey)
			skill_true_check(FinishX, FinishY, FinishColor, HeadKey)
			skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			skill_false_check(FinishX, FinishY, FinishColor, QuickKey)
			skill_false_check(FinishX, FinishY, FinishColor, PrecisionKey)
			skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			;Sleep 100
		}
	}
	Return	
	
}	