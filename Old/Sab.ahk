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
    Sleep 1000
    Reload
   }
  Return

  ; Charge rotation
  $2::
  Loop 
    {
    If not GetKeyState("2", "P")
      break
    SendInput 2
    Sleep 300
    SendInput 3
    Sleep 1000
    SendInput 4
    Sleep 1000
    SendInput 5
    Sleep 1000
    SendInput 6
    Sleep 1000
    SendInput 7
    Sleep 1000
    SendInput 2
    }
  Return

  $=::
  Loop 
    {
    If not GetKeyState("=", "P")
      break
    SendInput ^3
    Sleep 1000
    SendInput ^4
    Sleep 1000
    SendInput, =
    
    }
  Return

  }