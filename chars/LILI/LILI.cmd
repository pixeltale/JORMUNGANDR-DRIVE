; The CMD file.
;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 3

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
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,503]) || stateno = 656 || stateno = 670
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = stateno!=421
var(1) = 1

;===========================================================================
;236X - Judgement
[State -1, 236x]
type = ChangeState
value = 3000
triggerall = command = "236x"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = [100,101]

;214X- Strike Heaven
[State -1, 214x]
type = ChangeState
value = 3100
triggerall = command = "214x"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = [100,101]

;214S- Maw of Serpent
[State -1, 214S]
type = ChangeState
value = 3200
triggerall = command = "214S"
triggerall = power >= 4000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = [100,101]

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
triggerall = Map(DJCL) > 0
triggerall = command = "up"
trigger1 = ctrl && stateno!= [40,60]

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "up" || movecontact && command = "holdup"
triggerall = Map(DJCL) > 0
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
triggerall = pos y<-30 || vel y > 0
trigger1 = ctrl
trigger2 = movehit
trigger2 = stateno = 3130
trigger3 = stateno = 1052 && movehit && var(4) > 2
trigger4 = stateno = 703 && power >= 1000 || stateno = 705
;trigger2 = movecontact


;Backward Airdash
[State -1, Air Backdash]
type = ChangeState
value = 61
triggerall = command = "a44" || command = "M44"
trigger1 = statetype = A
trigger1 = ctrl
triggerall = Map(ADash) > 0
triggerall = pos y<-10
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

;===========================================================================

[State 1240, 4EX: Wrath of Aimless]
type = ChangeState
value = 2000
triggerall = power>=1000
triggerall = (command = "b" && command = "c") && command = "holdback" || (command = "EX" && command = "holdback") 
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 1001 && movecontact ;&& enemynear, movetype = H 

[State 1240, 6EX: Piercer: Tyrfing]
type = ChangeState
value = 2200
triggerall = power>=1000 && !map(EX6S_Limiter)
triggerall = (command = "b" && command = "c") && command = "holdfwd" || (command = "EX" && command = "holdfwd") 
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 1001 && movecontact ;&& enemynear, movetype = H 

[State 1240, 2EX: Wrath of Aimless]
type = ChangeState
value = 2300
triggerall = power>=1000 && !map(EX2S_Limiter)
triggerall = (command = "b" && command = "c") && command = "holddown" || (command = "EX" && command = "holddown") 
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 1001 && movecontact ;&& enemynear, movetype = H 

[State 1240, 5EX: BERETTA, THE SUBTYPE]
type = ChangeState
value = 2100
triggerall = power>=1000 && !map(EX5S_Limiter)
triggerall = (command = "b" && command = "c") ||  (command = "EX") 
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 1001 && movecontact ;&& enemynear, movetype = H 

;===========================================================================
;4S - Aimless Serpent (Ground)
[State -1, Spotdodge]
type = ChangeState
value = 1010
triggerall = command = "b"
triggerall = command = "holdback" || command = "back"
triggerall = !map(EN) || stateno = 40
triggerall = statetype != A || stateno = 40
trigger1 = ctrl || stateno = 40
trigger2 = var(1)
trigger3 = stateno = 100

;4SEN - Wandering Serpent (Ground)
[State -1, Spotdodge]
type = ChangeState
value = 1011
triggerall = command = "b"
triggerall = command = "holdback" || command = "back"
triggerall = map(EN)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger2 = movecontact
trigger3 = stateno = 100 && time > 2

;===========================================================================
;6S - Verofolnir
[State -1, Stomp]
type = ChangeState
value = 1100
triggerall = command = "b"
triggerall = command = "holdfwd" && command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 100 && time > 2

;2S - Disengage
[State -1, DP]
type = ChangeState
value = 1090
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 100 && time > 2

;===========================================================================
;j2S: FASTFALL
[State -1, Jotunn's Wrath]
type = changeState
value = 650
triggerall = command = "holddown" && command = "b"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 60
trigger4 = movecontact && stateno = [600,640]

;5S: One-Inch Punch
[State -1, One Inch Punch]
type = changeState
value = 1000
triggerall = command = "b"
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
triggerall = command = "b"
triggerall = statetype != A
triggerall = map(EN)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [200,220] || stateno = [400,431]
trigger3 = movecontact
trigger4 = stateno = 100 && time > 2

;EX jS: Jotunn's Wrath | jEX
[State -1, Jotunn's Wrath]
type = changeState
value = 2500
triggerall = (command = "b" && command = "c") ||  (command = "EX") 
triggerall = statetype = A && !map(EXjS_Limiter)
triggerall = power>=1000
triggerall = !map(jEXLim)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 60
trigger4 = movecontact && stateno = [600,640]

;jS: Jotunn's Wrath
[State -1, Jotunn's Wrath]
type = changeState
value = 1025
triggerall = command = "b"
triggerall = statetype = A
triggerall = !map(EN)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 60
trigger3 = movecontact

;EnjS: Jotunn's Wrath
[State -1, Jotunn's Wrath]
type = changeState
value = 1030
triggerall = command = "b"
triggerall = statetype = A
triggerall = map(EN)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 60
trigger4 = movecontact && stateno = [600,640]

;===========================================================================

[State -1, 2R: Striking Serpent]
type = ChangeState
value = 702 + 1*(Map(EnState))
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype !=A
trigger1 = var(1)
trigger1 = ctrl
trigger2 = stateno = [200,230] || stateno = [400,431]
trigger2 = movecontact
trigger3 = stateno = [100,101]

[State -1, 5R: Coiled Serpent]
type = ChangeState
value = 700 + 1*(MAP(EnState))
triggerall = command = "c"
triggerall = prevstateno != 632
trigger1 = statetype !=A && stateno != 704
trigger1 = var(1)
trigger1 = ctrl
trigger2 = stateno = [200,230] || stateno = [400,431]
trigger2 = movecontact
trigger3 = stateno = [100,101] && !(prevstateno = 2000 && time <= 5)

;===========================================================================
;NORMALS
;===========================================================================
;6H
[State -1, Forward Light]
type = ChangeState
value = 230
triggerall = command = "buffer_z"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = !map(NoNormals)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [400,420] || stateno = 200 || stateno = [210,220]
trigger2 = movecontact
trigger3 = stateno = [100,101] ;run and runstop

;5L: Standing Light
[State -1, Standing Light]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown" && var(59) !=4
triggerall = !map(NoNormals)
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact
trigger3 = stateno = [100,101] 
 
;5M: Standing Medium
[State -1, Standing Medium]
type = ChangeState
value =  210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = !map(NoNormals)
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
;trigger3 = stateno = 100 && time > 3
trigger3 = stateno = [400,410] && movecontact ;2L
trigger4 = stateno = [100,101]   ;runstop

;5H: Standing Heavy
[State -1, Standing Heavy]
type = ChangeState
value =  220
trigger1 = statetype = S
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = !map(NoNormals)
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
trigger3 = (stateno = 210) && movecontact ;5M
trigger4 = (stateno = 410) && movecontact ;2M
trigger5 = (stateno = 420) && movecontact ;2H
;trigger6 = stateno = 100 && time > 3
trigger6 = stateno = 400 && movecontact ;2L
trigger7 = stateno = [100,101] ;run and runstop

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;2L: Crouching Light
[State -1, Crouching Light]
type = ChangeState
value = 400
triggerall = command = "buffer_x"
triggerall = command = "holddown"
triggerall = !map(NoNormals)
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact ;5L
trigger3 = stateno = [100,101] 

;---------------------------------------------------------------------------
;2M: Crouching Medium
[State -1, Crouching Medium]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = !map(NoNormals)
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)  || (stateno = 210) 
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = [100,101] 

;---------------------------------------------------------------------------
;Crouching Heavy (2H)
[State -1, Crouching Heavy]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
triggerall = !map(NoNormals)
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 210) 
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = [100,101] 

;---------------------------------------------------------------------------
;3H: Sweep
[State -1, 3H]
type = ChangeState
value = 430
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = !map(NoNormals)
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410) || (stateno = 210)  || (stateno = 200) 
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = [100,101] 

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;j.5L: Jumping Light
[State -1, Jumping Light] ;jL
type = ChangeState
value = 600
triggerall = command = "x" || command = "buffer_x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350
trigger3 = stateno = 60
trigger4 = stateno = [600, 640] && movehit || stateno = 600 && movecontact
;---------------------------------------------------------------------------
;j.5M: Jumping Medium
[State -1, Jumping Medium]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = movecontact && stateno!= 610
trigger2 = stateno = [630,640] && movehit || stateno = 600 && movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 60

;---------------------------------------------------------------------------
;j.2H: Jumping Heavy
[State -1, Jumping Heavy]
type = ChangeState
value = 640
triggerall = command = "z"
triggerall	= command = "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600, 630] && movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 60

;j.5H: Jumping Heavy
[State -1, Jumping Heavy]
type = ChangeState
value = 630
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,610] && movecontact || stateno = 640 && movehit
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 60



;---------------------------------------------------------------------------
;===========================================================================
;PARRY (RED)                                                              []
;==========================================================================
;
;[State -1, Standing RED Parry]
;type = HitOverRide
;trigger1 = roundstate = 2 && (statetype = S || stateno = 5120)
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = movetype != A
;trigger1 = stateno = [151,153]
;attr = SA, AA, AP, HP, HA, NA, SA, SP, NP
;stateno = 703
;slot = 0
;time = 2

;[State -1, Crouching RED Parry]
;type = hitoverride
;trigger1 = roundstate = 2 && statetype != A
;trigger1 = command = "down" && command != "back" && command != "back" && command != "up"
;trigger1 = movetype != A
;trigger1 = stateno = [151,153]
;attr = C, AA, AP, HP, HA, NA, SA
;stateno = 704
;slot = 0
;time = 2
;
;[State -1, Air RED Parry]
;type = hitoverride
;trigger1 = roundstate = 2 && statetype = A
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = movetype != A
;trigger1 = stateno = [154,155]
;attr = SA, AA, AP, HP, HA, NA, SA
;stateno = 705
;forceair = 1
;slot = 0
;time = 2

;===========================================================================
;PARRY (BLUE)                                                             []
;==========================================================================

;[State -1, Standing Parry]
;type = HitOverRide
;triggerall = enemy, !map(LOW)
;trigger1 = roundstate = 2 && (statetype = S || stateno = 5120)
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = ctrl || (stateno = [700, 701])||(stateno = [703, 704]) || stateno = 5120
;trigger1 = movetype != A
;attr = SA, AA, AP, HP, HA, NA, SA, SP, NP
;stateno = 700
;slot = 0
;time = 6
;
;[State -1, Crouching Parry]
;type = hitoverride
;triggerall = enemy, !map(Overhead)
;trigger1 = roundstate = 2 && statetype != A
;trigger1 = command = "down" && command != "fwd" && command != "back" && command != "up"
;trigger1 = ctrl || (stateno = [700, 701])||(stateno = [703, 704]) || stateno = 5120
;trigger1 = movetype != A
;attr = C, AA, AP, HP, HA, NA, SA
;stateno = 701
;slot = 0
;time = 6
;
;[State -1, Air Parry]
;type = hitoverride
;trigger1 = roundstate = 2 && statetype = A
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = ctrl || stateno = 702 || stateno = 705
;trigger1 = movetype != A
;attr = SA, AA, AP, HP, HA, NA, SA
;stateno = 702
;forceair = 1
;slot = 0
;time = 8
