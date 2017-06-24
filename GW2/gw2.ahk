#NoEnv
SendMode Input
~RControl::Suspend, Toggle
Pause::Pause
Xbutton1::Reload
#MaxThreadsPerHotkey 2

#IfWinActive Guild Wars 2

$NumPad1::
SendInput {NumPad1}
Loop 
{
  PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 15, fast, RGB
  if ErrorLevel ; nope no red lettering, target is dead
    PixelSearch, Px, Py, 780, 71, 822, 92, 0XDDCC33, 15, fast, RGB
	if ErrorLevel ;
		break
  else
  {
    PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 15, fast, RGB
    if ErrorLevel ; nope no red lettering, target is dead
	  PixelSearch, Px, Py, 780, 71, 822, 92, 0XDDCC33, 15, fast, RGB
	  if ErrorLevel ;
        break
    else
    {	
	  ; Use Elixir B
      CoordMode, Pixel, Relative
      PixelGetColor, color1, 1200, 1016
      ifNotEqual, color1, 0x000000
      {
        SendInput {NumPad7}
        Sleep 500
      }
	}
    PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 15, fast, RGB
    if ErrorLevel ; nope no red lettering, target is dead
	  PixelSearch, Px, Py, 780, 71, 822, 92, 0XDDCC33, 15, fast, RGB
	  if ErrorLevel ;
        break
    else
    {		
	  ; Poison Dart Volley /Shrapnel Grenade 
	  SendInput {NumPad1}
	  CoordMode, Pixel, Relative
      PixelGetColor, color1, 711, 1014
      ifNotEqual, color1, 0x000000
      {
        SendInput {NumPad2} 
        sleep 3000
      }
	}
    PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 15, fast, RGB
    if ErrorLevel ; nope no red lettering, target is dead
	  PixelSearch, Px, Py, 780, 71, 822, 92, 0XDDCC33, 15, fast, RGB
	  if ErrorLevel ;
        break
    else
    {		
	  ; Static Shot / Flash Gernade
	  SendInput {NumPad1}
	  CoordMode, Pixel, Relative
      PixelGetColor, color1, 765, 1014
      ifNotEqual, color1, 0x000000
      {
        SendInput {NumPad3} 
        sleep 500
      }
    }
    PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 15, fast, RGB
    if ErrorLevel ; nope no red lettering, target is dead
	  PixelSearch, Px, Py, 780, 71, 822, 92, 0XDDCC33, 15, fast, RGB
	  if ErrorLevel ;
        break
    else
    {		
	  ; Flame Thrower / Freeze Grenade
	  SendInput {NumPad1}
	  CoordMode, Pixel, Relative
      PixelGetColor, color1, 828, 1014
      ifNotEqual, color1, 0x000000
      {
        SendInput {NumPad4} 
        sleep 500
      }
    }
  }
}

return

$NumPad9::
toggle := !toggle
; Static Shot
CoordMode, Pixel, Relative
PixelGetColor, color1, 1200, 1016
ifNotEqual, color1, 0x000000
{
  SendInput {NumPad7}
  Sleep 500
}  
PixelSearch, Px, Py, 780, 71, 822, 92, 0XDD4444, 15, fast, RGB
if ErrorLevel ; nope no red lettering, target is dead
{
}
else
{
  CoordMode, Pixel, Relative
  PixelGetColor, color1, 765, 1014
  ifNotEqual, color1, 0x000000
  {
    SendInput {NumPad3} 
    sleep 500
  }
}
SendInput {NumPad9}
Loop 
{
  if toggle 
  {
    CoordMode, Pixel, Relative
    PixelGetColor, color1, 1200, 1016
    ifNotEqual, color1, 0x000000
    {
	  if toggle 
	  {
        SendInput {NumPad7}
        Sleep 100
      }
      else
      {
        Break
      }		
    }
	SendInput {NumPad1}
	; Freeze Grenade
	CoordMode, Pixel, Relative
    PixelGetColor, color1, 828, 1014
    ifNotEqual, color1, 0x000000
    {
	  if toggle 
	  {	
        SendInput {NumPad4} 
        sleep 100
        SendInput {NumPad1}
      }
      else
      {
        Break
      }			
    }
    ; Poison Grenade
	CoordMode, Pixel, Relative
    PixelGetColor, color1, 877, 1010
    ifNotEqual, color1, 0x000000
    {
	  if toggle 
	  {	
        SendInput {NumPad5} 
        sleep 100
	    SendInput {NumPad1}
      }
      else
      {
        Break
      }		
    }	
 	; Shrapnel Grenade
	CoordMode, Pixel, Relative
    PixelGetColor, color1, 711, 1014
    ifNotEqual, color1, 0x000000
    {
      if toggle 
	  {
        SendInput {NumPad2} 
        sleep 100
	    SendInput {NumPad1}
      }
      else
      {
        Break
      }			
    }
    ; Flash Gernade
	CoordMode, Pixel, Relative
    PixelGetColor, color1, 765, 1014
    ifNotEqual, color1, 0x000000
    {
	  if toggle 
	  {	
        SendInput {NumPad3} 
        sleep 100
	    SendInput {NumPad1}
      }
      else
      {
        Break
      }
	}  
    ; Gernade Barrage
	CoordMode, Pixel, Relative
    PixelGetColor, color1, 817, 966
    ifNotEqual, color1, 0x000000
    {
	  if toggle 
	  {	
        SendInput 4 
        sleep 100
	    SendInput {NumPad1}
      }
      else
      {
        Break
      }		  
    }	


  } 	
  else
  {
    break
  }	
}
return