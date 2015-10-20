SetWorkingDir %A_ScriptDir%
IniFile:=A_ScriptDir "\include\rift.ini"
#Include %A_ScriptDir%\include\cadence_sleep.ahk
#Include %A_ScriptDir%\include\skill_true.ahk
#Include %A_ScriptDir%\include\skill_false.ahk
#Include %A_ScriptDir%\include\buff_check.ahk
#Include %A_ScriptDir%\include\motif_check.ahk


;-----------------------------------
; Save Last Spec Played
;-----------------------------------
if FileExist(A_ScriptDir "\spec.tmp")
	FileDelete, %A_ScriptDir%\spec.tmp
	FileAppend, Bard, %A_ScriptDir%\spec.tmp

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
;Bard Vars
IniRead, FinisherHealKey, %IniFile%, Bard, FinisherHealKey
IniRead, FinisherKey, %IniFile%, Bard, FinisherKey
IniRead, FinisherAOEKey, %IniFile%, Bard, FinisherAOEKey
IniRead, InteruptKey, %IniFile%, Bard, InteruptKey
IniRead, HealBuildKey, %IniFile%, Bard, HealBuildKey
IniRead, BuildKey, %IniFile%, Bard, BuildKey
IniRead, PlaneX, %IniFile%, Bard, PlaneX
IniRead, PlaneY, %IniFile%, Bard, PlaneY
IniRead, PlaneColor, %IniFile%, Bard, PlaneColor
IniRead, PlaneKey, %IniFile%, Bard, PlaneKey
IniRead, PlaneSleep, %IniFile%, Bard, PlaneSleep
IniRead, FanfareX, %IniFile%, Bard, FanfareX
IniRead, FanfareY, %IniFile%, Bard, FanfareY
IniRead, FanfareColor, %IniFile%, Bard, FanfareColor
IniRead, FanfareKey, %IniFile%, Bard, FanfareKey
IniRead, FanfareSleep, %IniFile%, Bard, FanfareSleep
IniRead, VigorX, %IniFile%, Bard, VigorX
IniRead, VigorY, %IniFile%, Bard, VigorY
IniRead, VigorColor, %IniFile%, Bard, VigorColor
IniRead, VigorKey, %IniFile%, Bard, VigorKey
IniRead, VigorSleep, %IniFile%, Bard, VigorSleep
IniRead, MotifSleep, %IniFile%, Bard, MotifSleep
IniRead, RegenX, %IniFile%, Bard, RegenX
IniRead, RegenY, %IniFile%, Bard, RegenY
IniRead, RegenColor, %IniFile%, Bard, RegenColor
IniRead, RegenKey, %IniFile%, Bard, RegenKey
IniRead, TenacityX, %IniFile%, Bard, TenacityX
IniRead, TenacityY, %IniFile%, Bard, TenacityY
IniRead, TenacityColor, %IniFile%, Bard, TenacityColor
IniRead, TenacityKey, %IniFile%, Bard, TenacityKey
IniRead, BraveryX, %IniFile%, Bard, BraveryX
IniRead, BraveryY, %IniFile%, Bard, BraveryY
IniRead, BraveryColor, %IniFile%, Bard, BraveryColor
IniRead, BraveryKey, %IniFile%, Bard, BraveryKey
IniRead, CadX, %IniFile%, Bard, CadX
IniRead, CadY, %IniFile%, Bard, CadY
IniRead, CadColor, %IniFile%, Bard, CadColor
IniRead, CEngX, %IniFile%, Bard, CEngX
IniRead, CEngY, %IniFile%, Bard, CEngY
IniRead, CEngColor, %IniFile%, Bard, CEngColor
IniRead, FinisherCEngKey, %IniFile%, Bard, FinisherCEngKey
IniRead, FinisherERayKey, %IniFile%, Bard, FinisherERayKey
IniRead, CompetenceX, %IniFile%, Bard, CompetenceX
IniRead, CompetenceY, %IniFile%, Bard, CompetenceY
IniRead, CompetenceColor, %IniFile%, Bard, CompetenceColor
IniRead, CompetenceKey, %IniFile%, Bard, CompetenceKey
IniRead, CompetenceSleep, %IniFile%, Bard, CompetenceSleep
IniRead, CowardiceKey, %IniFile%, Bard, CowardiceKey
IniRead, DistressKey, %IniFile%, Bard, DistressKey

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
; Mount and break Motif Rotation
;-----------------------------------
	$1::
	Loop 
	{
		If not GetKeyState("1", "P")
			break
		SendInput 1
		BreakTrue = 1
		Sleep 1000
		Reload
	}
	Return	
  
;-----------------------------------  
; Buff Up
;-----------------------------------
	$=:: 
	Loop 1
	{
		#Include %A_ScriptDir%\include\buff_check.ahk
		buff_check(PlaneX, PlaneY, PlaneColor, PlaneKey, PlaneSleep)
		buff_check(FanfareX, FanfareY, FanfareColor, FanfareKey, FanfareSleep)
		buff_check(VigorX, VigorY, VigorColor, VigorKey, VigorSleep)	
		buff_check(CompetenceX, CompetenceY, CompetenceColor, CompetenceKey, CompetenceSleep)
		Sleep 1000
	}
	Return

;-----------------------------------  
; Motif Rotation
;-----------------------------------
	#MaxThreadsPerHotkey 3
	$LAlt::
	#MaxThreadsPerHotkey 1
	if BreakTrue 
	{
		BreakTrue := 0
		return
	}
	BreakTrue := 1
	Loop
	{
		#Include %A_ScriptDir%\include\motif_check.ahk
		motif_check(RegenX, RegenY, RegenColor, RegenKey, MotifSleep)
		motif_check(TenacityX, TenacityY, TenacityColor, TenacityKey, MotifSleep)
		PixelGetColor, color1, 421, 1013
		ifNotEqual, color1, 0x0000FF
		{
			motif_check(BraveryX, BraveryY, BraveryColor, BraveryKey, MotifSleep)
		}
		buff_check(CompetenceX, CompetenceY, CompetenceColor, CompetenceKey, CompetenceSleep)
		buff_check(FanfareX, FanfareY, FanfareColor, FanfareKey, FanfareSleep)
		buff_check(VigorX, VigorY, VigorColor, VigorKey, VigorSleep)
		Sleep 100
		if not BreakTrue
			break
	}
	BreakTrue := 1  
	Return	

;-----------------------------------
; Combat Loops
;-----------------------------------	

	$NumPad4::
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
			#Include %A_ScriptDir%\include\cadence_sleep.ahk
			#Include %A_ScriptDir%\include\skill_true.ahk
			#Include %A_ScriptDir%\include\skill_false.ahk
			#Include %A_ScriptDir%\include\buff_check.ahk
			#Include %A_ScriptDir%\include\motif_check.ahk
			;cadence_sleep(CadX, CadY, CadColor)
			PixelGetColor, color1, 475, 1010
			ifEqual, color1, 0x0000FF
			{
				skill_true_check(FinishX, FinishY, FinishColor, FinisherCEngKey)
			}
			else
			{
				skill_true_check(FinishX, FinishY, FinishColor, FinisherHealKey)
			}
			;skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			motif_check(RegenX, RegenY, RegenColor, RegenKey, MotifSleep)
			motif_check(TenacityX, TenacityY, TenacityColor, TenacityKey, MotifSleep)
			PixelGetColor, color1, 421, 1013
			ifNotEqual, color1, 0x0000FF
			{
				motif_check(BraveryX, BraveryY, BraveryColor, BraveryKey, MotifSleep)
			}
			PixelGetColor, color, CadX, CadY
	        ifNotEqual, color, CadColor
			{
				skill_false_check(FinishX, FinishY, FinishColor, HealBuildKey)
			}
			buff_check(PlaneX, PlaneY, PlaneColor, PlaneKey, PlaneSleep)
			;buff_check(CompetenceX, CompetenceY, CompetenceColor, CompetenceKey, CompetenceSleep)
			Sleep 300  
		}
	}
	Return
 	
	$NumPad5::
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
			#Include %A_ScriptDir%\include\cadence_sleep.ahk
			#Include %A_ScriptDir%\include\skill_true.ahk
			#Include %A_ScriptDir%\include\skill_false.ahk
			#Include %A_ScriptDir%\include\buff_check.ahk
			#Include %A_ScriptDir%\include\motif_check.ahk
			;cadence_sleep(CadX, CadY, CadColor)
			PixelGetColor, color1, 391, 1013
			ifEqual, color1, 0x0000FF
			{
				skill_true_check(FinishX, FinishY, FinishColor, FinisherERayKey)
			}
			else
			{
				skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			}
			;skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			motif_check(RegenX, RegenY, RegenColor, RegenKey, MotifSleep)
			motif_check(TenacityX, TenacityY, TenacityColor, TenacityKey, MotifSleep)
			PixelGetColor, color1, 421, 1013
			ifNotEqual, color1, 0x0000FF
			{
				motif_check(BraveryX, BraveryY, BraveryColor, BraveryKey, MotifSleep)
			}
			PixelGetColor, color, CadX, CadY
	        ifNotEqual, color, CadColor
			{
				skill_false_check(FinishX, FinishY, FinishColor, BuildKey)
			}
			buff_check(PlaneX, PlaneY, PlaneColor, PlaneKey, PlaneSleep)
			;buff_check(CompetenceX, CompetenceY, CompetenceColor, CompetenceKey, CompetenceSleep)
			Sleep 300  
		}
	}
	Return 	

	$NumPad7::
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
			#Include %A_ScriptDir%\include\cadence_sleep.ahk
			#Include %A_ScriptDir%\include\skill_true.ahk
			#Include %A_ScriptDir%\include\skill_false.ahk
			#Include %A_ScriptDir%\include\buff_check.ahk
			#Include %A_ScriptDir%\include\motif_check.ahk
			;cadence_sleep(CadX, CadY, CadColor)
			PixelGetColor, color1, 391, 1013
			PixelGetColor, color2, 449, 1013
			PixelGetColor, color3, 476, 1013
			ifEqual, color1, 0x0000FF
			{
				skill_true_check(FinishX, FinishY, FinishColor, FinisherCEngKey)
			}
			else ifNotEqual, color2, 0x0000FF
			{
				skill_true_check(FinishX, FinishY, FinishColor, CowardiceKey)
			}
			else ifNotEqual, color3, 0x0000FF
			{
				skill_true_check(FinishX, FinishY, FinishColor, DistressKey)
			}
			else
			{
				skill_true_check(FinishX, FinishY, FinishColor, FinisherHealKey)
			}
			;skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			motif_check(RegenX, RegenY, RegenColor, RegenKey, MotifSleep)
			motif_check(TenacityX, TenacityY, TenacityColor, TenacityKey, MotifSleep)
			PixelGetColor, color1, 421, 1013
			ifNotEqual, color1, 0x0000FF
			{
				motif_check(BraveryX, BraveryY, BraveryColor, BraveryKey, MotifSleep)
			}
			PixelGetColor, color, CadX, CadY
	        ifNotEqual, color, CadColor
			{
				skill_false_check(FinishX, FinishY, FinishColor, HealBuildKey)
			}
			buff_check(PlaneX, PlaneY, PlaneColor, PlaneKey, PlaneSleep)
			;buff_check(CompetenceX, CompetenceY, CompetenceColor, CompetenceKey, CompetenceSleep)
			Sleep 300  
		}
	}
	Return	
	
} 
