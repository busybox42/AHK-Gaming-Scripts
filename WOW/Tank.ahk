
Pause::Pause
Xbutton2::Reload
#MaxThreads 1
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
			PixelGetColor, color1, 1175, 868
			ifNotEqual, color1, 0x000000	
			{
				sleep 100
				ifNotEqual, color1, 0x000000
				{
					Send, =
				}
			}
			Sleep 100
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
			PixelGetColor, color1, 1175, 868
			ifNotEqual, color1, 0x000000	
			{
				sleep 100
				ifNotEqual, color1, 0x000000
				{			
					Send, =
				}
			}			
			Sleep 100
		}
	}
	Return	
$NumPad7::
	Loop 
	{
		if not GetKeyState("NumPad7", "P")
			break
		else	
		{		
			SendInput {NumPad7}	
			PixelGetColor, color1, 1175, 868
			ifNotEqual, color1, 0x000000	
			{
				sleep 100
				ifNotEqual, color1, 0x000000
				{			
					Send, =
				}
			}
			Sleep 100
		}
	}
	Return	
}
