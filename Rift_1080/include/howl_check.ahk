howl_check(x, y, colorid, skillKey, dualismKey)
{ 
	CoordMode, Pixel, Relative
	PixelGetColor, color, %x%, %y%
	ifEqual, color, %colorid%
	{ 
		SendInput, %skillKey%
		Sleep 300
		SendInput, %dualismKey%
	}
}