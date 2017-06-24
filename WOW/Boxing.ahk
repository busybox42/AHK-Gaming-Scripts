WinGet, wowid, List, World of Warcraft
{
SetTitleMatchMode, 3
SetKeyDelay, -1
Thread, interrupt, 0
SetBatchLines, -1

Pause::Pause
Xbutton2::Reload

ClonesPush(strKeys)
	{
	global wowid1
		IfWinNotActive, ahk_id %wowid%	
			ControlSend, , %strKeys%, ahk_id %wowid1%
	global wowid2
		IfWinNotActive, ahk_id %wowid2%
			ControlSend, , %strKeys%, ahk_id %wowid2%
	global wowid3
		IfWinNotActive, ahk_id %wowid3%
			ControlSend, , %strKeys%, ahk_id %wowid3%
	global wowid4
		IfWinNotActive, ahk_id %wowid4%
			ControlSend, , %strKeys%, ahk_id %wowid4%
	global wowid5
		IfWinNotActive, ahk_id %wowid5%
			ControlSend, , %strKeys%, ahk_id %wowid5%
	}
}	

#IfWinActive, World of Warcraft
{
	~LButton::
		MouseGetPos, VarX, VarY
		If (VarX<14) or (VarX>413) or (VarY<648) or (VarY>854)
			Return
		Loop 
		{
			if not GetKeyState("LButton", "P")
				break
			else	
			{
				PixelGetColor, color1, 1133, 871
				ifNotEqual, color1, 0x000000	
				{
					ControlSend,, {=}, ahk_id %wowid2%
				}			
				ControlSend,, {LButton}, ahk_id %wowid1%
				ControlSend,, {NumPad4}, ahk_id %wowid2%
				sleep 100
			}
		}
		Return
		
	~RButton::
		MouseGetPos, VarX, VarY
		If (VarX<14) or (VarX>413) or (VarY<648) or (VarY>854)
			Return
		Loop 
		{
			if not GetKeyState("RButton", "P")
				break
			else	
			{
				PixelGetColor, color1, 1133, 871
				ifNotEqual, color1, 0x000000	
				{
					ControlSend,, {=}, ahk_id %wowid2%
				}				
				ControlSend,, {RButton}, ahk_id %wowid1%
				ControlSend,, {NumPad4}, ahk_id %wowid2%
				sleep 100
			}	
		}
		Return
		
	~1::ClonesPush("{1 down}{1 up}") ;
	~2::ClonesPush("{2 down}{2 up}") ;
	~3::ClonesPush("{3 down}{3 up}") ;
	~4::ClonesPush("{4 down}{4 up}") ;	
	~5::ClonesPush("{5 down}{5 up}") ;
	~6::ClonesPush("{6 down}{6 up}") ;
	~7::ClonesPush("{7 down}{7 up}") ;	
	~8::ClonesPush("{8 down}{8 up}") ;
	~9::ClonesPush("{9 down}{9 up}") ;	
	~0::ClonesPush("{0 down}{0 up}") ;
	~-::ClonesPush("{- down}{- up}") ;
	~=::ClonesPush("{= down}{= up}") ;
	NumPad1::ClonesPush("{NumPad1 down}{NumPad1 up}") ;
	NumPad2::ClonesPush("{NumPad2 down}{NumPad2 up}") ;
	NumPad3::ClonesPush("{NumPad3 down}{NumPad3 up}") ;
	
	NumPad4::
		Loop 
		{
			if not GetKeyState("NumPad4", "P")
				break
			else	
			{		
				PixelGetColor, color1, 1133, 871
				ifNotEqual, color1, 0x000000	
				{
					ControlSend,, {=}, ahk_id %wowid1%
					sleep 100
					ifNotEqual, color1, 0x000000	
					{
						ControlSend,, {=}, ahk_id %wowid2%
					}		
				}
				ClonesPush("{NumPad4 down}{NumPad4 up}") ;
				RandomSleep4(50,700)
				{
					Random, random, %min%, %max%
					Sleep %random%
				}
			}	
		}
		Return
		
	NumPad5::
		Loop 
		{
			if not GetKeyState("NumPad5", "P")
				break
			else
			{	
				PixelGetColor, color1, 1133, 871
				ifNotEqual, color1, 0x000000	
				{
					ControlSend,, {=}, ahk_id %wowid1%
					sleep 100
					ifNotEqual, color1, 0x000000	
					{
						ControlSend,, {=}, ahk_id %wowid2%
					}		
				}			
				ClonesPush("{NumPad5 down}{NumPad5 up}") ;
				RandomSleep5(50,700)
				{
					Random, random, %min%, %max%
					Sleep %random%
				}				
			}	
		}
		Return
		
	NumPad6::ClonesPush("{NumPad6 down}{NumPad6 up}") ;
	
	NumPad7::
		Loop 
		{
			if not GetKeyState("NumPad7", "P")
				break
			else
			{
				PixelGetColor, color1, 1133, 871
				ifNotEqual, color1, 0x000000	
				{
					ControlSend,, {=}, ahk_id %wowid1%
					sleep 100
					ifNotEqual, color1, 0x000000	
					{
						ControlSend,, {=}, ahk_id %wowid2%
					}		
				}			
				ClonesPush("{NumPad7 down}{NumPad7 up}") ;
				RandomSleep7(50,700)
				{				
					Random, random, %min%, %max%
					Sleep %random%
				}
			}
		}
		Return	

	NumPad8::ClonesPush("{NumPad8 down}{NumPad8 up}") ;
	NumPad9::ClonesPush("{NumPad9 down}{NumPad9 up}") ;
	NumPad0::ClonesPush("{NumPad0 down}{NumPad0 up}") ;
	f::ClonesPush("{f down}{f up}") ;
	x::ClonesPush("{x down}{x up}") ;
	Tab::ClonesPush("{Tab down}{Tab up}") ;

	Space::
	KeyWait, Space, D
	ControlSend,, {Space}, ahk_id %wowid1%
	ControlSend,, {Space}, ahk_id %wowid2%
	ControlSend,, {Space}, ahk_id %wowid3%
	ControlSend,, {Space}, ahk_id %wowid4%
	ControlSend,, {Space}, ahk_id %wowid5%
	Return

	Shift::
	KeyWait, Shift, D
	ControlSend,, {Shift}, ahk_id %wowid1%
	ControlSend,, {Shift}, ahk_id %wowid2%
	ControlSend,, {Shift}, ahk_id %wowid3%
	ControlSend,, {Shift}, ahk_id %wowid4%
	ControlSend,, {Shift}, ahk_id %wowid5%
	Return

}
