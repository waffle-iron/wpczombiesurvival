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