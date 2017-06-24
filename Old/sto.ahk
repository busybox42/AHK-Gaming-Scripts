; Auto Motif Rotation
XButton2::
Loop {
	if BreakTrue {
		BreakTrue =
		Break
	}
	SendInput !{Space}
    	Sleep 100
	SendInput {MButton}
}
Return
; Suspend Motif Rotation
XButton1:: BreakTrue = 1