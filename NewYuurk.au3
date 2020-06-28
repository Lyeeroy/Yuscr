#RequireAdmin
HotKeySet('{F10}', '_ex')
HotKeySet('{F9}', '_ScrQuit')

;639, 649, 0x393E3C - HONOR

;----- Global variables ----
Local $ClientGeneral = "LeagueClient.exe"
Local $Client = "LeagueClientUx.exe"
Local $Game = "League Of Legends.exe"
Local $ClientTitle = 'League of Legends'
Local $GameTitle = 'League of Legends (TM) Client'
Local $tick = 500
Local $ScrQuit = 0
;----- Client variables ----
Local $PlayButton[3] = [154, 41, 0x1E2328] ; START: PLAY
Local $ConfirmButton[3] = [539, 686, 14677] ; FIND MATCH, CONFIRM....
Local $InParty[3] = [1117, 118, 15787730] ; WHITE MAN: RIGHT MENU

Local $GameFound[3] = [639, 321, 1914949] ; GAME FOUND
Local $AcceptGame[3] = [643, 556, 13499130] ; ACCEPT BUTTON

Local $SearchForChampion[3] = [785, 103, 1646370] ; SEARCH BOX: YUMMI
Local $InLobbyLockInGreyButton[3] = [643, 618, 1975337] ; IN LOBBY
Local $LockIn[3] = [641, 606, 608872] ; LOCK CHAMP
Local $Yuumi[3] = [380, 168, 0xEB88BA] ; CLICK 1ST CHAMPION

Local $LevelUPText_V[3] = [615, 152, 15590351] ; LEVEL UP: V letter
Local $Gift_OK_Button[3] = [673, 676, 0x1E2328] ; NO MOUSE
Local $Gift_OK[3] = [636, 679, 5723731] ; OK BUTTON
Local $grey_OK[3] = [672, 678, 0x1E2328]
Local $select_gift[2] = [642, 391]

Local $Explore[3] = [1002, 823, 0x43321B]

Local $AfterGameAdvancedDetails[3] = [843, 36, 0x1E2328] ; TOP LEFT CORNER, SUMMONER ICON
Local $AfterGameCHAT[3] = [194, 687, 0x010A13] ; TOP LEFT CORNER, SUMMONER ICON

Local $res = 0

Local $coopvsall_tab[2] = [139, 99] ; Pix: 14790748
Local $beginner[2] = [452, 526] ; Pix: 15787730
Local $confirm[2] = [486, 689] ; Pix: 1975080

;----- Game variables ----

Local $MapBaseMouseClick[2] = [1660, 1062]
Local $WhiteVieweInBase[3] = [1657, 1035, 0xFFFFFF]
Local $E_SpellReady[3] = [914, 1013, 16252853]

Local $I1[3] = [304, 228, 4333208] ; Pix: 4333208
Local $I2[3] = [373, 232, 16701917] ; Pix: 16701917
Local $I3[3] = [439, 229, 605957] ; Pix: 605957
Local $I4[3] = [308, 353, 3023384] ; Pix: 3023384
Local $I5[3] = [367, 357, 656142] ; Pix: 656142
Local $I6[3] = [304, 484, 3748905] ; Pix: 3748905
Local $I7[3] = [370, 482, 16773375] ; Pix: 16773375
Local $I8[3] = [436, 479, 633524] ; Pix: 633524
Local $I9[3] = [503, 480, 5988954] ; Pix: 5988954
Local $I10[3] = [568, 480, 3217424] ; Pix: 3217424
Local $I11[3] = [305, 603, 4335382] ; Pix: 4335382
Local $I12[3] = [368, 604, 4335408] ; Pix: 4335408
Local $I13[3] = [435, 607, 5984787] ; Pix: 5984787
Local $I14[3] = [500, 604, 11176009] ; Pix: 11176009
Local $I15[3] = [568, 601, 16774858] ; Pix: 16774858

Local $P1[2] = [1688, 729] ;player 1
Local $P2[2] = [1754, 729] ;player 2
Local $P3[2] = [1818, 729] ;player 3
Local $P4[2] = [1882, 729] ;player 4

Local $Wed[3] = [870, 1012, 5274028] ;in W

Local $YummiInHUD[3] = [717, 1024, 12562882] ; HUD YUUMI ICON

Local $MaxR[3] = [957, 970, 16774244] ; Pix: 16774244
Local $MaxE[3] = [913, 971, 14667850] ; Pix: 14667850
Local $MaxW[3] = [870, 971, 14338890] ; Pix: 14338890
Local $MaxQ[3] = [827, 971, 15720274] ; Pix: 15720274

Local $P1HP_dead[3] = [1670, 780, 0x359657]
Local $P2HP_dead[3] = [1735, 780, 0x359657]
Local $P3HP_dead[3] = [1800, 780, 0x359657]
Local $P4HP_dead[3] = [1864, 780, 0x359657]

Local $P1HP_full[3] = [1714, 780, 0x30F871]
Local $P2HP_full[3] = [1779, 780, 0x30F871]
Local $P3HP_full[3] = [1844, 780, 0x30F871]
Local $P4HP_full[3] = [1908, 780, 0x30F871]

Local $phase = 'start'
Local $iBuy = 0
Local $wait = 0
Local $i = 0
Local $afkc = 1
Local $afk1
Local $afk0


While 1
	While ProcessExists($Client)
		$res += 1
		If _Client($PlayButton) Then
			_ClientClick($PlayButton[0], $PlayButton[1])
			Sleep(1000)
			_ClientClick($coopvsall_tab[0], $coopvsall_tab[1])
			Sleep(1000)
			_ClientClick($beginner[0], $beginner[1])
			Sleep(1000)
			_ClientClick($confirm[0], $confirm[1])
			_CLog('Play button found')
		EndIf

		If _Client($Explore) Then
			_ClientClick($Explore[0], $Explore[1])
		EndIf


		If _Client($InParty) Then
			_ClientClick($ConfirmButton[0], $ConfirmButton[1])
			_CLog('FIND MATCH')
		EndIf

		If _Client($GameFound) Then
			_ClientClick($AcceptGame[0], $AcceptGame[1])
			While _Client($GameFound)
				_CLog('Zzz: Game found')
				Sleep(1000)
			WEnd
		EndIf

		If _Client($InLobbyLockInGreyButton) Then
			_ClientClick($SearchForChampion[0], $SearchForChampion[1])
			_ClientClick($SearchForChampion[0], $SearchForChampion[1])
			Sleep(1000)
			ControlSend($ClientTitle, '', '', 'yuumi')
			Sleep(1000)
			If _Client($Yuumi) Then
				_ClientClick($Yuumi[0], $Yuumi[1])
			EndIf
			Sleep(1000)
			_ClientClick($LockIn[0], $LockIn[1])
			_CLog('LOCKED CHAMPION: WAITING FOR THE GAME')
		EndIf

		If _Client($LevelUPText_V) Or _Client($Gift_OK_Button) Then
			_ClientClick($Gift_OK[0], $Gift_OK[1])
			_CLog('OK BUTTON')
		EndIf

		If _Client($grey_OK) Then
			_ClientClick($select_gift[0], $select_gift[1])
			_CLog('U GOT GIFT')
		EndIf

		If _Client($AfterGameAdvancedDetails) Then  ; Or _Client($AfterGameCHAT)
			_ClientClick($ConfirmButton[0], $ConfirmButton[1])
			_CLog('PLAY AGAIN')
		EndIf
		Sleep($tick)
		ConsoleWrite('I')
		If $res = 1200 Then ;20Min = 2400 ; 10Min = 1200
			_ClientEx()
		EndIf

	WEnd

	$res = 0

	While ProcessExists($Game)
		While Not _Game($YummiInHUD) And $iBuy = 0
			_CLog("Zzz: Game is loading")
			Sleep(1000)
		WEnd

		If Not _Game($YummiInHUD) Then
			_CLog("Zzz: Yummi is dead")
			$phase = 'died'
		Else
			If $phase = 'start' Then
				Send("^e")
				Send("z")
				$iBuy = 1
				$phase = 'buy'
			ElseIf $phase = 'randomW' Then
				Global $randomChoice = Random(1, 4, 1)
				Switch $randomChoice
					Case 1
						_CLog("Player 1")
						MouseMove($P1[0], $P1[1])
						Send('w')
					Case 2
						_CLog("Player 2")
						MouseMove($P2[0], $P2[1])
						Send('w')
					Case 3
						_CLog("Player 3")
						MouseMove($P3[0], $P3[1])
						Send('w')
					Case 4
						_CLog("Player 4")
						MouseMove($P4[0], $P4[1])
						Send('w')
				EndSwitch
				$phase = 'waitForW'
				;COMPLETE
			ElseIf $phase = 'waitForW' Then
				;If Yummi is Wed Then go to Wed phase
				If _Game($Wed) Then
					$phase = 'Wed'
				Else
					ConsoleWrite('Waiting for W: ' & $wait & '/120' & @CRLF)
				EndIf
				;go find another player IF chosen is dead
				If $randomChoice = 1 Then
					If Not _Game($P1HP_dead) Then
						$phase = 'randomW'
						_CLog('P1 is dead: Go W another')
					EndIf
				ElseIf $randomChoice = 2 Then
					If Not _Game($P2HP_dead) Then
						$phase = 'randomW'
						_CLog('P2 is dead: Go W another')
					EndIf
				ElseIf $randomChoice = 3 Then
					If Not _Game($P3HP_dead) Then
						$phase = 'randomW'
						_CLog('P3 is dead: Go W another')
					EndIf
				ElseIf $randomChoice = 4 Then
					If Not _Game($P4HP_dead) Then
						$phase = 'randomW'
						_CLog('P4 is dead: Go W another')
					EndIf
				EndIf

				$wait += 1

				If $wait >= 120 Then
					$phase = 'randomW'
					$wait = 0
				EndIf
				;COMPLETE
			ElseIf $phase = 'Wed' Then
				If $randomChoice = 1 Then
					If Not _Game($P1HP_full) And _Game($E_SpellReady) Then
						Send('e')
					EndIf
				ElseIf $randomChoice = 2 Then
					If Not _Game($P2HP_full) And _Game($E_SpellReady) Then
						Send('e')
					EndIf
				ElseIf $randomChoice = 3 Then
					If Not _Game($P3HP_full) And _Game($E_SpellReady) Then
						Send('e')
					EndIf
				ElseIf $randomChoice = 4 Then
					If Not _Game($P4HP_full) And _Game($E_SpellReady) Then
						Send('e')
					EndIf
				EndIf
				If Not _Game($Wed) Then ;W LOST
					$wait = 0
					$phase = 'back'
				EndIf

				;Max spells if Wed

				If _Game($MaxE) Then
					_GameClick($MaxE[0], $MaxE[1])
					MouseMove($MapBaseMouseClick[0], $MapBaseMouseClick[1])
				ElseIf _Game($MaxW) Then
					_GameClick($MaxW[0], $MaxW[1])
					MouseMove($MapBaseMouseClick[0], $MapBaseMouseClick[1])
				ElseIf _Game($MaxQ) Then
					_GameClick($MaxQ[0], $MaxQ[1])
					MouseMove($MapBaseMouseClick[0], $MapBaseMouseClick[1])
				ElseIf _Game($MaxR) Then
					_GameClick($MaxR[0], $MaxR[1])
					MouseMove($MapBaseMouseClick[0], $MapBaseMouseClick[1])
				EndIf

				;Anati-afk sys

				If $afkc = 1 Then
					$afk1 = PixelGetColor(1611, 859)
					$afkc = 0
				ElseIf $afkc = 0 Then
					$afk0 = PixelGetColor(1611, 859)
					$afkc = 1
				EndIf
				If $afk0 = $afk1 Then
					$i += 1
					ConsoleWrite('ur afk:' & $i & '/45' & @CRLF)
				Else
					$i = 0
				EndIf

				If $i >= 45 Then
					_CLog('go find another player')
					If $randomChoice = 1 Then
						MouseMove($P1[0], $P1[1])
						Send('w')
					ElseIf $randomChoice = 2 Then
						MouseMove($P2[0], $P2[1])
						Send('w')
					ElseIf $randomChoice = 3 Then
						MouseMove($P3[0], $P3[1])
						Send('w')
					ElseIf $randomChoice = 4 Then
						MouseMove($P4[0], $P4[1])
						Send('w')
					EndIf
					$i = 0
					$phase = 'randomW'
				EndIf

			ElseIf $phase = 'back' Then
				If Not _Game($WhiteVieweInBase) Then
					$wait += 1
					ConsoleWrite('B: ' & $wait & '/34' & @CRLF)
					If $wait < 4 Then ;click 4 times Right Click map base
						_rGameClick($MapBaseMouseClick[0], $MapBaseMouseClick[1])
					ElseIf $wait = 20 Then
						Send('b')
					ElseIf $wait >= 35 Then
						$wait = 0
						$phase = 'buy'
					EndIf
					;max spell = different pix = error. If error fix:
					If _Game($Wed) Then
						$phase = 'Wed'
					EndIf
				Else
					$wait = 0
					$phase = 'buy'
				EndIf
				;COMPLETE
			ElseIf $phase = 'buy' Then

				Send('p')

				If $iBuy = 1 Then
					_rGameClick($I1[0], $I1[1])
					_rGameClick($I2[0], $I2[1])
					_rGameClick($I3[0], $I3[1])
					$iBuy = 4
				EndIf
				If _Game($I5) And $iBuy = 4 Then
					_rGameClick($I5[0], $I5[1])
					$iBuy = 5
				EndIf
				If _Game($I4) And $iBuy = 5 Then
					_rGameClick($I4[0], $I4[1])
					$iBuy = 6
				EndIf
				If _Game($I6) And $iBuy = 6 Then
					_rGameClick($I6[0], $I6[1])
					$iBuy = 7
				EndIf
				If _Game($I7) And $iBuy = 7 Then
					_rGameClick($I7[0], $I7[1])
					$iBuy = 8
				EndIf
				If _Game($I8) And $iBuy = 8 Then
					_rGameClick($I8[0], $I8[1])
					$iBuy = 9
				EndIf
				If _Game($I9) And $iBuy = 9 Then
					_rGameClick($I9[0], $I9[1])
					$iBuy = 10
				EndIf
				If _Game($I10) And $iBuy = 10 Then
					_rGameClick($I10[0], $I10[1])
					$iBuy = 11
				EndIf
				If _Game($I11) And $iBuy = 11 Then
					_rGameClick($I11[0], $I11[1])
					$iBuy = 12
				EndIf
				If _Game($I12) And $iBuy = 12 Then
					_rGameClick($I12[0], $I12[1])
					$iBuy = 13
				EndIf
				If _Game($I13) And $iBuy = 13 Then
					_rGameClick($I13[0], $I13[1])
					$iBuy = 14
				EndIf
				If _Game($I14) And $iBuy = 14 Then
					_rGameClick($I14[0], $I14[1])
					$iBuy = 15
				EndIf
				If _Game($I15) And $iBuy = 15 Then
					_rGameClick($I15[0], $I15[1])
					$iBuy = 420
				EndIf

				Send('p')

				_CLog('buy staff')
				$phase = 'randomW'

			ElseIf $phase = 'died' Then
				If _Game($YummiInHUD) Then
					$phase = 'buy'
				EndIf
				;COMPLETE
			EndIf
		EndIf
		Sleep($tick)
	WEnd
	$phase = 'start'
	$iBuy = 0
	$wait = 0
	$i = 0
	If $ScrQuit = 1 Then
		_CLog('SCR_QUIT')
		Exit
	EndIf
	_CLog('LF: Client/Game')
WEnd


Func _CLog($data)
	ConsoleWrite($data & '- Game phase: ' & $phase & @CRLF)
EndFunc   ;==>_CLog

Func _ClientClick($x, $y) ; CLIENT
	ControlClick($ClientTitle, '', '', 'left', 1, $x, $y)
	If @error Then
		Sleep(5000)
	EndIf
	_CLog('*Click*')
EndFunc   ;==>_ClientClick

Func _rGameClick($x, $y) ; CLIENT
	MouseClick('right', $x, $y)
	If @error Then
		Sleep(500)
	EndIf
	_CLog('*Click*')
EndFunc   ;==>_rGameClick

Func _GameClick($x, $y) ; CLIENT
	MouseClick('left', $x, $y)
	If @error Then
		Sleep(500)
	EndIf
	_CLog('*Click*')
EndFunc   ;==>_GameClick

Func _Game($gameObject)
	If WinActive($GameTitle) Then
		$gp = WinGetPos($GameTitle)
		$lf = PixelGetColor($gp[0] + $gameObject[0], $gp[1] + $gameObject[1])
		If $lf = $gameObject[2] Then
;~ 			_CLog('*Object found* & ' & $phase)
			Return True
		EndIf
	Else
		WinActivate($GameTitle)
		Sleep(1000)
	EndIf
EndFunc   ;==>_Game

Func _Client($object)
	If WinActive($ClientTitle) Then
		$gp = WinGetPos($ClientTitle)
		$lf = PixelGetColor($gp[0] + $object[0], $gp[1] + $object[1])
		If $lf = $object[2] Then
			_CLog('*Object found*')
			Return True
		EndIf
	Else
		WinActivate($ClientTitle)
		Sleep(1000)
	EndIf
EndFunc   ;==>_Client

Func _ex()
	_CLog('-EXIT-')
	Exit
EndFunc   ;==>_ex

Func _ClientEx()
	ProcessClose($ClientGeneral)
	While ProcessExists($ClientGeneral)
		Sleep(2000)
		_CLog('Exiting lol process')
	WEnd
	Sleep(2000)
	Run('D:\Riot Games\League of Legends\LeagueClient')
	While Not ProcessExists($Client)
		Sleep(2000)
		_CLog('Waiting for the game')
	WEnd
	Sleep(2000)
	While Not _Client($PlayButton)
		Sleep(1000)
		_CLog('Looking for Play button')
	WEnd
EndFunc   ;==>_ClientEx

Func _ScrQuit()
	_CLog('GOT IT: This game is the last one')
	MsgBox(0, @ScriptName, 'ScrSript: This game is the last one')
	$ScrQuit = 1
EndFunc
