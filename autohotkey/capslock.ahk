SetCapsLockState Off

WaitingForCtrlInput := false
SentCtrlDownWithKey := false

*CapsLock::
	key := 
	WaitingForCtrlInput := true
	Input, key, B C L1 T1, {Esc}
	WaitingForCtrlInput := false
	if (ErrorLevel = "Max") {
		SentCtrlDownWithKey := true
		Send {Ctrl Down}%key%
	}
	KeyWait, CapsLock
	Return

*CapsLock up::
	If (SentCtrlDownWithKey) {
		Send {Ctrl Up}
		SentCtrlDownWithKey := false
	} else {
		if (A_TimeSincePriorHotkey < 1000) {
			if (WaitingForCtrlInput) {
				Send, {Esc 2}
			} else {
				Send, {Esc}
			}
		}
	}
	Return

