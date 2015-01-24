AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Stalker' M4"
	SWEP.Description = "Using this gun will severely reduce the distance in which zombies can see your aura."
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-3.441, -4.723, 1.12)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(0, 0, -0.7)
	SWEP.SprintAng = Vector(-7.739, 28.141, 0)
	
	SWEP.ZoomAmount = 15
	
	SWEP.MuzzleEffect = "swb_rifle_med"
	SWEP.MuzzleEffectSupp = "swb_silenced"
	
	SWEP.HUD3DBone = "v_weapon.m4_Parent"
	SWEP.HUD3DPos = Vector(-0.5, -5, -1.2)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.015
end

SWEP.FadeCrosshairOnAim = false

SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 25
SWEP.BulletDiameter = 5.56
SWEP.CaseLength = 45

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "swb_base"
SWEP.Category = "SWB Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cstrike/c_rif_m4a1.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_m4a1.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 0.11
SWEP.FireSound = Sound("Weapon_M4A1.Single")
SWEP.FireSoundSuppressed = Sound("Weapon_M4A1.Silenced")
SWEP.Recoil = 1

SWEP.Suppressable = true

SWEP.ConeMax = 0.125
SWEP.ConeMin = 0.045

SWEP.WalkSpeed = SPEED_SLOW

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.004
SWEP.VelocitySensitivity = 1.6
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 24
SWEP.DeployTime = 1

function SWEP:GetAuraRange()
	return 512
end