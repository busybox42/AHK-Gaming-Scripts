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
IniRead, FinisherKey, %IniFile%, Solo, FinisherKey
IniRead, FinisherAOEKey, %IniFile%, Solo, FinisherAOEKey
IniRead, BuilderKey, %IniFile%, Solo, BuilderKey
IniRead, PrecKey, %IniFile%, Solo, PrecKey
IniRead, DauntKey, %IniFile%, Solo, DauntKey
IniRead, InteruptKey, %IniFile%, Solo, InteruptKey
IniRead, AOEKey, %IniFile%, Solo, AOEKey
IniRead, CombatPrepColor, %IniFile%, Solo, CombatPrepColor
IniRead, CombatPrepKey, %IniFile%, Solo, CombatPrepKey
IniRead, CombatPrepX, %IniFile%, Solo, CombatPrepX
IniRead, CombatPrepY, %IniFile%, Solo, CombatPrepY
IniRead, CombatPrepSleep, %IniFile%, Solo, CombatPrepSleep
IniRead, PlaneResColor, %IniFile%, Solo, PlaneResColor
IniRead, PlaneResKey, %IniFile%, Solo, PlaneResKey
IniRead, PlaneResX, %IniFile%, Solo, PlaneResX
IniRead, PlaneResY, %IniFile%, Solo, PlaneResY
IniRead, PlaneResSleep, %IniFile%, Solo, PlaneResSleep
IniRead, PlaneRevColor, %IniFile%, Solo, PlaneRevColor
IniRead, PlaneRevKey, %IniFile%, Solo, PlaneRevKey
IniRead, PlaneRevX, %IniFile%, Solo, PlaneRevX
IniRead, PlaneRevY, %IniFile%, Solo, PlaneRevY
IniRead, PlaneRevSleep, %IniFile%, Solo, PlaneRevSleep
IniRead, CuritiveEngColor, %IniFile%, Solo, CuritiveEngColor
IniRead, CuritiveEngKey, %IniFile%, Solo, CuritiveEngKey
IniRead, CuritiveEngX, %IniFile%, Solo, CuritiveEngX
IniRead, CuritiveEngY, %IniFile%, Solo, CuritiveEngY
IniRead, CuritiveEngSleep, %IniFile%, Solo, CuritiveEngSleep
IniRead, PrecReadyColor, %IniFile%, Solo, PrecReadyColor
IniRead, PrecReadyX, %IniFile%, Solo, PrecReadyX
IniRead, PrecReadyY, %IniFile%, Solo, PrecReadyY
IniRead, PrecBuffColor, %IniFile%, Solo, PrecBuffColor
IniRead, PrecBuffX, %IniFile%, Solo, PrecBuffX
IniRead, PrecBuffY, %IniFile%, Solo, PrecBuffY
IniRead, SideStepColor, %IniFile%, Solo, SideStepColor
IniRead, SideStepX, %IniFile%, Solo, SideStepX
IniRead, SideStepY, %IniFile%, Solo, SideStepY
IniRead, SideStepKey, %IniFile%, Solo, SideStepKey
IniRead, PlaneRefColor, %IniFile%, Solo, PlaneRefColor
IniRead, PlaneRefX, %IniFile%, Solo, PlaneRefX
IniRead, PlaneRefY, %IniFile%, Solo, PlaneRefY
IniRead, PlaneRefKey, %IniFile%, Solo, PlaneRefKey

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
		buff_check(CombatPrepX, CombatPrepY, CombatPrepColor, CombatPrepKey, CombatPrepSleep)
		Sleep 1000
		buff_check(PlaneResX, PlaneResY, PlaneResColor, PlaneResKey, PlaneResSleep)
		Sleep 1000
		buff_check(CuritiveEngX, CuritiveEngY, CuritiveEngColor, CuritiveEngKey, CuritiveEngSleep)	
		Sleep 1000
		buff_check(PlaneRevX, PlaneRevY, PlaneRevColor, PlaneRevKey, PlaneRevSleep)
	}
	Return

;-----------------------------------
; Combat Loops
;-----------------------------------	

	$NumPad1::
	skill_true_check(FinishX, FinishY, FinishColor, FinisherAOEKey)
	skill_false_check(FinishX, FinishY, FinishColor, AOEKey)
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
			skill_true_check(FinishX, FinishY, FinishColor, FinisherAOEKey)
			skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			skill_true_check(PlaneRefX, PlaneRefY, PlaneRefColor, PlaneRefKey)
			skill_true_check(SideStepX, SideStepY, SideStepColor, SideStepKey)
			skill_false_check(FinishX, FinishY, FinishColor, AOEKey)
			buff_check(CombatPrepX, CombatPrepY, CombatPrepColor, CombatPrepKey, CombatPrepSleep)
			buff_check(PlaneResX, PlaneResY, PlaneResColor, PlaneResKey, PlaneResSleep)
			buff_check(CuritiveEngX, CuritiveEngY, CuritiveEngColor, CuritiveEngKey, CuritiveEngSleep)	
			buff_check(PlaneRevX, PlaneRevY, PlaneRevColor, PlaneRevKey, PlaneRevSleep)
			Sleep 100
		}
	}
	Return	
	$NumPad2::
	skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
	skill_false_check(FinishX, FinishY, FinishColor, BuilderKey)
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
			skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			skill_true_check(PlaneRefX, PlaneRefY, PlaneRefColor, PlaneRefKey)
			skill_true_check(SideStepX, SideStepY, SideStepColor, SideStepKey)
			skill_true_check(PrecReadyX, PrecReadyY, PrecReadyColor, DauntKey)
			skill_false_check(FinishX, FinishY, FinishColor, BuilderKey)
			PixelGetColor, color, PrecBuffX, PrecBuffY
	        ifNotEqual, color, PrecBuffColor
			{
				skill_false_check(FinishX, FinishY, FinishColor, PrecKey)
			}
			buff_check(CombatPrepX, CombatPrepY, CombatPrepColor, CombatPrepKey, CombatPrepSleep)
			buff_check(PlaneResX, PlaneResY, PlaneResColor, PlaneResKey, PlaneResSleep)
			buff_check(CuritiveEngX, CuritiveEngY, CuritiveEngColor, CuritiveEngKey, CuritiveEngSleep)	
			buff_check(PlaneRevX, PlaneRevY, PlaneRevColor, PlaneRevKey, PlaneRevSleep)			
			;Sleep 100
		}
	}
	Return		
	
}	