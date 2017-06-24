;  -=: Alan's Sab AHK Macro :=-
; --------------------------------


;Change Scripts with F keys
$RALT::
Run C:\Users\Alan\Documents\Bard_Nightblade.ahk
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

  ; Mount and break Motif Rotation
  $1::
  Loop 
    {
    If not GetKeyState("1", "P")
      break
    SendInput 1
    BreakTrue = 1
    Sleep 1200
    Reload
   }
  Return

  ; Range Rotations

  $NumPad1::
  Loop 
    {
    If not GetKeyState("NumPad1", "P")
      break
  SendInput 8
  Sleep 100
  SendInput {NumPad1}
  Sleep 1200
  SendInput {NumPad1}
  Sleep 1200
  SendInput {NumPad1}
  Sleep 1200
  SendInput {NumPad1}
  Sleep 1200
  SendInput {NumPad1} 
   }
  Return

  $NumPad2::
  Loop 
    {
    If not GetKeyState("NumPad2", "P")
      break
  SendInput 8
  Sleep 100
  SendInput {NumPad2}
  Sleep 1200
  SendInput {NumPad2}
  Sleep 1200
  SendInput {NumPad2}
  Sleep 1200
  SendInput {NumPad2}
  Sleep 1200
  SendInput {NumPad2}
 
   }
  Return

  $NumPad3::
  Loop 
    {
    If not GetKeyState("NumPad3", "P")
      break
  SendInput 8
  Sleep 100
  SendInput {NumPad3}
  Sleep 1200
  SendInput {NumPad3}
  Sleep 1200
  SendInput {NumPad3}
  Sleep 1200
  SendInput {NumPad3}
  Sleep 1200
  SendInput {NumPad3} 
   }
  Return

  $NumPad6::
  Loop 
    {
    If not GetKeyState("NumPad6", "P")
      break
  SendInput {NumPad6}
  Sleep 100
  SendInput {NumPad8}
  Sleep 1200
  SendInput {NumPad8}
  Sleep 1200
  SendInput {NumPad8}
  Sleep 1200
  SendInput {NumPad8}
   }
  Return

  }