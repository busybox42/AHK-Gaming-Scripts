SetWorkingDir %A_ScriptDir%
IniFile:=A_ScriptDir "\include\rift.ini"
#Include %A_ScriptDir%\include\skill_true.ahk
#Include %A_ScriptDir%\include\bomb_true.ahk
#Include %A_ScriptDir%\include\skill_false.ahk
#Include %A_ScriptDir%\include\buff_check.ahk

;-----------------------------------
; Save Last Spec Played
;-----------------------------------
if FileExist(A_ScriptDir "\spec.tmp")
	FileDelete, %A_ScriptDir%\spec.tmp
	FileAppend, Sab, %A_ScriptDir%\spec.tmp

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
; Sab Vars
IniRead, CC, %IniFile%, Sab, CC
IniRead, RS, %IniFile%, Sab, RS
IniRead, CM, %IniFile%, Sab, CM
IniRead, BMacro, %IniFile%, Sab,  BMacro
IniRead, SC, %IniFile%, Sab, SC 
IniRead, zeroX, %IniFile%, Sab, zeroX 
IniRead, zeroY, %IniFile%, Sab, zeroY
IniRead, oneX, %IniFile%, Sab, oneX
IniRead, oneY, %IniFile%, Sab, oneY
IniRead, CM, %IniFile%, Sab, CM
IniRead, CMX, %IniFile%, Sab, CMX
IniRead, CMY, %IniFile%, Sab, CMY
IniRead, TB, %IniFile%, Sab, TB
IniRead, TBX, %IniFile%, Sab, TBX
IniRead, TBY, %IniFile%, Sab, TBY
IniRead, PlaneRes, %IniFile%, Sab, PlaneRes
IniRead, PlaneResX, %IniFile%, Sab, PlaneResX
IniRead, PlaneResY, %IniFile%, Sab, PlaneResY
IniRead, CureEng, %IniFile%, Sab, CureEng
IniRead, CureEngX, %IniFile%, Sab, CureEngX
IniRead, CureEngY, %IniFile%, Sab, CureEngY
IniRead, SabSleep, %IniFile%, Sab, SabSleep

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
		buff_check(PlaneResX, PlaneResY, CommonColor, PlaneRes, SabSleep)
		buff_check(CureEngX, CureEngY, CommonColor, CureEng, SabSleep)		
		Sleep 1000
	}
	Return	
	
;-----------------------------------
; Combat Loops
;-----------------------------------
	$NumPad4::
	SendInput, {NumPad4}
	Loop 
	{
		; check to see if we're in combat
		PixelSearch, Px, Py, 1102, 651, 1190, 669, AttackColor, 10, fast, RGB
		if ErrorLevel ; nope no red lettering, target is dead
		{
			;SendInput ^5
			break
		}	
		else
		{
			#Include %A_ScriptDir%\include\skill_true.ahk
			#Include %A_ScriptDir%\include\skill_false.ahk
			#Include %A_ScriptDir%\include\buff_check.ahk		
			PixelGetColor, combo, 390, 1006			
			ifEqual, combo, 0x0000FF
			{
				skill_false_check(FinishX, FinishY, FinishColor, CC)
				skill_true_check(FinishX, FinishY, FinishColor, BMacro)
				buff_check(PlaneResX, PlaneResY, CommonColor, PlaneRes, SabSleep)
				buff_check(CureEngX, CureEngY, CommonColor, CureEng, SabSleep)						
			}				
			else
			{
				PixelGetColor, bustrs, 418, 1005
				ifEqual, bustrs, 0x0000FF
				{
					skill_true_check(zeroX, zeroY, CommonColor, RS)
					skill_true_check(zeroX, zeroY, CommonColor, SC)
				}
				skill_true_check(CMX, CMY, CommonColor, CM)
				skill_true_check(TBX, TBY, CommonColor, TB)				
				SendInput, {NumPad7}
				buff_check(PlaneResX, PlaneResY, CommonColor, PlaneRes, SabSleep)
				buff_check(CureEngX, CureEngY, CommonColor, CureEng, SabSleep)					
			}
			Sleep 100
		}	
	}
	Return
}