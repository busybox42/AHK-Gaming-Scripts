#ifWinActive World of Warcraft 
{
  ~RControl::Suspend, Toggle
  $3::
  Loop 
  {
    if not GetKeyState("3", "P")
      break
    Send 3 ; Main tank loop 
    sleep 1
  }
  return
  
  $4::
  Loop 
  {
    if not GetKeyState("4", "P")
      break
    Send 4 ; Swipe only loop
    sleep 1
  }
  return
}


