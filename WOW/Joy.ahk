
Pause::Pause
Xbutton2::Reload
Xbutton1::ExitApp
#MaxThreads 1
#ifWinActive World of Warcraft 
{	
$Joy1::
	Loop 
	{
		if not GetKeyState("Joy1", "P")
			break
		else	
		{			
			SendInput {NumPad4}
			PixelGetColor, color1, 691, 1010
			ifNotEqual, color1, 0x000000	
			{
				sleep 10
				ifNotEqual, color1, 0x000000
				{
					Send, =
				}
			}		
			Sleep 100
		}
	}
	Return
$Joy3::
	Loop 
	{
		if not GetKeyState("Joy3", "P")
			break
		else	
		{	
			SendInput {NumPad5}	
			PixelGetColor, color1, 691, 1010
			ifNotEqual, color1, 0x000000	
			{
				sleep 10
				ifNotEqual, color1, 0x000000
				{			
					Send, =
				}
			}			
			Sleep 100
		}
	}
	Return	
$Joy4::
	Loop 
	{
		if not GetKeyState("Joy4", "P")
			break
		else	
		{		
			SendInput {NumPad7}	
			PixelGetColor, color1, 691, 1010
			ifNotEqual, color1, 0x000000	
			{
				sleep 10
				ifNotEqual, color1, 0x000000
				{			
					Send, =
				}
			}
			Sleep 100
		}
	}
	Return
}	

$NumPad2::
	SendInput {NumPad2}
	Sleep 5
	SendInput {Click}
Return	
