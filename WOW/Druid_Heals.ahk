
Pause::Pause
Xbutton2::Reload
Xbutton1::ExitApp
#MaxThreads 1
#ifWinActive World of Warcraft 
{	
~$LButton::
	Loop
	{
		MouseGetPos, VarX, VarY
		If (VarX<777) or (VarX>1162) or (VarY<703) or (VarY>923)
			Return
		if not GetKeyState("LButton", "P")
			break
		else	
		{
			; Lifebloom focus
			PixelGetColor, color1, 515, 1005
			ifEqual, color1, 0x000000	
			{
				sleep 100
				Send, 7
			}
			; Direct Heal
			PixelGetColor, color1, 510, 970
			ifNotEqual, color1, 0x000000	
			{
				sleep 100
				SendInput {NumPad7}
			}			
			Send {Click}
			Sleep 500		
		}
	}
	Return
~$RButton::
	Loop 
	{
		MouseGetPos, VarX, VarY
		If (VarX<777) or (VarX>1162) or (VarY<703) or (VarY>923)
			Return
		if not GetKeyState("RButton", "P")
			break
		else		
		{
			; Lifebloom focus
			PixelGetColor, color1, 515, 1005
			ifEqual, color1, 0x000000	
			{
				sleep 100
				Send, 7
			}
			; Direct Heal
			PixelGetColor, color1, 510, 970
			ifNotEqual, color1, 0x000000	
			{
				sleep 100
				SendInput {NumPad7}
			}		
			Send {Click Right}
			Sleep 500
		}
	}
	Return
$NumPad5::
	Loop 
	{
		if not GetKeyState("NumPad5", "P")
			break
		else	
		{
			; Lifebloom focus
			PixelGetColor, color1, 515, 1005
			ifEqual, color1, 0x000000	
			{
				sleep 100
				Send, 7
			}
			SendInput {NumPad5}
			Sleep 100
		}
	}
	Return
}