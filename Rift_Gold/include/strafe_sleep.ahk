strafe_sleep(x, y, colorid)
{
	CoordMode, Pixel, Relative
	PixelGetColor, color, %x%, %y%
	ifEqual, color, %colorid%
	{
		Sleep 4500
	}
}