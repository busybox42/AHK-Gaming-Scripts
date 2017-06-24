/*
-----------------------------------
-=: Alan's Solo MM/RNG/RS Macro :=-
-----------------------------------
Hotkeys:
-----------------------------------
 1 - Mount
 2 - Static Shot
 3 - Repe
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
FileAppend, MM, C:\Users\alan\Documents\AutoHotKey Macros\spec.tmp

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
IniRead, FinisherKey, %IniFile%, MM_Vars, FinisherKey
IniRead, AOEKey, %IniFile%, MM_Vars, AOEKey
IniRead, InteruptKey, %IniFile%, MM_Vars, InteruptKey
IniRead, SFColor, %IniFile%, MM_Vars, SFColor
IniRead, SFX, %IniFile%, MM_Vars, SFX
IniRead, SFY, %IniFile%, MM_Vars, SFY
IniRead, SFKey, %IniFile%, MM_Vars, SFKey
IniRead, BFColor, %IniFile%, MM_Vars, BFColor
IniRead, BFX, %IniFile%, MM_Vars, BFX
IniRead, BFY, %IniFile%, MM_Vars, BFY
IniRead, BFKey, %IniFile%, MM_Vars, BFKey
IniRead, QSColor, %IniFile%, MM_Vars, QSColor
IniRead, QSX, %IniFile%, MM_Vars, QSX
IniRead, QSY, %IniFile%, MM_Vars, QSY
IniRead, QSKey, %IniFile%, MM_Vars, QSKey
IniRead, DOSTX, %IniFile%, MM_Vars, DOSTX
IniRead, DOSTY, %IniFile%, MM_Vars, DOSTY
IniRead, DOSTColor, %IniFile%, MM_Vars, DOSTColor
IniRead, STColor, %IniFile%, MM_Vars, STColor
IniRead, STX, %IniFile%, MM_Vars, STX
IniRead, STY, %IniFile%, MM_Vars, STY
IniRead, STCDColor, %IniFile%, MM_Vars, STCDColor
IniRead, STCDX, %IniFile%, MM_Vars, STCDX
IniRead, STCDY, %IniFile%, MM_Vars, STCDY
IniRead, STKey, %IniFile%, MM_Vars, STKey
IniRead, BEColor, %IniFile%, MM_Vars, BEColor
IniRead, BEX, %IniFile%, MM_Vars, BEX
IniRead, BEY, %IniFile%, MM_Vars, BEY
IniRead, BEKey, %IniFile%, MM_Vars, BEKey
IniRead, ESColor, %IniFile%, MM_Vars, ESColor
IniRead, ESX, %IniFile%, MM_Vars, ESX
IniRead, ESY, %IniFile%, MM_Vars, ESY
IniRead, ESKey, %IniFile%, MM_Vars, ESKey
IniRead, BuffX, %IniFile%, MM_Vars, BuffX
IniRead, BuffY, %IniFile%, MM_Vars, BuffY
IniRead, PI, %IniFile%, MM_Vars, PI
IniRead, PIKey, %IniFile%, MM_Vars, PIKey
IniRead, VM, %IniFile%, MM_Vars, VM
IniRead, VMKey, %IniFile%, MM_Vars, VMKey
IniRead, EM, %IniFile%, MM_Vars, EM
IniRead, EMKey, %IniFile%, MM_Vars, EMKey
IniRead, 2PTX, %IniFile%, MM_Vars, 2PTX
IniRead, 2PTY, %IniFile%, MM_Vars, 2PTY
IniRead, 2PTColor, %IniFile%, MM_Vars, 2PTColor


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
  ;MsgBox %color%
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
  ; Set AHK process to high priority
  ;Process, Priority, , High  
  

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
  ; AOE Loop
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
	    ; If we need Beastial Fury finish with Head Shot
	    CoordMode, Pixel, Relative
        PixelGetColor, color1, %BFX%, %BFY%
	    ifEqual, color1, %BFColor%
        {
          ;skill_false_check(FinishX, FinishY, FinishColor, BFKey)
		}
        else 
        {
          ;skill_false_check(FinishX, FinishY, FinishColor, FinisherKey)
        }		  
        skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
	    skill_true_check(BuffX, BuffY, VM, VMKey)
		skill_true_check(BuffX, BuffY, EM, EMKey)
        Send {NumPad1} ; AOE Macro		
        Sleep 100
      }
	  if (BreakAOE = 1)
        break
    }
  BreakST = 1	
  Return
  
  ; Single Target Macro
  $NumPad2::
    BreakAOE = 1  
    BreakST = 0
	
    ; Start attack on yellow mobs
    SendInput {NumPad2} 
    Loop 
    {
      ; check to see if we're in combat
	  PixelSearch, Px, Py, 1300, 755, 1382, 772, AttackColor, 10, fast, RGB
	  if ErrorLevel ; nope no red lettering, target is dead
        break
	  else
	  {
	  	CoordMode, Pixel, Relative
        PixelGetColor, color3, %DOSTX%, %DOSTY%
	    ifEqual, color3, %DOSTColor%
	    {
	      CoordMode, Pixel, Relative
          PixelGetColor, color2, %STX%, %STY%
	      ifEqual, color2, %STColor%
		  {
	        Sleep 1000
            skill_true_check(STX, STY, STColor, STKey)
		    Sleep 1000
		    CoordMode, Pixel, Relative
		    PixelGetColor, color3, %STCDX%, %STCDY%
		    ifEqual, color3, %STCDColor%
		    {
		      Sleep 3000
		    }	
		  }
	    }
	    ; If we need Beastial Fury finish with Head Shot 
	    CoordMode, Pixel, Relative
        PixelGetColor, color1, %BFX%, %BFY%
	    ifEqual, color1, %BFColor%
        {
		  ; If  we have 5 combo points see if we have bull's eye up
		  CoordMode, Pixel, Relative
          PixelGetColor, color6, %FinishX%, %FinishY%
	      ifEqual, color6, %FinishColor%
          {
            skill_true_check(BEX, BEY, BEColor, BEKey)
			Sleep 500
          }	
          skill_true_check(FinishX, FinishY, FinishColor, BFKey)
		  skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
		  ; Don't waste two combo point abilities
		  CoordMode, Pixel, Relative
          PixelGetColor, color4, %2PTX%, %2PTY%
	      ifEqual, color4, %2PTColor%
		  {
		    skill_true_check(SFX, SFY, SFColor, SFKey)
		    skill_true_check(ESX, ESY, ESColor, ESKey)
		  }
		  ; If  we do not have 5 combo points do abilities
		  CoordMode, Pixel, Relative
          PixelGetColor, color5, %FinishX%, %FinishY%
	      ifNotEqual, color5, %FinishColor%
          {
		    skill_true_check(QSX, QSY, QSColor, QSKey)
		    ;skill_true_check(BEX, BEY, BEColor, BEKey)
	        ;skill_true_check(BuffX, BuffY, PI, PIKey)
	        skill_true_check(BuffX, BuffY, VM, VMKey)
		    skill_true_check(BuffX, BuffY, EM, EMKey)
		    Send {NumPad2} ; Main tank loop
			Sleep 100
		  }
	    }
        else 
        {
		  ; If  we have 5 combo points see if we have bull's eye up
		  CoordMode, Pixel, Relative
          PixelGetColor, color6, %FinishX%, %FinishY%
	      ifEqual, color6, %FinishColor%
          {
            skill_true_check(BEX, BEY, BEColor, BEKey)
			Sleep 500
          }			
          skill_true_check(FinishX, FinishY, FinishColor, FinisherKey)
		  skill_false_check(InteruptX, InteruptY, InteruptColor, InteruptKey)
		  ; Don't waste two combo point abilities
		  CoordMode, Pixel, Relative
          PixelGetColor, color4, %2PTX%, %2PTY%
	      ifEqual, color4, %2PTColor%
		  {
		    skill_true_check(SFX, SFY, SFColor, SFKey)
		    skill_true_check(ESX, ESY, ESColor, ESKey)
		  }
		  ; If  we do not have 5 combo points do abilities
		  CoordMode, Pixel, Relative
          PixelGetColor, color5, %FinishX%, %FinishY%
	      ifNotEqual, color5, %FinishColor%
          {
		    skill_true_check(QSX, QSY, QSColor, QSKey)
		    ;skill_true_check(BuffX, BuffY, PI, PIKey)
	        skill_true_check(BuffX, BuffY, VM, VMKey)
		    skill_true_check(BuffX, BuffY, EM, EMKey)
		    Send {NumPad2} ; Main tank loop
			Sleep 100
          }		  
        }	  
        
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
    SendInput {F1}
	SendInput, =
    Loop 6
    {
	  skill_true_check(BuffX, BuffY, PI, PIKey)
	  skill_true_check(BuffX, BuffY, VM, VMKey)
	  skill_true_check(BuffX, BuffY, EM, EMKey)
	  Sleep 1000
    }  
  Return
}  