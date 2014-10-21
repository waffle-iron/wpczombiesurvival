BMTZombies.WinsPercentage = class( "BMTZombies.WinsPercentage" )
local Percentage = BMTZombies.WinsPercentage

Percentage.static.DB = "BMTZombies"
Percentage.static.model = {
	tableName = "bmtzombies_winpercentages",
	fields = {
		mapName = "string",
		numPlayed = "int",
		wins = "int",
		losses = "int"
	}
}
Percentage:include( DatabaseModel )