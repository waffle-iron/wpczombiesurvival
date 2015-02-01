AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Grim Reaper' Machine Gun"
	SWEP.Description = "This weapon will do more damage with the less ammo you have"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-5.941, -6.378, 2.322)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(0, 0, -0.7)
	SWEP.SprintAng = Vector(-7.739, 28.141, 0)
	
	SWEP.ZoomAmount = 15
	
	SWEP.MuzzleEffect = "swb_rifle_med"
	SWEP.InvertShellEjectAngle = true
	
	SWEP.HUD3DBone = "v_weapon.m249"
	SWEP.HUD3DPos = Vector(1.5, -1, 2)
	SWEP.HUD3DAng = Angle(0, 180, 180)
	SWEP.HUD3DScale = 0.0150
end

SWEP.PlayBackRate = 1
SWEP.PlayBackRateSV = 1
SWEP.SpeedDec = 25
SWEP.BulletDiameter = 5.56
SWEP.CaseLength = 45

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
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
SWEP.ViewModel		= "models/weapons/cstrike/c_mach_m249para.mdl"
SWEP.WorldModel		= "models/weapons/w_mach_m249para.mdl"
SWEP.UseHands = true

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 100
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo 			= "ar2"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 0.1
SWEP.FireSound = Sound("Weapon_M249.Single")
SWEP.Recoil = 1.1
SWEP.Chamberable = false

SWEP.WalkSpeed = SPEED_SLOW

SWEP.HipSpread = 0.055
SWEP.AimSpread = 0.004
SWEP.VelocitySensitivity = 2.5
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 25
SWEP.DeployTime = 1

function SWEP:FireBullet(damage, cone, bullets)
	damage = (damage + damage * (1 - self:Clip1() / self.Primary.ClipSize))
	self.BaseClass.FireBullet(self, damage, cone, bullets)
end