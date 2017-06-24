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
    Send 7
    Sleep 1000
    Send 8 
    Sleep 1000
    Send 9
    Sleep 1000
    Send 0
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