AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Eliminator' SIG SG552"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-7.881, -18.001, 2.599)
	SWEP.AimAng = Vector(0, 0, 0)
		
	SWEP.SprintPos = Vector(0.922, -3.836, 0.704)
	SWEP.SprintAng = Vector(-10.207, 31.819, 0)
	
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.DrawBlackBarsOnAim = true
	SWEP.AimOverlay = surface.GetTextureID("swb/scope_rifle")
	SWEP.FadeDuringAiming = true
	SWEP.MoveWepAwayWhenAiming = true
	SWEP.ZoomAmount = 50
	SWEP.DelayedZoom = true
	SWEP.SnapZoom = true
	SWEP.SimulateCenterMuzzle = true
	
	SWEP.MuzzleEffect = "swb_rifle_med"
	
	SWEP.HUD3DBone = "v_weapon.sg552_Parent"
	SWEP.HUD3DPos = Vector(-1, -4.5, -3)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.015
end

SWEP.PlayBackRate = 1
SWEP.PlayBackRateSV = 1
SWEP.FadeCrosshairOnAim = true
SWEP.PreventQuickScoping = true

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true

SWEP.SpeedDec = 20
SWEP.BulletDiameter = 5.56
SWEP.CaseLength = 45

SWEP.Slot = 4
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
SWEP.ViewModel		= "models/weapons/cstrike/c_rif_sg552.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_sg552.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 35
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo 			= "ar2"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 0.075
SWEP.FireSound = Sound("Weapon_SG552.Single")
SWEP.Recoil = 0.9

SWEP.HipSpread = 0.042
SWEP.AimSpread = 0.006
SWEP.VelocitySensitivity = 1.5
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.15
SWEP.Shots = 1
SWEP.Damage = 21
SWEP.DeployTime = 1

SWEP.ConeMax = 0.08
SWEP.ConeMin = 0.02

SWEP.WalkSpeed = SPEED_SLOW