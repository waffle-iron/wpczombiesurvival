hook.Add( "OnNailRemoved", "NailRemoved.Alert", function(nail, ent1, ent2, remover)
	if remover and remover:IsValid() and remover:IsPlayer() then
		local deployer = nail:GetDeployer()
		if deployer:IsValid() and deployer ~= remover and deployer:Team() == TEAM_HUMAN then
			PrintTranslatedMessage(HUD_PRINTCONSOLE, "Nail belonging to "..deployer:Name().."("..deployer:SteamID()..") removed by "..remover:Name().." ("..remover:SteamID()..")")
		end
	end 
end )

hook.Add( "PropBroken", "PropBroken.Alert", function(ent, attacker)
	if not string.sub(ent:GetClass(), 1, 5) == "prop_" then return end

	if attacker:IsValid() and attacker:IsPlayer() then
		if attacker:Team() == TEAM_HUMAN and not ent.HasAlerted then
			ent.HasAlerted = true
			PrintTranslatedMessage(HUD_PRINTCONSOLE, " "..attacker:Name().." broke prop "..ent:GetModel().." ")
		end
	end
end )

hook.Add( "EntityTakeDamage", "EntityTakeDamage.Alert", function( ent, dmgInfo )
    if IsValid(ent) and ent:IsPlayerHolding() then
		local attacker = dmgInfo:GetAttacker()
		local holder = ent:GetHolder()
		if IsValid(holder) and IsValid(attacker) and attacker:IsPlayer() and not attacker:Team() == TEAM_UNDEAD then
			local propname = holder:GetHolding():GetModel()
			PrintTranslatedMessage(HUD_PRINTCONSOLE, " "..attacker:Name().." hit a prop with model ("..propname..") out of the hands of "..holder:Name().." ")
		end
    end
end )

hook.Add( "PlayerUse", "PlayerUse.Alert", function( ply, ent )
	if ent:IsValid() and ply:IsValid() and ent:GetClass() == "func_button" and not ent.HasAlerted then
		ent.HasAlerted = true
		if ent:GetName() == "" then
			PrintTranslatedMessage(HUD_PRINTCONSOLE, " "..ply:Name().." pushed button "..tostring(ent).." ")
		else
			PrintTranslatedMessage(HUD_PRINTCONSOLE, " "..ply:Name().." pushed button "..tostring(ent).." ("..ent:GetName()..") ")
		end
		timer.Simple(1, function() ent.HasAlerted = false end)
	end
end )