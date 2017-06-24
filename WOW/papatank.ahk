
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
			RandomSleep(50,700)
			{
				Random, random, %min%, %max%
				Sleep %random%
			}	
			PixelGetColor, color1, 1141, 875
			ifNotEqual, color1, 0x000000	
			{
				sleep 100
				Send, 9
				sleep 300
			}
			PixelGetColor, color2, 1141, 875
			ifNotEqual, color2, 0x000000	
			{
				sleep 100			
				Send, 0
				sleep 300
			}
			PixelGetColor, color3, 1141, 875
			ifNotEqual, color3, 0x000000	
			{				
				sleep 100			
				Send, -
				sleep 300
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
			RandomSleep1(50,700)
			{
				Random, random, %min%, %max%
				Sleep %random%
			}		
			PixelGetColor, color1, 1141, 875
			ifNotEqual, color1, 0x000000	
			{
				sleep 100			
				Send, 9
				sleep 300
			}
			PixelGetColor, color2, 1141, 875
			ifNotEqual, color2, 0x000000	
			{
				sleep 100			
				Send, 0
				sleep 300
			}
			PixelGetColor, color3, 1141, 875
			ifNotEqual, color3, 0x000000	
			{
				sleep 100			
				Send, -
				sleep 300
			}
		}
	}
	Return	
}