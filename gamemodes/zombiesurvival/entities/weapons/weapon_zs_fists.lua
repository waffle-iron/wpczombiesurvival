AddCSLuaFile()

SWEP.PrintName = "Fists"

if GAMEMODE.ZombieEscape then
	SWEP.WalkSpeed = SPEED_ZOMBIEESCAPE_NORMAL
else
	SWEP.WalkSpeed = SPEED_NORMAL
end

SWEP.IsMelee = true

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_arms_citizen.mdl"
SWEP.WorldModel	= ""

SWEP.Damage = 5
SWEP.UppercutDamageMultiplier = 3
SWEP.HitDistance = 40

SWEP.ViewModelFOV = 52

SWEP.ViewbobIntensity = 1
SWEP.ViewbobEnabled = true

SWEP.AutoSwitchFrom = true

SWEP.NoMagazine = true
SWEP.Undroppable = true
SWEP.NoPickupNotification = true

SWEP.Primary.Ammo = "none"
SWEP.Secondary.Ammo = "none"

SWEP.BlendPos = Vector(0, 0, 0)
SWEP.BlendAng = Vector(0, 0, 0)
SWEP.OldDelta = Angle(0, 0, 0)
SWEP.AngleDelta = Angle(0, 0, 0)

local SwingSound = Sound( "weapons/slam/throw.wav" )
local HitSound = Sound( "Flesh.ImpactHard" )

function SWEP:Initialize()
	--self:SetWeaponHoldType("normal")
	self:SetWeaponHoldType("fist")
end

function SWEP:PreDrawViewModel(vm, wep, pl)
	vm:SetMaterial("engine/occlusionproxy")
end

function SWEP:SetupDataTables()
	self:NetworkVar("Float", 0, "NextMeleeAttack")
	self:NetworkVar("Float", 1, "NextIdle")
	self:NetworkVar("Float", 2, "NextIdleHoldType")
	self:NetworkVar("Int", 2, "Combo")
end

function SWEP:UpdateNextIdle()
	local vm = self.Owner:GetViewModel()
	self:SetNextIdle( CurTime() + vm:SequenceDuration() )
end

function SWEP:PrimaryAttack(right)
	--self:SetWeaponHoldType("fist")
	self:SetNextIdleHoldType(CurTime() + 2)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self.WalkSpeed = 165
	self.Owner:ResetSpeed()

	local anim = "fists_left"
	if ( right ) then anim = "fists_right" end
	if ( self:GetCombo() >= 2 ) then
		anim = "fists_uppercut"
	end

	local vm = self.Owner:GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( anim ) )

	self:EmitSound( SwingSound )

	self:UpdateNextIdle()
	self:SetNextMeleeAttack( CurTime() + 0.2 )
	
	self:SetNextPrimaryFire( CurTime() + 0.9 )
	self:SetNextSecondaryFire( CurTime() + 0.9 )
end

function SWEP:SecondaryAttack()
	self:PrimaryAttack( true )
end

function SWEP:DealDamage()
	local owner = self.Owner
	local shootpos = owner:GetShootPos()
	local aimvector = owner:GetAimVector()
	local anim = self:GetSequenceName(owner:GetViewModel():GetSequence())
	local filter = owner:GetMeleeFilter()

	owner:LagCompensation( true )
	
	local tr = util.TraceLine( {
		start = shootpos,
		endpos = shootpos + aimvector * self.HitDistance,
		filter = filter
	} )

	if not IsValid( tr.Entity ) then 
		tr = util.TraceHull( {
			start = shootpos,
			endpos = shootpos + aimvector * self.HitDistance,
			filter = filter,
			mins = Vector( -3, -3, -3 ),
			maxs = Vector( 3, 3, 3 )
		} )
	end

	local hitent = tr.Entity

	-- We need the second part for single player because SWEP:Think is ran shared in SP.
	if tr.Hit and not ( game.SinglePlayer() and CLIENT ) then
		self:EmitSound( HitSound )
	end

	local hit = false
	local hitplayer = false

	if SERVER and IsValid( hitent ) then
		hitplayer = hitent:IsNPC() or hitent:IsPlayer()

		local dmginfo = DamageInfo()
		dmginfo:SetAttacker(IsValid(owner) and owner or self)
		dmginfo:SetInflictor(self)
		dmginfo:SetDamageType(DMG_CLUB)
		dmginfo:SetDamagePosition(tr.HitPos)
		if anim == "fists_uppercut" then
			dmginfo:SetDamage(self.Damage * self.UppercutDamageMultiplier)
		else
			dmginfo:SetDamage(self.Damage)
		end

		if hitent:IsPlayer() and hitent:WouldDieFrom(dmginfo:GetDamage(), dmginfo:GetDamagePosition()) then
			if anim == "fists_left" then
				dmginfo:SetDamageForce(owner:GetRight() * 4912 + owner:GetForward() * 9998)
			elseif anim == "fists_right" then
				dmginfo:SetDamageForce(owner:GetRight() * -4912 + owner:GetForward() * 9989)
			elseif anim == "fists_uppercut" then
				dmginfo:SetDamageForce(owner:GetUp() * 5158 + owner:GetForward() * 10012)
			end
		end

		hitent:TakeDamageInfo( dmginfo )
		hit = true
	end

	if SERVER and IsValid( hitent ) and hitent:GetMoveType() == MOVETYPE_VPHYSICS then
		local phys = hitent:GetPhysicsObject()
		if IsValid( phys ) then
			phys:ApplyForceOffset( aimvector * 2000, tr.HitPos )
			hitent:SetPhysicsAttacker(owner)
		end
	end

	if SERVER then
		if hitplayer and anim ~= "fists_uppercut" then
			self:SetCombo( self:GetCombo() + 1 )
		else
			self:SetCombo( 0 )
		end
	end

	owner:LagCompensation(false)
end

function SWEP:OnRemove()
	if CLIENT and self.Owner:IsValid() and self.Owner:IsPlayer() then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then vm:SetMaterial("") end
	end
end

function SWEP:Holster(wep)
	if CurTime() >= self:GetNextPrimaryFire() then
		self:OnRemove()

		return true
	end

	return false
end

function SWEP:Deploy()
	local vm = self.Owner:GetViewModel()
	vm:SendViewModelMatchingSequence(vm:LookupSequence("fists_draw"))
	
	self:UpdateNextIdle()
	
	if SERVER then
		self:SetCombo(0)
	end
	self.Owner:ResetSpeed()
	return true
end

function SWEP:Think()
	local vm = self.Owner:GetViewModel()
	local curtime = CurTime()
	local idletime = self:GetNextIdle()
	local idle_holdtype_time = self:GetNextIdleHoldType()

	if idle_holdtype_time > 0 and curtime >= idle_holdtype_time then
		--self:SetWeaponHoldType("normal")
		self:SetNextIdleHoldType(0)
		if GAMEMODE.ZombieEscape then 
			self.WalkSpeed = SPEED_ZOMBIEESCAPE_NORMAL
		else
			self.WalkSpeed = SPEED_NORMAL
		end
		self.Owner:ResetSpeed()
	end
	
	if idletime > 0 and curtime >= idletime then
		vm:SendViewModelMatchingSequence( vm:LookupSequence("fists_idle_0"..math.random(2)))

		self:UpdateNextIdle()
	end
	
	local meleetime = self:GetNextMeleeAttack()
	
	if meleetime > 0 and curtime >= meleetime then
		self:DealDamage()
		self:SetNextMeleeAttack( 0 )
	end
	
	if SERVER and curtime >= self:GetNextPrimaryFire() + 0.1 then
		self:SetCombo( 0 )
	end
end

if CLIENT then
	local reg = debug.getregistry()
	local Right = reg.Angle.Right
	local Up = reg.Angle.Up
	local Forward = reg.Angle.Forward
	local RotateAroundAxis = reg.Angle.RotateAroundAxis
	local GetVelocity = reg.Entity.GetVelocity
	local Length = reg.Vector.Length

	local FT, CT, cos1, cos2, ws, vel
	local Ang0, curang, curviewbob = Angle(0, 0, 0), Angle(0, 0, 0), Angle(0, 0, 0)
	
	local Vec0 = Vector(0, 0, 0)
	local TargetPos, TargetAng, cos1, sin1, tan, ws, rs, mod, vel, FT, sin2, delta
		
	local SP = game.SinglePlayer() 
	local PosMod, AngMod = Vector(0, 0, 0), Vector(0, 0, 0)
	local CurPosMod, CurAngMod = Vector(0, 0, 0), Vector(0, 0, 0)

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

	function SWEP:DrawWeaponSelection(...)
		return self:BaseDrawWeaponSelection(...)
	end

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

	function SWEP:PreDrawViewModel(vm)
		CT = UnPredictedCurTime()
		vm = self.Owner:GetViewModel()
		
		vm:SetMaterial("engine/occlusionproxy")
			
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
end