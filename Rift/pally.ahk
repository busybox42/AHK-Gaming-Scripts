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
	FileAppend, Pally, %A_ScriptDir%\warrior.tmp

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
; Pally Vars
IniRead, RecoveryPosX, %IniFile%, Pally, RecoveryPosX
IniRead, RecoveryPosY, %IniFile%, Pally, RecoveryPosY
IniRead, RecoveryPosColor, %IniFile%, Pally, RecoveryPosColor
IniRead, RecoveryPosKey, %IniFile%, Pally, RecoveryPosKey
IniRead, RecoveryPosSleep, %IniFile%, Pally, RecoveryPosSleep
IniRead, SotHX, %IniFile%, Pally, SotHX
IniRead, SotHY, %IniFile%, Pally, SotHY
IniRead, SotHColor, %IniFile%, Pally, SotHColor
IniRead, SotHKey, %IniFile%, Pally, SotHKey
IniRead, SotHSleep, %IniFile%, Pally, SotHSleep
IniRead, VoidX, %IniFile%, Pally, VoidX
IniRead, VoidY, %IniFile%, Pally, VoidY
IniRead, VoidColor, %IniFile%, Pally, VoidColor
IniRead, VoidKey, %IniFile%, Pally, VoidKey
IniRead, VoidSleep, %IniFile%, Pally, VoidSleep
IniRead, FinisherKey, %IniFile%, Pally, FinisherKey
IniRead, AOEKey, %IniFile%, Pally, AOEKey
IniRead, ABlockX, %IniFile%, Pally, ABlockX
IniRead, ABlockY, %IniFile%, Pally, ABlockY
IniRead, ABlockColor, %IniFile%, Pally, ABlockColor
IniRead, ABlockKey, %IniFile%, Pally, ABlockKey
IniRead, InteruptKey, %IniFile%, Pally, InteruptKey
IniRead, HealX, %IniFile%, Pally, HealX
IniRead, HealY, %IniFile%, Pally, HealY
IniRead, HealColor, %IniFile%, Pally, HealColor
IniRead, HealKey, %IniFile%, Pally, Healkey
IniRead, CHealX, %IniFile%, Pally, CHealX
IniRead, CHealY, %IniFile%, Pally, CHealY
IniRead, CHealColor, %IniFile%, Pally, CHealColor
IniRead, CHealKey, %IniFile%, Pally, CHealkey
IniRead, SOrderX, %IniFile%, Pally, SOrderX
IniRead, SOrderY, %IniFile%, Pally, SOrderY
IniRead, SOrderColor, %IniFile%, Pally, SOrderColor
IniRead, SOrderKey, %IniFile%, Pally, SOrderkey

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
		buff_check(RecoveryPosX, RecoveryPosY, RecoveryPosColor, RecoveryPosKey, RecoveryPosSleep)
		buff_check(SotHX, SotHY, SotHColor, SotHKey, SotHSleep)
		buff_check(VoidX, VoidY, VoidColor, VoidKey, VoidSleep)	
		Sleep 1000
	}
	Return
;-----------------------------------
; Combat Loops
;-----------------------------------	

	$NumPad1::
	SendInput, {NumPad1}
	skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
	skill_false_check(FinishX, FinishY, FinishColor, AOEKey)
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
			skill_true_check(CHealX, CHealY, CHealColor, CHealKey)
			skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			skill_true_check(HealX, HealY, HealColor, HealKey)
			buff_check(RecoveryPosX, RecoveryPosY, RecoveryPosColor, RecoveryPosKey, RecoveryPosSleep)
			buff_check(SotHX, SotHY, SotHColor, SotHKey, SotHSleep)
			buff_check(VoidX, VoidY, VoidColor, VoidKey, VoidSleep)
			skill_true_check(ABlockX, ABlockY, ABlockColor, ABlockKey)
			skill_false_check(FinishX, FinishY, FinishColor, AOEKey)
			Sleep 100
		}
	}
	Return
	
	$NumPad2::
	skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
	skill_false_check(FinishX, FinishY, FinishColor, AOEKey)
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
			skill_true_check(CHealX, CHealY, CHealColor, CHealKey)
			skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			skill_true_check(HealX, HealY, HealColor, HealKey)
			buff_check(RecoveryPosX, RecoveryPosY, RecoveryPosColor, RecoveryPosKey, RecoveryPosSleep)
			buff_check(SotHX, SotHY, SotHColor, SotHKey, SotHSleep)
			buff_check(VoidX, VoidY, VoidColor, VoidKey, VoidSleep)
			skill_true_check(ABlockX, ABlockY, ABlockColor, ABlockKey)
			skill_false_check(FinishX, FinishY, FinishColor, AOEKey)
			Sleep 100
		}
	}
	Return
}