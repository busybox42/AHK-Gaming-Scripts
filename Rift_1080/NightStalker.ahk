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
	FileAppend, ShadowStalker, %A_ScriptDir%\spec.tmp

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
IniRead, NBS, %IniFile%, NB, NBS
IniRead, BuildKey, %IniFile%, NB, BuildKey
IniRead, BuffColor, %IniFile%, NB, BuffColor
IniRead, HBlades, %IniFile%, NB, HBlades
IniRead, HBladesX, %IniFile%, NB, HBladesX
IniRead, HBladesY, %IniFile%, NB, HBladesY
IniRead, FBlades, %IniFile%, NB, FBlades
IniRead, FBladesX, %IniFile%, NB, FBladesX
IniRead, FBladesY, %IniFile%, NB, FBladesY
IniRead, TBD, %IniFile%, NB, TBD
IniRead, TBDX, %IniFile%, NB, TBDX
IniRead, TBDY, %IniFile%, NB, TBDY
IniRead, CEngine, %IniFile%, NB, CEngine
IniRead, CEngineX, %IniFile%, NB, CEngineX
IniRead, CEngineY, %IniFile%, NB, CEngineY
IniRead, PlaneRes, %IniFile%, NB, PlaneRes
IniRead, PlaneResX, %IniFile%, NB, PlaneResX
IniRead, PlaneResY, %IniFile%, NB, PlaneResY
IniRead, PlanarRev, %IniFile%, NB, PlanarRev
IniRead, PlanarRevX, %IniFile%, NB, PlanarRevX
IniRead, PlanarRevY, %IniFile%, NB, PlanarRevY
IniRead, Stalker, %IniFile%, NB, Stalker
IniRead, StalkerX, %IniFile%, NB, StalkerX
IniRead, StalkerY, %IniFile%, NB, StalkerY
IniRead, FinisherKey, %IniFile%, NB, FinisherKey
IniRead, AOEKey, %IniFile%, NB, AOEKey
IniRead, DD, %IniFile%, NB, DD
IniRead, TForce, %IniFile%, NB, TForce
IniRead, PlanarRef, %IniFile%, NB, PlanarRef
IniRead, PlanarRefX, %IniFile%, NB, PlanarRefX
IniRead, PlanarRefY, %IniFile%, NB, PlanarRefY
IniRead, TwilightTran, %IniFile%, NB, TwilightTran
IniRead, TwilightTranX, %IniFile%, NB, TwilightTranX
IniRead, TwilightTranY, %IniFile%, NB, TwilightTranY
IniRead, InteruptKey, %IniFile%, NB, InteruptKey

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
		#Include %A_ScriptDir%\include\skill_false.ahk
		buff_check(HBladesX, HBladesY, BuffColor, HBlades, NBS)
		buff_check(FBladesX, FBladesY, BuffColor, FBlades, NBS)
		buff_check(TBDX, TBDY, BuffColor, TBD, NBS)
		buff_check(CEngineX, CEngineY, BuffColor, CEngine, NBS)
		buff_check(PlaneResX, PlaneResY, BuffColor, PlaneRes, NBS)
		buff_check(PlanarRevX, PlanarRevY, BuffColor, PlanarRev, NBS)
		skill_false_check(StalkerX, StalkerY, BuffColor, Stalker)
		Sleep 1000
	}
	Return	
	
;-----------------------------------
; Combat Loops
;-----------------------------------

	$NumPad1::
	skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
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
			skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			skill_false_check(FinishX, FinishY, FinishColor, AOEKey)
			skill_true_check(PlanarRefX, PlanarRefY, BuffColor, PlanarRef)
			skill_true_check(TwilightTranX, TwilightTranY, BuffColor, TwilightTran)
			buff_check(HBladesX, HBladesY, BuffColor, HBlades, NBS)
			buff_check(FBladesX, FBladesY, BuffColor, FBlades, NBS)
			buff_check(TBDX, TBDY, BuffColor, TBD, NBS)
			buff_check(CEngineX, CEngineY, BuffColor, CEngine, NBS)
			buff_check(PlaneResX, PlaneResY, BuffColor, PlaneRes, NBS)
			buff_check(PlanarRevX, PlanarRevY, BuffColor, PlanarRev, NBS)
			skill_false_check(StalkerX, StalkerY, BuffColor, Stalker)
			Sleep 100  
		}
	}
	Return
	
	$NumPad2::
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
			#Include %A_ScriptDir%\include\skill_false.ahk
			#Include %A_ScriptDir%\include\buff_check.ahk
			skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			PixelGetColor, color1, 419, 1010
			ifNotEqual, color1, 0x0000FF
			{
				skill_false_check(FinishX, FinishY, FinishColor, DD)
			}
			PixelGetColor, color2, 392, 1010
			ifNotEqual, color2, 0x0000FF	
			{
				skill_false_check(FinishX, FinishY, FinishColor, TForce)
			}
			skill_false_check(FinishX, FinishY, FinishColor, BuildKey)
			skill_true_check(PlanarRefX, PlanarRefY, BuffColor, PlanarRef)
			skill_true_check(TwilightTranX, TwilightTranY, BuffColor, TwilightTran)
			buff_check(HBladesX, HBladesY, BuffColor, HBlades, NBS)
			buff_check(FBladesX, FBladesY, BuffColor, FBlades, NBS)
			buff_check(TBDX, TBDY, BuffColor, TBD, NBS)
			buff_check(CEngineX, CEngineY, BuffColor, CEngine, NBS)
			buff_check(PlaneResX, PlaneResY, BuffColor, PlaneRes, NBS)
			buff_check(PlanarRevX, PlanarRevY, BuffColor, PlanarRev, NBS)
			skill_false_check(StalkerX, StalkerY, BuffColor, Stalker)
			Sleep 100  
		}
	}
	Return
}