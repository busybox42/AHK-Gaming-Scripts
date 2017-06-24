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
	FileAppend, RiftBlade, %A_ScriptDir%\warrior.tmp

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
; RiftBlade Vars
IniRead, RecoveryPosX, %IniFile%, RiftBlade, RecoveryPosX
IniRead, RecoveryPosY, %IniFile%, RiftBlade, RecoveryPosY
IniRead, RecoveryPosColor, %IniFile%, RiftBlade, RecoveryPosColor
IniRead, RecoveryPosKey, %IniFile%, RiftBlade, RecoveryPosKey
IniRead, RecoveryPosSleep, %IniFile%, RiftBlade, RecoveryPosSleep
IniRead, AoWX, %IniFile%, RiftBlade, AoWX
IniRead, AoWY, %IniFile%, RiftBlade, AoWY
IniRead, AoWColor, %IniFile%, RiftBlade, AoWColor
IniRead, AoWKey, %IniFile%, RiftBlade, AoWKey
IniRead, AoWSleep, %IniFile%, RiftBlade, AoWSleep
IniRead, EnCondX, %IniFile%, RiftBlade, EnCondX
IniRead, EnCondY, %IniFile%, RiftBlade, EnCondY
IniRead, EnCondColor, %IniFile%, RiftBlade, EnCondColor
IniRead, EnCondKey, %IniFile%, RiftBlade, EnCondKey
IniRead, EnCondSleep, %IniFile%, RiftBlade, EnCondSleep
IniRead, StormBladeX, %IniFile%, RiftBlade, StormBladeX
IniRead, StormBladeY, %IniFile%, RiftBlade, StormBladeY
IniRead, StormBladeColor, %IniFile%, RiftBlade, StormBladeColor
IniRead, StormBladeKey, %IniFile%, RiftBlade, StormBladeKey
IniRead, StormBladeleep, %IniFile%, RiftBlade, StormBladeSleep
IniRead, FinisherKey, %IniFile%, RiftBlade, FinisherKey
IniRead, BuildKey, %IniFile%, RiftBlade, BuildKey
IniRead, FlamespearX, %IniFile%, RiftBlade, FlamespearX
IniRead, FlamespearY, %IniFile%, RiftBlade, FlamespearY
IniRead, FlamespearColor, %IniFile%, RiftBlade, FlamespearColor
IniRead, FlamespearKey, %IniFile%, RiftBlade, Flamespearkey

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
		buff_check(AoWX, AoWY, AoWColor, AoWKey, AoWSleep)
		buff_check(EnCondX, EnCondY, EnCondColor, EnCondKey, EnCondSleep)
		buff_check(StormBladeX, StormBladeY, StormBladeColor, StormBladeKey, StormBladeSleep)
		buff_check(RecoveryPosX, RecoveryPosY, RecoveryPosColor, RecoveryPosKey, RecoveryPosSleep)		
		Sleep 1000
	}
	Return
	;-----------------------------------
; Combat Loops
;-----------------------------------	

	$NumPad2::
	skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
	;1skill_false_check(FinishX, FinishY, FinishColor, AOEKey)
	Loop 
	{
		; check to see if we're in combat
		PixelSearch, Px, Py, 953, 634, 1038, 650, AttackColor, 10, fast, RGB
		if ErrorLevel ; nope no red lettering, target is dead
			break
		else
		{
			#Include %A_ScriptDir%\include\skill_true.ahk
			#Include %A_ScriptDir%\include\skill_false.ahk
			#Include %A_ScriptDir%\include\skill_crossfire.ahk
			#Include %A_ScriptDir%\include\buff_check.ahk
			skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			buff_check(AoWX, AoWY, AoWColor, AoWKey, AoWSleep)
			buff_check(EnCondX, EnCondY, EnCondColor, EnCondKey, EnCondSleep)
			buff_check(StormBladeX, StormBladeY, StormBladeColor, StormBladeKey, StormBladeSleep)
			buff_check(RecoveryPosX, RecoveryPosY, RecoveryPosColor, RecoveryPosKey, RecoveryPosSleep)
			skill_true_check(FlamespearX, FlamespearY, FlamespearColor, FlamespearKey)
			skill_false_check(FinishX, FinishY, FinishColor, BuildKey)
			Sleep 100
		}
	}
	Return
}