
Pause::Pause
Xbutton2::Reload
Xbutton1::ExitApp
#MaxThreads 1
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
			; Less than 5 combo points
			PixelGetColor, color2, 515, 933
			ifEqual, color2, 0x000000	
			{
				; Marked for Death if 0 combo points
				PixelGetColor, color5, 515, 900
				ifNotEqual, color5, 0x000000
				{
					SendInput {Numpad8}
				}
				SendInput {NumPad4}
				; Pistol Shot if we have Oppertunity
				PixelGetColor, color3, 515, 867
				ifNotEqual, color3, 0x000000
				{
					SendInput {NumPad9}
				}					
			}
			else
			{
				; Roll the bones if Ruthless Precision or Grand Melee not up
				PixelGetColor, color3, 515, 1005
				ifNotEqual, color3, 0x000000
				{
					; If Ruthless Precision is active finish with Between the Eyes else Dispatch
					PixelGetColor, color4, 515, 975	
					ifNotEqual, color4, 0x000000
					{
						Sleep 100
						SendInput {NumpadAdd}
					}
					SendInput {NumpadSub}
				}
				else
				{
					SendInput {NumPad0}
				}
			}
			; Use Crimson Vial if below 60% health
			PixelGetColor, color4, 715, 965
			ifNotEqual, color4, 0x000000
			{
				Send, -
			}
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
			; Less than 5 combo points
			PixelGetColor, color2, 515, 933
			ifEqual, color2, 0x000000	
			{
				; Marked for Death if 0 combo points
				PixelGetColor, color5, 515, 900
				ifNotEqual, color5, 0x000000
				{
					SendInput {Numpad8}
				}
				SendInput {NumPad5}
				; Pistol Shot if we have Oppertunity
				PixelGetColor, color3, 515, 867
				ifNotEqual, color3, 0x000000
				{
					SendInput {NumPad9}
				}					
			}
			else
			{
				; Roll the bones if Ruthless Precision or Grand Melee not up
				PixelGetColor, color3, 515, 1005
				ifNotEqual, color3, 0x000000
				{
					; If Ruthless Precision is active finish with Between the Eyes else Dispatch
					PixelGetColor, color4, 515, 975	
					ifNotEqual, color4, 0x000000
					{
						Sleep 100
						SendInput {NumpadAdd}
					}
					SendInput {NumpadSub}
				}
				else
				{
					SendInput {NumPad0}
				}
			}
			; Use Crimson Vial if below 60% health
			PixelGetColor, color4, 715, 965
			ifNotEqual, color4, 0x000000
			{
				Send, -
			}
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
				sleep 10
				ifNotEqual, color1, 0x000000
				{
					Send, =
				}
			}
			; Less than 5 combo points
			PixelGetColor, color2, 515, 933
			ifEqual, color2, 0x000000	
			{
				; Marked for Death if 0 combo points
				PixelGetColor, color5, 515, 900
				ifNotEqual, color5, 0x000000
				{
					SendInput {Numpad8}
				}
				SendInput {NumPad4}
				; Pistol Shot if we have Oppertunity
				PixelGetColor, color3, 515, 867
				ifNotEqual, color3, 0x000000
				{
					SendInput {NumPad9}
				}					
			}
			else
			{
				; If Ruthless Precision is active finish with Between the Eyes else Dispatch
				PixelGetColor, color4, 515, 975	
				ifNotEqual, color4, 0x000000
				{
					Sleep 100
					SendInput {NumpadAdd}
				}
				SendInput {NumpadSub}

			}
			; Use Crimson Vial if below 60% health
			PixelGetColor, color4, 715, 965
			ifNotEqual, color4, 0x000000
			{
				Send, -
			}
			Sleep 100
		}
	}
	Return

$NumPad8::
	Loop 
	{
		if not GetKeyState("NumPad8", "P")
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
			; Less than 5 combo points
			PixelGetColor, color2, 515, 933
			ifEqual, color2, 0x000000	
			{
				; Marked for Death if 0 combo points
				PixelGetColor, color5, 515, 900
				ifNotEqual, color5, 0x000000
				{
					SendInput {Numpad8}
				}
				SendInput {NumPad5}
				; Pistol Shot if we have Oppertunity
				PixelGetColor, color3, 515, 867
				ifNotEqual, color3, 0x000000
				{
					SendInput {NumPad9}
				}					
			}
			else
			{
				; If Ruthless Precision is active finish with Between the Eyes else Dispatch
				PixelGetColor, color4, 515, 975	
				ifNotEqual, color4, 0x000000
				{
					Sleep 100
					SendInput {NumpadAdd}
				}
				SendInput {NumpadSub}
			}
			; Use Crimson Vial if below 60% health
			PixelGetColor, color4, 715, 965
			ifNotEqual, color4, 0x000000
			{
				Send, -
			}
			Sleep 100
		}
	}
	Return
	$NumPad3::
		SendInput {NumPad3}
		Sleep 5
		SendInput {Click}	
	Return
}

