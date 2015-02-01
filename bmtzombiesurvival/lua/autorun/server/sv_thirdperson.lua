hook.Add( "OnPlayerChangedTeam", "STP_ChangedTeam", function( ply, oldTeam, newTeam ) 
	if ply.m_bThirdPEnabled then
		if newteam == TEAM_UNDEAD and oldTeam == TEAM_HUMAN then
			ply.m_bShoulderEnabled = false
		elseif newteam == TEAM_HUMAN and oldTeam == TEAM_UNDEAD then
			ply.m_bShoulderEnabled = true
		end
		
		net.Start("stp_enabled")
			net.WriteBit(ply.m_bShoulderEnabled)
			net.WriteBit(ply.m_bThirdPEnabled)
			net.WriteBit(ply.m_bThirdPDisabled)
		net.Send(ply)
	end
end )