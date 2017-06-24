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
IniRead, CommonSleep, %IniFile%, Common, CommonSleep
IniRead, CommonColor, %IniFile%, Common, CommonColor
; Marksman Vars
IniRead, FinisherKey, %IniFile%, MM, FinisherKey
IniRead, BuildKey, %IniFile%, MM, BuildKey
IniRead, InteruptKey, %IniFile%, MM, InteruptKey
IniRead, AOEKey, %IniFile%, MM, AOEKey
IniRead, StrafeX, %IniFile%, MM, StrafeX
IniRead, StrafeY, %IniFile%, MM, StrafeY
IniRead, StrafeKey, %IniFile%, MM, StrafeKey
IniRead, SplinterX, %IniFile%, MM, SplinterX
IniRead, SplinterY, %IniFile%, MM, SplinterY
IniRead, StrafeSleep, %IniFile%, MM, StrafeSleep
IniRead, SplinterColor, %IniFile%, MM, SplinterColor
IniRead, SplinterKey, %IniFile%, MM, SplinterKey
IniRead, VirulentX, %IniFile%, MM, VirulentX
IniRead, VirulentY, %IniFile%, MM, VirulentY
IniRead, VirulentColor, %IniFile%, MM, VirulentColor
IniRead, VirulentKey, %IniFile%, MM, VirulentKey
IniRead, VirulentSleep, %IniFile%, MM, VirulentSleep
IniRead, RendingX, %IniFile%, MM, RendingX
IniRead, RendingY, %IniFile%, MM, RendingY
IniRead, RendingColor, %IniFile%, MM, RendingColor
IniRead, RendingKey, %IniFile%, MM, RendingKey
IniRead, RendingSleep, %IniFile%, MM, RendingSleep
IniRead, VampiricX, %IniFile%, MM, VampiricX
IniRead, VampiricY, %IniFile%, MM, VampiricY
IniRead, VampiricColor, %IniFile%, MM, VampiricColor
IniRead, VampiricKey, %IniFile%, MM, VampiricKey
IniRead, VampiricSleep, %IniFile%, MM, VampiricSleep
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
		buff_check(RendingX, RendingY, CommonColor, RendingKey, CommonSleep)
		buff_check(VampiricX, VampiricY, CommonColor, VampiricKey, CommonSleep)	
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
			break
		else
		{
			#Include %A_ScriptDir%\include\skill_true.ahk
			#Include %A_ScriptDir%\include\skill_false.ahk
			#Include %A_ScriptDir%\include\skill_crossfire.ahk
			#Include %A_ScriptDir%\include\buff_check.ahk
			skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			crossfire_true_check(CrossfireX, CrossfireY, CommonColor, CrossfireKey)
			Sleep 100
			PixelGetColor, color, 584, 1034
			ifNotEqual, color, 0x0000FF
			{
				buff_check(RendingX, RendingY, CommonColor, RendingKey, CommonSleep)
				buff_check(VampiricX, VampiricY, CommonColor, VampiricKey, CommonSleep)
				skill_false_check(FinishX, FinishY, FinishColor, AOEKey)
			}
			;Sleep 100
		}
	}
	Return

	$NumPad2::
	skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
	skill_false_check(FinishX, FinishY, FinishColor, BuildKey)
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
			#Include %A_ScriptDir%\include\strafe_sleep.ahk
			skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
			skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
			PixelGetColor, color, 392, 1007
			ifEqual, color, 0x0000FF
			{
				PixelGetColor, color2, 418, 1007
				ifEqual, color2, 0x0000FF
				{
					sleep 900
					buff_check(StrafeX, StrafeY, CommonColor, StrafeKey, StrafeSleep)	
				}
			}
			PixelGetColor, color1, 474, 1007
			ifNotEqual, color1, 0x0000FF
			{
				buff_check(RendingX, RendingY, CommonColor, RendingKey, CommonSleep)
				buff_check(VampiricX, VampiricY, CommonColor, VampiricKey, CommonSleep)
				skill_false_check(FinishX, FinishY, FinishColor, BuildKey)
			}
			Sleep 100
		}
	}
	Return	
	
	
}	