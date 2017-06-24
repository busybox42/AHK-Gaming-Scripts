
Pause::Pause
Xbutton2::Reload
Xbutton1::ExitApp
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
			PixelGetColor, color1,691, 1010
			ifNotEqual, color1, 0x000000	
			{
				sleep 10
				ifNotEqual, color1, 0x000000
				{
					Send, =
				}
			}
			PixelGetColor, color2, 570, 950
			ifEqual, color2, 0x000000	
			{
				PixelGetColor, color5, 566, 905
				ifNotEqual, color5, 0x000000
				{
					SendInput {Numpad8}
				}
				SendInput {NumPad4}
				PixelGetColor, color3, 685, 950
				ifNotEqual, color3, 0x000000
				{
					SendInput {NumPad9}
				}					
			}
			else
			{
				PixelGetColor, color3, 565, 1003
				ifNotEqual, color3, 0x000000
				{
					SendInput {NumpadSub}
				}
				else
				{
					SendInput {NumPad0}
				}
			}
			PixelGetColor, color4, 626, 975
			ifNotEqual, color4, 0x000000
			{
				Send, -
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
			PixelGetColor, color1,691, 1010
			ifNotEqual, color1, 0x000000	
			{
				sleep 10
				ifNotEqual, color1, 0x000000
				{
					Send, =
				}
			}
			PixelGetColor, color2, 570, 950
			ifEqual, color2, 0x000000	
			{
				PixelGetColor, color5, 566, 905
				ifNotEqual, color5, 0x000000
				{
					SendInput {Numpad8}
				}			
				SendInput {NumPad5}
				PixelGetColor, color3, 685, 950
				ifNotEqual, color3, 0x000000
				{
					SendInput {NumPad9}
				}					
			}
			else
			{
				PixelGetColor, color3, 565, 1003
				ifNotEqual, color3, 0x000000
				{
					SendInput {NumpadSub}
				}
				else
				{
					SendInput {NumPad0}
				}
			}
			PixelGetColor, color4, 626, 975
			ifNotEqual, color4, 0x000000
			{
				Send, -
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
			PixelGetColor, color1,691, 1010
			ifNotEqual, color1, 0x000000	
			{
				sleep 10
				ifNotEqual, color1, 0x000000
				{
					Send, =
				}
			}
			PixelGetColor, color2, 570, 950
			ifEqual, color2, 0x000000	
			{
				PixelGetColor, color5, 566, 905
				ifNotEqual, color5, 0x000000
				{
					SendInput {Numpad8}
				}			
				SendInput {NumPad4}
				PixelGetColor, color3, 685, 950
				ifNotEqual, color3, 0x000000
				{
					SendInput {NumPad9}
				}					
			}
			else
			{
				SendInput {NumpadSub}
			}
			PixelGetColor, color4, 626, 975
			ifNotEqual, color4, 0x000000
			{
				Send, -
			}			
			Sleep 100
		}
	}
	Return
	
$NumPad8::
	Loop 
	{
		if not GetKeyState("NumPad8", "P")
			break
		else	
		{			
			PixelGetColor, color1,691, 1010
			ifNotEqual, color1, 0x000000	
			{
				sleep 10
				ifNotEqual, color1, 0x000000
				{
					Send, =
				}
			}
			PixelGetColor, color2, 570, 950
			ifEqual, color2, 0x000000	
			{
				PixelGetColor, color5, 566, 905
				ifNotEqual, color5, 0x000000
				{
					SendInput {Numpad8}
				}			
				SendInput {NumPad5}
				PixelGetColor, color3, 685, 950
				ifNotEqual, color3, 0x000000
				{
					SendInput {NumPad9}
				}					
			}
			else
			{
				SendInput {NumpadSub}
			}
			PixelGetColor, color4, 626, 975
			ifNotEqual, color4, 0x000000
			{
				Send, -
			}			
			Sleep 100
		}
	}
	Return	


}


