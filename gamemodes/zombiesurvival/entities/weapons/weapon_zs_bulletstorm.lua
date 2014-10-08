AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Bullet Storm' SMG"
	SWEP.Description = "Hold right click to use the Storm firing mode: fire rate is reduced to 60% but two bullets are fired at once."
	SWEP.CSMuzzleFlashes = true

	SWEP.AimPos = Vector(-1.93, -5.928, 1.82)
	SWEP.AimAng = Vector(1.162, 0, 0)
	
	SWEP.SprintPos = Vector(0.736, -3.971, 1.802)
	SWEP.SprintAng = Vector(-13.205, 37.048, 0)
	
	SWEP.ZoomAmount = 15
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "m"
	killicon.AddFont("swb_p90", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_rifle_med"
	
	SWEP.HUD3DBone = "v_weapon.p90_Release"
	SWEP.HUD3DPos = Vector(-1.35, -0.5, -6.5)
	SWEP.HUD3DAng = Angle(0, 0, 0)
end

SWEP.FadeCrosshairOnAim = false

SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 20
SWEP.BulletDiameter = 5.7
SWEP.CaseLength = 28

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_smg1_ttt"

SWEP.Slot = 2
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
SWEP.ViewModel		= "models/weapons/cstrike/c_smg_p90.mdl"
SWEP.WorldModel		= "models/weapons/w_smg_p90.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 50
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 0.07
SWEP.FireSound = Sound("Weapon_P90.Single")
SWEP.Recoil = 0.9

SWEP.HipSpread = 0.043
SWEP.AimSpread = 0.007
SWEP.VelocitySensitivity = 1.5
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.AmmoPerShot = 1
SWEP.Damage = 15.5
SWEP.DeployTime = 1
SWEP.BurstCooldownMul = 3.5

SWEP.ConeMax = 0.11
SWEP.ConeMin = 0.06

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Primary.DefaultNumShots = SWEP.Shots
SWEP.Primary.DefaultDelay = SWEP.FireDelay
SWEP.Primary.DefaultAmmoPerShot = SWEP.AmmoPerShot
SWEP.Primary.IronsightsNumShots = SWEP.Shots * 2
SWEP.Primary.IronsightsDelay = SWEP.FireDelay * 1.6666
SWEP.Primary.IronsightsAmmoPerShot = SWEP.AmmoPerShot * 2

function SWEP:SecondaryAttack()
	self.BaseClass.SecondaryAttack(self)

	if self.dt.State == SWB_AIMING then
		self.Shots = self.Primary.IronsightsNumShots
		self.FireDelay = self.Primary.IronsightsDelay
		self.AmmoPerShot = self.Primary.IronsightsAmmoPerShot
		self.SpreadPerShot = 0.02
		self.MaxSpreadInc = 0.063
		self.ClumpSpread = 0.014

		self:EmitSound("npc/scanner/scanner_scan4.wav", 40)
	else
		self.Shots = self.Primary.DefaultNumShots
		self.FireDelay = self.Primary.DefaultDelay
		self.AmmoPerShot = self.Primary.DefaultAmmoPerShot
		self.SpreadPerShot = 0.01
		self.MaxSpreadInc = 0.05
		self.ClumpSpread = 0

		self:EmitSound("npc/scanner/scanner_scan2.wav", 40)
	end
end

function SWEP:PrimaryAttack()
	if self.dt.State == SWB_AIMING and self:Clip1() == 1 then
		self:SecondaryAttack()
	end

	self.BaseClass.PrimaryAttack(self)
end

util.PrecacheSound("npc/scanner/scanner_scan4.wav")
util.PrecacheSound("npc/scanner/scanner_scan2.wav")