AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Owens' Handgun"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-3.418, -12.601, 2.559)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(-0.801, -17.56, -3.36)
	SWEP.SprintAng = Vector(46.2, -4.2, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.MuzzleEffect = "swb_pistol_small"
	
	SWEP.HUD3DBone = "gun"
	SWEP.HUD3DPos = Vector(1.12, -1.4, 2)
	SWEP.HUD3DAng = Angle(180, 0, 270)
	SWEP.HUD3DScale = 0.02
end

SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 10
SWEP.BulletDiameter = 9
SWEP.CaseLength = 19

SWEP.Kind = WEAPON_PISTOL
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_pistol_ttt"

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "swb_base"
SWEP.Category = "SWB Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel 		= "models/weapons/c_mantuna_pistol.mdl"
SWEP.WorldModel 	= "models/weapons/w_pistol.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 12
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Pistol"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 0.2
SWEP.FireSound = Sound("Weapon_Pistol.NPC_Single")
SWEP.Recoil = 0.7

SWEP.Chamberable = false
SWEP.ReloadSound = Sound("Weapon_Pistol.Reload")

SWEP.HipSpread = 0.036
SWEP.AimSpread = 0.0115
SWEP.ClumpSpread = 0.032
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.15
SWEP.Shots = 2
SWEP.Damage = 12
SWEP.DeployTime = 1

SWEP.ConeMax = 0.08
SWEP.ConeMin = 0.04