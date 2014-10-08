include("shared.lua")

SWEP.PrintName = "'Aegis' Barricade Kit"
SWEP.Description = "A ready-to-go, all-in-one board deployer.\nIt automatically deploys the board and then firmly attaches it to almost any surface.\nUse PRIMARY FIRE to deploy boards.\nUse SECONADRY FIRE and RELOAD to rotate the board.\nA ghost of the board shows you if placement is valid or not."
SWEP.DrawCrosshair = false
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false

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

function SWEP:DrawHUD()
	if GetConVarNumber("crosshair") ~= 1 then return end
	self:DrawCrosshairDot()
end

function SWEP:Deploy()
	self.IdleAnimation = CurTime() + self:SequenceDuration()

	return true
end

function SWEP:GetViewModelPosition(pos, ang)
	return pos, ang
end

function SWEP:DrawWeaponSelection(...)
	return self:BaseDrawWeaponSelection(...)
end

function SWEP:PrimaryAttack()
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
local kityaw = CreateClientConVar("zs_barricadekityaw", 90, false, true)
function SWEP:RotateGhost(amount)
	if nextclick <= RealTime() then
		surface.PlaySound("npc/headcrab_poison/ph_step4.wav")
		nextclick = RealTime() + 0.3
	end
	RunConsoleCommand("zs_barricadekityaw", math.NormalizeAngle(kityaw:GetFloat() + amount))
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
