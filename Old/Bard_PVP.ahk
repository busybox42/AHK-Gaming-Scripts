/*
---------------------------------
-=: Alan's PVP Bard AHK Macro :=-
---------------------------------
Hotkeys:
---------------------------------
1 - Mount
2 - Verse of Captivation
3 - Verse of Fascination
4 - Virtuoso
5 - Planar Disruption
6 - Rift Disturbance
7 - Planar Refuge
8 - Break Free
9 - Phase Macro
0 - PlaneBound Resilience
- - Fanfare of Power
= - Fanfare of Vigor
NumPad1 - Coda of Restoration
NumPad2 -  Main Combo Builder
NumPad3 - Riff
NumPad4 - Shift to Target Macro
NumPad5 - Finisher Macro
NumPad6 - Shift Macro
NumPad7 - Planar Switch
NumPad8 - Rift Prison
NumPad9 - Memory Capture
NumPad0 - Code of Cowardice
NumPad- - Code of Jeopardy
NumPad+ - Coda of Distress
Crtl1 - Motif of Regeneration
Crtl2 - Motif og Grandeur
Crtl3 - Motif of Tenacity
Crtl4 - Motiif of Focus
Crtl5 - Motif of Bravery
Crtl6 - Motif of Renewal
Crtl7 - 
Crtl8 - Stalker Phase
Crtl9 - Guardian Phase
Crtl0 - Anthem of Competence
Crtl- - Anthem of Defiance
Crtl= - Anthem of Fervor
-----------------------------------
*/

;-----------------------------------
; Save Last Spec Played
;-----------------------------------
if FileExist("C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp")
   FileDelete, C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp
FileAppend, BardPVP, C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp

SetWorkingDir %A_ScriptDir%
IniFile:=A_ScriptDir "\Rift.ini"   
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
;Bard PVE Vars
IniRead, FinisherKey, %IniFile%, Bard_PVP, FinisherKey
IniRead, FinisherHealKey, %IniFile%, Bard_PVP, FinisherHealKey
IniRead, InteruptKey, %IniFile%, Bard_PVP, InteruptKey
IniRead, MotifX, %IniFile%, Bard_PVP, MotifX
IniRead, MotifY, %IniFile%, Bard_PVP, MotifY
IniRead, MRegen1, %IniFile%, Bard_PVP, MRegen1
IniRead, MRegen2, %IniFile%, Bard_PVP, MRegen2
IniRead, MRegenKey, %IniFile%, Bard_PVP, MRegenKey
IniRead, MGrand1, %IniFile%, Bard_PVP, MGrand1
IniRead, MGrand2, %IniFile%, Bard_PVP, MGrand2
IniRead, MGrandKey, %IniFile%, Bard_PVP, MGrandKey
IniRead, MTenacity1, %IniFile%, Bard_PVP, MTenacity1
IniRead, MTenacity2, %IniFile%, Bard_PVP, MTenacity2
IniRead, MTenacityKey, %IniFile%, Bard_PVP, MTenacityKey
IniRead, MFocus1, %IniFile%, Bard_PVP, MFocus1
IniRead, MFocus2, %IniFile%, Bard_PVP, MFocus2
IniRead, MFocusKey, %IniFile%, Bard_PVP, MFocusKey
IniRead, MBravery1, %IniFile%, Bard_PVP, MBravery1
IniRead, MBravery2, %IniFile%, Bard_PVP, MBravery2
IniRead, MBraveryKey, %IniFile%, Bard_PVP, MBraveryKey
IniRead, MotTime, %IniFile%, Bard_PVP, MotTime
IniRead, MotTimeBuff, %IniFile%, Bard_PVP, MotTimeBuff
IniRead, BuffX, %IniFile%, Bard_PVP, BuffX
IniRead, BuffY, %IniFile%, Bard_PVP, BuffY
IniRead, FSleep, %IniFile%, Bard_PVP, FSleep
IniRead, DSleep, %IniFile%, Bard_PVP, DSleep
IniRead, PRes1, %IniFile%, Bard_PVP, PRes1
IniRead, PRes2, %IniFile%, Bard_PVP, PRes2
IniRead, PResKey, %IniFile%, Bard_PVP, PResKey
IniRead, GPhase1, %IniFile%, Bard_PVP, GPhase1
IniRead, GPhase2, %IniFile%, Bard_PVP, GPhase2
IniRead, GPhaseKey, %IniFile%, Bard_PVP, GPhaseKey
IniRead, AComp1, %IniFile%, Bard_PVP, AComp1
IniRead, AComp2, %IniFile%, Bard_PVP, AComp2
IniRead, ACompKey, %IniFile%, Bard_PVP, ACompKey
IniRead, FVigor1, %IniFile%, Bard_PVP, FVigor1
IniRead, FVigor2, %IniFile%, Bard_PVP, FVigor2
IniRead, FVigorKey, %IniFile%, Bard_PVP, FVigorKey
IniRead, FPower1, %IniFile%, Bard_PVP, FPower1
IniRead, FPower2, %IniFile%, Bard_PVP, FPower2
IniRead, FPowerKey, %IniFile%, Bard_PVP, FPowerKey
IniRead, CadX, %IniFile%, Bard_PVP, CadX
IniRead, CadY, %IniFile%, Bard_PVP, CadY
IniRead, CadColor, %IniFile%, Bard_PVP, CadColor

Pause::Pause
Xbutton2::Reload
   
;-----------------------------------
; Functions
;-----------------------------------
skill_true_check(x, y, colorid, skillKey)
{ 
  CoordMode, Pixel, Relative
  PixelGetColor, color, %x%, %y%
  ifEqual, color, %colorid%
  { 
    SendInput, %skillKey%
  }
 }
 
skill_false_check(x, y, colorid, skillKey)
{ 
  CoordMode, Pixel, Relative
  PixelGetColor, color, %x%, %y%
  ifNotEqual, color, %colorid%
  { 
    SendInput, %skillKey%
  }
 } 
motif_check(x, y, colorid1, colorid2, skillKey, mtime)
{ 
  CoordMode, Pixel, Relative
  PixelGetColor, color, %x%, %y%
  ifEqual, color, %colorid1%
  { 
    SendInput, %skillKey%
	Sleep %mtime%
  }
  else ifEqual, color, %colorid2%
  { 
    SendInput, %skillKey%
	Sleep %mtime%
  }
 }
cadence_sleep(x, y, colorid)
{
  CoordMode, Pixel, Relative
  PixelGetColor, color, %x%, %y%
  ifEqual, color, %colorid%
  {
    Sleep 2000
  }
 }
 
buff_check(x, y, colorid1, colorid2, skillKey, sleeper)
{ 
  CoordMode, Pixel, Relative
  PixelGetColor, color, %x%, %y%
  ifEqual, color, %colorid1%
  { 
    SendInput, %skillKey%
	Sleep %sleeper%
  }
  else ifEqual, color, %colorid2%
  { 
    SendInput, %skillKey%
	Sleep %sleeper%
  }
 }

;-----------------------------------
; Run if Rift is in the forground
;----------------------------------- 
#ifWinActive RIFT
{
    ;Set AHK process to high priority
    ;Process, Priority, , High  
    ; Toggle Macro

;----------------------------------- 	
; Change Scripts 
;----------------------------------- 
  $+1::
    Loop 
    {
      If not (GetKeyState("Shift") and GetKeyState("1", "P"))
        break
      SendInput, +1
      Run C:\Users\Alan\Documents\AutoHotKey Macros\Bard_PVP.ahk
      ExitApp
    }
    Return

  $+2::
    Loop 
    {
      If not (GetKeyState("Shift") and GetKeyState("2", "P"))
        break
      SendInput, +2
      Run C:\Users\Alan\Documents\AutoHotKey Macros\NB_PVP.ahk
      ExitApp
    }
    Return

  $+3::
    Loop 
    {
      If not (GetKeyState("Shift") and GetKeyState("3", "P"))
        break
      SendInput, +3
      Run C:\Users\Alan\Documents\AutoHotKey Macros\Solo.ahk
      ExitApp
    }
    Return

  $+4::
    Loop 
    {
      If not (GetKeyState("Shift") and GetKeyState("4", "P"))
        break
      SendInput, +4
      Run C:\Users\Alan\Documents\AutoHotKey Macros\Bard_PVE.ahk
      ExitApp
    }
    Return
	
	$+5::
    Loop 
    {
      If not (GetKeyState("Shift") and GetKeyState("5", "P"))
        break
      SendInput, +5
      Run C:\Users\Alan\Documents\AutoHotKey Macros\MM.ahk
      ExitApp
    }
    Return
;-----------------------------------
; Mount and break Motif Rotation
;-----------------------------------
 $1::
 Loop 
 {
  If not GetKeyState("1", "P")
    break
  SendInput 1
  BreakTrue = 1
  Sleep 1000
  Reload
 }
 Return	

;-----------------------------------
; Combat Loops
;-----------------------------------
  
$NumPad2:: 
  SendInput {NumPad2} ; Start attack on yellow mobs
  Loop 
  {
	  ; check to see if we're in combat
	  PixelSearch, Px, Py, 1300, 755, 1382, 772, AttackColor, 10, fast, RGB
	  if ErrorLevel ; nope no red lettering, target is dead
        break
	else
	{
	  cadence_sleep(CadX, CadY, CadColor)
      skill_false_check(FinishX, FinishY, FinishColor, FinisherKey)
	  skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
	  motif_check(MotifX, MotifY, MRegen1, MRegen2, MRegenKey, MotTime)
      motif_check(MotifX, MotifY, MGrand1, MGrand2, MGrandKey, MotTime)
	  motif_check(MotifX, MotifY, MTenacity1, MTenacity2, MTenacityKey, MotTime)
	  motif_check(MotifX, MotifY, MFocus1, MFocus2, MFocusKey, MotTime)
	  motif_check(MotifX, MotifY, MBravery1, MBravery2, MBraveryKey, MotTime)
	  buff_check(BuffX, BuffY, PRes1, PRes2, PResKey, DSleep)
	  buff_check(BuffX, BuffY, GPhase1, GPhase2, GPhaseKey, DSleep)
	  buff_check(BuffX, BuffY, AComp1, AComp2, ACompKey, DSleep)
	  Send {NumPad2} ; Main Combo Builder
	  Sleep 800
	  
	}
  }
  Return
  
$NumPad1:: 
  SendInput {NumPad8} ; Start attack on yellow mobs
  Loop 
  {
	  ; check to see if we're in combat
	  PixelSearch, Px, Py, 1300, 755, 1382, 772, AttackColor, 10, fast, RGB
	  if ErrorLevel ; nope no red lettering, target is dead
        break
	else
	{
	  cadence_sleep(CadX, CadY, CadColor)
      skill_false_check(FinishX, FinishY, FinishColor, FinisherHealKey)
	  skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
	  motif_check(MotifX, MotifY, MRegen1, MRegen2, MRegenKey, MotTime)
      motif_check(MotifX, MotifY, MGrand1, MGrand2, MGrandKey, MotTime)
	  motif_check(MotifX, MotifY, MTenacity1, MTenacity2, MTenacityKey, MotTime)
	  motif_check(MotifX, MotifY, MFocus1, MFocus2, MFocusKey, MotTime)
	  motif_check(MotifX, MotifY, MBravery1, MBravery2, MBraveryKey, MotTime)
	  buff_check(BuffX, BuffY, PRes1, PRes2, PResKey, DSleep)
	  buff_check(BuffX, BuffY, GPhase1, GPhase2, GPhaseKey, DSleep)
	  buff_check(BuffX, BuffY, AComp1, AComp2, ACompKey, DSleep)
	  Send {NumPad2} ; Main Combo Builder
	  Sleep 800
	  
	}
  }
  Return 
;-----------------------------------  
; Motif Rotation
;-----------------------------------
#MaxThreadsPerHotkey 3
$LALT::
#MaxThreadsPerHotkey 1
  if BreakTrue 
  {
    BreakTrue := 0
	return
  }
  BreakTrue := 1
  Loop
  {
    motif_check(MotifX, MotifY, MRegen1, MRegen2, MRegenKey, MotTimeBuff)
    motif_check(MotifX, MotifY, MGrand1, MGrand2, MGrandKey, MotTimeBuff)
	motif_check(MotifX, MotifY, MTenacity1, MTenacity2, MTenacityKey, MotTimeBuff)
	motif_check(MotifX, MotifY, MFocus1, MFocus2, MFocusKey, MotTimeBuff)
	motif_check(MotifX, MotifY, MBravery1, MBravery2, MBraveryKey, MotTimeBuff)
	Sleep 100
	if not BreakTrue
      break
  }
  BreakTrue := 1  
  Return
  
;-----------------------------------  
; Buff Up
;-----------------------------------
$=:: 
  Loop 5
  {
    buff_check(BuffX, BuffY, FVigor1, FVigor2, FVigorKey, FSleep)
	buff_check(BuffX, BuffY, FPower1, FPower2, FPowerKey, FSleep)
	buff_check(BuffX, BuffY, PRes1, PRes2, PResKey, DSleep)
	buff_check(BuffX, BuffY, GPhase1, GPhase2, GPhaseKey, DSleep)
	buff_check(BuffX, BuffY, AComp1, AComp2, ACompKey, DSleep)
	Sleep 1000
  }	
  Return
} 