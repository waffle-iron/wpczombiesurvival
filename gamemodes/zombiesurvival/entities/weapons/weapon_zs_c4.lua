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

function SWEP:Reload()
end   

function SWEP:Initialize()
	self:SetWeaponHoldType("slam")
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
		timer.Simple(2, function() self:Asplode() end )
		self.Owner:EmitSound( "siege/jihad.wav" )
	end
end

function SWEP:Asplode()
	local k, v
	local ent = ents.Create( "env_explosion" )
	ent:SetPos( self.Owner:GetPos() )
	ent:SetOwner( self.Owner )
	ent:Spawn()
	ent:SetKeyValue( "iMagnitude", "600" )
	ent:Fire( "Explode", 0, 0 )
	ent:EmitSound( "siege/big_explosion.wav", 500, 500 )
		
	self.Owner:Kill( )

	for k, v in pairs( player.GetAll( ) ) do
		v:ConCommand( "play siege/big_explosion.wav\n" )
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
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false
end

if CLIENT then
	function SWEP:WorldBoom()
		surface.EmitSound( "siege/big_explosion.wav" )
	end
	
	function SWEP:DrawWeaponSelection(...)
		return self:BaseDrawWeaponSelection(...)
	end
end