#region --- Internal functions Au3Recorder Start ---
Func _Au3RecordSetup()
Opt('WinWaitDelay',100)
Opt('WinDetectHiddenText',1)
Opt('MouseCoordMode',0)
Local $aResult = DllCall('User32.dll', 'int', 'GetKeyboardLayoutNameW', 'wstr', '')
If $aResult[1] <> '0000080A' Then
  MsgBox(64, 'Warning', 'Recording has been done under a different Keyboard layout' & @CRLF & '(0000080A->' & $aResult[1] & ')')
EndIf

EndFunc

Func _WinWaitActivate($title,$text,$timeout=0)
	WinWait($title,$text,$timeout)
	If Not WinActive($title,$text) Then WinActivate($title,$text)
	WinWaitActive($title,$text,$timeout)
EndFunc

_AU3RecordSetup()
#endregion --- Internal functions Au3Recorder End ---
$date = StringFormat("%02d",@YEAR) & @MON & StringFormat("%02d",@MDAY)

_WinWaitActivate("Program Manager","FolderView")
MouseClick("left",135,1061,1)
_WinWaitActivate("Home - Knox Portal - Internet Explorer","Barra de direcciones")
MouseClick("left",218,64,1)
_WinWaitActivate("Nueva pestaña - Internet Explorer","Barra de direcciones")
MouseClick("left",47,98,1)
sleep(50000)
_WinWaitActivate("Global Component Supply Portal - Internet Explorer","Barra de direcciones")
MouseClick("left",274,153,1)
MouseUp("left")
MouseClick("left",269,177,1)
MouseUp("left")
MouseMove(398,177,1)
sleep(1000)
MouseClick("left",398,264,1)
MouseUp("left")
sleep(30000)
_WinWaitActivate("Global Component Supply Portal - Internet Explorer","Barra de direcciones")
MouseClick("left",790,219,1)
MouseUp("left")
sleep(10000)
#hasta acá cargó la UI abnormal

#a partir de acá, selecciona customer
#selecciona DF y aplica
MouseClick("left",33,220,1)
MouseUp("left")
sleep(2000)
MouseClick("left",33,220,1)
MouseUp("left")
sleep(1000)
MouseClick("left",33,236,1)
MouseUp("left")
sleep(1000)
MouseClick("left",63,395,1)
MouseUp("left")
sleep(1000)
MouseClick("left",98,953,1)
MouseUp("left")
sleep(100000)
#hasta acá, selecciona customer

#acá pide que genere el Excel
MouseClick("left",1627,237,1)
MouseUp("left")
sleep(300000)

#acá lo descarga
MouseClick("left",1622,236,1)
MouseUp("left")
_WinWaitActivate("Internet Explorer","Guardar &como")
MouseClick("left",134,255,1)
_WinWaitActivate("Guardar como","Control de árbol de ")
Send("c:\users\rivas.a\desktop\" & $date & "_iatec_abnormal.xls")
MouseClick("left",813,513,1)
sleep(120000)

#cierra la pestaña
MouseClick("left",397,66,1)
MouseClick("left",1530,16,1)