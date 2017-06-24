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

; Start Rift if it's not Running.
SetTimer, CheckExists, 86400000
CheckExists:
  IfWinNotExist, RIFT
    {
    Run, C:\Program Files (x86)\RIFT Game\riftpatchlive.exe
    Sleep 4000
    SendInput Kal10w3n
    SendInput {!}
    Sleep 1000
    SendInput {Enter}
    Sleep 1000
    Click 537,517
    }
; Run if Rift is in the forground
#ifWinActive RIFT
  {
  ; Set AHK process to high priority
  ;Process, Priority, , High  
  ; Toggle Macro 
  ~RControl::Suspend, Toggle

;Change Scripts 
$+1::
  Loop 
    {
    If not (GetKeyState("Shift") and GetKeyState("1", "P"))
      break
    SendInput, +1
    Run C:\Users\Alan\Documents\AutoHotKey Macros\Bard_PVPnew.ahk
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
    Run C:\Users\Alan\Documents\AutoHotKey Macros\Bard_New.ahk
    ExitApp
    }
  Return

  ; Mount and break Motif Rotation
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
; Combo Builder Loop
$NumPad2::
  Loop 
  {
    if not GetKeyState("NumPad2", "P")
      break
	; Hit Finisher if 5 Combo Points  
	CoordMode, Pixel ,Relative
    PixelGetColor, color, 1003, 638
	if (color = "0xFDF5E1")
	  {
	  SendInput {NumPad5}
	  }
	; Interupt Target if Able  
	CoordMode, Pixel ,Relative
    PixelGetColor, color1, 672, 753
	if (color1 = "0xF0F0F0" or color1 = "0xDCDCDC" or color1 = "0xDFDFDF")
	  {
	  SendInput 5
	  }  
    Send {NumPad2}  
    Sleep 300
  }

  ; Buff Up
  $=::
  Loop 
    {
    If not GetKeyState("=", "P")
      break

    SendInput ^8
    Sleep 1000
    SendInput ^9
    Sleep 1000
    SendInput ^-
    Sleep 1000
    SendInput -
    Sleep 1000
    SendInput, =
    
    }
  Return

  ; Motif Rotation
  $LALT::
  Loop
    {
    If not GetKeyState("LALT", "P")
      break
    SendInput ^{NumPad1}
    Sleep 1000
    SendInput ^{NumPad2}
    Sleep 1000
    SendInput ^{NumPad3}
    Sleep 1000
    SendInput ^{NumPad4}
    Sleep 1000
    SendInput ^{NumPad5} 
    }
  Return

  ; Auto Motif Rotation
  #MaxThreadsPerHotkey 3
  XButton1::
  #MaxThreadsPerHotkey 1
  if BreakTrue 
    {
    BreakTrue := 0
	return
	}
	BreakTrue := 1
  Loop 
    {
	CoordMode, Pixel ,Relative
    PixelGetColor, color, 613, 534
	
	if (color = "0x017019" or color = "0x088926")
      {
	  SendInput ^{NumPad1}
	  Sleep 1000
	  }
	else if (color = "0x076B4F" or color = "0x3EF6CF")
      {
	  SendInput ^{NumPad2}
	  Sleep 1000
	  }
    else if (color = "0x007B9D" or color = "0x10E5FA")
      {
	  SendInput ^{NumPad3}
	  Sleep 1000
	  }  
	else if (color = "0xB60B4E" or color = "0xF88EE8")
      {
	  SendInput ^{NumPad4}
	  Sleep 1000
	  }
	else if (color = "0x0229A7" or color = "0x8CE3FF")
      {
	  SendInput ^{NumPad5}
	  Sleep 1000
	  }
      Sleep 100	  
	  ;MsgBox %color%
    if not BreakTrue
	  break
    }
	BreakTrue := 1
  Return
  
  }