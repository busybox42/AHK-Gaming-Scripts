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
; Ranger Vars
IniRead, Ace, %IniFile%, Ranger, Ace
IniRead, AceX, %IniFile%, Ranger, AceX
IniRead, AceY, %IniFile%, Ranger, AceY
IniRead, Shadow, %IniFile%, Ranger, Shadow
IniRead, ShadowX, %IniFile%, Ranger, ShadowX
IniRead, ShadowY, %IniFile%, Ranger, ShadowY
IniRead, Splinter, %IniFile%, Ranger, Splinter
IniRead, SplinterX, %IniFile%, Ranger, SplinterX
IniRead, SplinterY, %IniFile%, Ranger, SplinterY
IniRead, Animal, %IniFile%, Ranger, Animal
IniRead, AnimalX, %IniFile%, Ranger, AnimalX
IniRead, AnimalY, %IniFile%, Ranger, AnimalY
IniRead, FeralAgg, %IniFile%, Ranger, FeralAgg
IniRead, FeralAggX, %IniFile%, Ranger, FeralAggX
IniRead, FeralAggY, %IniFile%, Ranger, FeralAggY
IniRead, Quick, %IniFile%, Ranger, Quick
IniRead, HeadShot, %IniFile%, Ranger, HeadShot
IniRead, HeadShotX, %IniFile%, Ranger, HeadShotX
IniRead, HeadShotY, %IniFile%, Ranger, HeadShotY
IniRead, TwinShot, %IniFile%, Ranger, TwinShot
IniRead, LPoison, %IniFile%, Ranger, LPoison
IniRead, LPoisonX, %IniFile%, Ranger, LPoisonX
IniRead, LPoisonY, %IniFile%, Ranger, LPoisonY
IniRead, VPoison, %IniFile%, Ranger, VPoison
IniRead, VPoisonX, %IniFile%, Ranger, VPoisonX
IniRead, VPoisonY, %IniFile%, Ranger, VPoisonY
IniRead, FeralIn, %IniFile%, Ranger, FeralIn
IniRead, FeralInX, %IniFile%, Ranger, FeralInX
IniRead, FeralInY, %IniFile%, Ranger, FeralInY
IniRead, SotW, %IniFile%, Ranger, SotW
IniRead, SotWX, %IniFile%, Ranger, SotWX
IniRead, SotWY, %IniFile%, Ranger, SotWY
IniRead, RavIn, %IniFile%, Ranger, RavIn
IniRead, RavInX, %IniFile%, Ranger, RavInX
IniRead, RavInY, %IniFile%, Ranger, RavInY
IniRead, PredIn, %IniFile%, Ranger,  PredIn
IniRead, PredInX, %IniFile%, Ranger, PredInX
IniRead, PredInY, %IniFile%, Ranger, PredInY
IniRead, Pin, %IniFile%, Ranger, Pin
IniRead, PinX, %IniFile%, Ranger, PinX
IniRead, PinY, %IniFile%, Ranger, PinY
IniRead, RainArrows, %IniFile%, Ranger, RainArrows
IniRead, HCall, %IniFile%, Ranger, HCall
IniRead, HCallX, %IniFile%, Ranger, HCallX
IniRead, HCallY, %IniFile%, Ranger, HCallY

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
		PixelGetColor, pet, 503, 709
		ifNotEqual, pet, 0x252726
		{
			skill_false_check(HCallX, HCallY, FinishColor, HCall)
			sleep 100
			SendInput ^1
			sleep 1000
			PixelGetColor, petcast, 718, 985
			ifEqual, petcast, 0x0000FF
			{
				Sleep 8000
			}
		}	
		SendInput ^6
		buff_check(LPoisonX, LPoisonY, CommonColor, LPoison, RangSleep)
		sleep 1000
		buff_check(VPoisonX, VPoisonY, CommonColor, VPoison, RangSleep)
		buff_check(PredInX, PredInY, CommonColor, PredIn, RangSleep)
		sleep 2000
		buff_check(FeralInX, FeralInY, CommonColor, FeralIn, RangSleep)
		buff_check(SotWX, SotWY, CommonColor, SotW, RangSleep)
		buff_check(RavInX, RavInY, CommonColor, RavIn, RangSleep)
		Sleep 1000
	}
	Return	
	
;-----------------------------------
; Combat Loops
;-----------------------------------
	$NumPad1::
	skill_false_check(PinX, PinY, CommonColor, Pin)
	PixelGetColor, fin, 474, 1005
	ifEqual, fin, 0x0000FF
	{
		skill_true_check(FinishX, FinishY, FinishColor, HeadShot)
	}
	else
	{
		skill_true_check(FinishX, FinishY, FinishColor, TwinShot)
	}	
	skill_false_check(FinishX, FinishY, FinishColor, RainArrows)
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
			PixelGetColor, rain, 558, 1036
			ifEqual, tain, 0x0000FF
			{
				Sleep 100
			}
			else
			{
				skill_false_check(PinX, PinY, CommonColor, Pin)
				PixelGetColor, fin, 474, 1005
				ifEqual, fin, 0x0000FF
				{
					skill_true_check(FinishX, FinishY, FinishColor, HeadShot)
				}
				else
				{
					skill_true_check(FinishX, FinishY, FinishColor, TwinShot)
				}
				skill_false_check(FinishX, FinishY, FinishColor, RainArrows)
			}
		}
	}
	Return

	$NumPad4::
	PixelGetColor, fin, 474, 1005
	ifEqual, fin, 0x0000FF
	{
		skill_true_check(FinishX, FinishY, FinishColor, HeadShot)
	}
	else
	{
		skill_true_check(FinishX, FinishY, FinishColor, TwinShot)
	}
	PixelGetColor, aceshot, 391, 1005
	ifEqual, aceshot, 0x0000FF
	{			
		skill_false_check(FinishX, FinishY, FinishColor, Ace)
	}
	PixelGetColor, shad, 419, 1005
	ifEqual, shad, 0x0000FF
	{			
	skill_false_check(FinishX, FinishY, FinishColor, Shadow)
	}	
	skill_false_check(FinishX, FinishY, FinishColor, Quick)
	PixelGetColor, splint, 445, 1005
	ifEqual, splint, 0x0000FF
	{			
		skill_false_check(FinishX, FinishY, FinishColor, Splinter)
	}	
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
			PixelGetColor, fin, 474, 1005
			ifEqual, fin, 0x0000FF
			{
				skill_true_check(FinishX, FinishY, FinishColor, HeadShot)
			}
			else
			{
				skill_true_check(FinishX, FinishY, FinishColor, TwinShot)
			}
			PixelGetColor, aceshot, 391, 1005
			ifEqual, aceshot, 0x0000FF
			{			
				skill_false_check(FinishX, FinishY, FinishColor, Ace)
			}
			PixelGetColor, shad, 419, 1005
			ifEqual, shad, 0x0000FF
			{			
				skill_false_check(FinishX, FinishY, FinishColor, Shadow)
			}
			skill_false_check(FinishX, FinishY, FinishColor, Quick)
			PixelGetColor, splint, 445, 1005
			ifEqual, splint, 0x0000FF
			{			
				skill_false_check(FinishX, FinishY, FinishColor, Splinter)
			}
			skill_false_check(FeralAggX, FeralAggY, CommonColor, FeralAgg)
			skill_false_check(AnimalX, AnimalY, CommonColor, Animal)
			buff_check(LPoisonX, LPoisonY, CommonColor, LPoison, RangSleep)
			buff_check(VPoisonX, VPoisonY, CommonColor, VPoison, RangSleep)
			buff_check(PredInX, PredInY, CommonColor, PredIn, RangSleep)
			buff_check(FeralInX, FeralInY, CommonColor, FeralIn, RangSleep)
			buff_check(SotWX, SotWY, CommonColor, SotW, RangSleep)
			buff_check(RavInX, RavInY, CommonColor, RavIn, RangSleep)
			Sleep 300
		}	
	}
	Return
}