hook.Add( "EntityTakeDamage", "PreventPlayerDeath", function( ent, dmgInfo )
    if IsValid(ent) and ent:IsPlayer() then
        if ent:Health() - dmgInfo:GetDamage() <= 0 then
			if ent:HasWeapon("weapon_zs_c4") then
				dmgInfo:SetDamage(0)
				ent:SelectWeapon("weapon_zs_c4")	
				local mywep = ent:GetActiveWeapon()
				if IsValid(mywep) and not mywep.IsExploding then
					mywep:PrimaryAttack()
				end				
				return true
			end
        end
    end
end )