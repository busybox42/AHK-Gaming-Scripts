#ifWinActive World of Warcraft 
{
  ~RControl::Suspend, Toggle
  $3::
  Loop 
  {
    if not GetKeyState("3", "P")
      break
    Send 3 ; Main tank loop 
    sleep 700
  }
  return
  $2::
  Loop 
  {
    if not GetKeyState("2", "P")
      break
    Send 2 ; FF demo roar 
    sleep 1000
  }
  return
  $4::
  Loop 
  {
    if not GetKeyState("4", "P")
      break
    Send 4 ; Swipe 
    sleep 10
  }
  return
  
}


