AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Adonis' Pulse Rifle"
	SWEP.Description = "Deals massive damage and slows targets."
	SWEP.CSMuzzleFlashes = false
	
	SWEP.AimPos = Vector(-5.841, -9.681, 1)
	SWEP.AimAng = Vector(1.899, -0.301, 0)

	SWEP.SprintPos = Vector(3.799, -9.28, 1.679)
	SWEP.SprintAng = Vector(-7.901, 52.4, 0)
	
	SWEP.ZoomAmount = 15
	
	SWEP.HUD3DBone = "Vent"
	SWEP.HUD3DPos = Vector(1, 0, 0)	
	SWEP.HUD3DScale = 0.018
end

SWEP.PlayBackRate = 1
SWEP.PlayBackRateSV = 1
SWEP.SpeedDec = 25
SWEP.BulletDiameter = 5.56
SWEP.CaseLength = 45

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true

SWEP.Infliction = 0.8

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

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= false
SWEP.ViewModel 		= "models/weapons/c_irifle.mdl"
SWEP.WorldModel 	= "models/weapons/w_IRifle.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo 			= "pulse"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ReloadSound = Sound("Weapon_SMG1.Reload")
SWEP.FireDelay = 0.2
SWEP.FireSound = Sound("Airboat.FireGunHeavy")
SWEP.Recoil = 0.6
SWEP.Chamberable = false
SWEP.CanRicochet = false

SWEP.HipSpread = 0.035
SWEP.AimSpread = 0.004
SWEP.VelocitySensitivity = 2.5
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 34
SWEP.DeployTime = 1

SWEP.ConeMax = 0.06
SWEP.ConeMin = 0.02

SWEP.WalkSpeed = SPEED_SLOW

SWEP.TracerName = "AR2Tracer"

function SWEP.BulletCallback(attacker, tr, dmginfo)
	local ent = tr.Entity
	if ent:IsValid() and ent:IsPlayer() and ent:Team() == TEAM_UNDEAD then
		ent:AddLegDamage(4)
	end

	local e = EffectData()
		e:SetOrigin(tr.HitPos)
		e:SetNormal(tr.HitNormal)
		e:SetRadius(8)
		e:SetMagnitude(1)
		e:SetScale(1)
	util.Effect("cball_bounce", e)

	GenericBulletCallback(attacker, tr, dmginfo)
end