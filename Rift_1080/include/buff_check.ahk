buff_check(x, y, colorid1, skillKey, sleeper)
{ 
	CoordMode, Pixel, Relative
	PixelGetColor, color, %x%, %y%
	ifEqual, color, %colorid1%
	{ 
		SendInput, %skillKey%
		Sleep %sleeper%
	}
	
}