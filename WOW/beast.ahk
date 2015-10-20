
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
			PixelGetColor, color1, 1141, 875
			ifNotEqual, color1, 0x000000	
			{
				Send, -
				sleep 200
			}
			SendInput, =
			SendInput {NumPad4}
			SendInput 6
			SendInput 7
			SendInput 0
			sleep 300
			SendInput 4
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
			PixelGetColor, color1, 1141, 875
			ifNotEqual, color1, 0x000000	
			{
				Send, -
				sleep 200
			}
			SendInput, =			
			SendInput {NumPad5}
			SendInput 6
			SendInput 7
			SendInput 0
			sleep 300
			SendInput 4
			SendInput 8
		}
	}
	Return	
}