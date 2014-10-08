AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Tosser' SMG"
	SWEP.CSMuzzleFlashes = true

	SWEP.AimPos = Vector(-4.361, -4.849, 1.759)
	SWEP.AimAng = Vector(0, -0.201, 0)
	
	SWEP.SprintPos = Vector(3.799, -9.28, 1.679)
	SWEP.SprintAng = Vector(-7.901, 52.4, 0)
	
	SWEP.ZoomAmount = 15
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.MuzzleEffect = "swb_rifle_small"
	
	SWEP.HUD3DBone = "smdimport"
	SWEP.HUD3DPos = Vector(1.5, -5.25, 2.3)
	SWEP.HUD3DAng = Angle(180, 0, 270)
	SWEP.HUD3DScale = 0.02
end

SWEP.FadeCrosshairOnAim = false

SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 15
SWEP.BulletDiameter = 9
SWEP.CaseLength = 19

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_smg1_ttt"

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"auto"}
SWEP.Base = "swb_base"
SWEP.Category = "SWB Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel 		= "models/weapons/c_mantuna_smg1.mdl"
SWEP.WorldModel 	= "models/weapons/w_smg1.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 25
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"
SWEP.Chamberable = false
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1
SWEP.ReloadGesture = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.ConeMax = 0.055
SWEP.ConeMin = 0.029

SWEP.WalkSpeed = SPEED_NORMAL

SWEP.ReloadSound = Sound("Weapon_Tosser.Reload")
SWEP.FireDelay = 0.15
SWEP.FireSound = Sound("Weapon_Tosser.Fire")
SWEP.Recoil = 1

SWEP.HipSpread = 0.037
SWEP.AimSpread = 0.015
SWEP.VelocitySensitivity = 1.4
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 15
SWEP.DeployTime = 1
SWEP.BurstCooldownMul = 3.5

SWB_RegisterSound("Weapon_Tosser.Fire", {"weapons/ar1/ar1_dist1.wav", "weapons/ar1/ar1_dist2.wav"}, 100)
SWB_RegisterSound("Weapon_Tosser.Reload", "weapons/smg1_mantuna/smg1_reload.wav", 100)