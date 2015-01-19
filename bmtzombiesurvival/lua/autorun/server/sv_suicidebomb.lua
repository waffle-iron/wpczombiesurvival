hook.Add( "EntityTakeDamage", "PreventPlayerDeath", function( ent, dmgInfo )
    if IsValid(ent) and ent:IsPlayer() then
        if ent:Health() - dmgInfo:GetDamage() <= 0 then
            if not ent:Team() == TEAM_UNDEAD then
                if ent:HasWeapon("weapon_zs_c4") then
                    hook.Run( "PrePlayerDeath", ent )
					dmgInfo:SetDamage(0)    
                    dmginfo:ScaleDamage(0)
                end
            end
        end
    end
end )

hook.Add( "PrePlayerDeath", "PreDeathCheck", function( ply )
    ply:SelectWeapon("weapon_zs_c4")
                
    local mywep = ply:GetActiveWeapon()
    if IsValid(mywep) then
        mywep:PrimaryAttack()
    end
end )