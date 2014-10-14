-----LibK Database Init-----
LibK.SetupDatabase( "BMTZombies", BMTZombies )

hook.Add( "PlayerInitialSpawn", "PointSave.InitialSpawn", function( pl )
	if pl:GetSavedPoints() > 0 or pl:GetSavedPoints() < 0 then
		pl:SetSavedPoints(0)
	end
end )

hook.Add("PlayerSpawn","PointSave.Spawn", function(ply)
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
			if ply:Team() == 4 then
				if plyData.points and plyData.points > 0 then 
					ply:SetPoints(plyData.points)
				end
			end
		end
	end)
end)
hook.Add("PlayerPointsAdded","PointSave.Add", function(ply, points)
	local id = ply:SteamID()
	
	ply:SetSavedPoints(ply:GetSavedPoints() + 1)
	
	BMTZombies.Points.findBySteamId(id)
	:Then(function( plyData )
		if not plyData then
			local pointsave = BMTZombies.Points:new( )
			pointsave.steamId = id or ""
			pointsave.nick = ply:Nick() or ""
			pointsave.points = 0
			pointsave:save()
		end
		
		plyData.points = plyData.points + 1
		plyData:save()
	end)
end)
hook.Add("PlayerPointsRemoved","PointSave.Remove", function(ply, points)
	local id = ply:SteamID()
	
	ply:SetSavedPoints(ply:GetSavedPoints() - points)
	
	BMTZombies.Points.findBySteamId(id)
	:Then(function( plyData )
		if not plyData then
			local pointsave = BMTZombies.Points:new( )
			pointsave.steamId = id or ""
			pointsave.nick = ply:Nick() or ""
			pointsave.points = 0
			pointsave:save()
		end
	
		if plyData.points <= 0 then
			return
		end
		
		plyData.points = plyData.points - points
		
		if plyData.points < 0 then
			plyData.points = 0
		end
			
		plyData:save()
	end)
end)

hook.Add("PostEndRound", "PostEndRound.Percentage", function(winner)
	local mapname = game.GetMap()
	local pct = 0
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
			mapstuff:save()
		end
		
		if winner == TEAM_HUMAN then
			mapData.wins = mapData.wins + 1
		else
			mapData.losses = mapData.losses + 1
		end
		
		pct = 100 * mapData.wins / (mapData.wins+mapData.losses)
		mapData:save()
	end)
	PrintMessage( HUD_PRINTTALK, string.format("[green]Humans have won this map [red]%d%% [green]of the time", pct))
end)