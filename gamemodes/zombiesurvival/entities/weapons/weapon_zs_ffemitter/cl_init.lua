include("shared.lua")

SWEP.PrintName = "Force Field Emitter"
SWEP.Description = "Blocks bullets and other projectiles but will not stop humans, zombies, or other creatures from passing.\nPress PRIMARY ATTACK to deploy.\nPress SECONDARY ATTACK and RELOAD to rotate."
SWEP.DrawCrosshair = false

SWEP.Slot = 4
SWEP.SlotPos = 0

SWEP.ViewbobIntensity = 1
SWEP.ViewbobEnabled = true

local reg = debug.getregistry()
local GetVelocity = reg.Entity.GetVelocity
local Length = reg.Vector.Length

local FT, CT, cos1, cos2, ws, vel
local Ang0, curang, curviewbob = Angle(0, 0, 0), Angle(0, 0, 0), Angle(0, 0, 0)

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

function SWEP:DrawHUD()
	if GetConVarNumber("crosshair") ~= 1 then return end
	self:DrawCrosshairDot()
end

function SWEP:PrimaryAttack()
end

function SWEP:DrawWeaponSelection(...)
	return self:BaseDrawWeaponSelection(...)
end

function SWEP:Deploy()
	gamemode.Call("WeaponDeployed", self.Owner, self)

	return true
end

function SWEP:Think()
	if self.Owner:KeyDown(IN_ATTACK2) then
		self:RotateGhost(FrameTime() * 60)
	end
	if self.Owner:KeyDown(IN_RELOAD) then
		self:RotateGhost(FrameTime() * -60)
	end
end

local nextclick = 0
function SWEP:RotateGhost(amount)
	if nextclick <= RealTime() then
		surface.PlaySound("npc/headcrab_poison/ph_step4.wav")
		nextclick = RealTime() + 0.3
	end
	RunConsoleCommand("_zs_ghostrotation", math.NormalizeAngle(GetConVarNumber("_zs_ghostrotation") + amount))
end
