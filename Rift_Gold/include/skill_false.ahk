skill_false_check(x, y, colorid, skillKey)
{ 
	CoordMode, Pixel, Relative
	PixelGetColor, color, %x%, %y%
	ifNotEqual, color, %colorid%
	{ 
		SendInput, %skillKey%
	}
}