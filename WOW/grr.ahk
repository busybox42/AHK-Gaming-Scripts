Pause::Pause
Xbutton2::Reload
#MaxThreads 1
#ifWinActive World of Warcraft 
{	

$NumPad4::
	Loop 
	{
	click
	sleep 100
	}
$NumPad7::
	Loop 
	{
	click
	sleep 500
	SendInput 1
	}	
}
