;  -=: Alan's Bard AHK Macro :=-
; --------------------------------
; Hotkeys:
; --------------------------------
; 1  Mount
; 2  Verse of Capitvation
; 3  Verse of Fascination
; 4  Virtuoso
; 5  Verse of Vitality
; 6  Verse of Joy
; 7  Power Chord
; 8  Cadence
; 9  Hellfire Blades
; 0  Fanfare of Knowledge
; -  Fanfare of Power
; =  Fanfare of Vigor
; --------------------------------
; NumPad1  Coda of Restoration
; NumPad2  Firey Strike
; NumPad3  Riff
; NumPad4  Coda of Distress
; NumPad5  Coda of Cowardice
; NumPad6  Coda of Fury
; NumPad7  Side Step / Hsadow Shift
; NumPad8  Coda of Wrath
; NumPad9  Anthem of Fervor
; NumPad0  Anthem of Competence
; NumPad-  Anthem of Glory
; NumPad+  Anthem of Defiance
; --------------------------------
; ^1  Motif of Regeneration
; ^2  Motif of Grandeur
; ^3  Motif of Tenacity
; ^4  Motif of Focus
; ^5  Motif of Bravery
; ^6  Motif of Encouragement
; ^7  
; ^8  
; ^9  
; ^0  
; ^-  Party Invite
; ^=  Shrouded Rune 
; --------------------------------


;Change Scripts with F keys
$RALT::
;Run C:\Users\Alan\Documents\Bard_Sab.ahk
Run C:\Users\Alan\Documents\Bard_PVP.ahk
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
    SendInput {NumPad1}
    Sleep 300
    SendInput 7
    Sleep 3000
    SendInput 7
    Sleep 2000
    SendInput {NumPad1}
 
    }
  Return
 
  ; Firey Strike & Head Shot
;  $NumPad2::
;  Loop 
;    {
;    If not GetKeyState("NumPad2", "P")
;      break
;    SendInput {NumPad1}
;    Sleep 300
;    SendInput {NumPad2}
;    Sleep 1000
;    SendInput {NumPad2}
;    Sleep 1000
;    SendInput {NumPad2}
;    Sleep 1000
;    SendInput {NumPad2}
;    Sleep 1000
;    SendInput {NumPad2}     
;    Sleep 1500
;    SendInput {NumPad1}
;    }
;  Return

  ; Emergncy Heal  
  $NumPad3::
  Loop 
    {
    If not GetKeyState("NumPad3", "P")
      break
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
    SendInput {NumPad4}
    Sleep 300
    SendInput 7
    Sleep 3000
    SendInput 7
    Sleep 2000
    SendInput {NumPad4}
    }
  Return

  ; Cadence & Cowardance sequence
  $NumPad7::
  Loop 
    {
    If not GetKeyState("NumPad7", "P")
      break
    SendInput {NumPad7}
    Sleep 300
    SendInput 7
    Sleep 3000
    SendInput 7
    Sleep 2000
    SendInput {NumPad7}
    }
  Return

  ; Cadence & Wrath sequence
  $NumPad8::
  Loop 
    {
    If not GetKeyState("NumPad8", "P")
      break
    SendInput {NumPad8}
    Sleep 300
    SendInput 7 
    Sleep 3000
    SendInput 7
    Sleep 2000
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
  
  ; Hellfire Blades & knowledge
  $-::
  Loop 
    {
    If not GetKeyState("-", "P")
      break
    SendInput ^9
    Sleep 1000
    SendInput 8
    Sleep 1000
    SendInput 9
    Sleep 1000
    SendInput 0
    Sleep 1000
    SendInput - 
    }
  Return

  ; Hellfire Blades & Power
  $=::
  Loop 
    {
    If not GetKeyState("=", "P")
      break
    SendInput ^9
    Sleep 1000
    SendInput 8
    Sleep 1000
    SendInput 9
    Sleep 1000
    SendInput 0
    Sleep 1000
    SendInput =
    }
  Return


  ; Motif Rotation
  $LALT::
  Loop
    {
    If not GetKeyState("LALT", "P")
      break
    SendInput ^1
    Sleep 1000
    SendInput ^2
    Sleep 1000
    SendInput ^3
    Sleep 1000
    SendInput ^4
    Sleep 1000
    SendInput ^5 
    }
  Return

  ; Auto Motif Rotation
  RShift::
  Loop 
    {
    if BreakTrue 
      {
      BreakTrue =
      Break
      }
    SendInput ^1
    Sleep 1000
    SendInput ^2
    Sleep 1000
    SendInput ^3
    Sleep 1000
    SendInput ^4
    Sleep 1000
    SendInput ^5
    Sleep 24000 
    }
  Return
  ; Suspend Motif Rotation
  ;LControl:: BreakTrue = 1
  }