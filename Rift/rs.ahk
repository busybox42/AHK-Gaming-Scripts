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
	FileAppend, rs, %A_ScriptDir%\spec.tmp

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
IniRead, CommonColor, %IniFile%, Common, CommonColor
; RS Vars
IniRead, PlaneResX, %IniFile%, RS, PlaneResX
IniRead, PlaneResY, %IniFile%, RS, PlaneResY
IniRead, PlaneResKey, %IniFile%, RS, PlaneResKey
IniRead, PlaneResSleep, %IniFile%, RS, PlaneResSleep
IniRead, VigorX, %IniFile%, RS, VigorX
IniRead, VigorY, %IniFile%, RS, VigorY
IniRead, VigorKey, %IniFile%, RS, VigorKey
IniRead, VigorSleep, %IniFile%, RS, VigorSleep
IniRead, GuardPhaseX, %IniFile%, RS, GuardPhaseX
IniRead, GuardPhaseY, %IniFile%, RS, GuardPhaseY
IniRead, GuardPhaseKey, %IniFile%, RS, GuardPhaseKey
IniRead, GuardPhaseSleep, %IniFile%, RS, GuardPhaseSleep
IniRead, GuardedSteelX, %IniFile%, RS, GuardedSteelX
IniRead, GuardedSteelY, %IniFile%, RS, GuardedSteelY
IniRead, GuardedSteelKey, %IniFile%, RS, GuardedSteelKey
IniRead, WotPX, %IniFile%, RS, WotPX
IniRead, WotPY, %IniFile%, RS, WotPY
IniRead, WotPKey, %IniFile%, RS, WotPKey
IniRead, PotPX, %IniFile%, RS, PotPX
IniRead, PotPY, %IniFile%, RS, PotPY
IniRead, PotPKey, %IniFile%, RS, PotPKey
IniRead, RiftDisX, %IniFile%, RS, RiftDisX
IniRead, RiftDisY, %IniFile%, RS, RiftDisY
IniRead, RiftDisKey, %IniFile%, RS, RiftDisKey
IniRead, PlanarVorX, %IniFile%, RS, PlanarVorX
IniRead, PlanarVorY, %IniFile%, RS, PlanarVorY
IniRead, PlanarVorKey, %IniFile%, RS, PlanarVorKey
IniRead, InteruptKey, %IniFile%, RS, InteruptKey
IniRead, BuilderKey, %IniFile%, RS, BuilderKey
IniRead, PWellX, %IniFile%, RS, PWellX
IniRead, PWellY, %IniFile%, RS, PWellY
IniRead, PWellKey, %IniFile%, RS, PWellKey
IniRead, PRefX, %IniFile%, RS, PRefX
IniRead, PRefY, %IniFile%, RS, PRefY
IniRead, PRefKey, %IniFile%, RS, PRefKey
IniRead, PAegisX, %IniFile%, RS, PAegisX
IniRead, PAegisY, %IniFile%, RS, PAegisY 
IniRead, PAegisKey, %IniFile%, RS, PAegisKey
IniRead, StSX, %IniFile%, RS, StSX
IniRead, StSY, %IniFile%, RS, StSY
IniRead, StSKey, %IniFile%, RS, StSKey
IniRead, DeferDeathX, %IniFile%, RS, DeferDeathX
IniRead, DeferDeathY, %IniFile%, RS, DeferDeathY
IniRead, DeferDeathKey, %IniFile%, RS, DeferDeathKey

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
		buff_check(PlaneResX, PlaneResY, CommonColor, PlaneResKey, PlaneResSleep)
		Sleep 500
		buff_check(VigorX, VigorY, CommonColor, VigorKey, VigorSleep)
		Sleep 1000
		buff_check(GuardPhaseX, GuardPhaseY, CommonColor, GuardPhaseKey, GuardPhaseSleep)	
	}
	Return

;-----------------------------------
; Combat Loops
;-----------------------------------	

	$NumPad1::
	skill_false_check(FinishX, FinishY, CommonColor, BuilderKey)
	skill_true_check(GuardedSteelX, GuardedSteelY, CommonColor, GuardedSteelkey)
	Loop 
	{
		; check to see if we're in combat
		PixelSearch, Px, Py, 1102, 651, 1190, 669, AttackColor, 10, fast, RGB
		if ErrorLevel ; nope no red lettering, target is dead
			break
		else
		{
			#Include %A_ScriptDir%\include\skill_true.ahk
			#Include %A_ScriptDir%\include\skill_false.ahk
			#Include %A_ScriptDir%\include\buff_check.ahk
			PixelGetColor, color, 1111, 984
	        ifEqual, color, 0x0000FF
			{
				skill_true_check(GuardedSteelX, GuardedSteelY, CommonColor, GuardedSteelKey)
				Sleep 1000
				skill_true_check(WotPX, WotPY, CommonColor, WotPKey)
				skill_true_check(PotPX, PotPY, CommonColor, PotPKey)
				skill_true_check(FinishX, FinishY, CommonColor, GuardedSteelKey)
			}
			skill_true_check(GuardedSteelX, GuardedSteelY, CommonColor, GuardedSteelKey)
			skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			skill_true_check(PlanarVorX, PlanarVorY, CommonColor, PlanarVorKey)
			skill_false_check(FinishX, FinishY, CommonColor, BuilderKey)
			skill_true_check(RiftDisX, RiftDisY, CommonColor, RiftDisKey)
			skill_true_check(PWellX, PWellY, CommonColor, PWellKey)
			skill_true_check(PRefX, PRefY, CommonColor, PRefKey)
			skill_true_check(PAegisX, PAegisY, CommonColor, PAegisKey)
			skill_true_check(StSX, StSY, CommonColor, StSKey)
			skill_true_check(DeferDeathX, DeferDeathY, CommonColor, DeferDeathKey)
			buff_check(PlaneResX, PlaneResY, CommonColor, PlaneResKey, PlaneResSleep)
			buff_check(VigorX, VigorY, CommonColor, VigorKey, VigorSleep)
			buff_check(GuardPhaseX, GuardPhaseY, CommonColor, GuardPhaseKey, GuardPhaseSleep)
			Sleep 100
		}
	}
	Return		
	
}	