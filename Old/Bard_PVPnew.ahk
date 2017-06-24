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

  ; Buffs
  $=::
  Loop 
    {
    If not GetKeyState("=", "P")
      break
    SendInput, =
    Sleep 3500
    SendInput -
    Sleep 3000
    SendInput 0
    Sleep 1000
    SendInput ^9
    Sleep 1000
    SendInput ^0  
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
    PixelGetColor, color, 618, 532
	
	if (color = "0x009021" or color = "0x0E9E36")
      {
	  SendInput ^{NumPad1}
	  Sleep 1000
	  }
	else if (color = "0x008765" or color = "0x08654A")
      {
	  SendInput ^{NumPad2}
	  Sleep 1000
	  }
    else if (color = "0x0FE3F6" or color = "0x01AAE1")
      {
	  SendInput ^{NumPad3}
	  Sleep 1000
	  }  
	else if (color = "0xC6044A" or color = "0xD4297A")
      {
	  SendInput ^{NumPad4}
	  Sleep 1000
	  }
	else if (color = "0x0034BD" or color = "0x0038C6")
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