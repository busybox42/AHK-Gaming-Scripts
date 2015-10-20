
Pause::Pause
Xbutton2::Reload
#MaxThreads 2
#ifWinActive World of Warcraft 
{	
$NumPad4::
	Loop 
	{
		if not GetKeyState("NumPad4", "P")
			break
		else	
		{
				
			SendInput {NumPad4}
			Sleep 100
			PixelGetColor, color4, 1141, 875
			ifNotEqual, color4, 0x000000	
			{
				Send, =
				sleep 200
			}
			SendInput 8
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
			SendInput {NumPad5}
			Sleep 500
			PixelGetColor, color4, 1141, 875
			ifNotEqual, color4, 0x000000	
			{
				Send, =
				sleep 200
			}
			SendInput 8
			SendInput {NumPad8}
		}
	}
	Return	
}