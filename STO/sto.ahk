Pause::Pause
Xbutton2::Reload

;---------------------------------------------
; Run if Star Trek Online is in the forground
;--------------------------------------------- 
#ifWinActive Star Trek Online
{
	$1::
	Loop
	{
		; check to see if we're in combat
		PixelSearch, Px, Py, 944, 120, 1044, 136, 0x101070, 10, fast, RGB
		if ErrorLevel ; nope no red lettering, target is dead
		{
			break
		}
		else
		{
			PixelGetColor, color4, 648, 89
			ifEqual, color1, 0x0F0F0F
			{
				SendInput, 4
			}
		}
	}
	Return

}