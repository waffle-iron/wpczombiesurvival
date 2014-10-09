hook.Add( "OnNailRemoved", "NailRemoved.Alert", function(nail, ent1, ent2, remover)
	if remover and remover:IsValid() and remover:IsPlayer() then
		local deployer = nail:GetDeployer()
		if deployer:IsValid() and deployer ~= remover and deployer:Team() == TEAM_HUMAN then
			PrintTranslatedMessage(HUD_PRINTCONSOLE, "Nail belonging to "..deployer:Name().."("..deployer:SteamID()..") removed by "..remover:Name().." ("..remover:SteamID()..")")
		end
	end 
end )

hook.Add( "PropBroken", "PropBroken.Alert", function(ent, attacker)
	if attacker and attacker:IsValid() and attacker:IsPlayer() then
		if attacker:Team() == TEAM_HUMAN then
			PrintTranslatedMessage(HUD_PRINTCONSOLE, " "..attacker:Name().." broke a prop with model "..ent:GetModel().." ")
		end
	end 
end )