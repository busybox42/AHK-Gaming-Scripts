
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
			; Shield Wall
			PixelGetColor, color2,515, 857
			ifNotEqual, color2, 0x000000	
			{
				sleep 10
				Send, 6
			}
			; Last Stand
			PixelGetColor, color3,515, 905
			ifNotEqual, color3, 0x000000	
			{
				sleep 10
				Send, 4
			}
			; Rallying Cry
			PixelGetColor, color4,515, 880
			ifNotEqual, color4, 0x000000	
			{
				sleep 10
				Send, 5
			}
			; StoneForm
			PixelGetColor, color5,515, 925
			ifNotEqual, color5, 0x000000	
			{
				sleep 10
				Send, 3
			}			
			SendInput {NumPad4}
			sleep 50
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
			SendInput {NumPad5}
			RandSleep(100,400)
		}
	}
	Return
}	

