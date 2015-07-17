AddCSLuaFile()

SWEP.Base = "weapon_zs_poisonzombie"

function SWEP:SecondaryAttack()
	if self.Owner:GetMoveType() == MOVETYPE_WALK then
		self.Owner:SetMoveType(MOVETYPE_FLY)
	else
		self.Owner:SetMoveType(MOVETYPE_WALK)
	end
end

if not CLIENT then return end

function SWEP:PreDrawViewModel(vm)
	local owner = self.Owner
	if owner:IsValid() then
		owner:CallZombieFunction("PreRenderEffects", vm)
	end
end

function SWEP:PostDrawViewModel(vm)
	local owner = self.Owner
	if owner:IsValid() then
		owner:CallZombieFunction("PostRenderEffects", vm)
	end
end
