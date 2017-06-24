#NoEnv
SendMode Input
~RControl::Suspend, Toggle
Pause::Pause
Xbutton1::Reload

#IfWinActive Guild Wars 2

$NumPad1::
SendInput {NumPad1}
Loop 
{
  PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 10, fast, RGB
  if ErrorLevel ; nope no red lettering, target is dead
    break
  else
  {
    CoordMode, Pixel, Relative
    PixelGetColor, color1, 1200, 1016
    ifNotEqual, color1, 0x000000
    {
	 PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 10, fast, RGB
     if ErrorLevel ; nope no red lettering, target is dead
       break
     else
	 {
       SendInput {NumPad9}
       Sleep 1000
     }	   
    }
	CoordMode, Pixel, Relative
    PixelGetColor, color1, 765, 1014
    ifNotEqual, color1, 0x000000
    {
     PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 10, fast, RGB
     if ErrorLevel ; nope no red lettering, target is dead
       break
     else
	 {
      SendInput {NumPad3} 
      sleep 1000
	 }
    }
    CoordMode, Pixel, Relative
    PixelGetColor, color1, 711, 1014
    ifNotEqual, color1, 0x000000
    {
	 PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 10, fast, RGB
     if ErrorLevel ; nope no red lettering, target is dead
       break
     else
	 {	
        SendInput {NumPad2} 
        sleep 3000
	  }	
    }
	CoordMode, Pixel, Relative
    PixelGetColor, color1, 828, 1014
    ifNotEqual, color1, 0x000000
    {
	 PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 10, fast, RGB
     if ErrorLevel ; nope no red lettering, target is dead
       break
     else
	 {	
        SendInput {NumPad4} 
        sleep 1000
	 }
    }
    SendInput {NumPad1}
  }	
}  
return

^$NumPad1::
SendInput {NumPad1}
	Sleep 200
	SendInput {NumPad1}
Loop 
{
  PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 10, fast, RGB
  if ErrorLevel ; nope no red lettering, target is dead
    break
  else
  {
    CoordMode, Pixel, Relative
    PixelGetColor, color1, 1200, 1016
    ifNotEqual, color1, 0x000000
    {
	 PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 10, fast, RGB
     if ErrorLevel ; nope no red lettering, target is dead
       break
     else
	 {
       SendInput {NumPad9}
       Sleep 1000
     }	   
    }
	CoordMode, Pixel, Relative
    PixelGetColor, color1, 765, 1014
    ifNotEqual, color1, 0x000000
    {
     PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 10, fast, RGB
     if ErrorLevel ; nope no red lettering, target is dead
       break
     else
	 {
      SendInput {NumPad3} 
	  Sleep 200
	  SendInput {NumPad3}
      sleep 800
	 }
    }
	CoordMode, Pixel, Relative
    PixelGetColor, color1, 828, 1014
    ifNotEqual, color1, 0x000000
    {
	 PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 10, fast, RGB
     if ErrorLevel ; nope no red lettering, target is dead
       break
     else
	 {	
        SendInput {NumPad5} 
		Sleep 200
	    SendInput {NumPad5}
        sleep 800
	 }
    }	
    CoordMode, Pixel, Relative
    PixelGetColor, color1, 711, 1014
    ifNotEqual, color1, 0x000000
    {
	 PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 10, fast, RGB
     if ErrorLevel ; nope no red lettering, target is dead
       break
     else
	 {	
        SendInput {NumPad2}
	    Sleep 200
	    SendInput {NumPad2}		
        sleep 800
	  }	
    }
	CoordMode, Pixel, Relative
    PixelGetColor, color1, 828, 1014
    ifNotEqual, color1, 0x000000
    {
	 PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 10, fast, RGB
     if ErrorLevel ; nope no red lettering, target is dead
       break
     else
	 {	
        SendInput {NumPad4} 
		Sleep 200
	    SendInput {NumPad4}
        sleep 800
	 }
    }
	CoordMode, Pixel, Relative
    PixelGetColor, color1, 730, 962
    ifNotEqual, color1, 0x000000
    {
	 PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 10, fast, RGB
     if ErrorLevel ; nope no red lettering, target is dead
       break
     else
	 {	
        SendInput 2 
		Sleep 200
	    SendInput 2
        sleep 800
	 }
    }	
    SendInput {NumPad1}
	Sleep 200
	SendInput {NumPad1}
  }	
}  
return

#IfWinActive