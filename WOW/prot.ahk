
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
			PixelGetColor, color1, 1141, 875
			ifNotEqual, color1, 0x000000	
			{
				Send, -
				sleep 200
			}
			PixelGetColor, color2, 1141, 875
			ifNotEqual, color2, 0x000000	
			{
				Send, =
				sleep 200
			}
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
			Sleep 100
			PixelGetColor, color1, 1141, 875
			ifNotEqual, color1, 0x000000	
			{
				Send, -
				sleep 200
			}
			PixelGetColor, color2, 1141, 875
			ifNotEqual, color2, 0x000000	
			{
				Send, =
				sleep 200
			}
		}
	}
	Return
}