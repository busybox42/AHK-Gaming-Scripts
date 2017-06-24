/*
---------------------------------
-=: Alan's PVE Bard AHK Macro :=-
---------------------------------
Hotkeys:
---------------------------------
1 - Mount
2 - Side Step
3 - Poison Malice
4 - Virtuoso
5 - Weapon Barrage
6 - Stealth
7 - Malicious Strike
8 - 
9 - 
0 -
- -
= -
NumPad1 - Coda of Restoration
NumPad2 - Main Combo Builder
NumPad3 - Riff
NumPad4 - Coda of Cowardice
NumPad5 - Melee Finisher Macro
NumPad6 - Coda of Distress
NumPad7 - Coda of Jeopardy
NumPad8 - Cadence
NumPad9 -
NumPad0 - Anthem of Competence
NumPad- - Anthem of Defiance
NumPad+ - Anthem of Fervor
Crtl1 - Motif of Regeneration
Crtl2 - Motif og Grandeur
Crtl3 - Motif of Tenacity
Crtl4 - Motiif of Focus
Crtl5 - Motif of Bravery
Crtl6 -
Crtl7 -
Crtl8 -
Crtl9 - Lethal Poison
Crtl0 - Leeching Poison
Crtl- - Virulent Poison
Crtl= - Combat Pose
-----------------------------------
*/

;-----------------------------------
; Save Last Spec Played
;-----------------------------------
if FileExist("C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp")
   FileDelete, C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp
FileAppend, BardPVE, C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp

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
IniRead, FinisherKey, %IniFile%, Bard_PVE, FinisherKey
IniRead, FinisherHealKey, %IniFile%, Bard_PVE, FinisherHealKey
IniRead, InteruptKey, %IniFile%, Bard_PVE, InteruptKey
IniRead, MotifX, %IniFile%, Bard_PVE, MotifX
IniRead, MotifY, %IniFile%, Bard_PVE, MotifY
IniRead, MRegen1, %IniFile%, Bard_PVE, MRegen1
IniRead, MRegen2, %IniFile%, Bard_PVE, MRegen2
IniRead, MRegenKey, %IniFile%, Bard_PVE, MRegenKey
IniRead, MGrand1, %IniFile%, Bard_PVE, MGrand1
IniRead, MGrand2, %IniFile%, Bard_PVE, MGrand2
IniRead, MGrandKey, %IniFile%, Bard_PVE, MGrandKey
IniRead, MTenacity1, %IniFile%, Bard_PVE, MTenacity1
IniRead, MTenacity2, %IniFile%, Bard_PVE, MTenacity2
IniRead, MTenacityKey, %IniFile%, Bard_PVE, MTenacityKey
IniRead, MFocus1, %IniFile%, Bard_PVE, MFocus1
IniRead, MFocus2, %IniFile%, Bard_PVE, MFocus2
IniRead, MFocusKey, %IniFile%, Bard_PVE, MFocusKey
IniRead, MBravery1, %IniFile%, Bard_PVE, MBravery1
IniRead, MBravery2, %IniFile%, Bard_PVE, MBravery2
IniRead, MBraveryKey, %IniFile%, Bard_PVE, MBraveryKey
IniRead, MotTime, %IniFile%, Bard_PVE, MotTime
IniRead, MotTimeBuff, %IniFile%, Bard_PVE, MotTimeBuff
IniRead, BuffX, %IniFile%, Bard_PVE, BuffX
IniRead, BuffY, %IniFile%, Bard_PVE, BuffY
IniRead, FSleep, %IniFile%, Bard_PVE, FSleep
IniRead, DSleep, %IniFile%, Bard_PVE, DSleep
IniRead, VPoison1, %IniFile%, Bard_PVE, VPoison1
IniRead, VPoison2, %IniFile%, Bard_PVE, VPoison2
IniRead, VPoisonkey, %IniFile%, Bard_PVE, VPoisonkey
IniRead, LPoison1, %IniFile%, Bard_PVE, LPoison1
IniRead, LPoison2, %IniFile%, Bard_PVE, LPoison2
IniRead, LPoisonKey, %IniFile%, Bard_PVE, LPoisonKey
IniRead, FVigor1, %IniFile%, Bard_PVE, FVigor1
IniRead, FVigor2, %IniFile%, Bard_PVE, FVigor2
IniRead, FVigorKey, %IniFile%, Bard_PVE, FVigorKey
IniRead, FPower1, %IniFile%, Bard_PVE, FPower1
IniRead, FPower2, %IniFile%, Bard_PVE, FPower2
IniRead, FPowerKey, %IniFile%, Bard_PVE, FPowerKey
IniRead, CadX, %IniFile%, Bard_PVE, CadX
IniRead, CadY, %IniFile%, Bard_PVE, CadY
IniRead, CadColor, %IniFile%, Bard_PVE, CadColor

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
  ;MsgBox %color%
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
  ;MsgBox %color%
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
      Run C:\Users\Alan\Documents\AutoHotKey Macros\RSTank.ahk
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
	    CoordMode, Pixel, Relative
        PixelGetColor, color5, %FinishX%, %FinishY%
	    ifEqual, color5, %FinishColor%
        {	 
	      Send {NumPad2} ; Main Combo Builder
	    }
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
	    CoordMode, Pixel, Relative
        PixelGetColor, color5, %FinishX%, %FinishY%
	    ifEqual, color5, %FinishColor%
        {	 
	      Send {NumPad8} ; Main Combo Builder
	    }
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
	  buff_check(BuffX, BuffY, LPoison1, LPoison2, LPoisonKey, DSleep)
	  buff_check(BuffX, BuffY, VPoison1, VPoison2, VPoisonKey, DSleep)
	  Sleep 1000
    }	
  Return
} 