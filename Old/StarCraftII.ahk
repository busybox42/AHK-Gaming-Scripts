#ifWinActive StarCraft II
{
  $Numpad2::
  Loop 
  {
    if not GetKeyState("Numpad2", "P")
      break
    Send {Up}
  }
  return
  
  $Numpad8::
  Loop 
  {
    if not GetKeyState("Numpad8", "P")
      break
    Send {Down} 
  }
  return

  $Numpad4::
  Loop 
  {
    if not GetKeyState("Numpad4", "P")
      break
    Send {Left} 
  }
  return

  $Numpad6::
  Loop 
  {
    if not GetKeyState("Numpad6", "P")
      break
    Send {Right} 
  }
  return

  $w::
  Loop 
  {
    if not GetKeyState("w", "P")
      break
    Send {Up}
  }
  return
  
  $s::
  Loop 
  {
    if not GetKeyState("s", "P")
      break
    Send {Down} 
  }
  return

  $a::
  Loop 
  {
    if not GetKeyState("a", "P")
      break
    Send {Left} 
  }
  return

  $d::
  Loop 
  {
    if not GetKeyState("d", "P")
      break
    Send {Right} 
  }
  return
  ~RControl::Suspend, Toggle


}


