#ifWinActive RIFT 
{
  ~RControl::Suspend, Toggle

  $2::
  Loop 
  {
    If not GetKeyState("2", "P")
      break
    Send 2 
    Sleep 1000
    Send 5
    Sleep 1000
    Send 1 
    Sleep 1000
    Send 2
    Sleep 1000
 
  }
  Return
  $3::
  Loop 
  {
    If not GetKeyState("3", "P")
      break
    Send 3
    Sleep 1
  }
  Return
  $4::
  Loop 
  {
    If not GetKeyState("4", "P")
      break
    Send 4
    Sleep 1
  }
  Return
}