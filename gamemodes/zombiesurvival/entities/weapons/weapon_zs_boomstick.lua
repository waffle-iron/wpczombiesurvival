AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Boom Stick"
	SWEP.Description = "This shotgun allows you to load up to four shells in the chamber at once. Hold down reload for faster loading of each shell."
	SWEP.CSMuzzleFlashes = false
	
	SWEP.AimPos = Vector(-4.281, -9.247, 3.039)
	SWEP.AimAng = Vector(0, 0, 0)
		
	SWEP.SprintPos = Vector(2.599, -10.32, 1.32)
	SWEP.SprintAng = Vector(-9.101, 54.599, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "shotshell"
	SWEP.ShellOnEvent = true
	
	SWEP.MuzzleEffect = "swb_shotgun"
	
	SWEP.HUD3DBone = "ValveBiped.Gun"
	SWEP.HUD3DPos = Vector(1.4, -6, 0)
	SWEP.HUD3DAng = Angle(180, 0, 270)
	SWEP.HUD3DScale = 0.025
end

SWEP.PlayBackRate = 1
SWEP.PlayBackRateSV = 1
SWEP.SpeedDec = 30
SWEP.BulletDiameter = 5
SWEP.CaseLength = 10

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_box_buckshot_ttt"

SWEP.Infliction = 0.5

SWEP.Slot = 3
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

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel 		= "models/weapons/c_mantuna_shotgun.mdl"
SWEP.WorldModel 	= "models/weapons/w_shotgun.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize 		= 4
SWEP.Primary.ClipMultiplier = 3
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Buckshot"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 1.5
SWEP.FireSound = Sound("weapons/shotgun/shotgun_dbl_fire.wav")
SWEP.ShotgunReloadSound = Sound("Weapon_Shotgun.Reload")
SWEP.ShotgunPumpSound = Sound("Weapon_Shotgun.Special1")
SWEP.DrawSound = Sound("Weapon_Magnum.Spin")
SWEP.Recoil = 12.5
SWEP.ShotgunReload = true
SWEP.PumpAfterReload = true
SWEP.ReloadStartWait = 0.6
SWEP.ReloadFinishWait = 1.1
SWEP.ReloadShellInsertWait = 0.8
SWEP.Chamberable = false

SWEP.HipSpread = 0.056
SWEP.AimSpread = 0.023
SWEP.ClumpSpread = 0.07
SWEP.VelocitySensitivity = 2.2
SWEP.MaxSpreadInc = 0.07
SWEP.SpreadPerShot = 0.04
SWEP.SpreadCooldown = 1.03
SWEP.Shots = 12
SWEP.Damage = 36
SWEP.DeployTime = 1
SWEP.AmmoPerShot = 4

SWEP.ConeMax = 0.23
SWEP.ConeMin = 0.2

SWEP.WalkSpeed = SPEED_SLOWEST

function SWEP:PrimaryAttack()
	local clip = self:Clip1()
		
	self.Owner:ViewPunch(clip * 0.5 * self.Recoil * Angle(math.Rand(-0.1, -0.1), math.Rand(-0.1, 0.1), 0))
	self.Owner:SetGroundEntity(NULL)
	self.Owner:SetVelocity(-80 * clip * self.Owner:GetAimVector())
	
	self.BaseClass.PrimaryAttack(self)
end