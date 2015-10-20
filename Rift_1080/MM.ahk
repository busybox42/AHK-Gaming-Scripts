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
IniRead, FinisherKey, %IniFile%, MM, FinisherKey
IniRead, BuildKey, %IniFile%, MM, BuildKey
IniRead, InteruptKey, %IniFile%, MM, InteruptKey
IniRead, AOEKey, %IniFile%, MM, AOEKey
IniRead, DecoyX, %IniFile%, MM, DecoyX
IniRead, DecoyY, %IniFile%, MM, DecoyY
IniRead, DecoyColor, %IniFile%, MM, DecoyColor
IniRead, DecoyKey, %IniFile%, MM, DecoyKey
IniRead, StrafeX, %IniFile%, MM, StrafeX
IniRead, StrafeY, %IniFile%, MM, StrafeY
IniRead, StrafeColor, %IniFile%, MM, StrafeColor
IniRead, StrafeKey, %IniFile%, MM, StrafeKey
IniRead, StrafeSleepX, %IniFile%, MM, StrafeSleepX
IniRead, StrafeSleepY, %IniFile%, MM, StrafeSleepY
IniRead, StrafeSleepColor, %IniFile%, MM, StrafeSleepColor
IniRead, SplinterX, %IniFile%, MM, SplinterX
IniRead, SplinterY, %IniFile%, MM, SplinterY
IniRead, SplinterColor, %IniFile%, MM, SplinterColor
IniRead, SplinterKey, %IniFile%, MM, SplinterKey
IniRead, PredatoryX, %IniFile%, MM, PredatoryX
IniRead, PredatoryY, %IniFile%, MM, PredatoryY
IniRead, PredatoryColor, %IniFile%, MM, PredatoryColor
IniRead, PredatoryKey, %IniFile%, MM, PredatoryKey
IniRead, PredatorySleep, %IniFile%, MM, PredatorySleep
IniRead, ElectrifiedX, %IniFile%, MM, ElectrifiedX
IniRead, ElectrifiedY, %IniFile%, MM, ElectrifiedY
IniRead, ElectrifiedColor, %IniFile%, MM, ElectrifiedColor
IniRead, ElectrifiedKey, %IniFile%, MM, ElectrifiedKey
IniRead, ElectrifiedSleep, %IniFile%, MM, ElectrifiedSleep
IniRead, SilverTipX, %IniFile%, MM, SilverTipX
IniRead, SilverTipY, %IniFile%, MM, SilverTipY
IniRead, SilverTipColor, %IniFile%, MM, SilverTipColor
IniRead, SilverTipKey, %IniFile%, MM, SilverTipKey
IniRead, SilverTipSleep, %IniFile%, MM, SilverTipSleep
IniRead, ChannelX, %IniFile%, MM, ChannelX
IniRead, ChannelY, %IniFile%, MM, ChannelY
IniRead, ChannelColor, %IniFile%, MM, ChannelColor
IniRead, CrossfireX, %IniFile%, MM, CrossfireX
IniRead, CrossfireY, %IniFile%, MM, CrossfireY
IniRead, CrossfireColor, %IniFile%, MM, CrossfireColor
IniRead, CrossfireKey, %IniFile%, MM, CrossfireKey

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
		buff_check(ElectrifiedX, ElectrifiedY, ElectrifiedColor, ElectrifiedKey, ElectrifiedSleep)
		buff_check(SilverTipX, SilverTipY, SilverTipColor, SilverTipKey, SilverTipSleep)	
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
		PixelSearch, Px, Py, 1100, 647, 1190, 666, AttackColor, 10, fast, RGB
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
			crossfire_true_check(CrossfireX, CrossfireY, CrossfireColor, CrossfireKey)
			skill_true_check(DecoyX, DecoyY, DecoyColor, DecoyKey)
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
		PixelSearch, Px, Py, 1100, 647, 1190, 666, AttackColor, 10, fast, RGB
		if ErrorLevel ; nope no red lettering, target is dead
			break
		else
		{
			#Include %A_ScriptDir%\include\skill_true.ahk
			#Include %A_ScriptDir%\include\skill_false.ahk
			#Include %A_ScriptDir%\include\buff_check.ahk
			#Include %A_ScriptDir%\include\strafe_sleep.ahk
			skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			PixelGetColor, color, StrafeX, StrafeY
	        ifNotEqual, color, StrafeColor
			{
				skill_true_check(StrafeX, StrafeY, StrafeColor, StrafeKey)
				strafe_sleep(StrafeSleepX, StrafeSleepY, StrafeSleepColor)
				skill_true_check(DecoyX, DecoyY, DecoyColor, DecoyKey)
				skill_true_check(SplinterX, SplinterY, SplinterColor, SplinterKey)
				skill_false_check(FinishX, FinishY, FinishColor, BuildKey)
			}	
			;Sleep 100
		}
	}
	Return	
	
	
}	