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
	FileAppend, MM, %A_ScriptDir%\spec.tmp

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
; Marksman Vars
IniRead, FinisherKey, %IniFile%, HuntsMan, FinisherKey
IniRead, BuildKey, %IniFile%, HuntsMan, BuildKey
IniRead, InteruptKey, %IniFile%, HuntsMan, InteruptKey
IniRead, AOEKey, %IniFile%, HuntsMan, AOEKey
IniRead, SplinterKey, %IniFile%, HuntsMan, SplinterKey
IniRead, HeadShotKey, %IniFile%, HuntsMan, HeadShotKey
IniRead, HMS, %IniFile%, HuntsMan, HMS
IniRead, BuffColor, %IniFile%, HuntsMan, BuffColor
IniRead, FeralInstincts, %IniFile%, HuntsMan, FeralInstincts
IniRead, FeralInstinctsX, %IniFile%, HuntsMan, FeralInstinctsX
IniRead, FeralInstinctsY, %IniFile%, HuntsMan, FeralInstinctsY
IniRead, Electrified, %IniFile%, HuntsMan, Electrified
IniRead, ElectrifiedX, %IniFile%, HuntsMan, ElectrifiedX
IniRead, ElectrifiedY, %IniFile%, HuntsMan, ElectrifiedY
IniRead, Rending, %IniFile%, HuntsMan, Rending
IniRead, RendingX, %IniFile%, HuntsMan, RendingX
IniRead, RendingY, %IniFile%, HuntsMan, RendingY
IniRead, Reload, %IniFile%, HuntsMan, Reload
IniRead, ReloadX, %IniFile%, HuntsMan, ReloadX
IniRead, ReloadY, %IniFile%, HuntsMan, ReloadY


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
		buff_check(FeralInstinctsX, FeralInstinctsY, BuffColor, FeralInstincts, HMS)
		buff_check(ElectrifiedX, ElectrifiedY, BuffColor, Electrified, HMS)
		buff_check(RendingX, RendingY, BuffColor, Rending, HMS)	
		Sleep 1000
	}
	Return

;-----------------------------------
; Combat Loops
;-----------------------------------	

	$NumPad1::
	skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
	;1skill_false_check(FinishX, FinishY, FinishColor, AOEKey)
	Loop 
	{
		; check to see if we're in combat
		PixelSearch, Px, Py, 950, 631, 1040, 651, AttackColor, 10, fast, RGB
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
			buff_check(FeralInstinctsX, FeralInstinctsY, BuffColor, FeralInstincts, HMS)
			buff_check(ElectrifiedX, ElectrifiedY, BuffColor, Electrified, HMS)
			buff_check(RendingX, RendingY, BuffColor, Rending, HMS)	
			Sleep 100
			skill_false_check(FinishX, FinishY, FinishColor, AOEKey)
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
		PixelSearch, Px, Py, 950, 631, 1040, 651, AttackColor, 10, fast, RGB
		if ErrorLevel ; nope no red lettering, target is dead
			break
		else
		{
			#Include %A_ScriptDir%\include\skill_true.ahk
			#Include %A_ScriptDir%\include\skill_false.ahk
			#Include %A_ScriptDir%\include\buff_check.ahk
			#Include %A_ScriptDir%\include\strafe_sleep.ahk
			; If I do not have
			PixelGetColor, color1, 417, 977
			ifEqual, color1, 0x0000FF	
			{
				skill_true_check(FinishX, FinishY, FinishColor, HeadShotKey)
			}
			else
			{
				skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
				sleep 100
				skill_true_check(ReloadX, ReloadY, BuffColor, Reload)
			}
			skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			PixelGetColor, color2, 390, 977
			ifEqual, color2, 0x0000FF	
			{
				skill_false_check(FinishX, FinishY, FinishColor, SplinterKey)
			}
			else
			{
				skill_false_check(FinishX, FinishY, FinishColor, BuildKey)
			}
			buff_check(FeralInstinctsX, FeralInstinctsY, BuffColor, FeralInstincts, HMS)
			buff_check(ElectrifiedX, ElectrifiedY, BuffColor, Electrified, HMS)
			buff_check(RendingX, RendingY, BuffColor, Rending, HMS)	
			
			Sleep 100
		}
	}
	Return	
	
	
}	