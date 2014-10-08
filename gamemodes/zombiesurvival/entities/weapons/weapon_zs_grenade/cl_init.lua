include("shared.lua")

SWEP.PrintName = "Grenade"
SWEP.Description = "A simple fragmentation grenade.\nWhen used in the right conditions, it can obliterate groups of zombies."

SWEP.ViewModelFOV = 60

SWEP.Slot = 4
SWEP.SlotPos = 0

SWEP.BobScale = 0
SWEP.SwayScale = 0
SWEP.ViewbobIntensity = 1
SWEP.ViewbobEnabled = true

local reg = debug.getregistry()
local GetVelocity = reg.Entity.GetVelocity
local Length = reg.Vector.Length
local Ang0, curang, curviewbob = Angle(0, 0, 0), Angle(0, 0, 0), Angle(0, 0, 0)

--[[function SWEP:GetViewModelPosition(pos, ang)
	if self:GetPrimaryAmmoCount() <= 0 then
		return pos + ang:Forward() * -256, ang
	end

	return pos, ang
end]]

function SWEP:DrawWeaponSelection(...)
	return self:BaseDrawWeaponSelection(...)
end

function SWEP:CalcView(ply, pos, ang, fov)
	FT, CT = FrameTime(), CurTime()
		
	if self.ViewbobEnabled then
		ws = self.Owner:GetWalkSpeed()
		vel = Length(GetVelocity(self.Owner))
			
		if self.Owner:OnGround() and vel > ws * 0.3 then
			if vel < ws * 1.2 then
				cos1 = math.cos(CT * 15)
				cos2 = math.cos(CT * 12)
				curviewbob.p = cos1 * 0.15
				curviewbob.y = cos2 * 0.1
			else
				cos1 = math.cos(CT * 20)
				cos2 = math.cos(CT * 15)
				curviewbob.p = cos1 * 0.25
				curviewbob.y = cos2 * 0.15
			end
		else
			curviewbob = LerpAngle(FT * 10, curviewbob, Ang0)
		end
	end
	
	return pos, ang + curviewbob * self.ViewbobIntensity, fov
end
