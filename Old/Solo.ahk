/*
-----------------------------------
-=: Alan's Solo Sin/RS/BD Macro :=-
-----------------------------------
Hotkeys:
-----------------------------------
 1 - Mount
 2 - Instigate
 3 - Malicious Strike
 4 - Cut and Run
 5 - Planar Disruption
 6 - Stealth
 7 -
 8 -
 9 -
 0 - Phantom Blow
 - -
 = -
 NumPad1 - AOE Combo Builder Macro
 NumPad2 - Single Target Combo Builder Macro
 NumPad3 - Poison Malice
 NumPad4 - Port to Target Macro
 NumPad5 - Deadly Strike
 NumPad6 - Shift Macro
 NumPad7 - Phase Macro
 NumPad8 - Compound Attack
 NumPad9 - Side Step
 NumPad- 0 Final Blow
 NumPad- - Guarded Steel
 NumPad+ - Annihilate
 Crtl1 -
 Crtl2 -
 Crtl3 -
 Crtl4 -
 Crtl5 -
 Crtl6 -
 Crtl7 -
 Crtl8 - Virulent Poison
 Crtl9 - Planar Reversal
 Crtl0 - Lethal Poison
 Crtl- - Leeching Poison
 Crtl= - Combat Preparation
 -----------------------------------
*/

;-----------------------------------
; Save Last Spec Played
;-----------------------------------
if FileExist("C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp")
   FileDelete, C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp
FileAppend, Solo, C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp

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
; Solo Vars
IniRead, FinisherKey, %IniFile%, Solo_Vars, FinisherKey
IniRead, FinisherAOEKey, %IniFile%, Solo_Vars, FinisherAOEKey
IniRead, InteruptKey, %IniFile%, Solo_Vars, InteruptKey
IniRead, PhantomColor, %IniFile%, Solo_Vars, PhantomColor
IniRead, PhantomX, %IniFile%, Solo_Vars, PhantomX
IniRead, PhantomY, %IniFile%, Solo_Vars, PhantomY
IniRead, PhantomKey, %IniFile%, Solo_Vars, PhantomKey
IniRead, BuffX, %IniFile%, Solo_Vars, BuffX
IniRead, BuffY, %IniFile%, Solo_Vars, BuffY
IniRead, L1Poison, %IniFile%, Solo_Vars, L1Poison
IniRead, L1PoisonKey, %IniFile%, Solo_Vars, L1PoisonKey
IniRead, L2Poison, %IniFile%, Solo_Vars, L2Poison
IniRead, L2PoisonKey, %IniFile%, Solo_Vars, L2PoisonKey
IniRead, PRes, %IniFile%, Solo_Vars, PRes
IniRead, PResKey, %IniFile%, Solo_Vars, PResKey
IniRead, PRev, %IniFile%, Solo_Vars, PRev
IniRead, PRevKey, %IniFile%, Solo_Vars, PRevKey
IniRead, ComRes, %IniFile%, Solo_Vars, ComRes
IniRead, ComResKey, %IniFile%, Solo_Vars, ComResKey
IniRead, PhaseX, %IniFile%, Solo_Vars, PhaseX
IniRead, PhaseY, %IniFile%, Solo_Vars, PhaseY
IniRead, Phase, %IniFile%, Solo_Vars, Phase
IniRead, PhaseKey, %IniFile%, Solo_Vars, PhaseKey

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
  ;MSgBox %color%
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
	Sleep 100
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
        skill_true_check(FinishX, FinishY, FinishColor, FinisherAOEKey)
	    skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
	    skill_true_check(BuffX, BuffY, L1Poison, L1PoisonKey)
	    skill_true_check(BuffX, BuffY, L2Poison, L2PoisonKey)
	    skill_true_check(BuffX, BuffY, PRes, PResKey)
	    skill_true_check(BuffX, BuffY, PRev, PRevKey)
	    skill_self_check(BuffX, BuffY, ComRes, ComResKey)
	    skill_false_check(PhaseX, PhaseY, Phase, PhaseKey)
		skill_true_check(PhantomX, PhantomY, PhantomColor, PhantomKey)
        Send {NumPad1} ; Main tank loop
	  
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
        skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
	    skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
	    skill_true_check(BuffX, BuffY, L1Poison, L1PoisonKey)
	    skill_true_check(BuffX, BuffY, L2Poison, L2PoisonKey)
	    skill_true_check(BuffX, BuffY, PRes, PResKey)
	    skill_true_check(BuffX, BuffY, PRev, PRevKey)
	    skill_self_check(BuffX, BuffY, ComRes, ComResKey)
	    skill_false_check(PhaseX, PhaseY, Phase, PhaseKey)
	    CoordMode, Pixel, Relative
        PixelGetColor, color5, %FinishX%, %FinishY%
	    ifEqual, color5, %FinishColor%
        {	  
	      skill_true_check(PhantomX, PhantomY, PhantomColor, PhantomKey)
          Send {NumPad2} ; Main tank loop
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
      skill_true_check(BuffX, BuffY, L1Poison, L1PoisonKey)
	  skill_true_check(BuffX, BuffY, L2Poison, L2PoisonKey)
	  skill_true_check(BuffX, BuffY, PRes, PResKey)
	  skill_true_check(BuffX, BuffY, PRev, PRevKey)
	  skill_self_check(BuffX, BuffY, ComRes, ComResKey)
	  skill_false_check(PhaseX, PhaseY, Phase, PhaseKey)
	  Sleep 1000
    }  
  Return
}  