hook.Add( "PlayerSpawn", "Blood:PlayerSpawn", function( ply ) 
	if ply:Team() == TEAM_UNDEAD and not ply:GetBloodColor() == BLOOD_COLOR_ZOMBIE then
		ply:SetBloodColor(BLOOD_COLOR_ZOMBIE)
	elseif not ply:GetBloodColor() == BLOOD_COLOR_RED
		ply:SetBloodColor(BLOOD_COLOR_RED)
	end
end )