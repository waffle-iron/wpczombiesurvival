AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Suicide Bomb"
	SWEP.Slot				= 3
	SWEP.SlotPos			= 1
	SWEP.DrawAmmo			= false
	SWEP.DrawCrosshair		= false
end

SWEP.Author			= "Stingwraith"
SWEP.Contact		= "stingwraith123@yahoo.com"
SWEP.Purpose		= "Sacrifice yourself for Allah."
SWEP.Instructions	= "Left Click to make yourself EXPLODE. Right click to taunt."
SWEP.DrawCrosshair		= false

SWEP.UseHands = true

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cstrike/c_c4.mdl"
SWEP.WorldModel		= "models/weapons/w_c4.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"
SWEP.Primary.Delay			= 3

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.WalkSpeed = SPEED_NORMAL
SWEP.Undroppable = true

if SERVER then
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false
	
	function SWEP:Asplode()
		local owner = self:GetOwner()
		if owner:IsValid() and owner:IsPlayer() and owner:Team() == TEAM_HUMAN then
			local pos = self:GetPos()

			util.BlastDamage2(self, owner, pos, 960, 1800)

			local effectdata = EffectData()
				effectdata:SetOrigin(pos)
			util.Effect("Explosion", effectdata)
			
			owner:Kill()
			owner:Gib()

			for k, v in pairs( player.GetAll( ) ) do
				v:ConCommand( "play siege/big_explosion.wav\n" )
			end
		end
	end
end

function SWEP:Reload()
end   

function SWEP:Initialize()
	self:SetHoldType("slam")
    util.PrecacheSound("siege/big_explosion.wav")
    util.PrecacheSound("siege/jihad.wav")
end

function SWEP:Think()	
end

function SWEP:PrimaryAttack()
	self.Weapon:SetNextPrimaryFire(CurTime() + 3)

	local effectdata = EffectData()
		effectdata:SetOrigin( self.Owner:GetPos() )
		effectdata:SetNormal( self.Owner:GetPos() )
		effectdata:SetMagnitude( 8 )
		effectdata:SetScale( 1 )
		effectdata:SetRadius( 16 )
	util.Effect( "Sparks", effectdata )
	
	self.BaseClass.ShootEffects( self )
	
	if (SERVER) then
		self.IsExploding = true
		timer.Simple(2, function() self:Asplode() end )
		self.Owner:EmitSound( "siege/jihad.wav" )
	end
end

function SWEP:SecondaryAttack()	
	
	self.Weapon:SetNextSecondaryFire( CurTime() + 1 )
	
	local TauntSound = Sound( "vo/npc/male01/overhere01.wav" )

	self.Weapon:EmitSound( TauntSound )
	
	if (!SERVER) then return end
	
	self.Weapon:EmitSound( TauntSound )
end

if SERVER then
	function SWEP:ShouldDropOnDie()
		return false
	end
	
	function SWEP:OnDrop()
		if self:IsValid() then
			self.Weapon:Remove()
		end
	end
end

if CLIENT then
	function SWEP:WorldBoom()
		surface.EmitSound( "siege/big_explosion.wav" )
	end
	
	function SWEP:DrawWeaponSelection(...)
		return self:BaseDrawWeaponSelection(...)
	end
end