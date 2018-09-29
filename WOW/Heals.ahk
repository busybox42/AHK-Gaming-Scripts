
Pause::Pause
Xbutton2::Reload
Xbutton1::ExitApp
#MaxThreads 1
#ifWinActive World of Warcraft 
{	
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
			; Interupt
			PixelGetColor, color1,720, 965
			ifNotEqual, color1, 0x000000	
			{
				sleep 100
				ifNotEqual, color1, 0x000000
				{
					Send, =
				}
			}
			Send {Click}
			Sleep 100

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
			; Interupt
			PixelGetColor, color1,720, 965
			ifNotEqual, color1, 0x000000	
			{
				sleep 100
				ifNotEqual, color1, 0x000000
				{
					Send, =
				}
			}				
			Send {Click Right}
			Sleep 100
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
				sleep 100
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
				sleep 100
				ifNotEqual, color1, 0x000000
				{
					Send, =
				}
			}				
			SendInput {NumPad5}
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
			; Interupt
			PixelGetColor, color1,720, 965
			ifNotEqual, color1, 0x000000	
			{
				sleep 100
				ifNotEqual, color1, 0x000000
				{
					Send, =
				}
			}				
			SendInput {NumPad7}
			Sleep 100
		}
	}
	Return		
}