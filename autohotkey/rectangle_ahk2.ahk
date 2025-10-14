; AutoHotkey v2 script
; Win+Left  → cycles 1/3, 1/2, 2/3 left
; Win+Right → cycles 1/3, 1/2, 2/3 right
; Win+Down  → vertically maximized, centered, width = 1/3

#Requires AutoHotkey v2.0

; Keep track of toggle states
global LeftState := 0
global RightState := 0

#Left:: {
    WinGetPos &x, &y, &w, &h, "A"
    MonitorGetWorkArea 1, &monX, &monY, &monW, &monH
    global LeftState
    LeftState := (LeftState + 1) > 3 ? 1 : LeftState + 1
    RightState := 0 ; reset right cycle when left is used
    
    if (LeftState = 1) {
        newW := monW/3, newH := monH
        newX := monX, newY := monY
    } else if (LeftState = 2) {
        newW := monW/2, newH := monH
        newX := monX, newY := monY
    } else {
        newW := (2*monW)/3, newH := monH
        newX := monX, newY := monY
    }
    WinMove newX, newY, newW, newH, "A"
}

#Right:: {
    WinGetPos &x, &y, &w, &h, "A"
    MonitorGetWorkArea 1, &monX, &monY, &monW, &monH
    global RightState
    RightState := (RightState + 1) > 3 ? 1 : RightState + 1
    LeftState := 0 ; reset left cycle when right is used
    
    if (RightState = 1) {
        newW := monW/3, newH := monH
        newX := monX + (2*monW/3), newY := monY
    } else if (RightState = 2) {
        newW := monW/2, newH := monH
        newX := monX + (monW/2), newY := monY
    } else {
        newW := (2*monW)/3, newH := monH
        newX := monX + (monW - newW), newY := monY
    }
    WinMove newX, newY, newW, newH, "A"
}

#Down:: {
    MonitorGetWorkArea 1, &monX, &monY, &monW, &monH
    newW := monW/3
    newH := monH
    newX := monX + (monW - newW)/2
    newY := monY
    WinMove newX, newY, newW, newH, "A"
}