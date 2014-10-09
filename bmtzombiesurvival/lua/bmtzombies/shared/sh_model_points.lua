BMTZombies.Points = class( "BMTZombies.Points" )
local Points = BMTZombies.Points

Points.static.DB = "BMTZombies"
Points.static.model = {
	tableName = "bmtzombies_pointsave",
	fields = {
		steamId = "player",
		nick = "string",
		points = "int"
	}
}
Points:include( DatabaseModel )