;  -=: Alan's Bard AHK Macro :=-
; --------------------------------
; Hotkeys:
; --------------------------------
; 1  Mount
; 2  Motif of Regeneration
; 3  Motif of Tenacity
; 4  Motif of Focus
; 5  Motif of Tenacity
; 6  Motrif of Bravery
; 7  Power Chord
; 8  Cadence
; 9  Verse of Fascination
; 0 
; -  Fanfare of Power
; =  Fanfare of Vigor
; --------------------------------
; NumPad1  Coda of Restoration
; NumPad2  Firey Strike
; NumPad3  Riff
; NumPad4  Coda of Distress
; NumPad5  Coda of Cowardice
; NumPad6  Coda of Fury
; NumPad7  Head Shot
; NumPad8  Coda of Wrath
; NumPad9  Hellfire Blades
; NumPad0  Anthem of Competence
; NumPad-  Anthem of Glory
; NumPad+  Anthem of Defiance
; --------------------------------

;Change Scripts with F keys
RALT::
Run C:\Users\Alan\Documents\Bard_Sab.ahk
ExitApp
return

; Start Rift if it's not Running.
SetTimer, CheckExists, 86400000
CheckExists:
  IfWinNotExist, RIFT
    Run, C:\Program Files (x86)\RIFT\riftpatchbeta.exe

; Run if Rift is in the forground
#ifWinActive RIFT
  {
  ; Set AHK process to high priority
  ;Process, Priority, , High  
  ; Toggle Macro 
  ~RControl::Suspend, Toggle

  ; Cadence & Restoration sequence
  $NumPad1::
  Loop 
    {
    If not GetKeyState("NumPad1", "P")
      break

    SendInput ^0
    SendInput {NumPad1}
    Sleep 300
    SendInput 8
    Sleep 3000
    SendInput 7
    Sleep 1000
    SendInput {NumPad1}
    }
  Return
 
  ; Firey Strike & Head Shot
  $NumPad2::
  Loop 
    {
    If not GetKeyState("NumPad2", "P")
      break
    
    SendInput ^0
    SendInput {NumPad7}
    Sleep 300
    SendInput {NumPad2}
    Sleep 1000
    SendInput {NumPad2}
    Sleep 1000
    SendInput {NumPad2}
    Sleep 1500
    SendInput 7 
    Sleep 1500
    SendInput {NumPad7}
    }
  Return

  ; Emergncy Heal  
  $NumPad3::
  Loop 
    {
    If not GetKeyState("NumPad3", "P")
      break
    
    SendInput ^0
    SendInput {NumPad1}
    Sleep 300
    SendInput {NumPad3}
    Sleep 1000
    SendInput {NumPad1}
    }
  Return

  ; Cadence & Distress sequence  
  $NumPad4::
  Loop 
    {
    If not GetKeyState("NumPad4", "P")
      break
    
    SendInput ^0
    SendInput {NumPad4}
    Sleep 300
    SendInput 8
    Sleep 3000
    SendInput 7
    Sleep 3000
    SendInput {NumPad4}
    }
  Return

  ; Cadence & Cowardance sequence
  $NumPad5::
  Loop 
    {
    If not GetKeyState("NumPad5", "P")
      break
    
    SendInput ^0
    SendInput {NumPad5}
    Sleep 300
    SendInput 8
    Sleep 3000
    SendInput 7
    Sleep 3000
    SendInput {NumPad5}
    }
  Return

  ; Cadence & Fury sequence
  $NumPad6::
  Loop 
    {
    If not GetKeyState("NumPad6", "P")
      break
    
    SendInput ^0
    SendInput {NumPad6}
    Sleep 300
    SendInput 8
    Sleep 3000
    SendInput 7
    Sleep 3000
    SendInput {NumPad6}
    }
  Return

  ; Cadence & Head Shot
  $NumPad7::
  Loop 
    {
    If not GetKeyState("NumPad7", "P")
      break
    
    SendInput ^0
    SendInput {NumPad7}
    Sleep 300
    SendInput 8 
    Sleep 3000
    SendInput 7
    Sleep 1500
    SendInput {NumPad7}
    }
  Return

  ; Cadence & Wrath sequence
  $NumPad8::
  Loop 
    {
    If not GetKeyState("NumPad8", "P")
      break
    
    SendInput ^0
    SendInput {NumPad8}
    Sleep 300
    SendInput 8 
    Sleep 3000
    SendInput 7
    Sleep 1500
    SendInput {NumPad8}
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

  ; Hellfire Blades & Power
  $-::
  Loop 
    {
    If not GetKeyState("-", "P")
      break
    SendInput {NumPad9}
    Sleep 1000
    SendInput - 
    }
  Return

  ; Hellfire Blades Vigor
  $=::
  Loop 
    {
    If not GetKeyState("=", "P")
      break
    SendInput {NumPad9}
    Sleep 1000
    SendInput, =
    
    }
  Return
  
  ; Motif Rotation
  RShift::
  Loop 
    {
    if BreakTrue 
      {
      BreakTrue =
      Break
      }
    SendInput 2
    Sleep 1000
    SendInput 3
    Sleep 1000
    SendInput 4
    Sleep 1000
    SendInput 5
    Sleep 1000
    SendInput 6
    Sleep 24000 
    }
  Return
  ; Suspend Motif Rotation
  LControl:: BreakTrue = 1
  }