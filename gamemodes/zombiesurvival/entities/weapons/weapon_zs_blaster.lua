AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Blaster' Shotgun"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-4.281, -11.761, 3.319)
	SWEP.AimAng = Vector(3.517, 0, 0)
		
	SWEP.SprintPos = Vector(1.559, -8.881, 2.88)
	SWEP.SprintAng = Vector(-5.901, 46.7, 0.4)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "shotshell"
	SWEP.ShellOnEvent = true
	
	SWEP.MuzzleEffect = "swb_shotgun"
	
	SWEP.HUD3DPos = Vector(4, -3.5, -1.2)
	SWEP.HUD3DAng = Angle(90, 0, -30)
	SWEP.HUD3DScale = 0.02
	SWEP.HUD3DBone = "SS.Grip.Dummy"
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

SWEP.Slot = 1
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
SWEP.ViewModel 		= "models/weapons/v_supershorty/v_supershorty.mdl"
SWEP.WorldModel 	= "models/weapons/w_supershorty.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 6
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Buckshot"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 0.8
SWEP.FireSound = Sound("Weapon_Shotgun.Single")
SWEP.Recoil = 2.5
SWEP.ShotgunReload = true
SWEP.ReloadStartWait = 0.6
SWEP.ReloadFinishWait = 1.1
SWEP.ReloadShellInsertWait = 0.6
SWEP.Chamberable = false
SWEP.UseHands = false

SWEP.HipSpread = 0.036
SWEP.AimSpread = 0.003
SWEP.ClumpSpread = 0.02
SWEP.VelocitySensitivity = 2.2
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 1.03
SWEP.Shots = 7
SWEP.Damage = 12
SWEP.DeployTime = 1

SWEP.ConeMax = 0.18
SWEP.ConeMin = 0.155

SWEP.WalkSpeed = SPEED_SLOWER