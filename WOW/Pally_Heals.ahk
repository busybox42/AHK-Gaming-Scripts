
Pause::Pause
Xbutton2::Reload
#MaxThreads 1
#ifWinActive World of Warcraft 
{	
~$LButton::
	MouseGetPos, VarX, VarY
	If (VarX<781) or (VarX>1155) or (VarY<707) or (VarY>909)
		Return
	Loop 
	{
		if not GetKeyState("LButton", "P")
			break
		else	
		{
			PixelGetColor, color1, 1175, 868
			ifNotEqual, color1, 0x000000	
			{
				sleep 100
				ifNotEqual, color1, 0x000000
				{
					Send, =
				}
			}					
			Send {Click}
			Sleep 500
			SendInput 2			
		}
	}
	Return
~$RButton::
	MouseGetPos, VarX, VarY
	If (VarX<781) or (VarX>1155) or (VarY<707) or (VarY>909)
		Return
	Loop 
	{
		if not GetKeyState("RButton", "P")
			break
		else	
		{		
			PixelGetColor, color1, 1175, 868
			ifNotEqual, color1, 0x000000	
			{
				sleep 100
				ifNotEqual, color1, 0x000000
				{
					Send, =
				}
			}			
			Send {Click Right}
			Sleep 500
			SendInput 2	
		}
	}
	Return	
}