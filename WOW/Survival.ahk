
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
			; Serpent Sting
			PixelGetColor, color2, 515, 1005
			ifEqual, color2, 0x000000	
			{
				SendInput {NumPad8}
			}
			Send, 8
			SendInput {NumPad4}
			SendInput {NumPad9}
			SendInput {NumPad4}
			SendInput {NumPad0}
			SendInput {NumPad4}
			SendInput {NumPad5}
			SendInput {NumPad4}
			SendInput {NumpadSub}
			SendInput {NumpadAdd}
			RandSleep(100,300)
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
			; Serpent Sting
			PixelGetColor, color2, 515, 1005
			ifEqual, color2, 0x000000	
			{
				SendInput {NumPad8}
			}
			SendInput {NumPad9}
			SendInput {NumPad0}
			SendInput {NumPad5}
			SendInput {NumpadSub}
			SendInput {NumpadAdd}
			RandSleep(100,300)
		}
	}
	Return	
}	

