include("shared.lua")

SWEP.PrintName = "'Aegis' Barricade Kit"
SWEP.Description = "A ready-to-go, all-in-one board deployer.\nIt automatically deploys the board and then firmly attaches it to almost any surface.\nUse PRIMARY FIRE to deploy boards.\nUse SECONADRY FIRE and RELOAD to rotate the board.\nA ghost of the board shows you if placement is valid or not."
SWEP.DrawCrosshair = false
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false

SWEP.Slot = 4
SWEP.SlotPos = 0

SWEP.ViewbobIntensity = 1
SWEP.ViewbobEnabled = true

SWEP.BlendPos = Vector(0, 0, 0)
SWEP.BlendAng = Vector(0, 0, 0)
SWEP.OldDelta = Angle(0, 0, 0)
SWEP.AngleDelta = Angle(0, 0, 0)

local reg = debug.getregistry()
local Right = reg.Angle.Right
local Up = reg.Angle.Up
local Forward = reg.Angle.Forward
local RotateAroundAxis = reg.Angle.RotateAroundAxis
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

local Vec0 = Vector(0, 0, 0)
local TargetPos, TargetAng, cos1, sin1, tan, ws, rs, mod, vel, FT, sin2, delta
	
local SP = game.SinglePlayer() 
local PosMod, AngMod = Vector(0, 0, 0), Vector(0, 0, 0)
local CurPosMod, CurAngMod = Vector(0, 0, 0), Vector(0, 0, 0)

function SWEP:PreDrawViewModel(vm)
	if self.ShowViewModel == false then
		render.SetBlend(0)
	end
	
	CT = UnPredictedCurTime()
	vm = self.Owner:GetViewModel()
		
	EA = EyeAngles()
	FT = FrameTime()
		
	delta = Angle(EA.p, EA.y, 0) - self.OldDelta
	delta.p = math.Clamp(delta.p, -10, 10)
			
	self.OldDelta = Angle(EA.p, EA.y, 0)
	self.AngleDelta = LerpAngle(math.Clamp(FT * 10, 0, 1), self.AngleDelta, delta)
	self.AngleDelta.y = math.Clamp(self.AngleDelta.y, -10, 10)

	vel = Length(GetVelocity(self.Owner))
	ws = self.Owner:GetWalkSpeed()
		
	PosMod, AngMod = Vec0 * 1, Vec0 * 1
		
	if vel < 10 or not self.Owner:OnGround() then
		cos1, sin1 = math.cos(CT), math.sin(CT)
		tan = math.atan(cos1 * sin1, cos1 * sin1)
			
		AngMod.x = AngMod.x + tan * 1.15
		AngMod.y = AngMod.y + cos1 * 0.4
		AngMod.z = AngMod.z + tan
			
		PosMod.y = PosMod.y + tan * 0.2
	elseif vel > 10 and vel < ws * 1.2 then
		mod = 6 + ws / 130
		mul = math.Clamp(vel / ws, 0, 1)
		sin1 = math.sin(CT * mod) * mul
		cos1 = math.cos(CT * mod) * mul
		tan1 = math.tan(sin1 * cos1) * mul
			
		AngMod.x = AngMod.x + tan1
		AngMod.y = AngMod.y - cos1
		AngMod.z = AngMod.z + cos1
		PosMod.x = PosMod.x - sin1 * 0.4
		PosMod.y = PosMod.y + tan1 * 1
		PosMod.z = PosMod.z + tan1 * 0.5
	elseif (vel > ws * 1.2 and self.Owner:KeyDown(IN_SPEED)) or vel > ws * 3 then
		rs = self.Owner:GetRunSpeed()
		mod = 7 + math.Clamp(rs / 100, 0, 6)
		mul = math.Clamp(vel / rs, 0, 1)
		sin1 = math.sin(CT * mod) * mul
		cos1 = math.cos(CT * mod) * mul
		tan1 = math.tan(sin1 * cos1) * mul
		
		AngMod.x = AngMod.x + tan1 * 0.2
		AngMod.y = AngMod.y - cos1 * 1.5
		AngMod.z = AngMod.z + cos1 * 3
		PosMod.x = PosMod.x - sin1 * 1.2
		PosMod.y = PosMod.y + tan1 * 1.5
		PosMod.z = PosMod.z + tan1
	end
		
	FT = FrameTime()
		
	CurPosMod = LerpVector(FT * 10, CurPosMod, PosMod)
	CurAngMod = LerpVector(FT * 10, CurAngMod, AngMod)
end

function SWEP:GetViewModelPosition(pos, ang)
	RotateAroundAxis(ang, Right(ang), CurAngMod.x + self.AngleDelta.p)
	RotateAroundAxis(ang, Up(ang), CurAngMod.y + self.AngleDelta.y * 0.3)
	RotateAroundAxis(ang, Forward(ang), CurAngMod.z + self.AngleDelta.y * 0.3)

	pos = pos + (CurPosMod.x + self.AngleDelta.y * 0.1) * Right(ang)
	pos = pos + (CurPosMod.y + self.BlendPos.y) * Forward(ang)
	pos = pos + (CurPosMod.z + self.BlendPos.z - self.AngleDelta.p * 0.1) * Up(ang)
		
	return pos, ang
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
