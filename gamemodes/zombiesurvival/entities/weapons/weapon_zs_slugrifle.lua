AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Tiny' Slug Rifle"
	SWEP.Description = "This powerful rifle instantly kills any zombie with a head shot."
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-6.886, -8.721, 2.691)
	SWEP.AimAng = Vector(-0.213, -0.787, -1.463)
		
	SWEP.SprintPos = Vector(3.957, -4.112, 1.013)
	SWEP.SprintAng = Vector(-8.613, 32.743, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	
	SWEP.IconLetter = "B"
	killicon.AddFont("swb_xm1014", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_sniper"
	
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
	
	SWEP.HUD3DBone = "v_weapon.xm1014_Bolt"
	SWEP.HUD3DPos = Vector(-1, 0, 0)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.02
	
	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360x2.mdl", bone = "v_weapon.xm1014_Parent", rel = "", pos = Vector(0, -6, -9), angle = Angle(0, 0, 0), size = Vector(0.014, 0.014, 0.094), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base+"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "v_weapon.xm1014_Parent", rel = "base", pos = Vector(0, 0, 8.5), angle = Angle(0, 0, 0), size = Vector(0.014, 0.014, 0.014), color = Color(255, 255, 255, 45), surpresslightning = false, material = "models/screenspace", skin = 0, bodygroup = {} },
		["base++"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "v_weapon.xm1014_Parent", rel = "base", pos = Vector(0, 0, 2), angle = Angle(0, 0, 0), size = Vector(0.014, 0.014, 0.014), color = Color(255, 255, 255, 45), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(13, 1, -7), angle = Angle(80, 0, 0), size = Vector(0.014, 0.014, 0.094), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base+"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 8.5), angle = Angle(0, 0, 0), size = Vector(0.014, 0.014, 0.014), color = Color(255, 255, 255, 45), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base++"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 2), angle = Angle(0, 0, 0), size = Vector(0.014, 0.014, 0.014), color = Color(255, 255, 255, 45), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
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

SWEP.Slot = 3
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
SWEP.ViewModel		= "models/weapons/cstrike/c_shot_xm1014.mdl"
SWEP.WorldModel		= "models/weapons/w_shot_xm1014.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 2
SWEP.Primary.ClipMultiplier = 2
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "357"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ReloadDelay = SWEP.FireDelay
SWEP.NoDistanceReduction = true

SWEP.ConeMax = 0.12
SWEP.ConeMin = 0.005

SWEP.FireDelay = 1.5
SWEP.FireSound = Sound("Weapon_AWP.Single")
SWEP.Recoil = 2.5
SWEP.ShotgunReload = true
SWEP.ReloadStartWait = 0.6
SWEP.ReloadFinishWait = 0.7
SWEP.ReloadShellInsertWait = 0.6
SWEP.Chamberable = false

SWEP.HipSpread = 0.06
SWEP.AimSpread = 0.0001
SWEP.VelocitySensitivity = 2.2
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.05
SWEP.SpreadCooldown = 1.44
SWEP.Shots = 1
SWEP.Damage = 135
SWEP.DeployTime = 1

SWEP.WalkSpeed = SPEED_SLOWER

function SWEP.BulletCallback(attacker, tr, dmginfo)
	if tr.HitGroup == HITGROUP_HEAD then
		local ent = tr.Entity
		if ent:IsValid() and ent:IsPlayer() then
			if ent:Team() == TEAM_UNDEAD and ent:GetZombieClassTable().Boss then
				GenericBulletCallback(attacker, tr, dmginfo)
				return
			end

			ent.Gibbed = CurTime()
		end

		if gamemode.Call("PlayerShouldTakeDamage", ent, attacker) then
			INFDAMAGEFLOATER = true
			ent:SetHealth(math.max(ent:Health() - 400, 1))
		end
	end

	GenericBulletCallback(attacker, tr, dmginfo)
end
