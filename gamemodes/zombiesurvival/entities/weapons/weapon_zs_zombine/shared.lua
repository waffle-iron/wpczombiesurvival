SWEP.Base = "weapon_zs_zombie"

SWEP.MeleeReach = 48
SWEP.MeleeDelay = 0.8
SWEP.MeleeSize = 1.5
SWEP.MeleeDamage = 35
SWEP.MeleeDamageType = DMG_SLASH

SWEP.Primary.Delay = 1.1

SWEP.ViewModel = "models/weapons/zombine/v_zombine.mdl"
SWEP.WorldModel = ""

function SWEP:SendAttackAnim()
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
end

function SWEP:SecondaryAttack()
	if CurTime() <= self:GetNextSecondaryFire() then return end
	
	local owner = self.Owner
	
	if SERVER then
		local hand = owner:LookupBone("ValveBiped.Bip01_R_Hand")
		
		self.SpriteTrail = util.SpriteTrail(self, 0, Color(255,0,0), false, 8.0, 1, 0.5, 0.01, "trails/laser.vmt")
		self.SpriteTrail:SetPos(owner:GetBonePosition(hand))
		self.SpriteTrail:FollowBone(owner, hand)
	end

	self:SendWeaponAnim(ACT_VM_SECONDARYATTACK) -- grenade animation
	owner:DoAnimationEvent(ACT_GMOD_GESTURE_TAUNT_ZOMBIE)
	owner:EmitSound("weapons/npc/zombine/zombie_voice_idle"..math.random(14)..".wav")
	
	timer.Simple(0.9, function(wep) self:SendWeaponAnim(ACT_VM_THROW) end) -- timer to pull up grenade
	
	if (SERVER) then
		timer.Simple(3, function(wep) self:Grenade()  end)
	end

	self:SetNextSecondaryFire(CurTime() + 5) -- to make sure you can't spam the grenade
end

function SWEP:Think()
	if not self.Owner:Alive() then
		self.SpriteTrail:Fire("Kill")
	end
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