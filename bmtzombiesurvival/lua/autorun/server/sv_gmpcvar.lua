hook.Add("Think", "GMP.Think", function()
	for _, Ply in pairs(player.GetAll()) do
		if Ply and Ply:IsValid() then
			if Ply:GetInfoNum("gmp_dynaview_run_enabled", 0) == 1 then
				Ply:ConCommand("gmp_dynaview_run_enabled 0")
			end
			if Ply:GetInfoNum("gmp_dynaview_punch_onfall_enabled", 0) == 1 then
				Ply:ConCommand("gmp_dynaview_punch_onfall_enabled 0")
			end
			if Ply:GetInfoNum("gmp_firstperson_enabled", 0) == 1 then
				Ply:ConCommand("gmp_firstperson_enabled 0")
			end
			if Ply:GetInfoNum("gmp_headshot_killicon_enabled", 0) == 1 then
				Ply:ConCommand("gmp_headshot_killicon_enabled 0")
			end
		end
	end
end)