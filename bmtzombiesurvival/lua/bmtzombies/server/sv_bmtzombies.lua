-----LibK Database Init-----
LibK.SetupDatabase( "BMTZombies", BMTZombies )

hook.Add( "PlayerInitialSpawn", "PointSave.InitialSpawn", function( pl )
	if pl:GetSavedPoints() > 0 or pl:GetSavedPoints() < 0 then
		pl:SetSavedPoints(0)
	end
end )

hook.Add("PlayerSpawn","PointSave.Spawn", function(ply)
	if ply:Team() == TEAM_UNDEAD then
		return
	end

	local id = ply:SteamID()
	
	BMTZombies.Points.findBySteamId(id)
	:Then(function( plyData )
		if not plyData then
			local pointsave = BMTZombies.Points:new( )
			pointsave.steamId = id or ""
			pointsave.nick = ply:Nick() or ""
			pointsave.points = 0
			pointsave:save()
		else 
			if ply:Team() == TEAM_HUMAN then
				if plyData.points and plyData.points > 0 then 
					ply:SetPoints(plyData.points)
				end
			end
		end
	end)
end)
hook.Add("PlayerPointsAdded","PointSave.Add", function(ply, points)
	if ply:Team() == TEAM_UNDEAD then
		return
	end
	
	local id = ply:SteamID()
	
	if points > 1 then
		ply:SetSavedPoints(ply:GetSavedPoints() + math.Round(points/2))
	else
		ply:SetSavedPoints(ply:GetSavedPoints() + 1)
	end
	
	BMTZombies.Points.findBySteamId(id)
	:Then(function( plyData )
		if not plyData then
			local pointsave = BMTZombies.Points:new( )
			pointsave.steamId = id or ""
			pointsave.nick = ply:Nick() or ""
			pointsave.points = points
			pointsave:save()
		end
		
		if points > 1 then
			plyData.points = plyData.points + math.Round(points/2)
		else
			plyData.points = plyData.points + 1
		end
		plyData:save()
	end)
end)
hook.Add("PlayerPointsRemoved","PointSave.Remove", function(ply, points)
	if ply:Team() == TEAM_UNDEAD then
		return
	end

	local id = ply:SteamID()
	
	ply:SetSavedPoints(ply:GetSavedPoints() - points)
	
	BMTZombies.Points.findBySteamId(id)
	:Then(function( plyData )
		if not plyData then
			local pointsave = BMTZombies.Points:new( )
			pointsave.steamId = id or ""
			pointsave.nick = ply:Nick() or ""
			pointsave.points =  ply:GetPoints()
			pointsave:save()
		else
			if plyData.points <= 0 then
				return
			end
			
			plyData.points = plyData.points - points
			
			if plyData.points < 0 then
				plyData.points = 0
			end
				
			plyData:save()
		end
	end)
end)

hook.Add("EndRound", "EndRound.Percentage", function(winner)
	local mapname = game.GetMap()
	local pct = 0
	
	if team.NumPlayers(TEAM_HUMAN) == 0 and team.NumPlayers(TEAM_UNDEAD) == 0 then
		return
	end
	
	BMTZombies.WinsPercentage.findByMapName(mapname)
	:Then(function( mapData )
		if not mapData then
			local mapstuff = BMTZombies.WinsPercentage:new()
			mapstuff.mapName = mapname or ""
			if winner == TEAM_HUMAN then
				mapstuff.wins = 1
			else
				mapstuff.wins = 0
			end
			if winner == TEAM_UNDEAD then
				mapstuff.losses = 1
			else
				mapstuff.losses = 0
			end
			mapstuff.numPlayed = 1
			mapstuff:save()
		else
			if winner == TEAM_HUMAN then
				mapData.wins = mapData.wins + 1
			else
				mapData.losses = mapData.losses + 1
			end
			
			mapData.numPlayed = mapData.numPlayed + 1
			
			pct = 100 * mapData.wins / (mapData.wins+mapData.losses)
			mapData:save()
			
			ULib.tsayColor( nil, true, Color( 0, 255, 0 ), "This map has been played ", Color( 80, 208, 208 ), string.format("%d", mapData.numPlayed), Color( 0, 255, 0 ), " times and humans have won ", Color( 255, 0, 0 ), string.format("%d", math.ceil(pct)), Color( 0, 255, 0 ), " of the time." )
		end
	end)
end)