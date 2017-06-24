#ifWinActive World of Warcraft 
{
  ~RControl::Suspend, Toggle
  ~$LButton::
  MouseGetPos, VarX, VarY
  If (VarX<410) or (VarX>905) or (VarY<690) or (VarY>790)
    Return
  Loop 
  {
    If not GetKeyState("LButton", "P")
      Break
    Send {Click} ;Main Healing Rotation
    Sleep 1
  }
  Return

  ~$RButton::
  MouseGetPos, VarX, VarY
  If (VarX<410) or (VarX>905) or (VarY<690) or (VarY>790)
    Return
  Loop 
  {
    If not GetKeyState("RButton", "P")
      Break
    Send {Click right} ;Spam Nourish
    Sleep 1
  }
  Return

  $Numpad2::
  Loop 
  {
    If not GetKeyState("Numpad2", "P")
      break
    Send ^{Click right} ;Roll LB/Rejuv
    MouseGetPos, VarX, VarY
    If (VarX<410) or (VarX>905) or (VarY<690) or (VarY>790)
      Break
    Sleep 1
  }
  Return
}