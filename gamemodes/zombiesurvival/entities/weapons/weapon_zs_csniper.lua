AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Destroyer' Sniper Rifle"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-7.461, -13.646, 1.519)
	SWEP.AimAng = Vector(0, 0, 0)
		
	SWEP.SprintPos = Vector(0, 0, 0)
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
	
	SWEP.HeadshotMultiplier = 3.25
	
	SWEP.MuzzleEffect = "muzzleflash_m14"
	SWEP.PosBasedMuz = true
	
	SWEP.MuzzleEffect = "swb_rifle_med"
	SWEP.MuzzlePosMod = {x = 7, y = 55, z = -3}
	SWEP.PosBasedMuz = true

	SWEP.HUD3DBone = "base"
	SWEP.HUD3DPos = Vector(0.42, -5, -2.43)
	SWEP.HUD3DAng = Angle(90, -10, 0)
	SWEP.HUD3DScale = 0.03
end

SWEP.VElements = {
	["pipe1+"] = { type = "Model", model = "models/props_c17/GasPipes006a.mdl", bone = "base", rel = "", pos = Vector(2.273, -7.618, -1.255), angle = Angle(-90, 180, 0.382), size = Vector(0.076, 0.076, 0.076), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/MetalSet_1-2", skin = 0, bodygroup = {} },
	["pipe1"] = { type = "Model", model = "models/props_c17/GasPipes006a.mdl", bone = "base", rel = "", pos = Vector(2.267, -7.224, -1.43), angle = Angle(-90, 180, 0.382), size = Vector(0.076, 0.076, 0.076), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/MetalSet_1-2", skin = 0, bodygroup = {} },
	["indicator_holder"] = { type = "Model", model = "models/Items/battery.mdl", bone = "base", rel = "", pos = Vector(0.177, -6.804, -1.203), angle = Angle(180, 180, 90), size = Vector(0.109, 0.109, 0.109), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["indicator"] = { type = "Sprite", sprite = "sprites/glow04", bone = "base", rel = "", pos = Vector(-0.332, -7.698, -1.203), size = { x = 1, y = 1 }, color = Color(255, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false}
}

SWEP.PlayBackRate = 1
SWEP.PlayBackRateSV = 1
SWEP.FadeCrosshairOnAim = true
SWEP.PreventQuickScoping = true

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true

SWEP.SpeedDec = 30
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
SWEP.ViewModel		= "models/weapons/c_combinesniper_e2.mdl"
SWEP.WorldModel		= "models/weapons/w_combinesniper_e2.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 5
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "357"
GAMEMODE:SetupDefaultClip(SWEP.Primary)
	
SWEP.FireDelay = 1.5
SWEP.FireSound = Sound("weapons/jaanus/ep2sniper_fire.wav")
SWEP.Recoil = 1.1
SWEP.ReloadSound = Sound("weapons/jaanus/ep2sniper_reload.wav")

SWEP.HipSpread = 0.055
SWEP.AimSpread = 0.00025
SWEP.VelocitySensitivity = 2.2
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.15
SWEP.Shots = 1
SWEP.Damage = 325
SWEP.DeployTime = 1

SWEP.ConeMax = 0.075
SWEP.ConeMin = 0

SWEP.WalkSpeed = SPEED_SLOW

SWEP.LaserRespawnTime = 1
SWEP.LaserLastRespawn = 0

function SWEP:Think()
	if (self.LaserLastRespawn + self.LaserRespawnTime) < CurTime() then
		local effectdata = EffectData()
		
		effectdata:SetOrigin( self:GetOwner():GetShootPos() )
		effectdata:SetEntity( self.Weapon )
		util.Effect( "sniperlaserbeam", effectdata ) 
		
		self.LaserLastRespawn = CurTime()

		if ( self.Weapon:Clip1() > 0 ) then
			self.VElements["indicator"].color = Color(21, 186, 7, 255)
		else
			self.VElements["indicator"].color = Color(255, 0, 0, 255)
		end
	end
end

function SWEP:Precache()
    util.PrecacheSound("weapons/jaanus/ep2sniper_fire.wav")
	util.PrecacheSound("weapons/jaanus/ep2sniper_reload.wav")
	util.PrecacheSound("weapons/jaanus/ep2sniper_empty.wav")
end