AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Ricochete' Magnum"
	SWEP.Description = "This gun's bullets will bounce off of walls which will then deal extra damage."
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-3.6, -16.08, 1.44)
	SWEP.AimAng = Vector(0.5, -0.201, 0)
	
	SWEP.SprintPos = Vector(1.185, -15.796, -14.254)
	SWEP.SprintAng = Vector(64.567, 0, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.MuzzleEffect = "swb_pistol_large"
	SWEP.MuzzlePosMod = {x = 6.5, y =	30, z = -2}
	--SWEP.PosBasedMuz = true
	
	SWEP.HUD3DBone = "smdimport"
	SWEP.HUD3DPos = Vector(0.85, -2.6, 2.5)
	SWEP.HUD3DAng = Angle(180, 0, 270)
	SWEP.HUD3DScale = 0.015
end

SWEP.SpeedDec = 12
SWEP.BulletDiameter = 9.1
SWEP.CaseLength = 33

SWEP.PlayBackRate = 2
SWEP.PlayBackRateSV = 2

SWEP.Kind = WEAPON_PISTOL
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_revolver_ttt"

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"double"}
SWEP.Base = "swb_base"
SWEP.Category = "SWB Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/c_mantuna_357.mdl"
SWEP.WorldModel		= "models/weapons/w_357.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 6
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pistol"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 0.7
SWEP.FireSound = Sound("Weapon_357.Single")
SWEP.DrawSound = Sound("Weapon_Magnum.Spin")
SWEP.Recoil = 3
SWEP.Chamberable = false
SWEP.CanRicochet = true

SWEP.HipSpread = 0.048
SWEP.AimSpread = 0.0075
SWEP.VelocitySensitivity = 1.85
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.015
SWEP.SpreadCooldown = 0.5
SWEP.Shots = 1
SWEP.Damage = 59
SWEP.DeployTime = 1

SWEP.ConeMax = 0.075
SWEP.ConeMin = 0.04

local function DoRicochet(attacker, hitpos, hitnormal, normal, damage)
	attacker.RicochetBullet = true
	attacker:FireBullets({Num = 1, Src = hitpos, Dir = 2 * hitnormal * hitnormal:Dot(normal * -1) + normal, Spread = Vector(0, 0, 0), Tracer = 1, TracerName = "rico_trace", Force = damage * 0.15, Damage = damage, Callback = GenericBulletCallback})
	attacker.RicochetBullet = nil
end
function SWEP.BulletCallback(attacker, tr, dmginfo)
	if SERVER and tr.HitWorld and not tr.HitSky then
		local hitpos, hitnormal, normal, dmg = tr.HitPos, tr.HitNormal, tr.Normal, dmginfo:GetDamage() * 1.5
		timer.Simple(0, function() DoRicochet(attacker, hitpos, hitnormal, normal, dmg) end)
	end

	GenericBulletCallback(attacker, tr, dmginfo)
end

util.PrecacheSound("weapons/357_mantuna/357_spin1.wav")