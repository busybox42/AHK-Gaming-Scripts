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
	FileAppend, Reaver, %A_ScriptDir%\warrior.tmp

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
;Reaver Vars
IniRead, RSleep, %IniFile%, Reaver, RSleep
IniRead, RColor, %IniFile%, Reaver, RColor
IniRead, CotAX, %IniFile%, Reaver, CotAX
IniRead, CotAY, %IniFile%, Reaver, CotAY
IniRead, CotAKey, %IniFile%, Reaver, CotAKey
IniRead, BoAX, %IniFile%, Reaver, BoAX
IniRead, BoAY, %IniFile%, Reaver, BoAY
IniRead, BoAKey, %IniFile%, Reaver, BoAKey
IniRead, VoidX, %IniFile%, Reaver, VoidX
IniRead, VoidY, %IniFile%, Reaver, VoidY
IniRead, VoidKey, %IniFile%, Reaver, VoidKey
IniRead, ECX, %IniFile%, Reaver, ECX
IniRead, ECY, %IniFile%, Reaver, ECY
IniRead, ECKey, %IniFile%, Reaver, ECKey
IniRead, BuildKey, %IniFile%, Reaver, BuildKey
IniRead, AOEKey, %IniFile%, Reaver, AOEKey
IniRead, FinisherKey, %IniFile%, Reaver, FinisherKey
IniRead, FeaverX, %IniFile%, Reaver, FeaverX
IniRead, FeaverY, %IniFile%, Reaver, FeaverY
IniRead, FeaverKey, %IniFile%, Reaver, FeaverKey
IniRead, AoRX, %IniFile%, Reaver, AoRX
IniRead, AoRY, %IniFile%, Reaver, AoRY
IniRead, AoRKey, %IniFile%, Reaver, AoRKey
IniRead, InfestX, %IniFile%, Reaver, InfestX
IniRead, InfestY, %IniFile%, Reaver, InfestY
IniRead, InfestKey, %IniFile%, Reaver, InfestKey
IniRead, InteruptKey, %IniFile%, Reaver, InteruptKey
IniRead, SpellBreaker, %IniFile%, Reaver, SpellBreaker
IniRead, SpellBreakerX, %IniFile%, Reaver, SpellBreakerX
IniRead, SpellBreakerY, %IniFile%, Reaver, SpellBreakerY

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
		buff_check(CotAX, CotAY, RColor, CotAKey, RSleep)
		buff_check(BoAX, BoAY, RColor, BoAKey, RSleep)
		buff_check(VoidX, VoidY, RColor, VoidKey, RSleep)
        buff_check(ECX, ECY, RColor, ECKey, RSleep)
		buff_check(AoRX, AoRY, RColor, AoRKey, RSleep)
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
		PixelSearch, Px, Py, 1102, 651, 1190, 669, AttackColor, 10, fast, RGB
		if ErrorLevel ; nope no red lettering, target is dead
		{
			SendInput ^5
			break
		}	
		else
		{
			#Include %A_ScriptDir%\include\skill_true.ahk
			#Include %A_ScriptDir%\include\skill_false.ahk
			#Include %A_ScriptDir%\include\buff_check.ahk
			skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			skill_false_check(SpellBreakerX, SpellBreakerY, InteruptColor, SpellBreaker)
			skill_true_check(FeaverX, FeaverY, RColor, FeaverKey)
			skill_true_check(InfestX, InfestY, RColor, InfestKey)			
			buff_check(CotAX, CotAY, RColor, CotAKey, RSleep)
			buff_check(BoAX, BoAY, RColor, BoAKey, RSleep)
			buff_check(VoidX, VoidY, RColor, VoidKey, RSleep)
			buff_check(ECX, ECY, RColor, ECKey, RSleep)
			buff_check(AoRX, AoRY, RColor, AoRKey, RSleep)
			skill_false_check(FinishX, FinishY, FinishColor, AOEKey)
			Sleep 500
		}
	}
	return


	$NumPad2::
	skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
	skill_false_check(FinishX, FinishY, FinishColor, BuildKey)
	Loop 
	{
		; check to see if we're in combat
		PixelSearch, Px, Py, 1102, 651, 1190, 669, AttackColor, 10, fast, RGB
		if ErrorLevel ; nope no red lettering, target is dead
		{
			SendInput ^5		
			break
		}	
		else
		{
			#Include %A_ScriptDir%\include\skill_true.ahk
			#Include %A_ScriptDir%\include\skill_false.ahk
			#Include %A_ScriptDir%\include\buff_check.ahk
			skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			skill_false_check(SpellBreakerX, SpellBreakerY, InteruptColor, SpellBreaker)
			skill_true_check(FeaverX, FeaverY, RColor, FeaverKey)
			skill_true_check(InfestX, InfestY, RColor, InfestKey)
			buff_check(CotAX, CotAY, RColor, CotAKey, RSleep)
			buff_check(BoAX, BoAY, RColor, BoAKey, RSleep)
			buff_check(VoidX, VoidY, RColor, VoidKey, RSleep)
			buff_check(ECX, ECY, RColor, ECKey, RSleep)
			buff_check(AoRX, AoRY, RColor, AoRKey, RSleep)
			skill_false_check(FinishX, FinishY, FinishColor, BuildKey)
			Sleep 500
		}
	}
	return

}	