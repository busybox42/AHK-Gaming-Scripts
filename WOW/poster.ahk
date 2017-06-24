Pause::Pause
Xbutton2::Reload
#MaxThreads 2
#ifWinActive World of Warcraft 
{	
$0::
	Loop 
	{
		SendInput, 0
		Sleep 100
	}
Return	
$-::
	Loop 
	{
		SendInput, -
		Sleep 100
	}
Return

$=::
	Loop
	{

		SendInput, =
		Sleep 1000
	}
Return
	
}	