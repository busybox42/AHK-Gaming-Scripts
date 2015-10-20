bomb_true_check(x, y, colorid, skillKey)
{ 
	CoordMode, Pixel, Relative
	PixelGetColor, color, %x%, %y%
	ifEqual, color, %colorid%
	{ 
		sleep 100
		SendInput, %skillKey%
		sleep 100
		SendInput {Click}

	}
}