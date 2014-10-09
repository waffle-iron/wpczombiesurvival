hook.Add( "PlayerSpawn", "TPF_ZombieSurvivalAddon", function( pl ) 
	if pl:Team() == TEAM_UNDEAD and not pl.m_bTPFDisabled then
		pl.m_bTPFDisabled = true
	else 
		if pl:Team() == TEAM_HUMAN and pl.m_bTPFDisabled then
			pl.m_bTPFDisabled = false
		end
	end
end )