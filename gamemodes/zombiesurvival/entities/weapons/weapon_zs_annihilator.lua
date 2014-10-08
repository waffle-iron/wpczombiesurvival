AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Annihilator' SMG"
	SWEP.CSMuzzleFlashes = true
	SWEP.Description = "This gun's bullets will go through certain surfaces and has a chance to ricochete."

	SWEP.AimPos = Vector(-6.33, -11.261, 1.35)
	SWEP.AimAng = Vector(0, 0, 0)

	SWEP.SprintPos = Vector(3.799, -9.28, 1.679)
	SWEP.SprintAng = Vector(-7.901, 52.4, 0)
	
	SWEP.ViewModelMovementScale = 0.85
	
	SWEP.MuzzleEffect = "swb_rifle_small"
	
	SWEP.HUD3DBone = "ValveBiped.base"
	SWEP.HUD3DPos = Vector(1.5, 0.25, -2)
	SWEP.HUD3DScale = 0.02
end

SWEP.FadeCrosshairOnAim = false

SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 5
SWEP.BulletDiameter = 6
SWEP.CaseLength = 13

SWEP.CanPenetrate = true
SWEP.CanRicochet = true

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_smg_ttt"

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto","semi"}
SWEP.Base = "swb_base"
SWEP.Category = "SWB Weapons"

SWEP.Author			= "ForrestMarkX"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel 		= "models/weapons/c_smg3.mdl"
SWEP.WorldModel 	= "models/weapons/w_smg3.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 22
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"
SWEP.Chamberable = false
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ConeMax = 0.13
SWEP.ConeMin = 0.1

SWEP.WalkSpeed = SPEED_NORMAL

SWEP.ReloadSound = Sound("Weapon_SMG1.Reload")
SWEP.FireDelay = 0.05
SWEP.FireSound = Sound("Weapon_SMG1.NPC_Single")
SWEP.Recoil = 1

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1
SWEP.ReloadGesture = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.HipSpread = 0.037
SWEP.AimSpread = 0.013
SWEP.VelocitySensitivity = 1.3
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 28
SWEP.DeployTime = 1
SWEP.BurstCooldownMul = 3.5