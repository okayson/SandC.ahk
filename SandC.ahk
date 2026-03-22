;--------------------------------------------------
; Space and Control
;-----
;
;--------------------------------------------------
#Requires AutoHotkey v2.0

;--------------------------------
; global variables.
;--------------------------------
global gIsSpaceDown         := false
global gBeginTickOfSandC    := 0

;--------------------------------
*Space:: {
    if (!isSandCMode()) {
        beginSandC()
    }
}

;--------------------------------
*Space Up:: {
    if (isSandCMode()) {
        endSandC()
    }
}

;--------------------------------
isSandCMode() {
    global gIsSpaceDown
    return gIsSpaceDown
}

;--------------------------------
beginSandC() {
    global gIsSpaceDown, gBeginTickOfSandC

    gIsSpaceDown        := true
    gBeginTickOfSandC   := A_TickCount
    Send("{RCtrl Down}")
}

;--------------------------------
endSandC() {
    global gIsSpaceDown, gBeginTickOfSandC

    gIsSpaceDown := false
    Send("{RCtrl Up}")

    if ((A_TickCount - gBeginTickOfSandC) < 200) {
        Send("{Space}")
    }
}
