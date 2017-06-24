;  -=: Alan's Bard AHK Macro :=-


;Change Scripts with F keys
$RALT::
;Run C:\Users\Alan\Documents\Bard_Sab.ahk
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

  $NumPad1::
  Loop 
    {
    If not GetKeyState("NumPad1", "P")
      break
    SendInput 3
    SendInput 0
    Sleep 30
    SendInput {NumPad1}
    Sleep 1500
    SendInput 5
    Sleep 1000
    SendInput 4
    Sleep 1000
    SendInput 4
    Sleep 1000
    SendInput 4
    Sleep 1000
    SendInput 4
    Sleep 1000
    SendInput 3
 
    }
  Return

  $NumPad2::
  Loop 
    {
    If not GetKeyState("NumPad2", "P")
      break
    SendInput 3
    SendInput 0
    Sleep 300
    SendInput {NumPad1}
    Sleep 1500
    SendInput 5
    Sleep 1500
    SendInput 4
    Sleep 2000
    SendInput {NumPad2}
    Sleep 1500
    SendInput 4
    Sleep 1500
    SendInput 3
 
    }
  Return

}
 