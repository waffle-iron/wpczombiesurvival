AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Reaper' UMP"
	SWEP.CSMuzzleFlashes = true

	SWEP.AimPos = Vector(-8.721, -9.707, 4.081)
	SWEP.AimAng = Vector(-1.331, -0.281, -2.579)
	
	SWEP.SprintPos = Vector(0.736, -3.971, 3)
	SWEP.SprintAng = Vector(-13.205, 37.048, 0)
	
	SWEP.ZoomAmount = 15
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "q"
	killicon.AddFont("swb_ump", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_rifle_small"
	
	SWEP.HUD3DBone = "v_weapon.ump45_Release"
	SWEP.HUD3DPos = Vector(-1.1, -3, 2)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.02
end

SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 20
SWEP.BulletDiameter = 11.5
SWEP.CaseLength = 22.8

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_smg1_ttt"

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "smg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "swb_base"
SWEP.Category = "SWB Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cstrike/c_smg_ump45.mdl"
SWEP.WorldModel		= "models/weapons/w_smg_ump45.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 28
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 0.13
SWEP.FireSound = Sound("Weapon_UMP45.Single")
SWEP.Recoil = 0.8

SWEP.ConeMax = 0.08
SWEP.ConeMin = 0.045

SWEP.WalkSpeed = SPEED_SLOW

SWEP.HipSpread = 0.041
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 1.4
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 24
SWEP.DeployTime = 1
SWEP.BurstCooldownMul = 3.5