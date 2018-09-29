
Pause::Pause
Xbutton2::Reload
Xbutton1::ExitApp
#MaxThreads 1
#ifWinActive World of Warcraft 
{	
~$LButton::
	Loop
	{
		MouseGetPos, VarX, VarY
		If (VarX<777) or (VarX>1162) or (VarY<703) or (VarY>923)
			Return
		if not GetKeyState("LButton", "P")
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
			Send {Click}
			Sleep 500		
		}
	}
	Return
~$RButton::
	Loop 
	{
		MouseGetPos, VarX, VarY
		If (VarX<777) or (VarX>1162) or (VarY<703) or (VarY>923)
			Return
		if not GetKeyState("RButton", "P")
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
			Send {Click Right}
			Sleep 500
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
			SendInput {NumPad4}
			Sleep 100
		}
	}
	Return
}