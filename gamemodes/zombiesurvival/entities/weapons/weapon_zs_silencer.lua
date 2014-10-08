AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Silencer' SMG"
	SWEP.CSMuzzleFlashes = true

	SWEP.AimPos = Vector(-2.6, -3.072, 1.639)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(0.736, -3.971, 1.802)
	SWEP.SprintAng = Vector(-13.205, 37.048, 0)
	
	SWEP.ZoomAmount = 15
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "d"
	SWEP.NoStockMuzzle = true
	killicon.AddFont("swb_tmp", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_silenced_small"
	
	SWEP.HUD3DBone = "v_weapon.TMP_Parent"
	SWEP.HUD3DPos = Vector(-1, -3.5, -1)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.015
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
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "swb_base"
SWEP.Category = "SWB Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cstrike/c_smg_tmp.mdl"
SWEP.WorldModel		= "models/weapons/w_smg_tmp.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 25
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 0.06
SWEP.FireSound = Sound("Weapon_TMP.Single")
SWEP.Recoil = 0.7

SWEP.ConeMax = 0.13
SWEP.ConeMin = 0.1

SWEP.WalkSpeed = SPEED_NORMAL

SWEP.HipSpread = 0.037
SWEP.AimSpread = 0.013
SWEP.VelocitySensitivity = 1.3
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 22
SWEP.DeployTime = 1
SWEP.BurstCooldownMul = 3.5