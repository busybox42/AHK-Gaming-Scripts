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
	FileAppend, SoloBard, %A_ScriptDir%\spec.tmp

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
;SBard Vars
IniRead, FinisherHealKey, %IniFile%, SBard, FinisherHealKey
IniRead, FinisherKey, %IniFile%, SBard, FinisherKey
IniRead, FinisherAOEKey, %IniFile%, SBard, FinisherAOEKey
IniRead, InteruptKey, %IniFile%, SBard, InteruptKey
IniRead, HealBuildKey, %IniFile%, SBard, HealBuildKey
IniRead, BuildKey, %IniFile%, SBard, BuildKey
IniRead, HellfireX, %IniFile%, SBard, HellfireX
IniRead, HellfireY, %IniFile%, SBard, HellfireY
IniRead, HellfireColor, %IniFile%, SBard, HellfireColor
IniRead, HellfireKey, %IniFile%, SBard, HellfireKey
IniRead, HellfireSleep, %IniFile%, SBard, HellfireSleep
IniRead, FanfareX, %IniFile%, SBard, FanfareX
IniRead, FanfareY, %IniFile%, SBard, FanfareY
IniRead, FanfareColor, %IniFile%, SBard, FanfareColor
IniRead, FanfareKey, %IniFile%, SBard, FanfareKey
IniRead, FanfareSleep, %IniFile%, SBard, FanfareSleep
IniRead, VigorX, %IniFile%, SBard, VigorX
IniRead, VigorY, %IniFile%, SBard, VigorY
IniRead, VigorColor, %IniFile%, SBard, VigorColor
IniRead, VigorKey, %IniFile%, SBard, VigorKey
IniRead, VigorSleep, %IniFile%, SBard, VigorSleep
IniRead, SmolderX, %IniFile%, SBard, SmolderX
IniRead, SmolderY, %IniFile%, SBard, SmolderY
IniRead, SmolderColor, %IniFile%, SBard, SmolderColor
IniRead, SmolderKey, %IniFile%, SBard, SmolderKey
IniRead, SmolderSleep, %IniFile%, SBard, Smolderleep
IniRead, MotifSleep, %IniFile%, SBard, MotifSleep
IniRead, RegenX, %IniFile%, SBard, RegenX
IniRead, RegenY, %IniFile%, SBard, RegenY
IniRead, RegenColor, %IniFile%, SBard, RegenColor
IniRead, RegenKey, %IniFile%, SBard, RegenKey
IniRead, TenacityX, %IniFile%, SBard, TenacityX
IniRead, TenacityY, %IniFile%, SBard, TenacityY
IniRead, TenacityColor, %IniFile%, SBard, TenacityColor
IniRead, TenacityKey, %IniFile%, SBard, TenacityKey
IniRead, BraveryX, %IniFile%, SBard, BraveryX
IniRead, BraveryY, %IniFile%, SBard, BraveryY
IniRead, BraveryColor, %IniFile%, SBard, BraveryColor
IniRead, BraveryKey, %IniFile%, SBard, BraveryKey
IniRead, CadX, %IniFile%, SBard, CadX
IniRead, CadY, %IniFile%, SBard, CadY
IniRead, CadColor, %IniFile%, SBard, CadColor
IniRead, AgonyX, %IniFile%, SBard, AgonyX
IniRead, AgonyY, %IniFile%, SBard, AgonyY
IniRead, AgonyColor, %IniFile%, SBard, AgonyColor
IniRead, AgonyKey, %IniFile%, SBard, AgonyKey
IniRead, PopVitX, %IniFile%, SBard, PopVitX
IniRead, PopVitY, %IniFile%, SBard, PopVitY
IniRead, PopVitColor, %IniFile%, SBard, PopVitColor
IniRead, PopVitKey, %IniFile%, SBard, PopVitKey

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
		buff_check(HellfireX, HellfireY, HellfireColor, HellfireKey, HellfireSleep)
		buff_check(FanfareX, FanfareY, FanfareColor, FanfareKey, FanfareSleep)
		buff_check(VigorX, VigorY, VigorColor, VigorKey, VigorSleep)
		buff_check(SmolderX, SmolderY, SmolderColor, SmolderKey, SmolderSleep)		
		Sleep 1000
	}
	Return

;-----------------------------------  
; Motif Rotation
;-----------------------------------
	#MaxThreadsPerHotkey 3
	$LControl::
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
		motif_check(BraveryX, BraveryY, BraveryColor, BraveryKey, MotifSleep)
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
			skill_true_check(FinishX, FinishY, FinishColor, FinisherHealKey)
			;skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			skill_true_check(PopVitX, PopVitY, PopVitColor, PopVitKey)
			motif_check(RegenX, RegenY, RegenColor, RegenKey, MotifSleep)
			motif_check(TenacityX, TenacityY, TenacityColor, TenacityKey, MotifSleep)
			motif_check(BraveryX, BraveryY, BraveryColor, BraveryKey, MotifSleep)
			buff_check(HellfireX, HellfireY, HellfireColor, HellfireKey, HellfireSleep)
			buff_check(FanfareX, FanfareY, FanfareColor, FanfareKey, FanfareSleep)
			buff_check(VigorX, VigorY, VigorColor, VigorKey, VigorSleep)
			buff_check(SmolderX, SmolderY, SmolderColor, SmolderKey, SmolderSleep)
			PixelGetColor, color, CadX, CadY
	        ifNotEqual, color, CadColor
			{
				skill_false_check(FinishX, FinishY, FinishColor, HealBuildKey)
				skill_true_check(AgonyX, AgonyY, AgonyColor, AgonyKey)
			}
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
			skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			;skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			skill_true_check(PopVitX, PopVitY, PopVitColor, PopVitKey)
			motif_check(RegenX, RegenY, RegenColor, RegenKey, MotifSleep)
			motif_check(TenacityX, TenacityY, TenacityColor, TenacityKey, MotifSleep)
			motif_check(BraveryX, BraveryY, BraveryColor, BraveryKey, MotifSleep)
			buff_check(HellfireX, HellfireY, HellfireColor, HellfireKey, HellfireSleep)
			buff_check(FanfareX, FanfareY, FanfareColor, FanfareKey, FanfareSleep)
			buff_check(VigorX, VigorY, VigorColor, VigorKey, VigorSleep)
			buff_check(SmolderX, SmolderY, SmolderColor, SmolderKey, SmolderSleep)
			PixelGetColor, color, CadX, CadY
	        ifNotEqual, color, CadColor
			{
				skill_false_check(FinishX, FinishY, FinishColor, HealBuildKey)
				skill_true_check(AgonyX, AgonyY, AgonyColor, AgonyKey)
			}
			Sleep 300  
		}
	}
	Return 	

	$NumPad6::
	skill_true_check(FinishX, FinishY, FinishColor, FinisherAOEKey)	
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
			skill_true_check(FinishX, FinishY, FinishColor, FinisherAOEKey)
			;skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			skill_true_check(PopVitX, PopVitY, PopVitColor, PopVitKey)
			motif_check(RegenX, RegenY, RegenColor, RegenKey, MotifSleep)
			motif_check(TenacityX, TenacityY, TenacityColor, TenacityKey, MotifSleep)
			motif_check(BraveryX, BraveryY, BraveryColor, BraveryKey, MotifSleep)
			buff_check(HellfireX, HellfireY, HellfireColor, HellfireKey, HellfireSleep)
			buff_check(FanfareX, FanfareY, FanfareColor, FanfareKey, FanfareSleep)
			buff_check(VigorX, VigorY, VigorColor, VigorKey, VigorSleep)
			buff_check(SmolderX, SmolderY, SmolderColor, SmolderKey, SmolderSleep)
			PixelGetColor, color, CadX, CadY
	        ifNotEqual, color, CadColor
			{
				skill_false_check(FinishX, FinishY, FinishColor, HealBuildKey)
				skill_true_check(AgonyX, AgonyY, AgonyColor, AgonyKey)
			}
			Sleep 300 
		}
	}
	Return 	
	
} 
