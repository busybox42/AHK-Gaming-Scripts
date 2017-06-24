;----------------------------------- 	
; Change Scripts 
;----------------------------------- 
	$+1::
	Loop 
	{
		If not (GetKeyState("Shift") and GetKeyState("1", "P"))
			break
		SendInput, +1
		Run %A_ScriptDir%\Reaver.ahk
		ExitApp
	}
	Return
	
	$+2::
	Loop 
	{
		If not (GetKeyState("Shift") and GetKeyState("2", "P"))
			break
		SendInput, +2
		Run %A_ScriptDir%\Warlord.ahk
		ExitApp
	}
	Return