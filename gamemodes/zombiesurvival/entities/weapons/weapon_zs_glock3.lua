AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Crossfire' Glock 3"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-5.772, -2.526, 2.79)
	SWEP.AimAng = Vector(0.419, -0.01, 0)
	
	SWEP.SprintPos = Vector(0, -17.514, -12.271)
	SWEP.SprintAng = Vector(63.637, 0, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.MuzzleEffect = "swb_pistol_small"
	
	SWEP.HUD3DBone = "v_weapon.Glock_Slide"
	SWEP.HUD3DPos = Vector(5, 0.25, -0.8)
	SWEP.HUD3DAng = Angle(90, 0, 0)
end

SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 25
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
SWEP.FireModes = {"semi", "3burst"}
SWEP.Base = "swb_base"
SWEP.Category = "SWB Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cstrike/c_pist_glock18.mdl"
SWEP.WorldModel		= "models/weapons/w_pist_glock18.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 18
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pistol"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 0.3
SWEP.FireSound = Sound("Weapon_Glock.Single")
SWEP.Recoil = 0.7
SWEP.DryFire = true

SWEP.HipSpread = 0.038
SWEP.AimSpread = 0.013
SWEP.ClumpSpread = 0.013
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 0.86
SWEP.Shots = 3
SWEP.Damage = 17
SWEP.DeployTime = 1
SWEP.BurstCooldownMul = 3.5

SWEP.ConeMax = 0.14
SWEP.ConeMin = 0.07