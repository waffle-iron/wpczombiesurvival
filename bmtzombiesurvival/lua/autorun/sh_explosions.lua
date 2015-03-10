function Splode()
	local explode = ents.FindByClass("env_explosion")
	local explodear2 = ents.FindByClass("env_ar2explosion")
	local physboom = ents.FindByClass("env_physexplosion")
	local fire = ents.FindByClass("env_fire")
	for k,v in pairs( explode ) do
		if( v:IsValid() ) then
			local Pos = v:LocalToWorld( v:OBBCenter( ) )
			ParticleEffect("dusty_explosion_rockets", Pos, Angle(0,0,0), nil)
			v:Remove()
		end
	end
end

game.AddParticles( "particles/explodey.pcf" )
game.AddParticles( "particles/firey.pcf" )
hook.Add("Think", "Splode", Splode)