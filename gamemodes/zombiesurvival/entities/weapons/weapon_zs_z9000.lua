AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Z9000' Pulse Pistol"
	SWEP.Description = "Although the Z9000 does not deal that much damage, the pulse shots it fires will slow targets."
	SWEP.CSMuzzleFlashes = false
	
	SWEP.AimPos = Vector(-6.511, 3, 3.429)
	SWEP.AimAng = Vector(-0.15, -1.749, 0)
	
	SWEP.SprintPos = Vector(-0.801, -17.56, -3.36)
	SWEP.SprintAng = Vector(46.2, -4.2, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.MuzzleEffect = "swb_pistol_small"
	
	SWEP.HUD3DBone = "ValveBiped.square"
	SWEP.HUD3DPos = Vector(1.1, 0.25, -2)
	SWEP.HUD3DScale = 0.015
	
	SWEP.ShowViewModel = false

	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/weapons/w_alyx_gun.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7, 2, -4.092), angle = Angle(170, 10, 10), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 10
SWEP.BulletDiameter = 9
SWEP.CaseLength = 19

SWEP.Kind = WEAPON_PISTOL
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_pistol_ttt"

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "swb_base"
SWEP.Category = "SWB Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel 		= "models/weapons/c_pistol.mdl"
SWEP.WorldModel 	= "models/weapons/w_alyx_gun.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 10
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pulse"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 0.2
SWEP.FireSound = Sound("Weapon_Alyx_Gun.NPC_Single")
SWEP.Recoil = 0.7

SWEP.Chamberable = false
SWEP.ReloadSound = Sound("Weapon_Alyx_Gun.Reload")

SWEP.HipSpread = 0.036
SWEP.AimSpread = 0.0115
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.15
SWEP.Shots = 1
SWEP.Damage = 14
SWEP.DeployTime = 1

SWEP.TracerName = "AR2Tracer"

SWEP.ConeMax = 0.08
SWEP.ConeMin = 0.04

function SWEP.BulletCallback(attacker, tr, dmginfo)
	local ent = tr.Entity
	if ent:IsValid() and ent:IsPlayer() and ent:Team() == TEAM_UNDEAD then
		ent:AddLegDamage(8)
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