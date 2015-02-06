hook.Add( "OnPlayerChangedTeam", "STP_ChangedTeam", function( ply, oldTeam, newTeam ) 
	if ply.m_bThirdPEnabled then
		if newteam == TEAM_UNDEAD then
			ply.m_bThirdPEnabled = false
			ply.m_bShoulderEnabled = false
		end
		
		net.Start("stp_enabled")
			net.WriteBit(ply.m_bShoulderEnabled)
			net.WriteBit(ply.m_bThirdPEnabled)
			net.WriteBit(ply.m_bThirdPDisabled)
		net.Send(ply)
	end
end )