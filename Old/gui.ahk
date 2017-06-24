;------------------------------------------
; -=: Alan's Rift INI Editor :=-
;------------------------------------------

;------------------------------------------
; Set Working Dir and Specify Files
;------------------------------------------
SetWorkingDir %A_ScriptDir%
IniFile:=A_ScriptDir "\Rift.ini"
IniFileBak:=A_ScriptDir "\Rift.ini.bak" 

;------------------------------------------
; Load Variables From Rift.ini
;------------------------------------------
; Common Vars 
IniRead, AttackColor, %IniFile%, Common, AttackColor
IniRead, FinishColor, %IniFile%, Common, FinishColor
IniRead, FinishX, %IniFile%, Common, FinishX
IniRead, FinishY, %IniFile%, Common, FinishY
IniRead, InteruptColor, %IniFile%, Common, InteruptColor
IniRead, InteruptX, %IniFile%, Common, InteruptX
IniRead, InteruptY, %IniFile%, Common, InteruptY
; Login Vars
IniRead, UserEmail, %IniFile%, Login, UserEmail
IniRead, UserPassword, %IniFile%, Login, UserPassword
; Bard PVP
IniRead, FinisherKey_1, %IniFile%, Bard_PVP, FinisherKey
IniRead, FinisherHealKey_1, %IniFile%, Bard_PVP, FinisherHealKey
IniRead, InteruptKey_1, %IniFile%, Bard_PVP, InteruptKey
IniRead, MotifX_1, %IniFile%, Bard_PVP, MotifX
IniRead, MotifY_1, %IniFile%, Bard_PVP, MotifY
IniRead, MRegen1_1, %IniFile%, Bard_PVP, MRegen1
IniRead, MRegen2_1, %IniFile%, Bard_PVP, MRegen2
IniRead, MRegenKey_1, %IniFile%, Bard_PVP, MRegenKey
IniRead, MGrand1_1, %IniFile%, Bard_PVP, MGrand1
IniRead, MGrand2_1, %IniFile%, Bard_PVP, MGrand2
IniRead, MGrandKey_1, %IniFile%, Bard_PVP, MGrandKey
IniRead, MTenacity1_1, %IniFile%, Bard_PVP, MTenacity1
IniRead, MTenacity2_1, %IniFile%, Bard_PVP, MTenacity2
IniRead, MTenacityKey_1, %IniFile%, Bard_PVP, MTenacityKey
IniRead, MFocus1_1, %IniFile%, Bard_PVP, MFocus1
IniRead, MFocus2_1, %IniFile%, Bard_PVP, MFocus2
IniRead, MFocusKey_1, %IniFile%, Bard_PVP, MFocusKey
IniRead, MBravery1_1, %IniFile%, Bard_PVP, MBravery1
IniRead, MBravery2_1, %IniFile%, Bard_PVP, MBravery2
IniRead, MBraveryKey_1, %IniFile%, Bard_PVP, MBraveryKey
IniRead, MotTime_1, %IniFile%, Bard_PVP, MotTime
IniRead, MotTimeBuff_1, %IniFile%, Bard_PVP, MotTimeBuff
IniRead, BuffX_1, %IniFile%, Bard_PVP, BuffX
IniRead, BuffY_1, %IniFile%, Bard_PVP, BuffY
IniRead, FSleep_1, %IniFile%, Bard_PVP, FSleep
IniRead, DSleep_1, %IniFile%, Bard_PVP, DSleep
IniRead, PRes1_1, %IniFile%, Bard_PVP, PRes1
IniRead, PRes2_1, %IniFile%, Bard_PVP, PRes2
IniRead, PResKey_1, %IniFile%, Bard_PVP, PResKey
IniRead, GPhase1_1, %IniFile%, Bard_PVP, GPhase1
IniRead, GPhase2_1, %IniFile%, Bard_PVP, GPhase2
IniRead, GPhaseKey_1, %IniFile%, Bard_PVP, GPhaseKey
IniRead, AComp1_1, %IniFile%, Bard_PVP, AComp1
IniRead, AComp2_1, %IniFile%, Bard_PVP, AComp2
IniRead, ACompKey_1, %IniFile%, Bard_PVP, ACompKey
IniRead, FVigor1_1, %IniFile%, Bard_PVP, FVigor1
IniRead, FVigor2_1, %IniFile%, Bard_PVP, FVigor2
IniRead, FVigorKey_1, %IniFile%, Bard_PVP, FVigorKey
IniRead, FPower1_1, %IniFile%, Bard_PVP, FPower1
IniRead, FPower2_1, %IniFile%, Bard_PVP, FPower2
IniRead, FPowerKey_1, %IniFile%, Bard_PVP, FPowerKey
IniRead, CadX_1, %IniFile%, Bard_PVP, CadX
IniRead, CadY_1, %IniFile%, Bard_PVP, CadY
IniRead, CadColor_1, %IniFile%, Bard_PVP, CadColor
; NB PVP
IniRead, FinisherKey_2, %IniFile%, NB_Vars, FinisherKey
IniRead, InteruptKey_2, %IniFile%, NB_Vars, InteruptKey
IniRead, PhantomColor_2, %IniFile%, NB_Vars, PhantomColor
IniRead, PhantomX_2, %IniFile%, NB_Vars, PhantomX
IniRead, PhantomY_2, %IniFile%, NB_Vars, PhantomY
IniRead, PhantomKey_2, %IniFile%, NB_Vars, PhantomKey
IniRead, BuffX_2, %IniFile%, NB_Vars, BuffX
IniRead, BuffY_2, %IniFile%, NB_Vars, BuffY
IniRead, FBlades_2, %IniFile%, NB_Vars, FBlades
IniRead, FBladesKey_2, %IniFile%, NB_Vars, FBladesKey
IniRead, HBlades_2, %IniFile%, NB_Vars, HBlades
IniRead, HBladesKey_2, %IniFile%, NB_Vars, HBladesKey
IniRead, PRes_2, %IniFile%, NB_Vars, PRes
IniRead, PResKey_2, %IniFile%, NB_Vars, PResKey
IniRead, PRev_2, %IniFile%, NB_Vars, PRev
IniRead, PRevKey_2, %IniFile%, NB_Vars, PRevKey
IniRead, PhaseX_2, %IniFile%, NB_Vars, PhaseX
IniRead, PhaseY_2, %IniFile%, NB_Vars, PhaseY
IniRead, Phase_2, %IniFile%, NB_Vars, Phase
IniRead, PhaseKey_2, %IniFile%, NB_Vars, PhaseKey
; Solo
IniRead, FinisherKey_3, %IniFile%, Solo_Vars, FinisherKey
IniRead, FinisherAOEKey_3, %IniFile%, Solo_Vars, FinisherAOEKey
IniRead, InteruptKey_3, %IniFile%, Solo_Vars, InteruptKey
IniRead, PhantomColor_3, %IniFile%, Solo_Vars, PhantomColor
IniRead, PhantomX_3, %IniFile%, Solo_Vars, PhantomX
IniRead, PhantomY_3, %IniFile%, Solo_Vars, PhantomY
IniRead, PhantomKey_3, %IniFile%, Solo_Vars, PhantomKey
IniRead, BuffX_3, %IniFile%, Solo_Vars, BuffX
IniRead, BuffY_3, %IniFile%, Solo_Vars, BuffY
IniRead, L1Poison_3, %IniFile%, Solo_Vars, L1Poison
IniRead, L1PoisonKey_3, %IniFile%, Solo_Vars, L1PoisonKey
IniRead, L2Poison_3, %IniFile%, Solo_Vars, L2Poison
IniRead, L2PoisonKey_3, %IniFile%, Solo_Vars, L2PoisonKey
IniRead, PRes_3, %IniFile%, Solo_Vars, PRes
IniRead, PResKey_3, %IniFile%, Solo_Vars, PResKey
IniRead, PRev_3, %IniFile%, Solo_Vars, PRev
IniRead, PRevKey_3, %IniFile%, Solo_Vars, PRevKey
IniRead, ComRes_3, %IniFile%, Solo_Vars, ComRes
IniRead, ComResKey_3, %IniFile%, Solo_Vars, ComResKey
IniRead, PhaseX_3, %IniFile%, Solo_Vars, PhaseX
IniRead, PhaseY_3, %IniFile%, Solo_Vars, PhaseY
IniRead, Phase_3, %IniFile%, Solo_Vars, Phase
IniRead, PhaseKey_3, %IniFile%, Solo_Vars, PhaseKey
; Bard PVE
IniRead, FinisherKey_4, %IniFile%, Bard_PVE, FinisherKey
IniRead, FinisherHealKey_4, %IniFile%, Bard_PVE, FinisherHealKey
IniRead, MotifX_4, %IniFile%, Bard_PVE, MotifX
IniRead, MotifY_4, %IniFile%, Bard_PVE, MotifY
IniRead, MRegen1_4, %IniFile%, Bard_PVE, MRegen1
IniRead, MRegen2_4, %IniFile%, Bard_PVE, MRegen2
IniRead, MRegenKey_4, %IniFile%, Bard_PVE, MRegenKey
IniRead, MGrand1_4, %IniFile%, Bard_PVE, MGrand1
IniRead, MGrand2_4, %IniFile%, Bard_PVE, MGrand2
IniRead, MGrandKey_4, %IniFile%, Bard_PVE, MGrandKey
IniRead, MTenacity1_4, %IniFile%, Bard_PVE, MTenacity1
IniRead, MTenacity2_4, %IniFile%, Bard_PVE, MTenacity2
IniRead, MTenacityKey_4, %IniFile%, Bard_PVE, MTenacityKey
IniRead, MFocus1_4, %IniFile%, Bard_PVE, MFocus1
IniRead, MFocus2_4, %IniFile%, Bard_PVE, MFocus2
IniRead, MFocusKey_4, %IniFile%, Bard_PVE, MFocusKey
IniRead, MBravery1_4, %IniFile%, Bard_PVE, MBravery1
IniRead, MBravery2_4, %IniFile%, Bard_PVE, MBravery2
IniRead, MBraveryKey_4, %IniFile%, Bard_PVE, MBraveryKey
IniRead, MotTime_4, %IniFile%, Bard_PVE, MotTime
IniRead, MotTimeBuff_4, %IniFile%, Bard_PVE, MotTimeBuff
IniRead, BuffX_4, %IniFile%, Bard_PVE, BuffX
IniRead, BuffY_4, %IniFile%, Bard_PVE, BuffY
IniRead, FSleep_4, %IniFile%, Bard_PVE, FSleep
IniRead, DSleep_4, %IniFile%, Bard_PVE, DSleep
IniRead, VPoison1_4, %IniFile%, Bard_PVE, VPoison1
IniRead, VPoison2_4, %IniFile%, Bard_PVE, VPoison2
IniRead, VPoisonkey_4, %IniFile%, Bard_PVE, VPoisonkey
IniRead, LPoison1_4, %IniFile%, Bard_PVE, LPoison1
IniRead, LPoison2_4, %IniFile%, Bard_PVE, LPoison2
IniRead, LPoisonKey_4, %IniFile%, Bard_PVE, LPoisonKey
IniRead, FVigor1_4, %IniFile%, Bard_PVE, FVigor1
IniRead, FVigor2_4, %IniFile%, Bard_PVE, FVigor2
IniRead, FVigorKey_4, %IniFile%, Bard_PVE, FVigorKey
IniRead, FPower1_4, %IniFile%, Bard_PVE, FPower1
IniRead, FPower2_4, %IniFile%, Bard_PVE, FPower2
IniRead, FPowerKey_4, %IniFile%, Bard_PVE, FPowerKey
IniRead, CadX_4, %IniFile%, Bard_PVE, CadX
IniRead, CadY_4, %IniFile%, Bard_PVE, CadY
IniRead, CadColor_4, %IniFile%, Bard_PVE, CadColor

;------------------------------------------
; Build GUI
;------------------------------------------
Gui, Add, Text, x2 y0 w770 h20 , -=: Alan's Rift Rogue GUI Scripts Editor :=-
Gui, Add, Tab, x2 y20 w830 h380 , General|Login|BardStalker|NightStalker|RiftBlade|BardDancer

;------------------------------------------
; General Tab
;------------------------------------------
Gui, Add, Text, x42 y60 w70 h20 , Attack Color:
Gui, Add, Edit, x132 y60 w100 h20 R1 vAttackColor, %AttackColor%
Gui, Add, Text, x42 y90 w70 h20 , Finish Color:
Gui, Add, Edit, x132 y90 w100 h20 R1 vFinishColor, %FinishColor%
Gui, Add, Text, x42 y120 w70 h20 , Interupt Color:
Gui, Add, Edit, x132 y120 w100 h20 R1 vInteruptColor, %InteruptColor%
Gui, Add, Text, x42 y150 w70 h20 , Finish X:
Gui, Add, Edit, x132 y150 w100 h20 R1 vFinishX, %FinishX%
Gui, Add, Text, x42 y180 w70 h20 , Finish Y:
Gui, Add, Edit, x132 y180 w100 h20 R1 vFinishY, %FinishY%
Gui, Add, Text, x42 y210 w70 h20 , Interupt X:
Gui, Add, Edit, x132 y210 w100 h20 R1 vInteruptX, %InteruptX%
Gui, Add, Text, x42 y240 w70 h20 , Interupt Y:
Gui, Add, Edit, x132 y240 w100 h20 R1 vInteruptY, %InteruptY%
Gui, Add, Button, x732 y0 w100 h30 gButtonBackup1, Backup
Gui, Add, Button, x622 y0 w100 h30 gButtonSave1, Save

;------------------------------------------
; Login Tab
;------------------------------------------
Gui, Tab, Login
Gui, Add, Text, x42 y60 w90 h20 , User Name:
Gui, Add, Edit, x142 y60 w170 h20 R1 vUserEmail, %UserEmail%
Gui, Add, Text, x42 y90 w90 h20 , Password:
Gui, Add, Edit, x142 y90 w170 h20 R1 vUserPassword, ***********
Gui, Add, Button, x732 y0 w100 h30 gButtonBackup2, Backup
Gui, Add, Button, x622 y0 w100 h30 gButtonSave2, Save

;------------------------------------------
; BardStalker Tab
;------------------------------------------
Gui, Tab, BardStalker
Gui, Add, Text, x12 y50 w100 h20 , Finisher Key:
Gui, Add, Edit, x122 y50 w80 h20 R1 vFinisherKey_1, %FinisherKey_1%
Gui, Add, Text, x12 y80 w100 h20 , Finisher Heal Key:
Gui, Add, Edit, x122 y80 w80 h20 R1 vFinisherHealKey_1, %FinisherHealKey_1%
Gui, Add, Text, x12 y110 w100 h20 , Interupt Key:
Gui, Add, Edit, x122 y110 w80 h20 R1 vInteruptKey_1, %InteruptKey_1%
Gui, Add, Text, x12 y140 w100 h20 , Motif X:
Gui, Add, Edit, x122 y140 w80 h20 R1 vMotifX_1, %MotifX_1%
Gui, Add, Text, x12 y170 w100 h20 , Motif Y:
Gui, Add, Edit, x122 y170 w80 h20 R1 vMotifY_1, %MotifY_1%
Gui, Add, Text, x12 y200 w100 h20 , Regen Color 1:
Gui, Add, Edit, x122 y200 w80 h20 R1 vMRegen1_1, %MRegen1_1%
Gui, Add, Text, x12 y230 w100 h20 , Regen Color 2:
Gui, Add, Edit, x122 y230 w80 h20 R1 vMRegen2_1, %MRegen2_1%
Gui, Add, Text, x12 y260 w100 h20 , Regen Key:
Gui, Add, Edit, x122 y260 w80 h20 R1 vMRegenKey_1, %MRegenKey_1%
Gui, Add, Text, x12 y290 w100 h20 , Grandeur Color 1:
Gui, Add, Edit, x122 y290 w80 h20 R1 vMGrand1_1, %MGrand1_1%
Gui, Add, Text, x12 y320 w100 h20 , Grandeur Color 2:
Gui, Add, Edit, x122 y320 w80 h20 R1 vMGrand2_1, %MGrand2_1%
Gui, Add, Text, x12 y350 w100 h20 , Grandeur Key:
Gui, Add, Edit, x122 y350 w80 h20 R1 vMGrandKey_1, %MGrandKey_1%
Gui, Add, Text, x212 y50 w100 h20 , Tenacity Color 1:
Gui, Add, Edit, x322 y50 w80 h20 R1 vMTenacity1_1, %MTenacity1_1%
Gui, Add, Text, x212 y80 w100 h20 , Tenacity Color 2:
Gui, Add, Edit, x322 y80 w80 h20 R1 vMTenacity2_1, %MTenacity2_1%
Gui, Add, Text, x212 y110 w100 h20 , Tenacity Key:
Gui, Add, Edit, x322 y110 w80 h20 R1 vMTenacityKey_1, %MTenacityKey_1%
Gui, Add, Text, x212 y140 w100 h20 , Focus Color 1:
Gui, Add, Edit, x322 y140 w80 h20 R1 vMFocus1_1, %MFocus1_1%
Gui, Add, Text, x212 y170 w100 h20 , Focus Color 2:
Gui, Add, Edit, x322 y170 w80 h20 R1 vMFocus2_1, %MFocus2_1%
Gui, Add, Text, x212 y200 w100 h20 , Focus Key:
Gui, Add, Edit, x322 y200 w80 h20 R1 vMFocusKey_1, %MFocusKey_1%
Gui, Add, Text, x212 y230 w100 h20 , Bravery Color 1:
Gui, Add, Edit, x322 y230 w80 h20 R1 vMBravery1_1, %MBravery1_1%
Gui, Add, Text, x212 y260 w100 h20 , Bravery Color 2:
Gui, Add, Edit, x322 y260 w80 h20 R1 vMBravery2_1, %MBravery2_1%
Gui, Add, Text, x212 y290 w100 h20 , Bravery Key:
Gui, Add, Edit, x322 y290 w80 h20 R1 vMBraveryKey_1, %MBraveryKey_1%
Gui, Add, Text, x212 y320 w100 h20 , Motif Time:
Gui, Add, Edit, x322 y320 w80 h20 R1 vMotTime_1, %MotTime_1%
Gui, Add, Text, x212 y350 w100 h20 , Motif Buff Time:
Gui, Add, Edit, x322 y350 w80 h20 R1 vMotTimeBuff_1, %MotTimeBuff_1%
Gui, Add, Text, x412 y50 w100 h20 , Buff X:
Gui, Add, Edit, x522 y50 w80 h20 R1 vBuffX_1, %BuffX_1%
Gui, Add, Text, x412 y80 w100 h20 , Buff Y:
Gui, Add, Edit, x522 y80 w80 h20 R1 vBuffY_1, %BuffY_1%
Gui, Add, Text, x412 y110 w100 h20 , Fanfair Sleep:
Gui, Add, Edit, x522 y110 w80 h20 R1 vFSleep_1, %FSleep_1%
Gui, Add, Text, x412 y140 w100 h20 , Buff Sleep:
Gui, Add, Edit, x522 y140 w80 h20 R1 vDSleep_1, %DSleep_1%
Gui, Add, Text, x412 y170 w100 h20 , Planebound Color 1:
Gui, Add, Edit, x522 y170 w80 h20 R1 vPRes1_1, %PRes1_1%
Gui, Add, Text, x412 y200 w100 h20 , Planebound Color 2:
Gui, Add, Edit, x522 y200 w80 h20 R1 vPRes2_1, %PRes2_1%
Gui, Add, Text, x412 y230 w100 h20 , Planebound Key:
Gui, Add, Edit, x522 y230 w80 h20 R1 vPResKey_1, %PResKey_1%
Gui, Add, Text, x412 y260 w100 h20 , Phase Color 1:
Gui, Add, Edit, x522 y260 w80 h20 R1 vGPhase1_1, %GPhase1_1%
Gui, Add, Text, x412 y290 w100 h20 , Phase Color 2:
Gui, Add, Edit, x522 y290 w80 h20 R1 vGPhase2_1, %GPhase2_1%
Gui, Add, Text, x412 y320 w100 h20 , Phase Key:
Gui, Add, Edit, x522 y320 w80 h20 R1 vGPhaseKey_1, %GPhaseKey_1%
Gui, Add, Text, x412 y350 w100 h20 , Anthem Color 1:
Gui, Add, Edit, x522 y350 w80 h20 R1 vAComp1_1, %AComp1_1%
Gui, Add, Text, x612 y50 w100 h20 , Anthem Color 2
Gui, Add, Edit, x722 y50 w80 h20 R1 vAComp2_1, %AComp2_1%
Gui, Add, Text, x612 y80 w100 h20 , Anthem Key:
Gui, Add, Edit, x722 y80 w80 h20 R1 vACompKey_1, %ACompKey_1%
Gui, Add, Text, x612 y110 w100 h20 , Vigor Color 1:
Gui, Add, Edit, x722 y110 w80 h20 R1 vFVigor1_1, %FVigor1_1%
Gui, Add, Text, x612 y140 w100 h20 , Vigor Color 2:
Gui, Add, Edit, x722 y140 w80 h20 R1 vFVigor2_1, %FVigor2_1%
Gui, Add, Text, x612 y170 w100 h20 , Vigor Key:
Gui, Add, Edit, x722 y170 w80 h20 R1 vFVigorKey_1, %FVigorKey_1%
Gui, Add, Text, x612 y200 w100 h20 , Power Color 1:
Gui, Add, Edit, x722 y200 w80 h20 R1 vFPower1_1, %FPower1_1%
Gui, Add, Text, x612 y230 w100 h20 , Power Color 2:
Gui, Add, Edit, x722 y230 w80 h20 R1 vFPower2_1, %FPower2_1%
Gui, Add, Text, x612 y260 w100 h20 , Power Key:
Gui, Add, Edit, x722 y260 w80 h20 R1 vFPowerKey_1, %FPowerKey_1%
Gui, Add, Text, x612 y290 w100 h20 , Cadence X:
Gui, Add, Edit, x722 y290 w80 h20 R1 vCadX_1, %CadX_1%
Gui, Add, Text, x612 y320 w100 h20 , Cadence Y:
Gui, Add, Edit, x722 y320 w80 h20 R1 vCadY_1, %CadY_1%
Gui, Add, Text, x612 y350 w100 h20 , Cadence Color:
Gui, Add, Edit, x722 y350 w80 h20 R1 vCadColor_1, %CadColor_1%
Gui, Add, Button, x732 y0 w100 h30 gButtonBackup3, Backup
Gui, Add, Button, x622 y0 w100 h30 gButtonSave3, Save

;------------------------------------------
; NightStalker Tab
;------------------------------------------
Gui, Tab, NightStalker
Gui, Add, Text, x32 y50 w100 h20 , Finisher Key:
Gui, Add, Edit, x142 y50 w100 h20 R1 vFinisherKey_2, %FinisherKey_2%
Gui, Add, Text, x32 y80 w100 h20 R1 v, Interupt Key:
Gui, Add, Edit, x142 y80 w100 h20 R1 vInteruptKey_2, %InteruptKey_2%
Gui, Add, Text, x32 y110 w100 h20 , Phantom Color:
Gui, Add, Edit, x142 y110 w100 h20 R1 vPhantomColor_2, %PhantomColor_2%
Gui, Add, Text, x32 y140 w100 h20 , Phantom X:
Gui, Add, Edit, x142 y140 w100 h20 R1 vPhantomX_2, %PhantomX_2%
Gui, Add, Text, x32 y170 w100 h20 , Phantom Y:
Gui, Add, Edit, x142 y170 w100 h20 R1 vPhantomY_2, %PhantomY_2%
Gui, Add, Text, x32 y200 w100 h20 , Phantom Key:
Gui, Add, Edit, x142 y200 w100 h20 R1 vPhantomKey_2, %PhantomKey_2%
Gui, Add, Text, x32 y230 w100 h20 , Buff X:
Gui, Add, Edit, x142 y230 w100 h20 R1 vBuffX_2, %BuffX_2%
Gui, Add, Text, x32 y260 w100 h20 , Buff Y:
Gui, Add, Edit, x142 y260 w100 h20 R1 vBuffY_2, %BuffY_2%
Gui, Add, Text, x32 y290 w100 h20 , Fell Blades Color 1:
Gui, Add, Edit, x142 y290 w100 h20 R1 vFBlades_2, %FBlades_2%
 Gui, Add, Text, x32 y320 w100 h20 , Fell Blades Key:
Gui, Add, Edit, x142 y320 w100 h20 R1 vFBladesKey_2, %FBladesKey_2%
Gui, Add, Text, x282 y50 w100 h20 , Hell Blades Color 1:
Gui, Add, Edit, x392 y50 w100 h20 R1 vHBlades_2, %HBlades_2%
Gui, Add, Text, x282 y80 w100 h20 , Hell Blades Key:
Gui, Add, Edit, x392 y80 w100 h20 R1 vHBladesKey_2, %HBladesKey_2%
Gui, Add, Text, x282 y110 w100 h20 , Planebound Color 1:
Gui, Add, Edit, x392 y110 w100 h20 R1 vPRes_2, %PRes_2%
Gui, Add, Text, x282 y140 w100 h20 , Planebound Key:
Gui, Add, Edit, x392 y140 w100 h20 R1 vPResKey_2, %PResKey_2%
Gui, Add, Text, x282 y170 w100 h20 , Planar Rev Color 1:
Gui, Add, Edit, x392 y170 w100 h20 R1 vPRev_2, %PRev_2%
Gui, Add, Text, x282 y200 w100 h20 , Planar Rev Key:
Gui, Add, Edit, x392 y200 w100 h20 R1 vPRevKey_2, %PRevKey_2%
Gui, Add, Text, x282 y230 w100 h20 , Phase X:
Gui, Add, Edit, x392 y230 w100 h20 R1 vPhaseX_2, %PhaseX_2%
Gui, Add, Text, x282 y260 w100 h20 , Phase Y:
Gui, Add, Edit, x392 y260 w100 h20 R1 vPhaseY_2, %PhaseY_2%
Gui, Add, Text, x282 y290 w100 h20 , Phase Color:
Gui, Add, Edit, x392 y290 w100 h20 R1 vPhase_2, %Phase_2%
Gui, Add, Text, x282 y320 w100 h20 , Phase Key:
Gui, Add, Edit, x392 y320 w100 h20 vPhaseKey_2, %PhaseKey_2%
Gui, Add, Button, x732 y0 w100 h30 gButtonBackup4, Backup
Gui, Add, Button, x622 y0 w100 h30 gButtonSave4, Save

;------------------------------------------
; RiftBlade Tab
;------------------------------------------
Gui, Tab, RiftBlade
Gui, Add, Text, x32 y50 w100 h20 , Finisher Key:
Gui, Add, Edit, x142 y50 w100 h20 R1 vFinisherKey_3, %FinisherKey_3%
Gui, Add, Text, x32 y80 w100 h20 , Finisher AOE Key:
Gui, Add, Edit, x142 y80 w100 h20 R1 vFinisherAOEKey_3, %FinisherAOEKey_3%
Gui, Add, Text, x32 y110 w100 h20 , Inpterupt Key:
Gui, Add, Edit, x142 y110 w100 h20 R1 vInteruptKey_3, %InteruptKey_3%
Gui, Add, Text, x32 y140 w100 h20 , Phantom Color:
Gui, Add, Edit, x142 y140 w100 h20 R1 vPhantomColor_3, %PhantomColor_3%
Gui, Add, Text, x32 y170 w100 h20 , Phantom X:
Gui, Add, Edit, x142 y170 w100 h20 R1 vPhantomX_3, %PhantomX_3%
Gui, Add, Text, x32 y200 w100 h20 , Phantom Y:
Gui, Add, Edit, x142 y200 w100 h20 R1 vPhantomY_3, %PhantomY_3%
Gui, Add, Text, x32 y230 w100 h20 , Phantom Key:
Gui, Add, Edit, x142 y230 w100 h20 R1 v,PhantomKey_3 %PhantomKey_3%
Gui, Add, Text, x32 y260 w100 h20 , Buff X:
Gui, Add, Edit, x142 y260 w100 h20 R1 vBuffX_3, %BuffX_3%
Gui, Add, Text, x32 y290 w100 h20 , Buff Y:
Gui, Add, Edit, x142 y290 w100 h20 R1 vBuffY_3, %BuffY_3%
Gui, Add, Text, x32 y320 w100 h20 , Leech Poison Color:
Gui, Add, Edit, x142 y320 w100 h20 R1 vL1Poison_3, %L1Poison_3%
Gui, Add, Text, x32 y350 w100 h20 , Leech Poison Key:
Gui, Add, Edit, x142 y350 w100 h20 R1 vL1PoisonKey_3, %L1PoisonKey_3%
Gui, Add, Text, x302 y50 w100 h20 , Lethal Poison Color:
Gui, Add, Edit, x412 y50 w100 h20 R1 vL2Poison_3, %L2Poison_3%
Gui, Add, Text, x302 y80 w100 h20 , Lethal Poison Key:
Gui, Add, Edit, x412 y80 w100 h20 R1 vL2PoisonKey_3, %L2PoisonKey_3%
Gui, Add, Text, x302 y110 w100 h20 , Planebound Color:
Gui, Add, Edit, x412 y110 w100 h20 R1 vPRes_3, %PRes_3%
Gui, Add, Text, x302 y140 w100 h20 , Planebound Key:
Gui, Add, Edit, x412 y140 w100 h20 R1 vPResKey_3, %PResKey_3%
Gui, Add, Text, x302 y170 w100 h20 , Planar Rev Color:
Gui, Add, Edit, x412 y170 w100 h20 R1 vPRev_3, %PRev_3%
Gui, Add, Text, x302 y200 w100 h20 , Planar Rev Key:
Gui, Add, Edit, x412 y200 w100 h20 R1 vPRevKey_3, %PRevKey_3%
Gui, Add, Text, x302 y230 w100 h20 , Combat Res Color:
Gui, Add, Edit, x412 y230 w100 h20 R1 vComRes_3, %ComRes_3%
Gui, Add, Text, x302 y260 w100 h20 , Combat Res Key:
Gui, Add, Edit, x412 y260 w100 h20 R1 vComResKey_3, %ComResKey_3%
Gui, Add, Text, x302 y290 w100 h20 , Phase X:
Gui, Add, Edit, x412 y290 w100 h20 R1 vPhaseX_3, %PhaseX_3%
Gui, Add, Text, x302 y320 w100 h20 , Phase Y:
Gui, Add, Edit, x412 y320 w100 h20 R1 vPhaseY_3, %PhaseY_3%
Gui, Add, Text, x302 y350 w100 h20 , Phase Color:
Gui, Add, Edit, x412 y350 w100 h20 R1 vPhase_3, %Phase_3%
Gui, Add, Text, x562 y50 w100 h20 , Phase Key:
Gui, Add, Edit, x672 y50 w100 h20 R1 vPhaseKey_3, %PhaseKey_3%
Gui, Add, Button, x732 y0 w100 h30 gButtonBackup5, Backup
Gui, Add, Button, x622 y0 w100 h30 gButtonSave5, Save

;------------------------------------------
; BardDancer Tab
;------------------------------------------
Gui, Tab, BardDancer
Gui, Add, Text, x12 y50 w100 h20 , Finisher Key:
Gui, Add, Edit, x122 y50 w80 h20 R1 vFinisherKey_4, %FinisherKey_4%
Gui, Add, Text, x12 y80 w100 h20 , Finisher Heal Key:
Gui, Add, Edit, x122 y80 w80 h20 R1 vFinisherHealKey_4, %FinisherHealKey_4%
Gui, Add, Text, x12 y110 w100 h20 , Interupt Key:
Gui, Add, Edit, x122 y110 w80 h20 , 
Gui, Add, Text, x12 y140 w100 h20 , Motif X:
Gui, Add, Edit, x122 y140 w80 h20 R1 vMotifX_4, %MotifX_4%
Gui, Add, Text, x12 y170 w100 h20 , Motif Y:
Gui, Add, Edit, x122 y170 w80 h20 R1 vMotifY_4, %MotifY_4%
Gui, Add, Text, x12 y200 w100 h20 , Regen Color 1:
Gui, Add, Edit, x122 y200 w80 h20 R1 vMRegen1_4, %MRegen1_4%
Gui, Add, Text, x12 y230 w100 h20 , Regen Color 2:
Gui, Add, Edit, x122 y230 w80 h20 R1 vMRegen2_4, %MRegen2_4%
Gui, Add, Text, x12 y260 w100 h20 , Regen Key:
Gui, Add, Edit, x122 y260 w80 h20 R1 vMRegenKey_4, %MRegenKey_4%
Gui, Add, Text, x12 y290 w100 h20 , Grandeur Color 1:
Gui, Add, Edit, x122 y290 w80 h20 R1 vMGrand1_4, %MGrand1_4%
Gui, Add, Text, x12 y320 w100 h20 , Grandeur Color 2:
Gui, Add, Edit, x122 y320 w80 h20 R1 vMGrand2_4, %MGrand2_4%
Gui, Add, Text, x12 y350 w100 h20 , Grandeur Key:
Gui, Add, Edit, x122 y350 w80 h20 R1 vMGrandKey_4, %MGrandKey_4%
Gui, Add, Text, x212 y50 w100 h20 , Tenacity Color 1:
Gui, Add, Edit, x322 y50 w80 h20 R1 vMTenacity1_4, %MTenacity1_4%
Gui, Add, Text, x212 y80 w100 h20 , Tenacity Color 2:
Gui, Add, Edit, x322 y80 w80 h20 R1 vMTenacity2_4, %MTenacity2_4%
Gui, Add, Text, x212 y110 w100 h20 , Tenacity Key:
Gui, Add, Edit, x322 y110 w80 h20 R1 vMTenacityKey_4, %MTenacityKey_4%
Gui, Add, Text, x212 y140 w100 h20 , Focus Color 1:
Gui, Add, Edit, x322 y140 w80 h20 R1 vMFocus1_4, %MFocus1_4%
Gui, Add, Text, x212 y170 w100 h20 , Focus Color 2:
Gui, Add, Edit, x322 y170 w80 h20 R1 vMFocus2_4, %MFocus2_4%
Gui, Add, Text, x212 y200 w100 h20 , Focus Key:
Gui, Add, Edit, x322 y200 w80 h20 R1 vMFocusKey_4, %MFocusKey_4%
Gui, Add, Text, x212 y230 w100 h20 , Bravery Color 1:
Gui, Add, Edit, x322 y230 w80 h20 R1 vMBravery1_4, %MBravery1_4%
Gui, Add, Text, x212 y260 w100 h20 , Bravery Color 2:
Gui, Add, Edit, x322 y260 w80 h20 R1 vMBravery2_4, %MBravery2_4%
Gui, Add, Text, x212 y290 w100 h20 , Bravery Key:
Gui, Add, Edit, x322 y290 w80 h20 R1 vMBraveryKey_4, %MBraveryKey_4%
Gui, Add, Text, x212 y320 w100 h20 , Motif Time:
Gui, Add, Edit, x322 y320 w80 h20 R1 vMotTime_4, %MotTime_4%
Gui, Add, Text, x212 y350 w100 h20 , Motif Buff Time:
Gui, Add, Edit, x322 y350 w80 h20 R1 vMotTimeBuff_4, %MotTimeBuff_4%
Gui, Add, Text, x412 y50 w100 h20 , Buff X:
Gui, Add, Edit, x522 y50 w80 h20 R1 vBuffX_4, %BuffX_4%
Gui, Add, Text, x412 y80 w100 h20 , Buff Y:
Gui, Add, Edit, x522 y80 w80 h20 R1 vBuffY_4, %BuffY_4%
Gui, Add, Text, x412 y110 w100 h20 , Fanfair Sleep:
Gui, Add, Edit, x522 y110 w80 h20 R1 vFSleep_4, %FSleep_4%
Gui, Add, Text, x412 y140 w100 h20 , Buff Sleep:
Gui, Add, Edit, x522 y140 w80 h20 R1 vDSleep_4, %DSleep_4%
Gui, Add, Text, x412 y170 w100 h20 , Vir Poison Color 1:
Gui, Add, Edit, x522 y170 w80 h20 R1 vVPoison1_4, %VPoison1_4%
Gui, Add, Text, x412 y200 w100 h20 , Vir Poison Color 2:
Gui, Add, Edit, x522 y200 w80 h20 R1 vVPoison2_4, %VPoison2_4%
Gui, Add, Text, x412 y230 w100 h20 , Vir Poison Key:
Gui, Add, Edit, x522 y230 w80 h20 R1 vVPoisonkey_4, %VPoisonkey_4%
Gui, Add, Text, x412 y260 w100 h20 , Leth Poison Color 1:
Gui, Add, Edit, x522 y260 w80 h20 R1 vLPoison1_4, %LPoison1_4%
Gui, Add, Text, x412 y290 w100 h20 , Leth Poison Color 2:
Gui, Add, Edit, x522 y290 w80 h20 R1 vLPoison2_4, %LPoison2_4%
Gui, Add, Text, x412 y320 w100 h20 , Leth Poison Key:
Gui, Add, Edit, x522 y320 w80 h20 R1 vLPoisonKey_4, %LPoisonKey_4%
Gui, Add, Text, x412 y350 w100 h20 , Anthem Color 1:
Gui, Add, Edit, x522 y350 w80 h20 , 
Gui, Add, Text, x612 y50 w100 h20 , Anthem Color 2
Gui, Add, Edit, x722 y50 w80 h20 , 
Gui, Add, Text, x612 y80 w100 h20 , Anthem Key:
Gui, Add, Edit, x722 y80 w80 h20 , 
Gui, Add, Text, x612 y110 w100 h20 , Vigor Color 1:
Gui, Add, Edit, x722 y110 w80 h20 R1 vFVigor1_4, %FVigor1_4%
Gui, Add, Text, x612 y140 w100 h20 , Vigor Color 2:
Gui, Add, Edit, x722 y140 w80 h20 R1 vFVigor2_4, %FVigor2_4%
Gui, Add, Text, x612 y170 w100 h20 , Vigor Key:
Gui, Add, Edit, x722 y170 w80 h20 R1 vFVigorKey_4, %FVigorKey_4%
Gui, Add, Text, x612 y200 w100 h20 , Power Color 1:
Gui, Add, Edit, x722 y200 w80 h20 R1 vFPower1_4, %FPower1_4%
Gui, Add, Text, x612 y230 w100 h20 , Power Color 2:
Gui, Add, Edit, x722 y230 w80 h20 R1 vFPower2_4, %FPower2_4%
Gui, Add, Text, x612 y260 w100 h20 , Power Key:
Gui, Add, Edit, x722 y260 w80 h20 R1 vFPowerKey_4, %FPowerKey_4%
Gui, Add, Text, x612 y290 w100 h20 , Cadence X:
Gui, Add, Edit, x722 y290 w80 h20 R1 vCadX_4, %CadX_4%
Gui, Add, Text, x612 y320 w100 h20 , Cadence Y:
Gui, Add, Edit, x722 y320 w80 h20 R1 vCadY_4, %CadY_4%
Gui, Add, Text, x612 y350 w100 h20 , Cadence Color:
Gui, Add, Edit, x722 y350 w80 h20 R1 vCadColor_4, %CadColor_4% 
Gui, Add, Button, x732 y0 w100 h30 gButtonBackup6, Backup
Gui, Add, Button, x622 y0 w100 h30 gButtonSave6, Save

;------------------------------------------
; End Gui
;------------------------------------------
Gui, Show, x226 y116 h409 w841, New GUI Window
Return

GuiClose:
ExitApp
;------------------------------------------
; Buttons
;------------------------------------------
ButtonSave1:
gui, submit, nohide
IniWrite, %AttackColor%, %IniFile%, Common, AttackColor
IniWrite, %FinishColor%, %IniFile%, Common, FinishColor
IniWrite, %InteruptColor%, %IniFile%, Common, InteruptColor
IniWrite, %FinishX%, %IniFile%, Common, FinishX
IniWrite, %FinishY%, %IniFile%, Common, FinishY
IniWrite, %InteruptX%, %IniFile%, Common, InteruptX
IniWrite, %InteruptY%, %IniFile%, Common, InteruptY
Return

ButtonBackup1:
FileCopy, %IniFile%, %IniFileBak%

ButtonSave2:
gui, submit, nohide
IniWrite, %UserEmail%, %IniFile%, Login, UserEmail
IniWrite, %UserPassword%, %IniFile%, Login, UserPassword
Return

ButtonBackup2:
FileCopy, %IniFile%, %IniFileBak%

ButtonSave3:
gui, submit, nohide
IniWrite, %FinisherKey_1%, %IniFile%, Bard_PVP, FinisherKey_1
IniWrite, %FinisherHealKey_1%, %IniFile%, Bard_PVP, FinisherHealKey_1
IniWrite, %InteruptKey_1%, %IniFile%, Bard_PVP, InteruptKey_1
IniWrite, %MotifX_1%, %IniFile%, Bard_PVP, MotifX_1
IniWrite, %MotifY_1%, %IniFile%, Bard_PVP, MotifY_1
IniWrite, %MRegen1_1%, %IniFile%, Bard_PVP, MRegen1_1
IniWrite, %MRegen2_1%, %IniFile%, Bard_PVP, MRegen2_1
IniWrite, %MRegenKey_1%, %IniFile%, Bard_PVP, MRegenKey_1
IniWrite, %MGrand1_1%, %IniFile%, Bard_PVP, MGrand1_1
IniWrite, %MGrand2_1%, %IniFile%, Bard_PVP, MGrand2_1
IniWrite, %MGrandKey_1%, %IniFile%, Bard_PVP, MGrandKey_1
IniWrite, %MTenacity1_1%, %IniFile%, Bard_PVP, MTenacity1_1
IniWrite, %MTenacity2_1%, %IniFile%, Bard_PVP, MTenacity2_1
IniWrite, %MTenacityKey_1%, %IniFile%, Bard_PVP, MTenacityKey_1
IniWrite, %MFocus1_1%, %IniFile%, Bard_PVP, MFocus1_1
IniWrite, %MFocus2_1%, %IniFile%, Bard_PVP, MFocus2_1
IniWrite, %MFocusKey_1%, %IniFile%, Bard_PVP, MFocusKey_1
IniWrite, %MBravery1_1%, %IniFile%, Bard_PVP, MBravery1_1
IniWrite, %MBravery2_1%, %IniFile%, Bard_PVP, MBravery2_1
IniWrite, %MBraveryKey_1%, %IniFile%, Bard_PVP, MBraveryKey_1
IniWrite, %MotTime_1%, %IniFile%, Bard_PVP, MotTime_1
IniWrite, %MotTimeBuff_1%, %IniFile%, Bard_PVP, MotTimeBuff_1
IniWrite, %BuffX_1%, %IniFile%, Bard_PVP, BuffX_1
IniWrite, %BuffY_1%, %IniFile%, Bard_PVP, BuffY_1
IniWrite, %FSleep_1%, %IniFile%, Bard_PVP, FSleep_1
IniWrite, %DSleep_1%, %IniFile%, Bard_PVP, DSleep_1
IniWrite, %PRes1_1%, %IniFile%, Bard_PVP, PRes1_1
IniWrite, %PRes2_1%, %IniFile%, Bard_PVP, PRes2_1
IniWrite, %PResKey_1%, %IniFile%, Bard_PVP, PResKey_1
IniWrite, %GPhase1_1%, %IniFile%, Bard_PVP, GPhase1_1
IniWrite, %GPhase2_1%, %IniFile%, Bard_PVP, GPhase2_1
IniWrite, %GPhaseKey_1%, %IniFile%, Bard_PVP, GPhaseKey_1
IniWrite, %AComp1_1%, %IniFile%, Bard_PVP, AComp1_1
IniWrite, %AComp2_1%, %IniFile%, Bard_PVP, AComp2_1
IniWrite, %ACompKey_1%, %IniFile%, Bard_PVP, ACompKey_1
IniWrite, %FVigor1_1%, %IniFile%, Bard_PVP, FVigor1_1
IniWrite, %FVigor2_1%, %IniFile%, Bard_PVP, FVigor2_1
IniWrite, %FVigorKey_1%, %IniFile%, Bard_PVP, FVigorKey_1
IniWrite, %FPower1_1%, %IniFile%, Bard_PVP, FPower1_1
IniWrite, %FPower2_1%, %IniFile%, Bard_PVP, FPower2_1
IniWrite, %FPowerKey_1%, %IniFile%, Bard_PVP, FPowerKey_1
IniWrite, %CadX_1%, %IniFile%, Bard_PVP, CadX_1
IniWrite, %CadY_1%, %IniFile%, Bard_PVP, CadY_1
IniWrite, %CadColor_1%, %IniFile%, Bard_PVP, CadColor_1
Return

ButtonBackup3:
FileCopy, %IniFile%, %IniFileBak%

ButtonSave4:
gui, submit, nohide
IniWrite, %FinisherKey_2%, %IniFile%, NB_Vars, FinisherKey_2
IniWrite, %InteruptKey_2%, %IniFile%, NB_Vars, InteruptKey_2
IniWrite, %PhantomColor_2%, %IniFile%, NB_Vars, PhantomColor_2
IniWrite, %PhantomX_2%, %IniFile%, NB_Vars, PhantomX_2
IniWrite, %PhantomY_2%, %IniFile%, NB_Vars, PhantomY_2
IniWrite, %PhantomKey_2%, %IniFile%, NB_Vars, PhantomKey_2
IniWrite, %BuffX_2%, %IniFile%, NB_Vars, BuffX_2
IniWrite, %BuffY_2%, %IniFile%, NB_Vars, BuffY_2
IniWrite, %FBlades_2%, %IniFile%, NB_Vars, FBlades_2
IniWrite, %FBladesKey_2%, %IniFile%, NB_Vars, FBladesKey_2
IniWrite, %HBlades_2%, %IniFile%, NB_Vars, HBlades_2
IniWrite, %HBladesKey_2%, %IniFile%, NB_Vars, HBladesKey_2
IniWrite, %PRes_2%, %IniFile%, NB_Vars, PRes_2
IniWrite, %PResKey_2%, %IniFile%, NB_Vars, PResKey_2
IniWrite, %PRev_2%, %IniFile%, NB_Vars, PRev_2
IniWrite, %PRevKey_2%, %IniFile%, NB_Vars, PRevKey_2
IniWrite, %PhaseX_2%, %IniFile%, NB_Vars, PhaseX_2
IniWrite, %PhaseY_2%, %IniFile%, NB_Vars, PhaseY_2
IniWrite, %PhaseKey_2%, %IniFile%, NB_Vars, PhaseKey_2
Return

ButtonBackup4:
FileCopy, %IniFile%, %IniFileBak%

ButtonSave5:
gui, submit, nohide
IniWrite, %FinisherKey_3%, %IniFile%, Solo_Vars, FinisherKey_3
IniWrite, %FinisherAOEKey_3%, %IniFile%, Solo_Vars, FinisherAOEKey_3
IniWrite, %InteruptKey_3%, %IniFile%, Solo_Vars, InteruptKey_3
IniWrite, %PhantomColor_3%, %IniFile%, Solo_Vars, PhantomColor_3
IniWrite, %PhantomX_3%, %IniFile%, Solo_Vars, PhantomX_3
IniWrite, %PhantomY_3%, %IniFile%, Solo_Vars, PhantomY_3
IniWrite, %PhantomKey_3%, %IniFile%, Solo_Vars, PhantomKey_3
IniWrite, %BuffX_3%, %IniFile%, Solo_Vars, BuffX_3
IniWrite, %BuffY_3%, %IniFile%, Solo_Vars, BuffY_3
IniWrite, %L1Poison_3%, %IniFile%, Solo_Vars, L1Poison_3
IniWrite, %L1PoisonKey_3%, %IniFile%, Solo_Vars, L1PoisonKey_3
IniWrite, %L2Poison_3%, %IniFile%, Solo_Vars, L2Poison_3
IniWrite, %L2PoisonKey_3%, %IniFile%, Solo_Vars, L2PoisonKey_3
IniWrite, %PRes_3%, %IniFile%, Solo_Vars, PRes_3
IniWrite, %PResKey_3%, %IniFile%, Solo_Vars, PResKey_3
IniWrite, %PRev_3%, %IniFile%, Solo_Vars, PRev_3
IniWrite, %PRevKey_3%, %IniFile%, Solo_Vars, PRevKey_3
IniWrite, %ComRes_3%, %IniFile%, Solo_Vars, ComRes_3
IniWrite, %ComResKey_3%, %IniFile%, Solo_Vars, ComResKey_3
IniWrite, %PhaseX_3%, %IniFile%, Solo_Vars, PhaseX_3
IniWrite, %PhaseY_3%, %IniFile%, Solo_Vars, PhaseY_3
IniWrite, %Phase_3%, %IniFile%, Solo_Vars, Phase_3
IniWrite, %PhaseKey_3%, %IniFile%, Solo_Vars, PhaseKey_3
Return

ButtonBackup5:
FileCopy, %IniFile%, %IniFileBak%

ButtonSave6:
gui, submit, nohide
IniWrite, %FinisherKey_4%, %IniFile%, Bard_PVE, FinisherKey_4
IniWrite, %FinisherHealKey_4%, %IniFile%, Bard_PVE, FinisherHealKey_4
IniWrite, %MotifX_4%, %IniFile%, Bard_PVE, MotifX_4
IniWrite, %MotifY_4%, %IniFile%, Bard_PVE, MotifY_4
IniWrite, %MRegen1_4%, %IniFile%, Bard_PVE, MRegen1_4
IniWrite, %MRegen2_4%, %IniFile%, Bard_PVE, MRegen2_4
IniWrite, %MRegenKey_4%, %IniFile%, Bard_PVE, MRegenKey_4
IniWrite, %MGrand1_4%, %IniFile%, Bard_PVE, MGrand1_4
IniWrite, %MGrand2_4%, %IniFile%, Bard_PVE, MGrand2_4
IniWrite, %MGrandKey_4%, %IniFile%, Bard_PVE, MGrandKey_4
IniWrite, %MTenacity1_4%, %IniFile%, Bard_PVE, MTenacity1_4
IniWrite, %MTenacity2_4%, %IniFile%, Bard_PVE, MTenacity2_4
IniWrite, %MTenacityKey_4%, %IniFile%, Bard_PVE, MTenacityKey_4
IniWrite, %MFocus1_4%, %IniFile%, Bard_PVE, MFocus1_4
IniWrite, %MFocus2_4%, %IniFile%, Bard_PVE, MFocus2_4
IniWrite, %MFocusKey_4%, %IniFile%, Bard_PVE, MFocusKey_4
IniWrite, %MBravery1_4%, %IniFile%, Bard_PVE, MBravery1_4
IniWrite, %MBravery2_4%, %IniFile%, Bard_PVE, MBravery2_4
IniWrite, %MBraveryKey_4%, %IniFile%, Bard_PVE, MBraveryKey_4
IniWrite, %MotTime_4%, %IniFile%, Bard_PVE, MotTime_4
IniWrite, %MotTimeBuff_4%, %IniFile%, Bard_PVE, MotTimeBuff_4
IniWrite, %BuffX_4%, %IniFile%, Bard_PVE, BuffX_4
IniWrite, %BuffY_4%, %IniFile%, Bard_PVE, BuffY_4
IniWrite, %FSleep_4%, %IniFile%, Bard_PVE, FSleep_4
IniWrite, %DSleep_4%, %IniFile%, Bard_PVE, DSleep_4
IniWrite, %VPoison1_4%, %IniFile%, Bard_PVE, VPoison1_4
IniWrite, %VPoison2_4%, %IniFile%, Bard_PVE, VPoison2_4
IniWrite, %VPoisonkey_4%, %IniFile%, Bard_PVE, VPoisonkey_4
IniWrite, %LPoison1_4%, %IniFile%, Bard_PVE, LPoison1_4
IniWrite, %LPoison2_4%, %IniFile%, Bard_PVE, LPoison2_4
IniWrite, %LPoisonKey_4%, %IniFile%, Bard_PVE, LPoisonKey_4
IniWrite, %FVigor1_4%, %IniFile%, Bard_PVE, FVigor1_4
IniWrite, %FVigor2_4%, %IniFile%, Bard_PVE, FVigor2_4
IniWrite, %FVigorKey_4%, %IniFile%, Bard_PVE, FVigorKey_4
IniWrite, %FPower1_4%, %IniFile%, Bard_PVE, FPower1_4
IniWrite, %FPower2_4%, %IniFile%, Bard_PVE, FPower2_4
IniWrite, %FPowerKey_4%, %IniFile%, Bard_PVE, FPowerKey_4
IniWrite, %CadX_4%, %IniFile%, Bard_PVE, CadX_4
IniWrite, %CadY_4%, %IniFile%, Bard_PVE, CadY_4
IniWrite, %CadColor_4%, %IniFile%, Bard_PVE, CadColor_4
Return

ButtonBackup6:
FileCopy, %IniFile%, %IniFileBak%