crossfire_true_check(x, y, colorid, skillKey)
{ 
	CoordMode, Pixel, Relative
	PixelGetColor, color, %x%, %y%
	ifEqual, color, %colorid%
	{ 
		Sleep 1000
		SendInput, %skillKey%
		Sleep 4000
	}
}