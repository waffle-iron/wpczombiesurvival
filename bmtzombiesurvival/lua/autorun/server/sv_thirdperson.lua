hook.Add( "PlayerSpawn", "STP_PlayerSpawn", function( ply ) 
	if ply.m_bThirdPEnabled then
		if ply:Team() == TEAM_UNDEAD then
			ply.m_bThirdPEnabled = false
			ply.m_bShoulderEnabled = false
			
			net.Start("stp_enabled")
				net.WriteBit(ply.m_bShoulderEnabled)
				net.WriteBit(ply.m_bThirdPEnabled)
				net.WriteBit(ply.m_bThirdPDisabled)
			net.Send(ply)
		end
	end
end )