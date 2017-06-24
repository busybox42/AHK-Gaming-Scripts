/*
-=: Alan's SWTOR Inqistor Sorceer Macro :=-
--------------------------------------------

--------------------------------------------
Main Bar
--------------------------------------------
1 - Whirlwind
2 - Jolt
3 - Channel the Force
4 - Force Slow
5 - Force Speed
6 -
7 - 
8 - Recklessness
9 - Pruge
0 - Dark Heal
- - Dark Infusion
= - Static Barrier

--------------------------------------------
Bottom Bar
--------------------------------------------
Shift 1 - Electrocute
Shift 2 - Crushing Daarkness
Shift 3 - Affliction
Shift 4 - Chain Lightning
Shift 5 - Force Lightning
Shift 6 - Lightning Strike
Shift 7 - Shock
Shift 8 - Overload
Shift 9 - Unbreakable Will
Shift 0 - 
Shift - - Thrash
Shift = - Saber Strike

--------------------------------------------
Pet Bar
--------------------------------------------
Ctrl 1 - Attack
Ctrl 2 - Passive
Ctrl 3 - Shadow Killer
Ctrl 4 - Taunt
*/

; --------------------------------------------
; Start SWTOR if it's not Running.
; --------------------------------------------
SetTimer, CheckExists, 86400000
CheckExists:
IfWinNotExist, Star Wars: The Old Republic
Run, C:\Program Files (x86)\Electronic Arts\BioWare\Star Wars - The Old Republic\launcher.exe

; --------------------------------------------
; Run if SWTOR is in the forground
; --------------------------------------------
#ifWinActive, Star Wars: The Old Republic
;Set AHK process to high priority
;Process, Priority, , High  
; Toggle Macro 
~RControl::Suspend, Toggle

; --------------------------------------------
; Ranged Spells
; --------------------------------------------
$+2::
Loop {
	if not  GetKeyState("Shift", "P") GetKeyState("2", "P")
		break
	SendInput 8 ;Recklessness
	SendInput +2 ; Crushing Darkness
	SendInput +4 ; Chain Lightning
	SendInput +5 ;Force Lightning
	SendInput +6 ;Lightning strike
	SendInput +7 ;Shock
	;SendInput ^1 ;pet attack button
	Sleep 500
}

; --------------------------------------------
; Healing Spells
; --------------------------------------------
$+4::
Loop {
	if not GetKeyState("Shift", "P") GetKeyState("4", "P")
		break
	Click ;Mouse Over Target
	Sleep 5
	SendInput 0 ;Dark Heal    
	Sleep 5
	SendInput +{tab} ;Target Previous Target
	Sleep 500 ;Need a slight sleept to avoid issues
}
$+5::
Loop {
	if not GetKeyState("Shift", "P") GetKeyState("5", "P")
		break
	Click ;Mouse Over Target
	Sleep 5
	SendInput - ;Dark Infusion
	Sleep 5
	SendInput +{tab} ;Target Previous Target
	Sleep 500 ;Need a slight sleept to avoid issues
}
$+6::
Loop {
	if not GetKeyState("Shift", "P") GetKeyState("6", "P")
		break
	Click ;Mouse Over Target
	Sleep 5
	SendInput, 9 ;Purge
	Sleep 5
	SendInput +{tab} ;Target Previous Target
	Sleep 500 ;Need a slight sleept to avoid issues
}
$+7::
Loop {
	if not GetKeyState("Shift", "P") GetKeyState("7", "P")
		break
	Click ;Mouse Over Target
	Sleep 5
	SendInput, = ;Dark Infusion
	Sleep 5
	SendInput +{tab} ;Target Previous Target
	Sleep 500 ;Need a slight sleept to avoid issues
}