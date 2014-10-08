AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Annabelle' Rifle"
	SWEP.Description = "This modified hunting rifle's bullets will explode in to smaller bullets upon hitting a hard surface."
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-8.801, -7.12, 5.639)
	SWEP.AimAng = Vector(0, 0, 3.299)
		
	SWEP.SprintPos = Vector(11.199, -4.45, 2.039)
	SWEP.SprintAng = Vector(-1.9, 46.099, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "shotshell"
	SWEP.ShellOnEvent = true
	
	SWEP.IconLetter = "k"
	killicon.AddFont("swb_annabelle", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_shotgun"
	
	SWEP.HUD3DBone = "ValveBiped.Gun"
	SWEP.HUD3DPos = Vector(1.75, 1, -5)
	SWEP.HUD3DAng = Angle(180, 0, 0)
	SWEP.HUD3DScale = 0.015
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
SWEP.ViewModel		= "models/weapons/c_annabelle.mdl"
SWEP.WorldModel 	= "models/weapons/w_annabelle.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.UseHands = true

SWEP.Primary.ClipSize		= 4
SWEP.Primary.ClipMultiplier = 1.5
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "357"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 1
SWEP.FireSound = Sound("Weapon_Shotgun.Single")
SWEP.Recoil = 2.5
SWEP.ShotgunReload = true
SWEP.ReloadStartWait = 0.6
SWEP.ReloadFinishWait = 1.1
SWEP.ReloadShellInsertWait = 0.6
SWEP.Chamberable = false

SWEP.HipSpread = 0.036
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 2.2
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 1.03
SWEP.Shots = 1
SWEP.Damage = 90
SWEP.DeployTime = 1

SWEP.ConeMax = 0.1
SWEP.ConeMin = 0.015

SWEP.WalkSpeed = SPEED_SLOW

local function DoRicochet(attacker, hitpos, hitnormal, normal, damage)
	attacker.RicochetBullet = true
	attacker:FireBullets({Num = 8, Src = hitpos, Dir = hitnormal, Spread = Vector(0.2, 0.2, 0), Tracer = 1, TracerName = "rico_trace", Force = damage * 0.15, Damage = damage, Callback = GenericBulletCallback})
	attacker.RicochetBullet = nil
end
function SWEP.BulletCallback(attacker, tr, dmginfo)
	if SERVER and tr.HitWorld and not tr.HitSky then
		local hitpos, hitnormal, normal, dmg = tr.HitPos, tr.HitNormal, tr.Normal, dmginfo:GetDamage() / 5
		timer.Simple(0, function() DoRicochet(attacker, hitpos, hitnormal, normal, dmg) end)
	end

	GenericBulletCallback(attacker, tr, dmginfo)
end