AddCSLuaFile()

if CLIENT then
	SWEP.PrintName = "Lamp"

	SWEP.ViewModelFOV = 65
	SWEP.ViewModelFlip = false

	SWEP.ShowViewModel = false
	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props_interiors/Furniture_Lamp01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1.85, -8), angle = Angle(183, 0, 2), size = Vector(1.5, 1.5, 1.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/props_interiors/Furniture_Lamp01a.mdl"
SWEP.WM = "models/props_interiors/Furniture_Lamp01a.mdl"
SWEP.WMPos = Vector(1, -2.638, 10)
SWEP.WMAng = Angle(180, 0, 0)
SWEP.UseHands = true
SWEP.DrawTraditionalWorldModel = false

SWEP.HoldType = "melee2"

SWEP.DamageType = DMG_CLUB

SWEP.MeleeDamage = 44
SWEP.MeleeRange = 68
SWEP.MeleeSize = 2

SWEP.Primary.Delay = 1

SWEP.WalkSpeed = SPEED_SLOW

SWEP.SwingRotation = Angle(0, -90, -60)
SWEP.SwingOffset = Vector(0, 30, -40)
SWEP.SwingTime = 0.4
SWEP.SwingHoldType = "melee"

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 80, math.Rand(65, 70))
end

function SWEP:PlayHitSound()
	self:EmitSound("physics/metal/metal_solid_impact_hard"..math.random(4, 5)..".wav")
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav")
end
