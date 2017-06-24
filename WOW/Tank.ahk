
Pause::Pause
Xbutton2::Reload
Xbutton1::ExitApp
#MaxThreads 1
#ifWinActive World of Warcraft 
{
RandSleep(x,y) { ;creates a variable with an X and Y
Random, rand, %x%, %y% ;Uses the Random function to generate x and y
Sleep %rand% ;makes the %rand% value the sleep time
}	
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

			SendInput {NumPad4}
			RandSleep(100,400)
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
			SendInput {NumPad5}
			RandSleep(100,400)
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
			SendInput {NumPad7}
			RandSleep(100,400)
		}
	}
	Return	
}	

