AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Sawed-Off' Shotgun"
	SWEP.Description = "A double barrel sawed-off shotgun, you can fire each barrel simultaneously or both at the same time"
	SWEP.CSMuzzleFlashes = true

	SWEP.SprintPos = Vector(8.52, -9.881, 1.08)
	SWEP.SprintAng = Vector(-11, 52.099, 0.699)
	
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "shotshell"
	SWEP.ShellOnEvent = true
	
	SWEP.MuzzleEffect = "swb_shotgun"
	
	SWEP.HUD3DBone = "Body"
	SWEP.HUD3DPos = Vector(4.7, 0.4, 14.8)
	SWEP.HUD3DAng = Angle(180, 0, -50)
	SWEP.HUD3DScale = 0.025
end

SWEP.PlayBackRate = 1
SWEP.PlayBackRateSV = 1
SWEP.SpeedDec = 20
SWEP.BulletDiameter = 3
SWEP.CaseLength = 5

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_box_buckshot_ttt"

SWEP.Infliction = 0.5

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "swb_base"
SWEP.Category = "SWB Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/tayley/v_bm16.mdl"
SWEP.WorldModel		= "models/weapons/stalkerwep/bm16/w_bm16.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize 		= 2
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Buckshot"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

sound.Add(
{
	name = "BM16_Fire_Both",
	channel = CHAN_WEAPON,
	volume = 1.0,
	sound = "weapons/razborka_bm16/bm16_fire_both.wav"
})

sound.Add(
{
	name = "BM16_Fire",
	channel = CHAN_WEAPON,
	volume = 1.0,
	sound = "weapons/razborka_bm16/bm16_fire.wav"
})

sound.Add(
{
	name = "bm16.openstart",
	channel = CHAN_WEAPON,
	volume = 1.0,
	sound = "weapons/razborka_bm16/bm16_open_start.wav"
})

sound.Add(
{
	name = "bm16.openfinish",
	channel = CHAN_WEAPON,
	volume = 1.0,
	sound = "weapons/razborka_bm16/bm16_open_finish.wav"
})

sound.Add(
{
	name = "bm16.shellin",
	channel = CHAN_WEAPON,
	volume = 1.0,
	sound = {"weapons/razborka_bm16/bm16_shell_in1.wav", "weapons/razborka_bm16/bm16_shell_in2.wav"}
})

sound.Add(
{
	name = "bm16.hammer",
	channel = CHAN_WEAPON,
	volume = 1.0,
	sound = "weapons/razborka_bm16/bm16_pull_hammer.wav"
})

sound.Add(
{
	name = "bm16.close",
	channel = CHAN_WEAPON,
	volume = 1.0,
	sound = "weapons/razborka_bm16/bm16_close.wav"
})

SWEP.FireDelay = 0.1
SWEP.FireDelay_Both = 0.25
SWEP.FireSound = Sound("BM16_Fire")
SWEP.FireSoundBoth = Sound("BM16_Fire_Both")
SWEP.Recoil = 3.5

SWEP.HipSpread = 0.056
SWEP.AimSpread = 0.023
SWEP.ClumpSpread = 0.07
SWEP.VelocitySensitivity = 2.2
SWEP.MaxSpreadInc = 0.07
SWEP.SpreadPerShot = 0.04
SWEP.SpreadCooldown = 1.03
SWEP.Shots = 6
SWEP.Damage = 28
SWEP.DeployTime = 1

SWEP.ConeMax = 0.14
SWEP.ConeMin = 0.105

SWEP.WalkSpeed = SPEED_SLOWER

local barrel, ammo

function SWEP:Deploy()
	barrel = self:Clip1()
	
	if barrel == 1 then
		self:SendWeaponAnim(ACT_VM_RELEASE)
	elseif barrel == 0 then
		self:SendWeaponAnim(ACT_VM_DRAW_EMPTY)
	else
		self:SendWeaponAnim(ACT_VM_DRAW)
	end
	
	self.dt.Aiming = false
	self:SetNextPrimaryFire(CurTime() + self.DeployTime)
	return true
end

function SWEP:FireAnimFunc()
	barrel = self:Clip1()
	
	if barrel == 1 then
		self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
	elseif barrel == 2 then
		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	end
end

function SWEP:Reload()
	if self:Clip1() >= self.Primary.ClipSize or self.Owner:GetAmmoCount(self.Primary.Ammo) == 0 then
		return
	end
	
	self.dt.State = SWB_IDLE
	
	barrel = self:Clip1()
	ammo = self.Owner:GetAmmoCount("buckshot")
	self.Owner:SetDTFloat(0, 0.75)
	
	if barrel == 0 and ammo == 1 then
		self:DefaultReload(ACT_VM_RELOAD)
		return
	end
	
	if barrel == 1 then
		self:DefaultReload(ACT_VM_RELOAD)
	elseif barrel == 0 then
		self:DefaultReload(ACT_VM_RELOAD_EMPTY)
	end
end

function SWEP:SecondaryAttack()
	if not self:CanPrimaryAttack() then
		return
	end
	
	if self:Clip1() < 2 then
		self:PrimaryAttack()
		return
	end
	
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	CT = CurTime()
	
	self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
	
	if IsFirstTimePredicted() then
		self:EmitSound(self.FireSoundBoth, 105, 100)
		self:FireBullet(self.Damage, self.CurCone, self.Shots * 2)
		self:MakeRecoil(2)
		
		self.SpreadWait = CT + self.SpreadCooldown
		
		self.AddSpread = math.Clamp(self.AddSpread + self.SpreadPerShot, 0, self.MaxSpreadInc)
		self.AddSpreadSpeed = math.Clamp(self.AddSpreadSpeed - 0.2, 0, 1)
	end
	
	self:TakePrimaryAmmo(2)
	self:SetNextPrimaryFire(CT + self.FireDelay_Both)
	self:SetNextSecondaryFire(CT + self.FireDelay_Both)
end