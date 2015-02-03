AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Laser Boom Stick"
	SWEP.Description = "This shotgun allows you to load up to four shells in the chamber at once. Hold down reload for faster loading of each shell."
	SWEP.CSMuzzleFlashes = false
	
	SWEP.AimPos = Vector(-4.08, -9.921, 2.24)
	SWEP.AimAng = Vector(1.1, 0.4, 0)
		
	SWEP.SprintPos = Vector(2.599, -10.32, 1.32)
	SWEP.SprintAng = Vector(-9.101, 54.599, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "shotshell"
	SWEP.ShellOnEvent = true
	
	SWEP.MuzzleEffect = "swb_shotgun"
	
	SWEP.HUD3DBone = "ValveBiped.Gun"
	SWEP.HUD3DPos = Vector(1.4, -6, 0)
	SWEP.HUD3DAng = Angle(180, 0, 270)
	SWEP.HUD3DScale = 0.025
	
	SWEP.VElements = {
		["battery1"] = { type = "Model", model = "models/items/battery.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(0, -4.676, 1.557), angle = Angle(0, 0, -90), size = Vector(0.5, 0.5, 0.82), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["battery2"] = { type = "Model", model = "models/items/battery.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(0, 10.909, 0.518), angle = Angle(0, 0, -90), size = Vector(0.56, 0.56, 2.832), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
		["battery1_wm"] = { type = "Model", model = "models/items/battery.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.869, 1.557, -6.753), angle = Angle(0, -90, -94), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["battery2_wm"] = { type = "Model", model = "models/items/battery.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.869, 1.557, -5.715), angle = Angle(0, -90, -94), size = Vector(0.5, 0.5, 1.404), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
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
SWEP.ViewModel 		= "models/weapons/c_mantuna_shotgun.mdl"
SWEP.WorldModel 	= "models/weapons/w_shotgun.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize 		= 4
SWEP.Primary.ClipMultiplier = 3
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Buckshot"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 1.5
SWEP.FireSound = Sound("weapons/shotgun/shotgun_dbl_fire.wav")
SWEP.ShotgunReloadSound = Sound("Weapon_Shotgun.Reload")
SWEP.ShotgunPumpSound = Sound("Weapon_Shotgun.Special1")
SWEP.DrawSound = Sound("Weapon_Magnum.Spin")
SWEP.Recoil = 12.5
SWEP.ShotgunReload = true
SWEP.PumpAfterReload = true
SWEP.ReloadStartWait = 0.6
SWEP.ReloadFinishWait = 1.1
SWEP.ReloadShellInsertWait = 0.8
SWEP.Chamberable = false

SWEP.HipSpread = 0.056
SWEP.AimSpread = 0.023
SWEP.ClumpSpread = 0.07
SWEP.VelocitySensitivity = 2.2
SWEP.MaxSpreadInc = 0.07
SWEP.SpreadPerShot = 0.04
SWEP.SpreadCooldown = 1.03
SWEP.Shots = 12
SWEP.Damage = 50
SWEP.DeployTime = 1
SWEP.AmmoPerShot = 4

SWEP.ConeMax = 0.23
SWEP.ConeMin = 0.2

SWEP.WalkSpeed = SPEED_SLOWER

function SWEP:PrimaryAttack()
	local clip = self:Clip1()

	self.BaseClass.PrimaryAttack(self)
		
	self.Owner:ViewPunch(clip * 0.5 * self.Recoil * Angle(math.Rand(-0.1, -0.1), math.Rand(-0.1, 0.1), 0))
	self.Owner:SetGroundEntity(NULL)
	self.Owner:SetVelocity(-80 * clip * self.Owner:GetAimVector())
end

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
	
	dmginfo:SetDamageType( bit.bor( DMG_ENERGYBEAM, DMG_DISSOLVE ) );
	
	GenericBulletCallback(attacker, tr, dmginfo)
end