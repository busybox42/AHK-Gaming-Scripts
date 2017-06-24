; Start SWTOR if it's not Running.
SetTimer, CheckExists, 86400000
CheckExists:
  IfWinNotExist, Star Wars: The Old Republic
    Run, C:\Program Files (x86)\Electronic Arts\BioWare\Star Wars - The Old Republic\launcher.exe

; Run if SWTOR is in the forground
;#ifWinActive Star Wars: The Old Republic
  ; Set AHK process to high priority
  ;Process, Priority, , High  
  ; Toggle Macro 
 ; ~RControl::Suspend, Toggle

  #Persistent
  SetTimer, PressSpaceBar, 300000   
  return

  PressSpaceBar:
  Send, {Space down}
  Sleep 50
  Send, {Space up}
  return