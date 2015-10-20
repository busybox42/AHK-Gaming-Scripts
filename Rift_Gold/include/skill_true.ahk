skill_true_check(x, y, colorid, skillKey)
{ 
	CoordMode, Pixel, Relative
	PixelGetColor, color, %x%, %y%
	ifEqual, color, %colorid%
	{ 
		SendInput, %skillKey%
	}
}