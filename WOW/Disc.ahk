
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
~$LButton::
	MouseGetPos, VarX, VarY
	If (VarX<781) or (VarX>1155) or (VarY<707) or (VarY>909)
		Return
	Loop 
	{
		if not GetKeyState("LButton", "P")
			break
		else	
		{
			PixelGetColor, color2, 585, 1000
			ifEqual, color2, 0x000000
			{
				SendInput {NumPad9}
			}		
			Send {Click}
			RandSleep(10,100)

		}
	}
	Return
~$RButton::
	MouseGetPos, VarX, VarY
	If (VarX<781) or (VarX>1155) or (VarY<707) or (VarY>909)
		Return
	Loop 
	{
		if not GetKeyState("RButton", "P")
			break
		else	
		{
			PixelGetColor, color2, 585, 1000
			ifEqual, color2, 0x000000
			{
				SendInput {NumPad9}
			}		
			Send {Click Right}
			RandSleep(10,100)
		}
	}
	Return
}