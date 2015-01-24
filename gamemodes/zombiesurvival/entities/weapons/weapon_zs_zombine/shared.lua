SWEP.Base = "weapon_zs_zombie"

SWEP.MeleeReach = 48
SWEP.MeleeDelay = 0.8
SWEP.MeleeSize = 1.5
SWEP.MeleeDamage = 30
SWEP.MeleeDamageType = DMG_SLASH

SWEP.Primary.Delay = 1.1

SWEP.ViewModel = "models/weapons/zombine/v_zombine.mdl"
SWEP.WorldModel = ""

function SWEP:SendAttackAnim()
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
end

SWEP.NextGrenade = 0
function SWEP:SecondaryAttack()
	if CurTime() < self.NextGrenade then return end

	self:SendWeaponAnim(ACT_VM_SECONDARYATTACK) -- grenade animation
	self.Owner:DoAnimationEvent(ACT_GMOD_GESTURE_TAUNT_ZOMBIE)
	self.Owner:EmitSound("weapons/npc/zombine/zombie_voice_idle"..math.random(14)..".wav")
	
	timer.Simple(0.9, function(wep) self:SendWeaponAnim(ACT_VM_THROW) end) -- timer to pull up grenade
	
	if (SERVER) then
		timer.Simple(3, function(wep) self:Grenade()  end)
	end

	self.NextGrenade = CurTime() + 5 -- to make sure you can't spam the grenade
end

function SWEP:CheckMoaning()
end

function SWEP:StopMoaningSound()
end

function SWEP:StartMoaningSound()
end

function SWEP:PlayHitSound()
	self.Owner:EmitSound("npc/zombie/claw_strike"..math.random(1, 3)..".wav", 75, 80)
end

function SWEP:PlayMissSound()
	self.Owner:EmitSound("npc/zombie/claw_miss"..math.random(1, 2)..".wav", 75, 80)
end

function SWEP:PlayAttackSound()
	self.Owner:EmitSound("weapons/npc/zombine/zo_attack"..math.random(1, 2)..".wav")
end

function SWEP:PlayIdleSound()
	self.Owner:EmitSound("weapons/npc/zombine/zombie_voice_idle"..math.random(14)..".wav")
end