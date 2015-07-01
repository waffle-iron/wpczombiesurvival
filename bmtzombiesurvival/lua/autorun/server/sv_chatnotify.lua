hook.Add("PlayerSay", "DoorsAndDoorAccessories", function(ply, text)
	local text = string.lower(text)
		
	if ( string.sub( text, 1, 11 ) == "!doorhealth" ) then
		local tr = ply:GetEyeTrace()
		local door = tr.Entity
		if (IsValid(door) and door:GetClass() == "prop_door_rotating") then
			ULib.tsayColor(ply, true, Color( 0, 255, 255 ), "That door's health is " .. door.Heal or 0)
		else
			ULib.tsayColor(ply, true, Color( 0, 255, 255 ), "That is not a valid door!")
		end
		return false
	end
end)