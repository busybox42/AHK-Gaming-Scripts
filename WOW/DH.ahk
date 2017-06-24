
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
			PixelGetColor, color1,691, 1010
			ifNotEqual, color1, 0x000000	
			{
				sleep 10
				ifNotEqual, color1, 0x000000
				{
					Send, =
				}
			}
			PixelGetColor, color2, 685, 950
			ifNotEqual, color2, 0x000000	
			{
				SendInput {NumPad5}
			}
			else
			{
				SendInput {NumPad4}
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
}
$NumPad0::
	SendInput {Space}
	Sleep 5
	SendInput {NumPad0}
Return		
$NumPad7::
	SendInput {NumPad7}
	Sleep 5
	SendInput {Click}
Return	
$NumPad1::
	SendInput {NumPad1}
	Sleep 5
	SendInput {Click}
Return	
$NumPad2::
	SendInput {NumPad2}
	Sleep 5
	SendInput {Click}
Return	
$3::
	SendInput 3
	Sleep 5
	SendInput {Click}
Return	
$4::
	SendInput 4
	Sleep 5
	SendInput {Click}
	Sleep 1000
Return

