motif_check(x, y, colorid1, skillKey, mtime)
{ 
	CoordMode, Pixel, Relative
	PixelGetColor, color, %x%, %y%
	ifEqual, color, %colorid1%
	{ 
		SendInput, %skillKey%
		Sleep %mtime%
	}
}