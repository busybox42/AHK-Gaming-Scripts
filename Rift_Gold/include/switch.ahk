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
		Run %A_ScriptDir%\MM.ahk
		ExitApp
	}
	Return
	
	$+3::
	Loop 
	{
		If not (GetKeyState("Shift") and GetKeyState("3", "P"))
			break
		SendInput, +3
		Run %A_ScriptDir%\rs.ahk
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
		Run %A_ScriptDir%\Tact.ahk
		ExitApp
	}
	Return

	$+6::
	Loop 
	{
		If not (GetKeyState("Shift") and GetKeyState("6", "P"))
			break
		SendInput, +6
		Run %A_ScriptDir%\Ranger.ahk
		ExitApp
	}
	Return

	$+7::
	Loop 
	{
		If not (GetKeyState("Shift") and GetKeyState("7", "P"))
			break
		SendInput, +7
		Run %A_ScriptDir%\Sab.ahk
		ExitApp
	}
	Return

	$+8::
	Loop 
	{
		If not (GetKeyState("Shift") and GetKeyState("8", "P"))
			break
		SendInput, +8
		Run %A_ScriptDir%\full_bard.ahk
		ExitApp
	}
	Return	