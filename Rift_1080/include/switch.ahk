;----------------------------------- 	
; Change Scripts 
;----------------------------------- 
	$+1::
	Loop 
	{
		If not (GetKeyState("Shift") and GetKeyState("1", "P"))
			break
		SendInput, +1
		Run %A_ScriptDir%\Bard.ahk
		ExitApp
	}
	Return
	
	$+2::
	Loop 
	{
		If not (GetKeyState("Shift") and GetKeyState("2", "P"))
			break
		SendInput, +2
		Run %A_ScriptDir%\MM_PVP.ahk
		ExitApp
	}
	Return
	
	$+3::
	Loop 
	{
		If not (GetKeyState("Shift") and GetKeyState("3", "P"))
			break
		SendInput, +3
		Run %A_ScriptDir%\Solo.ahk
		ExitApp
	}
	Return
	
	$+4::
	Loop 
	{
		If not (GetKeyState("Shift") and GetKeyState("4", "P"))
			break
		SendInput, +4
		Run %A_ScriptDir%\NightStalker.ahk
		ExitApp
	}
	Return
	
	$+5::
	Loop 
	{
		If not (GetKeyState("Shift") and GetKeyState("5", "P"))
			break
		SendInput, +5
		Run %A_ScriptDir%\Sab.ahk
		ExitApp
	}
	Return