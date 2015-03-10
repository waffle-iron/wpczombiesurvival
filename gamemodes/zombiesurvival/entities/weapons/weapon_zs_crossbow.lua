AddCSLuaFile()

if CLIENT then
	SWEP.PrintName = "'Impaler' Crossbow"
	SWEP.Description = "This ancient weapon can easily skewer groups of zombies."

	SWEP.HUD3DBone = "smdimport"
	SWEP.HUD3DPos = Vector(1.9, -4.5, 0)
	SWEP.HUD3DAng = Angle(180, 0, 270)
	SWEP.HUD3DScale = 0.025

	SWEP.ViewModelFOV = 53
	SWEP.ViewModelFlip = false

	SWEP.Slot = 3
	SWEP.SlotPos = 0
	
	SWEP.BobScale = 0
	SWEP.SwayScale = 0
	SWEP.ViewbobIntensity = 1
	SWEP.ViewbobEnabled = true
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "crossbow"

SWEP.Infliction = 0.5

SWEP.ViewModel = "models/weapons/c_mantuna_crossbow.mdl"
SWEP.WorldModel = "models/weapons/w_crossbow.mdl"
SWEP.UseHands = true

SWEP.Primary.ClipSize = 1
SWEP.Primary.ClipMultiplier = 4
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "XBowBolt"
SWEP.Primary.Delay = 2.0
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.SecondaryDelay = 0.25

SWEP.WalkSpeed = SPEED_SLOW

SWEP.NextZoom = 0

if SERVER then
	function SWEP:Think()
		if self.IdleAnimation and self.IdleAnimation <= CurTime() then
			self.IdleAnimation = nil
			
			if ( self:Clip1() <= 0 ) then
				self:SendWeaponAnim(ACT_VM_FIDGET)
			else
				self:SendWeaponAnim(ACT_VM_IDLE)
			end
		end
		if self:GetIronsights() and not self.Owner:KeyDown(IN_ATTACK2) then
			self:SetIronsights(false)
		end
	end

	function SWEP:PrimaryAttack()
		if self:CanPrimaryAttack() then
			self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

			local owner = self.Owner

			self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
			owner:RestartGesture(ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW)

			self:TakePrimaryAmmo(1)

			self.IdleAnimation = CurTime() + self:SequenceDuration()

			self:EmitSound("Weapon_Crossbow.Single")

			local ent = ents.Create("projectile_arrow")
			if ent:IsValid() then
				ent:SetOwner(owner)
				ent:SetPos(owner:GetShootPos())
				ent:SetAngles(owner:GetAimVector():Angle())
				ent.Team = owner:Team()
				ent:Spawn()
				local phys = ent:GetPhysicsObject()
				if phys:IsValid() then
					phys:Wake()
					phys:SetVelocityInstantaneous(owner:GetAimVector() * 1400)
				end
			end
		end
	end

	function SWEP:Reload()
		if self:GetNextReload() <= CurTime() and self:Clip1() == 0 and 0 < self.Owner:GetAmmoCount("XBowBolt") then
			self:EmitSound("weapons/crossbow_mantuna/bolt_load"..math.random(2)..".wav", 50, 100)
			self:EmitSound("weapons/crossbow_mantuna/reload1.wav")
			self:DefaultReload(ACT_VM_RELOAD)
			self.Owner:RestartGesture(ACT_HL2MP_GESTURE_RELOAD_CROSSBOW)
			self:SetNextReload(CurTime() + self:SequenceDuration())
		end
	end

	function SWEP:SecondaryAttack()
		if CurTime() < self.NextZoom then return end

		self.NextZoom = CurTime() + self.SecondaryDelay

		local zoomed = self:GetDTBool(1)
		self:SetDTBool(1, not zoomed)

		if zoomed then
			self.Owner:SetFOV(self.Owner:GetInfo("fov_desired"), 0.15)
			self:EmitSound("weapons/sniper/sniper_zoomout.wav", 50, 100)
		else
			self.Owner:SetFOV(self.Owner:GetInfo("fov_desired") * 0.25, 0.15)
			self:EmitSound("weapons/sniper/sniper_zoomin.wav", 50, 100)
		end
	end
end

if CLIENT then
	function SWEP:PrimaryAttack()
		if self:CanPrimaryAttack() then
			self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
			self:TakePrimaryAmmo(1)
			self:EmitSound("Weapon_Crossbow.Single")
			self.Owner:RestartGesture(ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW)
			self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
			self.IdleAnimation = CurTime() + self:SequenceDuration()
		end
	end

	function SWEP:SecondaryAttack()
		if CurTime() < self.NextZoom then return end
		self.NextZoom = CurTime() + self.SecondaryDelay

		local zoomed = self:GetDTBool(1)
		self:SetDTBool(1, not zoomed)
		if zoomed then
			surface.PlaySound("weapons/sniper/sniper_zoomout.wav")
		else
			surface.PlaySound("weapons/sniper/sniper_zoomin.wav")
		end
	end

	function SWEP:Reload()
		if self:GetNextReload() <= CurTime() and self:Clip1() == 0 and 0 < self.Owner:GetAmmoCount("XBowBolt") then
			surface.PlaySound("weapons/crossbow/bolt_load"..math.random(1,2)..".wav")
			self:DefaultReload(ACT_VM_RELOAD)
			self.Owner:RestartGesture(ACT_HL2MP_GESTURE_RELOAD_CROSSBOW)
			self:SetNextReload(CurTime() + self:SequenceDuration())
		end
	end

	local texScope = surface.GetTextureID("zombiesurvival/scope")
	function SWEP:DrawHUDBackground()
		if self:GetDTBool(1) then
			local scrw, scrh = ScrW(), ScrH()
			local size = math.min(scrw, scrh)

			local hw = scrw * 0.5
			local hh = scrh * 0.5

			surface.SetDrawColor(255, 0, 0, 180)
			surface.DrawLine(0, hh, scrw, hh)
			surface.DrawLine(hw, 0, hw, scrh)
			for i=1, 10 do
				surface.DrawLine(hw, hh + i * 7, hw + (50 - i * 5), hh + i * 7)
			end

			surface.SetTexture(texScope)
			surface.SetDrawColor(255, 255, 255, 255)
			surface.DrawTexturedRect((scrw - size) * 0.5, (scrh - size) * 0.5, size, size)
			surface.SetDrawColor(0, 0, 0, 255)
			if scrw > size then
				local extra = (scrw - size) * 0.5
				surface.DrawRect(0, 0, extra, scrh)
				surface.DrawRect(scrw - extra, 0, extra, scrh)
			end
			if scrh > size then
				local extra = (scrh - size) * 0.5
				surface.DrawRect(0, 0, scrw, extra)
				surface.DrawRect(0, scrh - extra, scrw, extra)
			end
		end
	end
end

function SWEP:Holster()
	if self:GetDTBool(1) then
		self.Owner:SetFOV(self.Owner:GetInfo("fov_desired"), 0.5)
		self:EmitSound("weapons/sniper/sniper_zoomout.wav", 50, 100)
		self:SetDTBool(1, false)
	end

	return true
end

function SWEP:OnRemove()
	if self.Owner:IsValid() and self:GetDTBool(1) then
		self.Owner:SetFOV(self.Owner:GetInfo("fov_desired"), 0.5)
	end
end

if CLIENT then
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

	local Vec0 = Vector(0, 0, 0)
	local TargetPos, TargetAng, cos1, sin1, tan, ws, rs, mod, vel, FT, sin2, delta
	
	local SP = game.SinglePlayer() 
	local PosMod, AngMod = Vector(0, 0, 0), Vector(0, 0, 0)
	local CurPosMod, CurAngMod = Vector(0, 0, 0), Vector(0, 0, 0)

	function SWEP:PreDrawViewModel()
		CT = UnPredictedCurTime()
		vm = self.Owner:GetViewModel()
		
		EA = EyeAngles()
		FT = FrameTime()
		
		if self.ShowViewModel == false then
			render.SetBlend(0)
		end
		
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

	local ghostlerp = 0
	function SWEP:CalcViewModelView(vm, oldpos, oldang, pos, ang)
		RotateAroundAxis(ang, Right(ang), CurAngMod.x + self.AngleDelta.p)
		RotateAroundAxis(ang, Up(ang), CurAngMod.y + self.AngleDelta.y * 0.3)
		RotateAroundAxis(ang, Forward(ang), CurAngMod.z + self.AngleDelta.y * 0.3)

		pos = pos + (CurPosMod.x + self.AngleDelta.y * 0.1) * Right(ang)
		pos = pos + (CurPosMod.y + self.BlendPos.y) * Forward(ang)
		pos = pos + (CurPosMod.z + self.BlendPos.z - self.AngleDelta.p * 0.1) * Up(ang)
		
		if self.Owner:GetBarricadeGhosting() then
			ghostlerp = math.min(1, ghostlerp + FrameTime() * 4)
		elseif ghostlerp > 0 then
			ghostlerp = math.max(0, ghostlerp - FrameTime() * 5)
		end

		if ghostlerp > 0 then
			pos = pos + 3.5 * ghostlerp * ang:Up()
			ang:RotateAroundAxis(ang:Right(), -30 * ghostlerp)
		end
		
		return pos, ang
	end
end

util.PrecacheSound("weapons/crossbow_mantuna/bolt_load1.wav")
util.PrecacheSound("weapons/crossbow_mantuna/bolt_load2.wav")
util.PrecacheSound("weapons/sniper/sniper_zoomin.wav")
util.PrecacheSound("weapons/sniper/sniper_zoomout.wav")
