
Pause::Pause
Xbutton2::Reload
Xbutton1::ExitApp
#MaxThreads 1
#ifWinActive World of Warcraft 
{
$NumPad1::
	Loop 
	{
		if not GetKeyState("NumPad1", "P")
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
			PixelGetColor, color2,578, 1007
			ifNotEqual, color2, 0x000000	
			{
				sleep 50
				SendInput {NumPad1}
				Sleep 10
				SendInput {Click}
			}
			else {
				PixelGetColor, color3,581, 950
				ifNotEqual, color3, 0x000000	
				{
					SendInput {NumPad9}
				}
				SendInput {NumPad4}
			}	
			Sleep 10
		}
	}
	Return

$NumPad2::
	Loop 
	{
		if not GetKeyState("NumPad2", "P")
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
			PixelGetColor, color2,578, 1007
			ifNotEqual, color2, 0x000000	
			{
				sleep 50
				SendInput {NumPad2}
			}
			else {
				PixelGetColor, color3,581, 950
				ifNotEqual, color3, 0x000000	
				{
					SendInput {NumPad9}
				}
				SendInput {NumPad0}
			}	
			Sleep 10
		}
	}
	Return	
	
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
			PixelGetColor, color2,578, 1007
			ifNotEqual, color2, 0x000000	
			{
				sleep 50
				SendInput {NumPad2}
			}
			else {
				PixelGetColor, color3,581, 950
				ifNotEqual, color3, 0x000000	
				{
					SendInput {NumPad9}
				}
				SendInput {NumPad4}
			}	
			Sleep 10
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
			PixelGetColor, color2,578, 1007
			ifNotEqual, color2, 0x000000	
			{
				sleep 50
				SendInput {NumPad2}
			}
			else {
				PixelGetColor, color3,581, 950
				ifNotEqual, color3, 0x000000	
				{
					SendInput {NumPad9}
				}
				SendInput {NumPad5}
			}	
			Sleep 10
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
			PixelGetColor, color2,578, 1007
			ifNotEqual, color2, 0x000000	
			{
				sleep 50
				SendInput {NumPad2}
			}
			else {
				PixelGetColor, color3,581, 950
				ifNotEqual, color3, 0x000000	
				{
					SendInput {NumPad9}
				}
				SendInput {NumPad7}
			}	
			Sleep 10
		}
	}
	Return
}	

