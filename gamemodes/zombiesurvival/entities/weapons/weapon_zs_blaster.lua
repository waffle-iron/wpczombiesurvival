AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Blaster' Shotgun"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-2.68, 4, 0.9)
	SWEP.AimAng = Vector(1.407, 0.1, 0)
		
	SWEP.SprintPos = Vector(11.456, -5.865, 1)
	SWEP.SprintAng = Vector(0, 66.833, 15.477)
	
	SWEP.VMPos = Vector(0, 2.68, -0.9)
	SWEP.VMAng = Vector(-1.407, -90, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "shotshell"
	SWEP.ShellOnEvent = true
	
	SWEP.MuzzleEffect = "swb_shotgun"
	
	SWEP.HUD3DPos = Vector(8.5, -1.3, 2.2)
	SWEP.HUD3DAng = Angle(0, -90, 60)
	SWEP.HUD3DScale = 0.02
	SWEP.HUD3DBone = "RW_Weapon"
end

sound.Add({
	name = 			"TFA_KF2_MB500.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 		{ "weapons/kf2/mb500/fire1.wav", "weapons/kf2/mb500/fire2.wav" }
})

sound.Add({
	name = 			"TFA_KF2_MB500.Insert",
	channel = 		CHAN_USER_BASE+11,
	volume = 		0.9,
	sound = 			"weapons/kf2/mb500/insertshell.wav"
})

sound.Add({
	name = 			"TFA_KF2_MB500.Equip",
	channel = 		CHAN_USER_BASE+11,
	volume = 		0.9,
	sound = 			"weapons/kf2/mb500/equip.wav"
})

sound.Add({
	name = 			"TFA_KF2_MB500.Holster",
	channel = 		CHAN_USER_BASE+11,
	volume = 		0.9,
	sound = 			"weapons/kf2/mb500/equip.wav"
})

sound.Add({
	name = 			"TFA_KF2_MB500.Cloth",
	channel = 		CHAN_USER_BASE+11,
	volume = 		0.9,
	sound = 			"weapons/kf2/mb500/cloth1.wav"
})

sound.Add({
	name = 			"TFA_KF2_MB500.BoltBack",
	channel = 		CHAN_USER_BASE+11,
	volume = 		0.9,
	sound = 			"weapons/kf2/mb500/boltback.wav"
})

sound.Add({
	name = 			"TFA_KF2_MB500.BoltForward",
	channel = 		CHAN_USER_BASE+11,
	volume = 		0.9,
	sound = 			"weapons/kf2/mb500/boltforward.wav"
})

sound.Add({
	name = 			"TFA_KF2_MB500.ChanClear",
	channel = 		CHAN_USER_BASE+11,
	volume = 		0.5,
	sound = 			"weapons/kf2/mb500/chanclear.wav"
})

SWEP.PlayBackRate = 1
SWEP.PlayBackRateSV = 1
SWEP.SpeedDec = 30
SWEP.BulletDiameter = 5
SWEP.CaseLength = 10

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_box_buckshot_ttt"

SWEP.WeaponBaseType = "tfa"

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "shotgun"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "swb_base"
SWEP.Category = "SWB Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/killingfloor2/c_mb500.mdl"
SWEP.WorldModel		= "models/weapons/killingfloor2/w_mb500.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 5
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Buckshot"

GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 1.1
SWEP.FireSound = Sound("TFA_KF2_MB500.1")
SWEP.Recoil = 3
SWEP.ShotgunReload = true
SWEP.ReloadStartWait = 0.6
SWEP.ReloadFinishWait = 1.1
SWEP.ReloadShellInsertWait = 0.6
SWEP.Chamberable = false
SWEP.UseHands = true

SWEP.HipSpread = 0.07
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.06
SWEP.ClumpSpread = 0.02
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.8
SWEP.Shots = 6
SWEP.Damage = 12
SWEP.DeployTime = 1

SWEP.ConeMax = 0.18
SWEP.ConeMin = 0.155

SWEP.WalkSpeed = SPEED_SLOWER
