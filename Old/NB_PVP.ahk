/*
-----------------------------------
 -=: Alan's NB/RS PVP AHK Macro :=-
 ----------------------------------
 Hotkeys:
 ----------------------------------
 1 - Mount
 2 - Dusk to Dawn
 3 - Ebon Fury
 4 - Twilight Transcendence
 5 - Planar Disruption
 6 - Conceal
 7 - Potion
 8 -
 9 -
 0 -  Phantom Blow
 - -
 = -
 NumPad1 - AOE Combo Builder Macro
 NumPad2 - Single Target Combo Builder Macro
 NumPad3 - Planar Refuge
 NumPad4 - Port to Target Macro
 NumPad5 - Finisher Macro
 NumPad6 - Shift Macro
 NumPad7 - Phase Macro
 NumPad8 - Rift Prison
 NumPad9 - Dark Containment
 NumPad- -
 NumPad+ -
 Crtl1 -
 Crtl2 -
 Crtl3 -
 Crtl4 -
 Crtl5 -
 Crtl6 -
 Crtl7 -
 Crtl8 - Break Free
 Crtl9 - Planar Reversal
 Crtl0 - Smoldering Blades
 Crtl- - Fell Blades
 Crtl= - Hellfire Blades
 -----------------------------------
 */
 
;-----------------------------------
; Save Last Spec Played
;-----------------------------------
if FileExist("C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp")
   FileDelete, C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp
FileAppend, NBPVP, C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp

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
; NB Vars
IniRead, FinisherKey, %IniFile%, NB_Vars, FinisherKey
IniRead, InteruptKey, %IniFile%, NB_Vars, InteruptKey
IniRead, PhantomColor, %IniFile%, NB_Vars, PhantomColor
IniRead, PhantomX, %IniFile%, NB_Vars, PhantomX
IniRead, PhantomY, %IniFile%, NB_Vars, PhantomY
IniRead, PhantomKey, %IniFile%, NB_Vars, PhantomKey
IniRead, BuffX, %IniFile%, NB_Vars, BuffX
IniRead, BuffY, %IniFile%, NB_Vars, BuffY
IniRead, FBlades, %IniFile%, NB_Vars, FBlades
IniRead, FBladesKey, %IniFile%, NB_Vars, FBladesKey
IniRead, HBlades, %IniFile%, NB_Vars, HBlades
IniRead, HBladesKey, %IniFile%, NB_Vars, HBladesKey
IniRead, PRes, %IniFile%, NB_Vars, PRes
IniRead, PResKey, %IniFile%, NB_Vars, PResKey
IniRead, PRev, %IniFile%, NB_Vars, PRev
IniRead, PRevKey, %IniFile%, NB_Vars, PRevKey
IniRead, PhaseX, %IniFile%, NB_Vars, PhaseX
IniRead, PhaseY, %IniFile%, NB_Vars, PhaseY
IniRead, Phase, %IniFile%, NB_Vars, Phase
IniRead, PhaseKey, %IniFile%, NB_Vars, PhaseKey
IniRead, CDX, %IniFile%, NB_Vars, CDX
IniRead, CDY, %IniFile%, NB_Vars, CDY
IniRead, CDColor1, %IniFile%, NB_Vars, CDColor1
IniRead, CDColor2, %IniFile%, NB_Vars, CDColor2
IniRead, CDKey1, %IniFile%, NB_Vars, CDKey1
IniRead, CDKey2, %IniFile%, NB_Vars, CDKey2
IniRead, CDX1, %IniFile%, NB_Vars, CDX1
IniRead, CDY1, %IniFile%, NB_Vars, CDY1
IniRead, CDColor3, %IniFile%, NB_Vars, CDColor3
IniRead, CDKey3, %IniFile%, NB_Vars, CDKey3
	
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
skill_self_check(x, y, colorid, skillKey)
{ 
  CoordMode, Pixel, Relative
  PixelGetColor, color, %x%, %y%
  ifEqual, color, %colorid%
  { 
    SendInput, {F1}
	Sleep 300
    SendInput, %skillKey%
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
; Combat Loops
;-----------------------------------
  #MaxThreadsPerHotkey 3
  $NumPad1:: 
    BreakST = 1	
    BreakAOE = 0
    Loop 
    {
	  ; check to see if we're in combat
	  PixelSearch, Px, Py, 1300, 755, 1382, 772, AttackColor, 10, fast, RGB
	  if ErrorLevel ; nope no red lettering, target is dead
        break
	  else
	  {
        skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
	    skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
	    skill_true_check(CDX, CDY, CDColor1, CDKey1)
		skill_true_check(CDX, CDY, CDColor2, CDKey2)
		skill_true_check(CDX1, CDY1, CDColor3, CDKey3)
        skill_true_check(BuffX, BuffY, FBlades, FBladesKey)
	    skill_true_check(BuffX, BuffY, HBlades, HBladesKey)
	    skill_true_check(BuffX, BuffY, PRes, PResKey)
	    ;skill_true_check(BuffX, BuffY, PRev, PRevKey)
	    CoordMode, Pixel, Relative
        PixelGetColor, color5, %FinishX%, %FinishY%
	    ifNotEqual, color5, %FinishColor%
        {
		  skill_true_check(PhantomX, PhantomY, PhantomColor, PhantomKey)
          SendInput {NumPad1} ; Main tank loop 
		}  
        Sleep 100
      }
	  if (BreakAOE = 1)
        break
    }
  BreakST = 1	
  Return
  
  $NumPad2:: 
    BreakAOE = 1  
    BreakST = 0
    SendInput {NumPad2} ; Start attack on yellow mobs
    Loop 
    {
      ; check to see if we're in combat
	  PixelSearch, Px, Py, 1300, 755, 1382, 772, AttackColor, 10, fast, RGB
	  if ErrorLevel ; nope no red lettering, target is dead
        break
	  else
	  {
	    STATE=sot
        skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
	    skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
	    skill_true_check(CDX, CDY, CDColor1, CDKey1)
	    skill_true_check(CDX, CDY, CDColor2, CDKey2)
	    skill_true_check(CDX1, CDY1, CDColor3, CDKey3)
        skill_true_check(BuffX, BuffY, FBlades, FBladesKey)
	    skill_true_check(BuffX, BuffY, HBlades, HBladesKey)
	    skill_true_check(BuffX, BuffY, PRes, PResKey)
	    ;skill_true_check(BuffX, BuffY, PRev, PRevKey)
	    CoordMode, Pixel, Relative
        PixelGetColor, color5, %FinishX%, %FinishY%
	    ifNotEqual, color5, %FinishColor%
        {
	      skill_true_check(PhantomX, PhantomY, PhantomColor, PhantomKey)
          SendInput {NumPad2} ; Main tank loop
        }		
        Sleep 100
	  }
	  if (BreakST = 1)
        break
    }
  BreakAOE = 1	
  Return
  
  
;-----------------------------------  
; Buff Up
;-----------------------------------
  $=::
    Loop 6
    {
      skill_true_check(BuffX, BuffY, FBlades, FBladesKey)
	  skill_true_check(BuffX, BuffY, HBlades, HBladesKey)
	  skill_true_check(BuffX, BuffY, PRes, PResKey)
	  skill_true_check(BuffX, BuffY, PRev, PRevKey)
	  Sleep 1000
    }  
  Return
}  