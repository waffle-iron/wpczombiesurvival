AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Double Barrel' Shotgun"
	SWEP.Description = "A double barrel shotgun, you can fire each barrel simultaneously or both at the same time"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-4.719, 2, 2.481)
	SWEP.AimAng = Vector(0 ,0, 0)

	SWEP.SprintPos = Vector(11.456, -5.865, 1)
	SWEP.SprintAng = Vector(0, 66.833, 15.477)
	
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "shotshell"
	SWEP.ShellOnEvent = true
	
	SWEP.MuzzleEffect = "swb_shotgun"
	
	SWEP.VMPos = Vector(0, 4.719, -2.481)
	SWEP.VMAng = Vector(0, -90, 0)
	
	SWEP.HUD3DBone = "RW_Weapon"
	SWEP.HUD3DPos = Vector(7.5, -1.7, 1.2)
	SWEP.HUD3DAng = Angle(0, -90, 65)
	SWEP.HUD3DScale = 0.017
end

sound.Add({
	name = 			"TFA_KF2_DB.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 		{ "weapons/kf2/doublebarrel/fire3.wav", "weapons/kf2/doublebarrel/fire2.wav"}
})

sound.Add({
	name = 			"TFA_KF2_DB.2",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/kf2/doublebarrel/fire1.wav"
})

sound.Add({
	name = 			"TFA_KF2_DB.Open",
	channel = 		CHAN_USER_BASE+11,
	volume = 		0.9,
	sound = 			"weapons/kf2/doublebarrel/open.wav"
})

sound.Add({
	name = 			"TFA_KF2_DB.Close",
	channel = 		CHAN_USER_BASE+11,
	volume = 		0.9,
	sound = 			"weapons/kf2/doublebarrel/close.wav"
})

sound.Add({
	name = 			"TFA_KF2_DB.Insert",
	channel = 		CHAN_USER_BASE+11,
	volume = 		0.9,
	sound = 			"weapons/kf2/doublebarrel/insert.wav"
})

sound.Add({
	name = 			"TFA_KF2_DB.Equip",
	channel = 		CHAN_USER_BASE+11,
	volume = 		0.9,
	sound = 			"weapons/kf2/doublebarrel/equip.wav"
})

sound.Add({
	name = 			"TFA_KF2_DB.Cloth",
	channel = 		CHAN_USER_BASE+11,
	volume = 		0.9,
	sound = 			"weapons/kf2/doublebarrel/cloth1.wav"
})

sound.Add({
	name = 			"TFA_KF2_DB.Cloth2",
	channel = 		CHAN_USER_BASE+11,
	volume = 		0.9,
	sound = 			"weapons/kf2/doublebarrel/cloth2.wav"
})

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

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/killingfloor2/c_doublebarrel.mdl"
SWEP.WorldModel		= "models/weapons/killingfloor2/w_doublebarrel.mdl"

SWEP.WeaponBaseType = "tfa"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.UseHands 			= true

SWEP.Primary.ClipSize 		= 2
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Buckshot"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 0.1
SWEP.FireDelay_Both = 0.25
SWEP.FireSound = Sound("TFA_KF2_DB.1")
SWEP.FireSoundBoth = Sound("TFA_KF2_DB.2")
SWEP.Recoil = 3.0

SWEP.HipSpread = 0.036
SWEP.AimSpread = 0.003
SWEP.ClumpSpread = 0.01
SWEP.VelocitySensitivity = 2.2
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 1.03
SWEP.Shots = 6
SWEP.Damage = 28
SWEP.DeployTime = 1.8

SWEP.ConeMax = 0.14
SWEP.ConeMin = 0.105

SWEP.WalkSpeed = SPEED_SLOWER

local barrel, ammo

function SWEP:FireAnimationEvent(pos, ang, ev, name)
	if ev == 5001 then
		if self.MuzzleEffect then
			self:CreateMuzzle(pos, ang)
		end
		
		if self.NoStockMuzzle then
			return true
		end
		
		return self.dt.Suppressed
	end
	
	if ev == 5011 then
		if self.MuzzleEffect then
			self:CreateMuzzle(pos, ang)
		end
		
		if self.NoStockMuzzle then
			return true
		end
		
		return self.dt.Suppressed
	end
	
	if ev == 20 then
		if self.Shell then
			self:CreateShell()
		end
		
		return self.NoStockShells
	end
end

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