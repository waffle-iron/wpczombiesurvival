AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'OICW' Assault Rifle"
	SWEP.CSMuzzleFlashes = true

	SWEP.AimPos =Vector(-8.721, -11.86, 4.519)
	SWEP.AimAng = Vector(0, 0, 0)

	SWEP.SprintPos = Vector(3.799, -9.28, 1.679)
	SWEP.SprintAng = Vector(-7.901, 52.4, 0)
	
	SWEP.ViewModelMovementScale = 0.85
	
	SWEP.MuzzleEffect = "swb_rifle_med"
	
	SWEP.DrawBlackBarsOnAim = true
	SWEP.AimOverlay = surface.GetTextureID("zombiesurvival/scope")
	SWEP.FadeDuringAiming = true
	SWEP.MoveWepAwayWhenAiming = true
	SWEP.ZoomAmount = 70
	SWEP.DelayedZoom = true
	SWEP.SnapZoom = true
	SWEP.SimulateCenterMuzzle = true
	
	SWEP.AdjustableZoom = true
	SWEP.MinZoom = 40
	SWEP.MaxZoom = 80
	
	SWEP.HUD3DBone = "weapons/v_AR01"
	SWEP.HUD3DPos = Vector(2.2, -10, 4)
	SWEP.HUD3DAng = Angle(180, 0, 270)
	SWEP.HUD3DScale = 0.03
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
SWEP.AmmoEnt = "item_ammo_ar2_ttt"

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "2burst", "semi"}
SWEP.Base = "swb_base"
SWEP.Category = "SWB Weapons"

SWEP.Author			= "Kalashnikov"
SWEP.Contact		= "http://steamcommunity.com/id/bfg/"
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 53
SWEP.ViewModelFlip	= false
SWEP.ViewModel 		= "models/weapons/c_oicw.mdl"
SWEP.WorldModel 	= "models/weapons/w_oicw.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"
SWEP.Chamberable = false
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1
SWEP.ReloadGesture = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.ConeMax = 0.035
SWEP.ConeMin = 0.019

SWEP.WalkSpeed = SPEED_NORMAL

SWEP.ReloadSound = Sound("Weapon_OICW.Reload")
SWEP.FireDelay = 0.1
SWEP.FireSound = Sound("Weapon_OICW.Fire")
SWEP.Recoil = 1

SWEP.HipSpread = 0.037
SWEP.AimSpread = 0.015
SWEP.VelocitySensitivity = 1.4
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 20
SWEP.DeployTime = 1
SWEP.BurstCooldownMul = 3.5

SWB_RegisterSound("Weapon_OICW.Fire", {"weapons/oicw/oicw_fire1.wav", "weapons/oicw/oicw_fire2.wav"}, 100)
SWB_RegisterSound("Weapon_OICW.Reload", "weapons/oicw/oicw_reload.wav", 100)