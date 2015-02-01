include("shared.lua")

SWEP.PrintName = "Chem Zombie"
SWEP.DrawCrosshair = false

function SWEP:Think()
end

function SWEP:DrawHUD()
	if GetConVarNumber("crosshair") ~= 1 then return end
	
	if self.Owner.m_bThirdPEnabled or (not GetConVar("gmp_hud_enabled"):GetBool() or not GetConVar("gmp_hud_crosshair_enabled"):GetBool()) then
		self:DrawCrosshairDot()
	end
end
