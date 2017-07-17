;--------------------------------------------------
; Space and Control
;-----
;
;--------------------------------------------------
;--------------------------------
; global variables.
;--------------------------------
global gIsSpaceDown			:= False
global gBeginTickOfSandC	:= 0

;--------------------------------
*Space::

	if ( !isSandCMode() )
	{
		beginSandC()
	}
	return
	
;--------------------------------
*Space Up::
	
	if ( isSandCMode() )
	{
		endSandC()
	}
	return
	
;--------------------------------
isSandCMode()
{
	global gIsSpaceDown
	return gIsSpaceDown
}
;--------------------------------
beginSandC()
{
	global gIsSpaceDown
	global gBeginTickOfSandC
	
	gIsSpaceDown		:= True
	gBeginTickOfSandC	:= A_TickCount
	Send {RCtrl Down}
	Input, inputKey, L1 V, {RCtrl}
}
;--------------------------------
endSandC()
{
	global gIsSpaceDown
	global gBeginTickOfSandC

	gIsSpaceDown := False
	Send {RCtrl Up}
	
	If ((A_TickCount - gBeginTickOfSandC) < 200)
	{
		Send {Space}
	}
	; Send dummy key to finish the "Input" method.
	Send {RCtrl}
}
