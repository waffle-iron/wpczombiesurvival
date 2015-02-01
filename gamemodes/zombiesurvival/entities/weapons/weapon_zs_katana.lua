AddCSLuaFile()

if CLIENT then
	SWEP.PrintName = "'Slicer' Katana"
	
	SWEP.Description = "Incredibly far reach."

	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 55
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.HoldType = "melee2"

SWEP.ViewModel      = "models/weapons/c_katana.mdl"
SWEP.WorldModel   	= "models/weapons/w_katana.mdl"
SWEP.UseHands = true

SWEP.MeleeDamage = 75
SWEP.MeleeRange = 72
SWEP.MeleeSize = 1.5
SWEP.MeleeKnockBack = 8

SWEP.Primary.Delay = 1.0

SWEP.WalkSpeed = SPEED_FASTEST
SWEP.HitDecal = "Manhackcut"
SWEP.NoHitSoundFlesh = true
SWEP.SwingHoldType = "melee"

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/knife/knife_slash"..math.random(2)..".wav")
end

function SWEP:PlayHitSound()
	self:EmitSound("weapons/knife/knife_hitwall1.wav")
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("weapons/knife/knife_hit"..math.random(4)..".wav")
end

function SWEP:MeleeSwing()
	local owner = self.Owner

	owner:DoAttackEvent()

	local filter = owner:GetMeleeFilter()

	owner:LagCompensation(true)

	local tr = owner:MeleeTrace(self.MeleeRange, self.MeleeSize, filter)
	if tr.Hit then
		local damagemultiplier = owner.BuffMuscular and 1.2 or 1
		local damage = self.MeleeDamage * damagemultiplier
		local hitent = tr.Entity
		local hitflesh = tr.MatType == MAT_FLESH or tr.MatType == MAT_BLOODYFLESH or tr.MatType == MAT_ANTLION or tr.MatType == MAT_ALIENFLESH

		if self.HitAnim and not hitflesh then
			self:SendWeaponAnim(self.HitAnim)
		else
			if self.MissAnim then
				self:SendWeaponAnim(self.MissAnim)
			end
		end
		self.IdleAnimation = CurTime() + self:SequenceDuration()

		if hitflesh then
			util.Decal(self.BloodDecal, tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
			self:PlayHitFleshSound()
			if SERVER and not (hitent:IsValid() and hitent:IsPlayer() and hitent:Team() == owner:Team()) then
				util.Blood(tr.HitPos, math.Rand(damage * 0.25, damage * 0.6), (tr.HitPos - owner:GetShootPos()):GetNormalized(), math.Rand(damage * 6, damage * 12), true)
			end
			if not self.NoHitSoundFlesh then
				self:PlayHitSound()
			end
		else
			util.Decal(self.HitDecal, tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
			self:PlayHitSound()
		end

		if self.OnMeleeHit and self:OnMeleeHit(hitent, hitflesh, tr) then
			owner:LagCompensation(false)
			return
		end

		if SERVER and hitent:IsValid() then
			damage = self.MeleeDamage * damagemultiplier

			if hitent:GetClass() == "func_breakable_surf" then
				hitent:Fire("break", "", 0.01) -- Delayed because no way to do prediction.
			else
				local dmginfo = DamageInfo()
				dmginfo:SetDamagePosition(tr.HitPos)
				dmginfo:SetDamage(damage)
				dmginfo:SetAttacker(owner)
				dmginfo:SetInflictor(self)
				dmginfo:SetDamageType(self.DamageType)
				if hitent:IsPlayer() then
					hitent:MeleeViewPunch(damage)
					if hitent:IsHeadcrab() then
						damage = damage * 2
						dmginfo:SetDamage(damage)
					end
					gamemode.Call("ScalePlayerDamage", hitent, tr.HitGroup, dmginfo)

					if self.MeleeKnockBack > 0 then
						hitent:ThrowFromPositionSetZ(tr.HitPos, self.MeleeKnockBack, nil, true)
					end
					if hitent:IsPlayer() and hitent:WouldDieFrom(damage, dmginfo:GetDamagePosition()) then
						dmginfo:SetDamageForce(math.min(self.MeleeDamage, 50) * 400 * owner:GetAimVector())
					end
				end

				if hitent:IsPlayer() then
					hitent:TakeDamageInfo(dmginfo)
				else
					-- Again, no way to do prediction.
					timer.Simple(0, function()
						if hitent:IsValid() then
							-- Workaround for propbroken not calling.
							local h = hitent:Health()

							hitent:TakeDamageInfo(dmginfo)

							if hitent:Health() <= 0 and h ~= hitent:Health() then
								gamemode.Call("PropBroken", hitent, owner)
							end

							local phys = hitent:GetPhysicsObject()
							if hitent:GetMoveType() == MOVETYPE_VPHYSICS and phys:IsValid() and phys:IsMoveable() then
								hitent:SetPhysicsAttacker(owner)
							end
						end
					end)
				end
			end
		end

		if self.PostOnMeleeHit then self:PostOnMeleeHit(hitent, hitflesh, tr) end
	else
		if self.MissAnim then
			self:SendWeaponAnim(self.MissAnim)
		end
		self.IdleAnimation = CurTime() + self:SequenceDuration()
		self:PlaySwingSound()

		if self.PostOnMeleeMiss then self:PostOnMeleeMiss(tr) end
	end

	owner:LagCompensation(false)
end