; The CMD file.
;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 5

[Command]
name = "236236L"
command = ~D, F, D, F, a
time = 26
[Command]
name = "6246L"
command = ~$F, $D, $B, $F, a
[Command]
name = "426H"
command = ~$B, $D, F, c
time = 30
buffer.time = 10
[Command]
name = "624H"
command = ~$F, $D, B, c
time = 30
buffer.time = 10
[Command]
name = "214L"
command = ~$D, B, a
buffer.time = 5
[Command]
name = "214L_unbuffer"
command = ~$D, B, a
buffer.time = 0
[Command]
name = "214M"
command = ~$D, B, b
buffer.time = 10
[Command]
name = "214H"
command = ~$D, B, c
buffer.time = 10
[Command]
name = "214R"
command = ~$D, B, c
buffer.time = 10
[Command]
name = "236L"
command = ~D, >F, a
[Command]
name = "236M"
command = ~D, >F, b
[Command]
name = "236H"
command = ~D, >F, c
[Command]
name = "236R"
command = ~$D, >F, d
buffer.time = 10
[Command]
name = "22L"
command = ~D, D, a
time = 10
[Command]
name = "22M"
command = ~D, D, b
time = 10
[Command]
name = "22H"
command = ~D, D, c
time = 10
[Command]
name = "22R"
command = ~D, D, d
time = 10

[Command]
name = "feintBuffer_B"
command = /b
time = 1
buffer.time = 0
[Command]
name = "feintBuffer_C"
command = /c
time = 1
buffer.time = 0

[Statedef -1]

;===========================================================================

;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A && ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,503]) || stateno = [600, 640]
trigger2 = movecontact
trigger3 = stateno = 100 || stateno = 60
var(1) = 1

;===========================================================================
;236X - Judgement
[State -1, 236x]
type = ChangeState
value = 3000
triggerall = command = "236236C"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = [100,101]

;214X- Strike Heaven
;[State -1, 214x]
;type = ChangeState
;value = 3100
;triggerall = command = "214x"
;triggerall = power >= 2000
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = statetype != A
;trigger2 = stateno != [3000,3050)
;trigger2 = movecontact ;&& enemynear, movetype = H
;trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
;trigger4 = stateno = [100,101]

;214S- Maw of Serpent
;[State -1, 214S]
;type = ChangeState
;value = 3200
;triggerall = command = "214S"
;triggerall = power >= 4000
;triggerall = statetype != A
;trigger1 = ctrl || var(1) || stateno < 3000 && movehit && stateno != [800, 805]

;===============================================================================
;---------------------------------------------------------------------------

;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = ctrl
trigger2 = Map(JC)

[State -1,JC]
type = ChangeState
value = 40
triggerall = statetype != A
triggerall = command = "holdup" || command = "up"
trigger1 = map(JC)
trigger2 = ctrl ||stateno = 100 && time > 3

;Double Jump Raw
[State -1,DJC]
type = ChangeState
value = 45
triggerall = Map(DoubleJump)  < 1
triggerall = command = "up"
trigger1 = ctrl && stateno!= [40,60]

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "up" || movecontact && command = "holdup"
triggerall = Map(DoubleJump) < 1
trigger1 = ctrl && stateno!= [40,55] && !(stateno = 56 && time < 30)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = hitdefattr = A, NA
trigger2 = stateno!=620
trigger3 =  stateno=45 || stateno=46|| stateno=50
trigger3 = vel y>.1



;---------------------------------------------------------------------------
;Forward Airdash
[State -1, Airdash]
type = ChangeState
value = 60
triggerall = command != "holdback"
triggerall = command = "a66" || command = "M66"
triggerall = statetype = A
triggerall = Map(ADash) > 0
triggerall = pos y<-45 || vel y > 0
trigger1 = ctrl
trigger2 = movehit
trigger2 = stateno = 3130
trigger3 = stateno = 1052 && movehit && var(4) > 2
trigger4 = stateno = 703 && power >= 1000 || stateno = 705


;Backward Airdash
[State -1, Air Backdash]
type = ChangeState
value = 61
triggerall = command = "a44" || command = "M44"
trigger1 = statetype = A
trigger1 = ctrl
triggerall = Map(ADash) > 0
triggerall = pos y<-45
;--------------------------------------------------------------------------

;Dash
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = command != "holdback"
triggerall = command = "66" || command = "M66"
triggerall = stateno!=100
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250

;Backdash
[State -1, Backdash]
type = ChangeState
value = 105
triggerall = command = "44" || command = "M44"
triggerall = stateno!=105
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250

;===========================================================================
;SPECIAL ATTACKS
;===========================================================================

;IRON MOUNTAIN'S COFFIN
[State -1, One Inch Punch]
type = changeState
value = 2300
triggerall = command = "623C"
triggerall = statetype != A
trigger1 = var(1) || ctrl

;THE BEAST UNLEASHED ....
[State -1, Beast Elbow]
type = changeState
value = 1205
triggerall = command = "624H"
triggerall = statetype != A
trigger1 = var(1)
trigger2 = MAP(StrikeCount) = 2

;THE TREE OF LIFE AND DEATH......
[State -1, Yggdrasil]
type = changeState
value = 1206
triggerall = command = "236H"
triggerall = statetype != A
trigger1 = MAP(StrikeCount) = 2

;ALL EXISTENCE DENIED......
[State -1, EGO DEATH DRIVER]
type = changeState
value = 1207
triggerall = command = "6246L"
triggerall = statetype != A
trigger1 = MAP(StrikeCount) = 2

;===========================================================================
;4S - Aimless Serpent (Ground)
[State -1, Spotdodge]
type = ChangeState
value = 1010
triggerall = command = "214L"
triggerall = stateno = 40 || !map(EN) && statetype != A
trigger1 = ctrl
trigger2 = var(1) || stateno = 40

;4SEN - Wandering Serpent (Ground)
[State -1, Spotdodge]
type = ChangeState
value = 1011
triggerall = command = "214L" && prevstateno != 1010 || command = "214L_unbuffer" && prevstateno = 1010 
triggerall = map(EN)
triggerall = statetype != A
trigger1 = var(1)

;===========================================================================
;236M - Strike the Earth
[State -1, STE]
type = ChangeState
value = 1200
triggerall = command = "236M"
triggerall = statetype != A
trigger1 = var(1)
trigger2 = stateno = 100 && time > 2

;6S - Verofolnir
[State -1, Stomp]
type = ChangeState
value = 1100
triggerall = command = "236H" && command != "426H"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 100 && time > 2

;2S - Disengage
[State -1, DP]
type = ChangeState
value = 1090
triggerall = command = "214M"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 100 && time > 2

;===========================================================================
;j22L: HOP
[State -1, Fastfall]
type = changeState
value = 651
triggerall = command = "22L"
triggerall = statetype = A && !map(L_Teleport)
trigger1 = var(1) || ctrl || stateno = 652 && movecontact

;j22M: HOP
[State -1, Fastfall]
type = changeState
value = 652
triggerall = command = "22M"
triggerall = statetype = A
trigger1 = var(1) || ctrl || stateno = 650

;j22H FASTFALL
[State -1, Fastfall]
type = changeState
value = 650
triggerall = command = "22H"
triggerall = statetype = A
trigger1 = var(1) || ctrl || stateno = 651

;5S: One-Inch Punch
[State -1, One Inch Punch]
type = changeState
value = 1000
triggerall = command = "236L"
triggerall = statetype != A
triggerall = !map(EN)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [200,220] || stateno = [400,431]
trigger3 = movecontact


;5SEN: One-Inch Punch
[State -1, One Inch Punch]
type = changeState
value = 1001
triggerall = command = "236L"
triggerall = statetype != A
triggerall = map(EN)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [200,220] || stateno = [400,431]
trigger3 = movecontact
trigger4 = stateno = 100 && time > 2

;j236C: Jotunn's Wrath
[State -1, Jotunn's Wrath]
type = changeState
value = cond(map(EN), 1030, 1025)
triggerall = command = "236H"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 60
trigger4 = movecontact && stateno = [600,640]


[State -1, EXCEED Shock]
type = ChangeState
value = 905
triggerall = command = "236" && command = "F"
triggerall = statetype !=A
trigger1 = var(1)
trigger2 = stateno = [200,230] || stateno = [400,431]
trigger2 = movecontact
trigger3 = stateno = [100,101]
;===========================================================================

[State -1, 2D: Striking Serpent]
type = ChangeState
value = 702 + 1*(Map(EnState))
triggerall = command = "D"
triggerall = command = "holddown"
triggerall = statetype !=A
trigger1 = var(1)
trigger2 = stateno = [200,230] || stateno = [400,431]
trigger2 = movecontact
trigger3 = stateno = [100,101]

[State -1, 5D: Coiled Serpent]
type = ChangeState
value = 700 + 1*(MAP(EnState))
triggerall = command = "D"
triggerall = prevstateno != 632
triggerall = statetype !=A && stateno != 704
trigger1 = var(1)
trigger1 = ctrl
trigger2 = stateno = [200,230] || stateno = [400,431]
trigger2 = movecontact
trigger3 = stateno = [100,101] && !(prevstateno = 2000 && time <= 5)

;===========================================================================
;NORMALS
;===========================================================================
;6C
[State -1, 6C]
type = ChangeState
value = 230
triggerall = statetype != A
triggerall = command = "C"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = !map(NoNormals)
trigger1 = ctrl || stateno = [100,101]
trigger2 = (stateno = [400,420] || stateno = [200,220]) && movecontact

;5A
[State -1, Standing Light]
type = ChangeState
value = 200
triggerall = statetype != A
triggerall = command = "A"
triggerall = command != "holddown" && var(59) !=4
triggerall = !map(NoNormals)
trigger1 = ctrl || stateno = [100,101] 
trigger2 = stateno = 400 && movecontact

;5B
[State -1, Standing Medium]
type = ChangeState
value =  210
triggerall = statetype != A
triggerall = command = "B"
triggerall = command != "holddown"
triggerall = !map(NoNormals)
trigger1 = ctrl || stateno = [100,101] 
trigger2 = (stateno = 200 || stateno = [400,410]) && movecontact

;5C
[State -1, Standing Heavy]
type = ChangeState
value =  220
triggerall = statetype != A
triggerall = command = "C"
triggerall = command != "holddown"
triggerall = !map(NoNormals)
trigger1 = ctrl || stateno = [100,101] 
trigger2 = (stateno = [200,210] || stateno = [400,420]) && movecontact

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;2A
[State -1, 2A]
type = ChangeState
value = 400
triggerall = statetype != A
triggerall = command = "A"
triggerall = command = "holddown"
triggerall = !map(NoNormals)
trigger1 = ctrl || stateno = [100,101] 
trigger2 = stateno = 200 && movecontact

;---------------------------------------------------------------------------
;2B
[State -1, 2B]
type = ChangeState
value = 410
triggerall = statetype != A
triggerall = command = "B"
triggerall = command = "holddown"
triggerall = !map(NoNormals)
trigger1 = ctrl || stateno = [100,101] 
trigger2 = (stateno = 400 || stateno = [200, 210] ) && movecontact

;---------------------------------------------------------------------------
;2C
[State -1, 2C]
type = ChangeState
value = 420
triggerall = statetype != A
triggerall = command = "C"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
triggerall = !map(NoNormals)
trigger1 = ctrl || stateno = [100,101] 
trigger2 = (stateno = [400, 410] || stateno = [200, 210]) && movecontact

;---------------------------------------------------------------------------
;3C
[State -1, 3C]
type = ChangeState
value = 430
triggerall = statetype != A
triggerall = command = "C"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = !map(NoNormals)
trigger1 = ctrl || stateno = [100,101] 
trigger2 = (stateno = [400, 420] || stateno = [200, 220]) && movecontact

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;jA
[State -1, jA]
type = ChangeState
value = 600
triggerall = command = "A"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
;---------------------------------------------------------------------------
;j.B
[State -1, jB]
type = ChangeState
value = 610
triggerall = command = "B"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = movecontact && stateno = 600

;---------------------------------------------------------------------------
;j.2C: Jumping Heavy
[State -1, j2C]
type = ChangeState
value = 640
triggerall = command = "C"
triggerall	= command = "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600, 630] && movecontact

;j.C: Jumping Heavy
[State -1, jC]
type = ChangeState
value = 630
triggerall = command = "C"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,610] && movecontact

;REDLINE GUARD
[State -1, REDLINE GUARD]
type = ChangeState
value = 910 + 1*statetype = A
triggerall = power >= (500 * prevstateno = [120, 155])
triggerall = command = "Redline Guard"
trigger1 = ctrl || stateno = [120,155] && map(IBParam)

;DEVIANT REDLINE CANCEL
[State -1, REDLINE CANCEL]
type = ChangeState
value = 4002
triggerall = power >=1000 && stateno != 4002
triggerall = command = "F"
triggerall = statetype != A
trigger1 = map(FRC)

;DEVIANT REDLINE CANCEL (AIR)
[State -1, REDLINE CANCEL]
type = ChangeState
value = 4003
triggerall = power>=1000 && stateno != 4003
triggerall = command = "F"
triggerall = statetype = A 
trigger1 = map(FRC)