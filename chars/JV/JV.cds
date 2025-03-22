; The CMD file.
;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 5

[Command]
name = "236236A"
command = ~D, F, D, F, a
time = 26
[Command]
name = "214A_unbuffer"
command = ~$D, B, a
buffer.time = 0

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
[State -1, Cancel Condition Reset]
type = VarSet		;Ground Special
trigger1 = 1
var(1) = 0
[State -1, Cancel Condition Reset]
type = VarSet		;Air Special
trigger1 = 1
var(2) = 0

[State -1, Cancel Condition Check]
type = VarSet
triggerall = statetype != A
trigger1 = ctrl || stateno = 100
trigger2 = (stateno = [200,299] || stateno = [400,503]) && movecontact
var(1) = 1

[State -1, Cancel Condition Check]
type = VarSet
trigger1 = statetype = A && ctrl
trigger2 = stateno = [600, 640]
trigger2 = movecontact
trigger3 = stateno = 60
var(2) = 1

;===========================================================================
;236X - Judgement
[State -1, 236x]
type = ChangeState
value = 3000
triggerall = command = "236236C"
triggerall = power >= 2000 * map(METER.COST)
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

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "up" && map(doubleJump_BUFFFIX) < 2 || movecontact && command = "holdup"
triggerall = stateno!= [45,46]
triggerall = Map(DoubleJump)
triggerall= statetype = A
trigger1 = ctrl
trigger2 = movecontact
trigger2 = hitdefattr = A, NA



;---------------------------------------------------------------------------
;Forward Airdash
[State -1, Airdash]
type = ChangeState
value = 60
triggerall = command != "holdback"
triggerall = command = "a66" || command = "M66"
triggerall = statetype = A
triggerall = Map(airdash)
triggerall = pos y<-65 || vel y > 0
trigger1 = ctrl || stateno = 713


;Backward Airdash
[State -1, Air Backdash]
type = ChangeState
value = 61
triggerall = command = "a44" || command = "M44"
trigger1 = statetype = A
trigger1 = ctrl
triggerall = Map(airdash)
triggerall = pos y<-65
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
trigger2 = stateno = 250 || map(Shock.DC)

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
;DEVIANT DRIVES
;===========================================================================
;j236D: Jotunn's Extinction
[State -1, Jotunn's Extinction]
type = changeState
value = 2000
triggerall = command = "236D" && power >= 1000 * map(METER.COST)
trigger1 = var(2)

;j236D > j236D: Ordinance Driver
[State -1, Ordinance Driver]
type = changeState
value = 2010
triggerall = command = "236D" && power >= 1000 * map(METER.COST)
trigger1 = stateno = 2000 && movehit

;===========================================================================
;SPECIAL ATTACKS
;===========================================================================
;236A
[State -1, One Inch Punch]
type = changeState
value = 1000
triggerall = command = "236A"
triggerall = !map(EN)
trigger1 = var(1)

;E236A
[State -1, One Inch Punch]
type = changeState
value = 1001
triggerall = command = "236A"
triggerall = map(EN)
trigger1 = var(1)

;214A
[State -1, Spotdodge]
type = ChangeState
value = 1010
triggerall = command = "214A"
triggerall = stateno = 40 || !map(EN) && statetype != A
trigger1 = var(1) || stateno = 40

;E214A
[State -1, Spotdodge]
type = ChangeState
value = 1011
triggerall = command = "214A" && prevstateno != 1010 || command = "214A_unbuffer" && prevstateno = 1010 
triggerall = map(EN)
trigger1 = var(1)

;236B - Strike the Earth
[State -1, STE]
type = ChangeState
value = 1030
triggerall = command = "236B"
trigger1 = var(1)

;IRON MOUNTAIN'S COFFIN
[State -1, Tetsuzankou]
type = changeState
value = 1020
triggerall = command = "623C"
trigger1 = var(1)

;===========================================================================
;STRIKE THE EARTH!
;===========================================================================
;THE BEAST UNLEASHED ....
[State -1, Beast Elbow]
type = changeState
value = 1034
triggerall = command = "624C"
trigger1 = var(1)
trigger2 = MAP(StrikeCount) = 2 && stateno != 1034

;THE TREE OF LIFE AND DEATH......
;[State -1, Yggdrasil]
;type = changeState
;value = 1206
;triggerall = command = "236C"
;trigger1 = MAP(StrikeCount) = 2

;ALL EXISTENCE DENIED......
;[State -1, EGO DEATH DRIVER]
;type = changeState
;value = 1207
;triggerall = command = "6246A"
;trigger1 = MAP(StrikeCount) = 2

;===========================================================================

;===========================================================================
;Air Specials
;===========================================================================
;j22C
[State -1, Fastfall]
type = changeState
value = 1217
triggerall = command = "22C" && (pos y <= -30)
trigger1 = var(2)

;j236C: Jotunn's Wrath
[State -1, Jotunn's Wrath]
type = changeState
value = cond(map(EN), 1041, 1040)
triggerall = command = "236C" && command != "up"
trigger1 = var(2)

;===========================================================================
;SYSTEM MECHANICS
;===========================================================================
[State -1, PARADIGM SHIFT]
type 		= ChangeState
value 		= 915 + (statetype = A)
triggerall	= map(VoidGauge) >= 1000
triggerall 	= command = "E" && command = "D" || command = "SHIFT"
trigger1 		= var(1 + (statetype = A)) || movetype != H && roundstate = 2
[State -1, EXCEED Shock]
type 		= ChangeState
value 		= 905
triggerall 	= power >= 1000 * map(METER.COST)
triggerall 	= command = "E"
trigger1	 	= var(1)

;===========================================================================
;DRIVER ACTION
;===========================================================================
[State -1, 5D: Coiled Serpent]
type = ChangeState
value = 700 + 1*(MAP(EnState))
triggerall = command = "D"
trigger1 = var(1)
[State -1, j.5D: Coiled Serpent]
type = ChangeState
value = 710
triggerall = command = "D" && (pos y <= -30)
trigger1 = var(2)

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
trigger2 = (stateno = 400 || stateno = [200, 210] ) && movecontact && prevstateno != 410

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
type 		= ChangeState
value 		= 640
triggerall 	= command = "C"
triggerall	= command = "holddown"
triggerall 	= statetype = A
trigger1 		= ctrl
trigger2 		= stateno = [600, 630] && movecontact

;j.C: Jumping Heavy
[State -1, jC]
type = ChangeState
value = 630
triggerall = command = "C"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,610] && movecontact

;DEVIANT REDLINE CANCEL
[State -1, REDLINE CANCEL]
type = ChangeState
value = 4002
triggerall = power >=1000 * map(METER.COST) && stateno != 4002
triggerall = command = "F"
triggerall = statetype != A
trigger1 = map(FRC)

;DEVIANT REDLINE CANCEL (AIR)
[State -1, REDLINE CANCEL]
type = ChangeState
value = 4003
triggerall = power>=1000 * map(METER.COST) && stateno != 4003
triggerall = command = "F"
triggerall = statetype = A 
trigger1 = map(FRC)