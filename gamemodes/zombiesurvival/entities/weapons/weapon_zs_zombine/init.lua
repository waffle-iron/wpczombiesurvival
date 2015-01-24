AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function SWEP:Grenade()
	if not self.Owner:Alive() then return end

	local ent = ents.Create( "env_explosion" )
	ent:SetPos( self.Owner:GetPos() )
	ent:SetOwner( self.Owner )
	ent:Spawn()
	ent:SetKeyValue( "iMagnitude", "60" )
	ent:Fire( "Explode", 0, 0 )
	ent:EmitSound("ambient/fire/gascan_ignite1.wav")
		
	self.Owner:Kill( )
end

function SWEP:Reload()
	self.BaseClass.SecondaryAttack(self)
end
