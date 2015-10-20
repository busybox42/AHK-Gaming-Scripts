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
	FileAppend, Tact, %A_ScriptDir%\spec.tmp

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
; Tact Vars
IniRead, PlaneResX, %IniFile%, Tact, PlaneResX
IniRead, PlaneResY, %IniFile%, Tact, PlaneResY
IniRead, PlaneResKey, %IniFile%, Tact, PlaneResKey
IniRead, TSleep, %IniFile%, Tact, TSleep
IniRead, VigorX, %IniFile%, Tact, VigorX
IniRead, VigorY, %IniFile%, Tact, VigorY
IniRead, VigorKey, %IniFile%, Tact, VigorKey
IniRead, VigorSleep, %IniFile%, Tact, VigorSleep
IniRead, CEngX, %IniFile%, Tact, CEngX
IniRead, CEngY, %IniFile%, Tact, CEngY
IniRead, CEngKey, %IniFile%, Tact, CEngKey
IniRead, EnergyAltX, %IniFile%, Tact, EnergyAltX
IniRead, EnergyAltY, %IniFile%, Tact, EnergyAltY
IniRead, EnergyAltKey, %IniFile%, Tact, EnergyAltKey
IniRead, TPrimer, %IniFile%, Tact, TPrimer
IniRead, NecroRay, %IniFile%, Tact, NecroRay
IniRead, EmpRay, %IniFile%, Tact, EmpRay
IniRead, BoltX, %IniFile%, Tact, BoltX
IniRead, BoltY, %IniFile%, Tact, BoltY
IniRead, BoltKey, %IniFile%, Tact, BoltKey
IniRead, Flame, %IniFile%, Tact, Flame
IniRead, Ice, %IniFile%, Tact, Ice
IniRead, PowerCoreX, %IniFile%, Tact, PowerCoreX
IniRead, PowerCoreY, %IniFile%, Tact, PowerCoreY
IniRead, PowerCoreKey, %IniFile%, Tact, PowerCoreKey
IniRead, NecroCoreX, %IniFile%, Tact, NecroCoreX
IniRead, NecroCoreY, %IniFile%, Tact, NecroCoreY
IniRead, NecroCoreKey, %IniFile%, Tact, NecroCoreKey
IniRead, CureCoreX, %IniFile%, Tact, CureCoreX
IniRead, CureCoreY, %IniFile%, Tact, CureCoreY
IniRead, CureCoreKey, %IniFile%, Tact, CureCoreKey
IniRead, FortCoreX, %IniFile%, Tact, FortCoreX
IniRead, FortCoreY, %IniFile%, Tact, FortCoreY
IniRead, FortCoreKey, %IniFile%, Tact, FortCoreKey
IniRead, CRemoteX, %IniFile%, Tact, CRemoteX
IniRead, CRemoteY, %IniFile%, Tact, CRemoteY
IniRead, CRemoteKey, %IniFile%, Tact, CRemoteKey
IniRead, BRemoteX, %IniFile%, Tact, BRemoteX
IniRead, BRemoteY, %IniFile%, Tact, BRemoteY
IniRead, BRemoteKey, %IniFile%, Tact, BRemoteKey
IniRead, SRemoteX, %IniFile%, Tact, SRemoteX
IniRead, SRemoteY, %IniFile%, Tact, SRemoteY
IniRead, SRemoteKey, %IniFile%, Tact, SRemoteKey

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
		SendInput, 8
		sleep 1000
		buff_check(PlaneResX, PlaneResY, CommonColor, PlaneResKey, TSleep)
		buff_check(VigorX, VigorY, CommonColor, VigorKey, VigorSleep)
		buff_check(EnergyAltX, EnergyAltY, CommonColor, EnergyAltKey, TSleep)
		buff_check(CEngX, CEngY, CommonColor, CEngKey, TSleep)	
	}
	Return

;-----------------------------------
; Combat Loops
;-----------------------------------	

	$NumPad1::
	;skill_false_check(FinishX, FinishY, CommonColor, Ice)
	Loop 
	{
		; check to see if we're in combat
		PixelSearch, Px, Py, 1102, 651, 1190, 669, AttackColor, 10, fast, RGB
		if ErrorLevel ; nope no red lettering, target is dead
		{ 
			SendInput, ^9
			break
		}
		else
		{
			#Include %A_ScriptDir%\include\skill_true.ahk
			#Include %A_ScriptDir%\include\skill_false.ahk
			#Include %A_ScriptDir%\include\buff_check.ahk
			; Decide to use Torrent Primer or Necrotic Ray Finisher
			PixelGetColor, color1, 691, 1025
	        ifEqual, color1, 0x0000FF
			{
				skill_true_check(FinishX, FinishY, CommonColor, TPrimer)
			}
			else
			{
				skill_true_check(FinishX, FinishY, CommonColor, NecroRay)
			}			
			; Remotes
			PixelGetColor, color, 580, 1037
	        ifEqual, color, 0x0000FF
			{
				skill_false_check(SRemoteX, SRemoteY, CommonColor, SRemoteKey)
			}
			skill_true_check(CRemoteX, CRemoteY, CommonColor, CRemoteKey)
			skill_true_check(BRemoteX, BRemoteY, CommonColor, BRemoteKey)			
			; Drop Cores
			skill_true_check(PowerCoreX, PowerCoreY, CommonColor, PowerCoreKey)
			skill_true_check(NecroCoreX, NecroCoreY, CommonColor, NecroCoreKey)
			skill_true_check(CureCoreX, CureCoreY, CommonColor, CureCoreKey)
			skill_true_check(FortCoreX, FortCoreY, CommonColor, FortCoreKey)
			; Check to see if I have 4 stacks of Expanded Torrents
			PixelGetColor, color, 1111, 984
	        ifNotEqual, color, 0x0000FF
			{
				; Use Bolt
				PixelGetColor, color2, 1112, 952
				ifEqual, color2, 0x0000FF
				{
					SendInput, {NumPad2}
					Sleep 1000
					
				}
				;skill_true_check(BoltX, BoltY, CommonColor, BoltKey)
			}
			buff_check(PlaneResX, PlaneResY, CommonColor, PlaneResKey, TSleep)
			buff_check(VigorX, VigorY, CommonColor, VigorKey, VigorSleep)
			buff_check(EnergyAltX, EnergyAltY, CommonColor, EnergyAltKey, TSleep)
			PixelGetColor, color4, 717, 981
			ifNotEqual, color4, 0x0000FF
			{			
				buff_check(CEngX, CEngY, CommonColor, CEngKey, TSleep)
			}
			; Cast Torrents if we don't have 5 combo points or 4 stacks of Expand Torrents
			PixelGetColor, color3, 1112, 952
			ifNotEqual, color3, 0x0000FF
			{
				ifNotEqual, color, 0x0000FF
				{
					SendInput, {NumPad1}
					Sleep 1000
				}
			}
			ifNotEqual, color3, 0x0000FF
			{
				ifNotEqual, color, 0x0000FF
				{
					SendInput, {NumPad3}
				}	
			}			
			Sleep 1000
			;skill_false_check(FinishX, FinishY, CommonColor, Flame)
			;Sleep 2000
			;skill_false_check(FinishX, FinishY, CommonColor, Ice)
		}
	}	
	Return	

	$NumPad3::
	;skill_false_check(FinishX, FinishY, CommonColor, Ice)
	Loop 
	{
		; check to see if we're in combat
		PixelSearch, Px, Py, 1102, 651, 1190, 669, AttackColor, 10, fast, RGB
		if ErrorLevel ; nope no red lettering, target is dead
		{
			SendInput, ^9
			break
		}
		else
		{
			#Include %A_ScriptDir%\include\skill_true.ahk
			#Include %A_ScriptDir%\include\skill_false.ahk
			#Include %A_ScriptDir%\include\buff_check.ahk
			; Decide to use Torrent Primer or Necrotic Ray Finisher
			PixelGetColor, color1, 691, 1025
	        ifEqual, color1, 0x0000FF
			{
				skill_true_check(FinishX, FinishY, CommonColor, TPrimer)
			}
			else
			{
				skill_true_check(FinishX, FinishY, CommonColor, EmpRay)
			}
			; Remotes
			PixelGetColor, color, 580, 1037
	        ifEqual, color, 0x0000FF
			{
				skill_false_check(SRemoteX, SRemoteY, CommonColor, SRemoteKey)
			}			
			skill_true_check(CRemoteX, CRemoteY, CommonColor, CRemoteKey)
			skill_true_check(BRemoteX, BRemoteY, CommonColor, BRemoteKey)			
			; Drop Cores
			skill_true_check(PowerCoreX, PowerCoreY, CommonColor, PowerCoreKey)
			;skill_true_check(NecroCoreX, NecroCoreY, CommonColor, NecroCoreKey)
			skill_true_check(CureCoreX, CureCoreY, CommonColor, CureCoreKey)
			skill_true_check(FortCoreX, FortCoreY, CommonColor, FortCoreKey)
			; Check to see if I have 4 stacks of Expanded Torrents
			PixelGetColor, color, 1111, 984
	        ifNotEqual, color, 0x0000FF
			{
				; Use Bolt
				PixelGetColor, color2, 1112, 952
				ifEqual, color2, 0x0000FF
				{
					SendInput, {NumPad2}
					Sleep 1000
					
				}
				;skill_true_check(BoltX, BoltY, CommonColor, BoltKey)
			}
			buff_check(PlaneResX, PlaneResY, CommonColor, PlaneResKey, TSleep)
			buff_check(VigorX, VigorY, CommonColor, VigorKey, VigorSleep)
			buff_check(EnergyAltX, EnergyAltY, CommonColor, EnergyAltKey, TSleep)
			PixelGetColor, color4, 717, 981
			ifNotEqual, color4, 0x0000FF
			{
				buff_check(CEngX, CEngY, CommonColor, CEngKey, TSleep)
			}
			; Cast Torrents if we don't have 5 combo points or 4 stacks of Expand Torrents
			PixelGetColor, color3, 1112, 952
			ifNotEqual, color3, 0x0000FF
			{
				ifNotEqual, color, 0x0000FF
				{
					SendInput, {NumPad1}
					Sleep 1000
				}
			}
			ifNotEqual, color3, 0x0000FF
			{
				ifNotEqual, color, 0x0000FF
				{
					SendInput, {NumPad3}
				}	
			}			
			Sleep 1000
			;skill_false_check(FinishX, FinishY, CommonColor, Flame)
			;Sleep 2000
			;skill_false_check(FinishX, FinishY, CommonColor, Ice)
		}
	}	
	Return
}	