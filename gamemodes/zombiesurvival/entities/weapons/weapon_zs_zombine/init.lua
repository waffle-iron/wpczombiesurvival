AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function SWEP:Grenade()
	local owner = self.Owner
	
	if not owner:Alive() then return end

	owner:EmitSound("ambient/fire/gascan_ignite1.wav")
	local effectdata = EffectData()
		effectdata:SetOrigin(owner:GetPos())
	util.Effect("Explosion", effectdata)
	util.BlastDamage2(self, owner, owner:GetPos(), 256, 50)
		
	owner:Kill( )
end

function SWEP:Reload()
	self.BaseClass.SecondaryAttack(self)
end
