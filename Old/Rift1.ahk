#ifWinActive RIFT 
{
  ~RControl::Suspend, Toggle

  $2::
  Loop 
  {
    If not GetKeyState("2", "P")
      break
    Send 1
    Sleep 3000
    Send 2 
    Sleep 1500
    Send 8 
    Sleep 1500
    Send 3
    Sleep 3000
    Send 4
    Sleep 4000
  }
  Return
  $5::
  Loop 
  {
    If not GetKeyState("5", "P")
      break
    Send 5
    Sleep 1000
    Send 6
    Sleep 1000
  }
  Return

}