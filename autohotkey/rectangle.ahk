; AutoHotkey v1.1 script
; Win+Left  → cycles 1/3, 1/2, 2/3 left
; Win+Right → cycles 1/3, 1/2, 2/3 right
; Win+Down  → cycles 1/2, 2/3, 1/3 centered (vertically maximized)

#NoEnv
#SingleInstance Force
SendMode Input

; Keep track of toggle states
LeftState := 0
RightState := 0
DownState := 0

#Left::
    SysGet, mon, MonitorWorkArea, 1
    LeftState++
    if (LeftState > 3)
        LeftState := 1
    RightState := 0
    DownState := 0

    if (LeftState = 3) {
        newW := (monRight - monLeft) / 3
        newX := monLeft
    } else if (LeftState = 1) {
        newW := (monRight - monLeft) / 2
        newX := monLeft
    } else {
        newW := (monRight - monLeft) * 2 / 3
        newX := monLeft
    }
    newH := (monBottom - monTop)
    newY := monTop
    WinGet, hwnd, ID, A
    WinGet, state, MinMax, ahk_id %hwnd%
    if (state = 1) {
        WinRestore, ahk_id %hwnd%
    }
    WinMove, ahk_id %hwnd%,, newX, newY, newW, newH
return

#Right::
    SysGet, mon, MonitorWorkArea, 1
    RightState++
    if (RightState > 3)
        RightState := 1
    LeftState := 0
    DownState := 0

    if (RightState = 3) {
        newW := (monRight - monLeft) / 3
        newX := monLeft + (monRight - monLeft) * 2 / 3
    } else if (RightState = 1) {
        newW := (monRight - monLeft) / 2
        newX := monLeft + (monRight - monLeft) / 2
    } else {
        newW := (monRight - monLeft) * 2 / 3
        newX := monRight - newW
    }
    newH := (monBottom - monTop)
    newY := monTop
    WinGet, hwnd, ID, A
    WinGet, state, MinMax, ahk_id %hwnd%
    if (state = 1) {
        WinRestore, ahk_id %hwnd%
    }
    WinMove, ahk_id %hwnd%,, newX, newY, newW, newH
return

#Down::
    SysGet, mon, MonitorWorkArea, 1
    DownState++
    if (DownState > 3)
        DownState := 1
    LeftState := 0
    RightState := 0

    if (DownState = 1) {
        newW := (monRight - monLeft) / 2
    } else if (DownState = 2) {
        newW := (monRight - monLeft) * 2 / 3
    } else {
        newW := (monRight - monLeft) / 3
    }
    newH := (monBottom - monTop)
    newX := monLeft + ((monRight - monLeft) - newW) / 2
    newY := monTop

    WinGet, hwnd, ID, A
    WinGet, state, MinMax, ahk_id %hwnd%
    if (state = 1) {
        WinRestore, ahk_id %hwnd%
    }
    WinMove, ahk_id %hwnd%,, newX, newY, newW, newH
return
