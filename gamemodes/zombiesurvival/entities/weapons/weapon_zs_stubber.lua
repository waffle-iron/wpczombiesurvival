AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Stubber' Rifle"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-6.68, -18.331, 3.359)
	SWEP.AimAng = Vector(0, 0, 0)
		
	SWEP.SprintPos = Vector(0, 0, 1.5)
	SWEP.SprintAng = Vector(-7.739, 28.141, 0)
	
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.DrawBlackBarsOnAim = true
	SWEP.AimOverlay = surface.GetTextureID("swb/scope_rifle")
	SWEP.FadeDuringAiming = true
	SWEP.MoveWepAwayWhenAiming = true
	SWEP.ZoomAmount = 70
	SWEP.DelayedZoom = true
	SWEP.SnapZoom = true
	SWEP.SimulateCenterMuzzle = true
	
	SWEP.AdjustableZoom = true
	SWEP.MinZoom = 40
	SWEP.MaxZoom = 80
	
	SWEP.IronsightsMultiplier = 0.25
	
	SWEP.MuzzleEffect = "swb_rifle_large"
	
	SWEP.HUD3DBone = "v_weapon.scout_Parent"
	SWEP.HUD3DPos = Vector(-1, -2.75, -6)
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

SWEP.SpeedDec = 25
SWEP.BulletDiameter = 7.62
SWEP.CaseLength = 51

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"bolt"}
SWEP.Base = "swb_base"
SWEP.Category = "SWB Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cstrike/c_snip_scout.mdl"
SWEP.WorldModel		= "models/weapons/w_snip_scout.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 5
SWEP.Primary.ClipMultiplier = 1.5
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "357"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 1.5
SWEP.FireSound = Sound("Weapon_Scout.Single")
SWEP.Recoil = 2

SWEP.HipSpread = 0.055
SWEP.AimSpread = 0.00015
SWEP.VelocitySensitivity = 2
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.05
SWEP.SpreadCooldown = 1.25
SWEP.Shots = 1
SWEP.Damage = 50
SWEP.DeployTime = 1

SWEP.ConeMax = 0.075
SWEP.ConeMin = 0

SWEP.WalkSpeed = SPEED_SLOW