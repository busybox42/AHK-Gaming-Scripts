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
FileAppend, Tank, C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp

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
; Tank Vars
IniRead, FinisherKey, %IniFile%, Tank_Vars, FinisherKey
IniRead, InteruptKey, %IniFile%, Tank_Vars, InteruptKey
IniRead, PhantomColor, %IniFile%, Tank_Vars, PhantomColor
IniRead, PhantomX, %IniFile%, Tank_Vars, PhantomX
IniRead, PhantomY, %IniFile%, Tank_Vars, PhantomY
IniRead, PhantomKey, %IniFile%, Tank_Vars, PhantomKey
IniRead, BuffX, %IniFile%, Tank_Vars, BuffX
IniRead, BuffY, %IniFile%, Tank_Vars, BuffY
IniRead, L2Poison, %IniFile%, Tank_Vars, PInstinct
IniRead, L2PoisonKey, %IniFile%, Tank_Vars, PInstinctKey
IniRead, PRes, %IniFile%, Tank_Vars, PRes
IniRead, PResKey, %IniFile%, Tank_Vars, PResKey
IniRead, PRev, %IniFile%, Tank_Vars, PRev
IniRead, PRevKey, %IniFile%, Tank_Vars, PRevKey
IniRead, ComRes, %IniFile%, Tank_Vars, ComRes
IniRead, ComResKey, %IniFile%, Tank_Vars, ComResKey
IniRead, PhaseX, %IniFile%, Tank_Vars, PhaseX
IniRead, PhaseY, %IniFile%, Tank_Vars, PhaseY
IniRead, Phase, %IniFile%, Tank_Vars, Phase
IniRead, PhaseKey, %IniFile%, Tank_Vars, PhaseKey
IniRead, GSX, %IniFile%, Tank_Vars, GSX
IniRead, GSY, %IniFile%, Tank_Vars, GSY
IniRead, GSColor, %IniFile%, Tank_Vars, GSColor
IniRead, GSKey, %IniFile%, Tank_Vars, GSKey
IniRead, FBX, %IniFile%, Tank_Vars, FBX
IniRead, FBY, %IniFile%, Tank_Vars, FBY
IniRead, FBColor, %IniFile%, Tank_Vars, FBColor
IniRead, FBKey, %IniFile%, Tank_Vars, FBKey
IniRead, ANX, %IniFile%, Tank_Vars, ANX
IniRead, ANY, %IniFile%, Tank_Vars, ANY
IniRead, ANColor, %IniFile%, Tank_Vars, ANColor
IniRead, ANKey, %IniFile%, Tank_Vars, ANKey
IniRead, CDX, %IniFile%, Tank_Vars, CDX
IniRead, CDY, %IniFile%, Tank_Vars, CDY
IniRead, CDColor1, %IniFile%, Tank_Vars, CDColor1
IniRead, CDColor2, %IniFile%, Tank_Vars, CDColor2
IniRead, CDColor3, %IniFile%, Tank_Vars, CDColor3
IniRead, CDKey1, %IniFile%, Tank_Vars, CDKey1
IniRead, CDKey2, %IniFile%, Tank_Vars, CDKey2
IniRead, CDKey3, %IniFile%, Tank_Vars, CDKey3
IniRead, SSX, %IniFile%, Tank_Vars, SSX
IniRead, SSY, %IniFile%, Tank_Vars, SSY
IniRead, SSColor, %IniFile%, Tank_Vars, SSColor
IniRead, SSKey, %IniFile%, Tank_Vars, SSKey

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
  $NumPad1:: 
    Loop 
    {
	  ; check to see if we're in combat
	  PixelSearch, Px, Py, 893, 635, 968, 647, AttackColor, 10, fast, RGB
	  if ErrorLevel ; nope no red lettering, target is dead
        break
	  else
	  {
        CoordMode, Pixel, Relative
        PixelGetColor, color1, %GSX%, %GSY%
	    ifEqual, color1, %GSColor%
        {
          skill_false_check(FinishX, FinishY, FinishColor, GSKey)
        } 
	    CoordMode, Pixel, Relative
        PixelGetColor, color2, %FBX%, %FBY%
	    ifEqual, color2, %FBColor%
        {
          skill_false_check(FinishX, FinishY, FinishColor, FBKey)
        }
	    CoordMode, Pixel, Relative
        PixelGetColor, color3, %ANX%, %ANY%
	    ifEqual, color3, %ANColor%
        {
          skill_false_check(FinishX, FinishY, FinishColor, ANKey)
        }
        else
        {		
		  skill_false_check(FinishX, FinishY, FinishColor, FinisherKey)
	    }
		skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
		skill_true_check(CDX, CDY, CDColor1, CDKey1)
		skill_true_check(CDX, CDY, CDColor2, CDKey2)
		skill_true_check(CDX, CDY, CDColor3, CDKey3)
		skill_true_check(SSX, SSY, SSColor, SSKey)
        skill_true_check(PhantomX, PhantomY, PhantomColor, PhantomKey)
	    skill_false_check(PhaseX, PhaseY, Phase, PhaseKey)
		
        Send {NumPad1} ; Main tank loop 
        Sleep 100
      }
    }
    Return
  
$NumPad2:: 	
  SendInput {NumPad2} ; Start attack on yellow mobs
  Loop 
  {
    ; check to see if we're in combat
	PixelSearch, Px, Py, 893, 635, 968, 647, AttackColor, 10, fast, RGB
	if ErrorLevel ; nope no red lettering, target is dead
      break
	else
	{
      CoordMode, Pixel, Relative
      PixelGetColor, color1, %GSX%, %GSY%
	  ifEqual, color1, %GSColor%
      {
        skill_false_check(FinishX, FinishY, FinishColor, GSKey)
      } 
	  CoordMode, Pixel, Relative
      PixelGetColor, color2, %FBX%, %FBY%
	  ifEqual, color2, %FBColor%
      {
        skill_false_check(FinishX, FinishY, FinishColor, FBKey)
      }
	  CoordMode, Pixel, Relative
      PixelGetColor, color3, %ANX%, %ANY%
	  ifEqual, color3, %ANColor%
      {
        skill_false_check(FinishX, FinishY, FinishColor, ANKey)
      }
      else
      {	  
        skill_false_check(FinishX, FinishY, FinishColor, FinisherKey)
	  }	
	  skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
	  skill_true_check(CDX, CDY, CDColor1, CDKey1)
	  skill_true_check(CDX, CDY, CDColor2, CDKey2)
	  skill_true_check(CDX, CDY, CDColor3, CDKey3)
	  skill_true_check(SSX, SSY, SSColor, SSKey)
      skill_true_check(PhantomX, PhantomY, PhantomColor, PhantomKey)
	  skill_false_check(PhaseX, PhaseY, Phase, PhaseKey)

      Send {NumPad2} ; Main tank loop 
      Sleep 100
	}
  }
  Return
  
;-----------------------------------  
; Buff Up
;-----------------------------------
$=::
  Loop 6
  {
    skill_true_check(BuffX, BuffY, PInstinct, PInstinctKey)
	skill_true_check(BuffX, BuffY, PRes, PResKey)
	skill_true_check(BuffX, BuffY, PRev, PRevKey)
	skill_self_check(BuffX, BuffY, ComRes, ComResKey)
	skill_false_check(PhaseX, PhaseY, Phase, PhaseKey)
	Sleep 1000
  }  
  Return
}  