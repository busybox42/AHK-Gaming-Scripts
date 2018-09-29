
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
			; Interupt
			PixelGetColor, color1,720, 965
			ifNotEqual, color1, 0x000000	
			{
				sleep 10
				ifNotEqual, color1, 0x000000
				{
					Send, =
				}
			}		
			; Hand of Gul'dan if more than 4 soul shards
			PixelGetColor, color2,515, 1005
			ifNotEqual, color2, 0x000000	
			{
				Sleep 100
				Send, 9
			}
			; Cast Demonbolt if Demon Core is up
			PixelGetColor, color3,515, 965
			ifNotEqual, color3, 0x000000	
			{
				Sleep 100
				Send, 8
			}			
			SendInput {NumPad4}
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
			; Interupt
			PixelGetColor, color1,720, 965
			ifNotEqual, color1, 0x000000	
			{
				sleep 10
				ifNotEqual, color1, 0x000000
				{
					Send, =
				}
			}		
			; Hand of Gul'dan if more than 4 soul shards
			PixelGetColor, color2,515, 1005
			ifNotEqual, color2, 0x000000	
			{
				Sleep 100
				Send, 9
				sleep 1300
				SendInput {NumPad5}
			}
			; Cast Demonbolt if Demon Core is up
			PixelGetColor, color3,515, 965
			ifNotEqual, color3, 0x000000	
			{
				Sleep 100
				Send, 8
			}			
			SendInput {NumPad4}
			Sleep 100
		
		}
	}
	Return	
}