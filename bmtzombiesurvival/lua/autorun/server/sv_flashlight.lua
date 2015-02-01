hook.Add( "OnPlayerChangedTeam", "TPF_ZombieSurvivalAddon", function( ply, oldTeam, newTeam ) 
	if newteam == TEAM_UNDEAD then
		pl.m_bTPFDisabled = true
	elseif newteam == TEAM_HUMAN then
		pl.m_bTPFDisabled = false
	end
end )