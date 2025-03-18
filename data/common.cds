[Defaults]
command.time = 15
command.buffer.time = 5

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1
[Command]
name = "A"
command = a
time = 1
[Command]
name = "b"
command = b
time = 1
[Command]
name = "B"
command = b
time = 1
[Command]
name = "c"
command = c
time = 1
[Command]
name = "C"
command = c
time = 1
[Command]
name = "d"
command = d
time = 1
[Command]
name = "D"
command = d
time = 1
[Command]
name = "F"
command = x
time = 1
[Command]
name = "E"
command = y
time = 1
[Command]
name = "z"
command = z
time = 1
[Command]
name = "w"
command = w
time = 1
[Command]
name = "s"
command = s
time = 1
[Command]
name = "start"
command = s
time = 1
[Command]
name = "start"
command = /s
buffer.time = 30
[Command]
name = "m"
command = m
time = 1

[Command]
name = "pushblock"
command = a
time = 1
buffer.time = 10

[Command]
name = "pushblock"
command = a
time = 1
buffer.time = 1

[Command]
name = "back"     ; REQUIRED for command buffering
command = B
time = 1
ignorehitpause = 1

[Command]
name = "fwd"      ; REQUIRED for command buffering
command = F
time = 1
[Command]
name = "airjump"       ; REQUIRED for command buffering
command = >$U
time = 5
buffer.time = 3
[Command]
name = "up"       ; REQUIRED for command buffering
command = $U
time = 1
buffer.time = 3
[Command]
name = "down"     ; REQUIRED for command buffering
command = D
time = 1

[Command]
name = "upfwd"
command = UF
time = 1
[Command]
name = "upback"
command = UB
time = 1

[Command]
name = "downback" ; REQUIRED for command buffering
command = DB
time = 1
[Command]
name = "downfwd"  ; REQUIRED for command buffering
command = DF
time = 1
[Command]
name = "fwd2"     ; REQUIRED for command buffering
command = $F
time = 1
[Command]
name = "back2"    ; REQUIRED for command buffering
command = $B
time = 1
[Command]
name = "up2"
command = $U      ; REQUIRED for command buffering
time = 1
[Command]
name = "down2"    ; REQUIRED for command buffering
command = $D
time = 1

[Command]
name = "upfwd2"
command = $UF
time = 1
[Command]
name = "upback2"
command = $UB
time = 1
[Command]
name = "downback2"
command = $DB
time = 1
[Command]
name = "downfwd2"
command = $DF
time = 1


[Command]
name = "recovery"
command = 
time = 1
buffer.time = 1

[Command]
name = "TagShiftBack"
command = d
time = 1
buffer.time = 1

[Command]
name = "TagShiftFwd"
command = w
time = 1
buffer.time = 1

[Command]
name = "menu"
command = m
time = 1
buffer.time = 1

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "holdx"
command = /x
time = 1
[Command]
name = "holdy"
command = /y
time = 1
[Command]
name = "holdz"
command = /z
time = 1
[Command]
name = "holdw"
command = /w
time = 1
[Command]
name = "HOLD_A"
command = /a
time = 1
[Command]
name = "HOLD_B"
command = /b
time = 1
[Command]
name = "HOLD_C"
command = /c
time = 1
[Command]
name = "HOLD_D"
command = /d
time = 1
[Command]
name = "HOLD_F"
command = /x
time = 1
[Command]
name = "holds"
command = /s
time = 1



;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1
[Command]
name = "hold_y"
command = /y
time = 1
[Command]
name = "hold_z"
command = /z
time = 1
[Command]
name = "hold_w"
command = /w
time = 1
[Command]
name = "hold_a"
command = /a
time = 1
[Command]
name = "hold_b"
command = /b
time = 1
[Command]
name = "hold_c"
command = /c
time = 1
[Command]
name = "hold_d"
command = /d
time = 1
[Command]
name = "hold_start"
command = /s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1
buffer.time = 2
[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1
buffer.time = 2
[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1
buffer.time = 2
[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1
buffer.time = 2
[Command]
name = "holdup" ;Required (do not remove)
command = /UF
time = 1
buffer.time = 2
[Command]
name = "holdup" ;Required (do not remove)
command = /UB
time = 1
buffer.time = 2

[Command]
name = "holdfwd_r" ; Raw hold forward (REQUIRED for command buffering)
command = /F
time = 1
[Command]
name = "holddown_r" ; Raw hold forward (REQUIRED for command buffering)
command = /D
time = 1
[Command]
name = "holdback_r" ; Raw hold forward (REQUIRED for command buffering)
command = /B
time = 1
[Command]
name = "holdup_r" ; Raw hold forward (REQUIRED for command buffering)
command = /U
time = 1

;-| Release Dir |-----------------------------------------------------------
[Command]
name = "release_fwd"
command = ~F
time = 1

[Command]
name = "release_down"
command = ~D
time = 1

[Command]
name = "release_back"
command = ~B
time = 1

[Command]
name = "release_up"
command = ~U
time = 1

[Command]
name = "release_fwd_g"    ; REQUIRED for command buffering
command = ~$F
time = 1

[Command]
name = "release_down_g"   ; REQUIRED for command buffering
command = ~$D
time = 1

[Command]
name = "release_back_g"   ; REQUIRED for command buffering
command = ~$B
time = 1

[Command]
name = "release_up_g"     ; REQUIRED for command buffering
command = ~$U
time = 1

[Command]
name = "release_downback" ; REQUIRED for command buffering
command = ~DB
time = 1

[Command]
name = "release_downfwd"  ; REQUIRED for command buffering
command = ~DF
time = 1

;-| Release Button |---------------------------------------------------------
[Command]
name = "release_a"
command = ~a
time = 1

[Command]
name = "release_b"
command = ~b
time = 1

[Command]
name = "release_c"
command = ~c
time = 1
[Command]
name = "release_d"
command = ~d
time = 1
[Command]
name = "release_x"
command = ~x
time = 1

[Command]
name = "release_y"
command = ~y
time = 1

[Command]
name = "release_z"
command = ~z
time = 1
[Command]
name = "release_w"
command = ~w
time = 1
[Command]
name = "release_start"
command = ~s
time = 1

[Command]
name = "TagShiftBack"
command = d
time = 1

[Command]
name = "TagShiftFwd"
command = w
time = 1

;-| Multi Button |---------------------------------------------------------
[Command]
name = "AB"
command = a+b
time = 1
[Command]
name = "BC"
command = b+c
time = 1
[Command]
name = "CD"
command = c+d
time = 1
[Command]
name = "DE"
command = d+e
time = 1

[Command]
name = "ABC"
command = a+b+c
time = 1

;====== DOUBLE TAP =========
[Command]
name = "66"
command = F, F
time = 10
buffertime = 15

[Command]
name = "66"
command = F, n, F
time = 10
buffertime = 5

[Command]
name = "66"
command = ~F, F
time = 5
buffertime = 5


[Command]
name = "a66"
command = ~F, F
time = 10
buffertime = 20


[Command]
name = "44"
command = B, B
time = 10
buffertime = 15

[Command]
name = "a44"
command = ~B, B
time = 10
buffertime = 20


[Command]
name = "28"
command = $D, U
time = 10
buffer.time = 10
[Command]
name = "29"
command = $D, UF
time = 10
buffer.time = 10
[Command]
name = "29"
command = $D, DF, F, U
time = 10
buffer.time = 10
[Command]
name = "29"
command = $D, DF, F, N, U
time = 10
buffer.time = 10
[Command]
name = "29"
command = $D, U, F
time = 10
buffer.time = 10
[Command]
name = "29"
command = $D, F, U
time = 10
buffer.time = 10
[Command]
name = "27"
command = $D, UB
time = 10
buffer.time = 10
[Command]
name = "27"
command = $D, U, B
time = 10
buffer.time = 10
[Command]
name = "27"
command = $D, B, U
time = 10
buffer.time = 10
[Command]
name = "27"
command = $D, DB, B, U
time = 10
buffer.time = 10
[Command]
name = "27"
command = $D, DB, B, N, U
time = 10
buffer.time = 10
[Command]
name = "88"
command = ~U, U
time = 10
buffer.time = 8
[Command]
name = "22"
command = ~D, D
time = 10
buffer.time = 8
[Command]
name = "222"
command = ~D, D, D
time = 40
buffer.time = 8

;===================================
; RECOVERY
;===================================
[Command]
name = "recovery"
command = /a
time = 4
[Command]
name = "recovery"
command = /b
time = 4
[Command]
name = "recovery"
command = /c
time = 4
[Command]
name = "recovery"
command = /x
time = 4
[Command]
name = "recovery"
command = /y
time = 4
[Command]
name = "recovery"
command = /z
time = 4

;System
[Command]
name = "REDLINE GUARD"
command = /F,x
time = 1
buffer.time = 2
;System
[Command]
name = "BLUELINE GUARD"
command = /$B,/x
time = 1
buffer.time = 2

;===================================
; Command Inputs - Super
;===================================

[Command]
name = "236236A"
command = ~D, DF, F, D, DF, F, a
time = 30
buffer.time = 15
[Command]
name = "236236B"
command = ~D, DF, F, D, DF, F, b
time = 30
buffer.time = 15
[Command]
name = "236236C"
command = ~D, DF, F, D, DF, F, c
time = 30
buffer.time = 15
[Command]
name = "236236D"
command = ~D, DF, F, D, DF, F, d
time = 30
buffer.time = 15
[Command]
name = "236236CD"
command = ~D, DF, F, D, DF, F, c+d
time = 20
buffer.time = 15

[Command]
name = "214214A"
command = ~D, DB, B, D, DB, B, a
time = 20
[Command]
name = "214214B"
command = ~D, DB, B, D, DB, B, b
time = 20
[Command]
name = "214214C"
command = ~D, DB, B, D, DB, B, c
time = 20
[Command]
name = "214214D"
command = ~D, DB, B, D, DB, B, d
time = 20
[Command]
name = "214214CD"
command = ~D, DB, B, D, DB, B, c+d
time = 20

[Command]
name = "632146A"
command = ~F, DF, D, DB, B, F, a
[Command]
name = "632146B"
command = ~F, DF, D, DB, B, F, b
[Command]
name = "632146C"
command = ~F, DF, D, DB, B, F, c
[Command]
name = "632146D"
command = ~F, DF, D, DB, B, F, d
time = 15
buffer.time = 15
[Command]
name = "6246Y"
command = ~$F, $D, $B, $F, y
time = 15
buffer.time = 15
[Command]
name = "6246Z"
command = ~$F, $D, $B, $F, z
time = 15
buffer.time = 15
[Command]
name = "632146CD"
command = ~F, DF, D, DB, B, F, c+x

[Command]
name = "ExGuard"
command = ~F, y

;===================================
; Command Inputs - Special, Without Buttons
;===================================
[Command]
name = "6246"
command = ~$F, $D, $B, $F
[Command]
name = "624"
command = ~$F, $D, $B
[Command]
name = "426"
command = ~$B, $D, F
[Command]
name = "63214"
command = ~F, DF, D, DB, B
[Command]
name = "623"
command = ~F, D, DF
time = 10
buffer.time = 10
[Command]
name = "421"
command = ~B, D, DB
time = 8
buffer.time = 10
[Command]
name = "236"
command = ~D, DF, F
time = 6
buffer.time = 10
[Command]
name = "214"
command = ~D, DB, B
time = 6
buffer.time = 10
[Command]
name = "MistStep"
command = ~$F, D, DF
time = 20
buffer.time = 15
[Command]
name = "MistStep"
command = ~$F, $D, $F
time = 20
buffer.time = 15
[Command]
name = "MistStep"
command = ~$F, N, D, DF
time = 20
buffer.time = 15

;===================================
; Command Inputs - Special, With Buttons
;===================================
[Command]
name = "6246A"
command = ~$F, $D, $B, F, a
buffer.time = 10
[Command]
name = "6246B"
command = ~$F, $D, $B, F, b
buffer.time = 10
[Command]
name = "6246C"
command = ~$F, $D, $B, F, c
buffer.time = 10
[Command]
name = "6246D"
command = ~$F, $D, $B, F, d
buffer.time = 10

[Command]
name = "632146A"
command = ~F, DF, D, DB, B, F, a
buffer.time = 15
[Command]
name = "632146B"
command = ~F, DF, D, DB, B, F, b
buffer.time = 15
[Command]
name = "632146C"
command = ~F, DF, D, DB, B, F, c
buffer.time = 15
[Command]
name = "632146D"
command = ~F, DF, D, DB, B, F, x
buffer.time = 15

[Command]
name = "41236A"
command = ~B, DB, D, DF, F, a
buffer.time = 10
[Command]
name = "41236B"
command = ~B, DB, D, DF, F, b
buffer.time = 10
[Command]
name = "41236C"
command = ~B, DB, D, DF, F, c
buffer.time = 10
[Command]
name = "41236D"
command = ~B, DB, D, DF, F, x
buffer.time = 10

[Command]
name = "624A"
command = ~$F, $D, $B, a
buffer.time = 10
[Command]
name = "624B"
command = ~$F, $D, $B, b
buffer.time = 10
[Command]
name = "624C"
command = ~$F, $D, $B, c
buffer.time = 10
[Command]
name = "624D"
command = ~$F, $D, $B, d
buffer.time = 10

[Command]
name = "63214A"
command = ~F, DF, D, DB, B, a
buffer.time = 10
[Command]
name = "63214B"
command = ~F, DF, D, DB, B, b
buffer.time = 10
[Command]
name = "63214C"
command = ~F, DF, D, DB, B, c
buffer.time = 10
[Command]
name = "63214D"
command = ~F, DF, D, DB, B, x
buffer.time = 10

[Command]
name = "623A"
command = ~F, D, $F, a
[Command]
name = "623B"
command = ~F, D, $F, b
[Command]
name = "623C"
command = ~F, D, $F, c
[Command]
name = "623D"
command = ~F, D, $F, x

[Command]
name = "421A"
command = ~B, D, DB, a
time = 6
[Command]
name = "421B"
command = ~B, D, DB, b
time = 6
[Command]
name = "421C"
command = ~B, D, DB, c
time = 6
[Command]
name = "421D"
command = ~B, D, DB, x
time = 6

[Command]
name = "236A"
command = ~D, DF, F, a
[Command]
name = "236B"
command = ~D, DF, F, b
[Command]
name = "236C"
command = ~D, DF, F, c
[Command]
name = "236D"
command = ~D, DF, F, d

[Command]
name = "214A"
command = ~D, DB, B, a
[Command]
name = "214B"
command = ~D, DB, B, b
[Command]
name = "214C"
command = ~D, DB, B, c
[Command]
name = "214D"
command = ~D, DB, B, x

[Command]
name = "66A"
command = F, F, a
time = 10
[Command]
name = "66B"
command = F, F, b
time = 10
[Command]
name = "66C"
command = F, F, c
time = 10
[Command]
name = "66D"
command = F, F, x
time = 10

[Command]
name = "22A"
command = ~D, D, a
time = 10
[Command]
name = "22B"
command = ~D, D, a
time = 10
[Command]
name = "22C"
command = ~D, D, c
time = 10
[Command]
name = "22D"
command = ~D, D, d
time = 10

;236 Motion ========================[]
[Command]
name = "236x"
command = ~D, DF, F, x
time = 15
buffer.time = 4
[Command]
name = "236x"   ;Same name as above
command = ~D, DF, F, y
time = 15
buffer.time = 4
[Command]
name = "236x"   ;Same name as above
command = ~D, DF, F, z
time = 15
buffer.time = 4
[Command]
name = "236s"   ;Same name as above
command = ~D, DF, F, s
time = 15
buffer.time = 4
[Command] ;Duplicates for Case Sensitivity ==========
name = "236X"
command = ~D, DF, F, x
time = 15
buffer.time = 4
[Command]
name = "236X"   ;Same name as above
command = ~D, DF, F, y
time = 15
buffer.time = 4
[Command]
name = "236X"   ;Same name as above
command = ~D, DF, F, z
time = 15
buffer.time = 4
name = "236S"   ;Same name as above
command = ~D, DF, F, s
time = 15
buffer.time = 4

;214 Motion ========================[]
[Command]
name = "214x"
command = ~D, DB, B, x;~F, D, DF, F, D, DF, x
time = 10
[Command]
name = "214x"   ;Same name as above
command = ~D, DB, B, y;~F, D, DF, F, D, DF, y
time = 10
[Command]
name = "214x"   ;Same name as above
command = ~D, DB, B, z;~F, D, DF, F, D, DF, y
time = 10
[Command]
name = "214s"   ;Same name as above
command = ~D, DB, B, b;~F, D, DF, F, D, DF, y
time = 10
[Command] ;Duplicates for Case Sensitivity ==========
name = "214X"
command = ~D, DB, B, x;~F, D, DF, F, D, DF, x
time = 10
[Command]
name = "214X"   ;Same name as above
command = ~D, DB, B, y;~F, D, DF, F, D, DF, y
time = 10
[Command]
name = "214X"   ;Same name as above
command = ~D, DB, B, z;~F, D, DF, F, D, DF, y
time = 10
[Command]
name = "214S"   ;Same name as above
command = ~D, DB, B, b;~F, D, DF, F, D, DF, y
time = 10

;623 Motion
[Command]
name = "623X"
command = ~F, D, DF, x

[Command]
name = "623X"
command = ~F, D, DF, y

[Command]
name = "623X"
command = ~F, D, DF, z

;MACROS ======================[]

[Command]
name = "M44"
command = /B, w
time = 1
[Command]
name = "M44"
command = /DB, w
time = 1
[Command]
name = "M66"
command = w
time = 1
[Command]
name = "M66Hold"
command = /w
time = 1
[Command]
name = "M22"
command = ~/$D, w
time = 1
[Command]
name = "M88"
command = ~/$U, w
time = 1

[Command]
name = "EX"
command = d
time = 1
buffer.time = 2
[Command]
name = "EX"
command = b+c
time = 1
buffer.time = 2

[Command]
name = "reset"
command = ~D,D,c

[Command]
name = "holdupb"
command = $U
time = 1
buffer.time = 5

;-| Throws |-----------------------------------------------
[Command]
name = "Throw"
command = b+c
time = 3
buffer.time = 2

[Command]
name = "throwtech"
command = a+b
time = 1
[Command]
name = "throwtech"
command = b+c
time = 1
[Command]
name = "throwtech"
command = a+c
time = 1


;==| Buffers |===============================
[Command]
name = "buffer_z" 
command = z
time = 1
buffer.time = 3

[Command]
name = "buffer_x" 
command = x
time = 1
buffer.time = 3

[Command]
name = "buffer_y" 
command = y
time = 1
buffer.time = 3

[Command]
name = "buffer_a"
command = a
time = 1
buffer.time = 3

[Command]
name = "buffer_b"
command = b
time = 1
buffer.time = 3

[Command]
name = "buffer_c"
command = c
time = 1
buffer.time = 3

