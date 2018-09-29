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
			;Void Eruption
			PixelGetColor, color5,603, 985
			ifEqual, color5, 0x000000	
			{
				SendInput 7
			}				
			; Vampiric Touch				
			PixelGetColor, color3,530, 980
			ifEqual, color3, 0x000000	
			{
				SendInput 9
			}			
			; SW: Pain
			PixelGetColor, color2, 530, 952
			ifEqual, color2, 0x000000	
			{
				SendInput 8
			}
			; Cast Shadow fiend when in Voidform
			PixelGetColor, color4,530, 1005
			ifNotEqual, color4, 0x000000	
			{
				Sleep 100
				SendInput 0
			}				
			SendInput {NumPad4}
			RandSleep(10,100)
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
			PixelGetColor, color5,603, 985
			ifEqual, color5, 0x000000	
			{
				SendInput 7
			}				
			; Vampiric Touch
			PixelGetColor, color3,530, 980
			ifEqual, color3, 0x000000	
			{
				SendInput 9
			}			
			; SW: Pain
			PixelGetColor, color2, 530, 952
			ifEqual, color2, 0x000000	
			{
				SendInput 8
			}
			; Cast Shadow fiend when in Voidform
			PixelGetColor, color4,530, 1005
			ifNotEqual, color4, 0x000000	
			{
				Sleep 100
				SendInput 0
			}			
			SendInput {NumPad5}
			RandSleep(100,400)
		}
	}
	Return
	
}	