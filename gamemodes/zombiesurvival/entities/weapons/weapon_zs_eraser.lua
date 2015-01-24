AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Eraser' Tactical Pistol"
	SWEP.Description = "Damage increases as remaining bullets decrease. The last shot is worth triple damage."
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-5.949, -2.096, 2.88)
	SWEP.AimAng = Vector(-0.401, 0, 0)
		
	SWEP.SprintPos = Vector(0, -17.514, -12.271)
	SWEP.SprintAng = Vector(63.637, 0, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.MuzzleEffect = "swb_pistol_med"
	
	SWEP.HUD3DBone = "v_weapon.FIVESEVEN_PARENT"
	SWEP.HUD3DPos = Vector(-1, -2.5, -1)
	SWEP.HUD3DAng = Angle(0, 0, 0)
end

SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 10
SWEP.BulletDiameter = 5.7
SWEP.CaseLength = 28

SWEP.Kind = WEAPON_PISTOL
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_pistol_ttt"

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "swb_base"
SWEP.Category = "SWB Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cstrike/c_pist_fiveseven.mdl"
SWEP.WorldModel		= "models/weapons/w_pist_fiveseven.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 12
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pistol"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 0.1
SWEP.FireSound = Sound("weapons/ar2/npc_ar2_altfire.wav")
SWEP.Recoil = 0.95

SWEP.HipSpread = 0.04
SWEP.AimSpread = 0.009
SWEP.VelocitySensitivity = 1.3
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.15
SWEP.Shots = 1
SWEP.Damage = 21
SWEP.DeployTime = 1
SWEP.DryFire = false

SWEP.ConeMax = 0.06
SWEP.ConeMin = 0.03

function SWEP:FireBullet(damage, cone, bullets)
	if self:Clip1() == 1 then
		damage = damage * 3
	else
		damage = damage + damage * (1 - self:Clip1() / self.Primary.ClipSize)
	end

	self.BaseClass.FireBullet(self, damage, cone, bullets)
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	if self.ShotgunReloadState != 0 then
		return
	end
	
	if self.ReloadDelay then
		return
	end
	
	if self.dt.Safe then
		self:CycleFiremodes()
		return
	end
	
	mag = self:Clip1()
	
	if mag == 0 then
		self:EmitSound("SWB_Empty", 100, 100)
		self:SetNextPrimaryFire(CT + 0.25)
		return
	end
	
	if self.dt.State == SWB_RUNNING or self.dt.State == SWB_ACTION then
		return
	end
	
	if self.BurstAmount and self.BurstAmount > 0 then
		if self.dt.Shots >= self.BurstAmount then
			return
		end
		
		self.dt.Shots = self.dt.Shots + 1
	end
	
	
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	CT = CurTime()
	
	if self.dt.Suppressed then
		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK_SILENCED)
	else
		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	end
	
	if self.FireAnimFunc then
		self:FireAnimFunc()
	else
		if self.dt.State == SWB_AIMING then
			if mag - self.AmmoPerShot <= 0 and self.DryFire then
				if self.dt.Suppressed then
					self:SendWeaponAnim(ACT_VM_DRYFIRE_SILENCED)
				else
					self:SendWeaponAnim(ACT_VM_DRYFIRE)
				end
			else
				if self.dt.Suppressed then
					self:SendWeaponAnim(ACT_VM_PRIMARYATTACK_SILENCED)
				else
					self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
				end
			end
			
			if self.FadeCrosshairOnAim then
				if SP then
					if SERVER then
						self.Owner:GetViewModel():SetPlaybackRate(self.PlayBackRate or 1)
					end
				else
					if SERVER then
						self.Owner:GetViewModel():SetPlaybackRate(self.PlayBackRateSV or 1)
					else
						self.Owner:GetViewModel():SetPlaybackRate(self.PlayBackRate or 1)
					end
				end
			end
		else
			if mag - self.AmmoPerShot <= 0 and self.DryFire then
				if self.dt.Suppressed then
					self:SendWeaponAnim(ACT_VM_DRYFIRE_SILENCED)
				else
					self:SendWeaponAnim(ACT_VM_DRYFIRE)
				end
			else
				if self.dt.Suppressed then
					self:SendWeaponAnim(ACT_VM_PRIMARYATTACK_SILENCED)
				else
					self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
				end
			end
			
			if self.FadeCrosshairOnAim then
				self.Owner:GetViewModel():SetPlaybackRate(self.PlayBackRateHip or 1)
			end
		end
	end
	
	if IsFirstTimePredicted() then
		if self.dt.Suppressed then
			self:EmitSound(self.FireSoundSuppressed, 80, 70 + (1 - (self:Clip1() / self.Primary.ClipSize)) * 90)
		else
			self:EmitSound(self.FireSound, 80, 70 + (1 - (self:Clip1() / self.Primary.ClipSize)) * 90)
		end
		
		self:FireBullet(self.Damage * (self.dt.Suppressed and 0.9 or 1), self.CurCone, self.Shots)
		self:MakeRecoil()
		
		self.SpreadWait = CT + self.SpreadCooldown
		mul = 1
	
		if self.Owner:Crouching() then
			mul = mul * 0.75
		end
		
		if self.Owner.Expertise then
			mul = mul * (1 - self.Owner.Expertise["wepprof"].val * 0.002)
			
			if SERVER then
				if self.dt.State == SWB_AIMING then
					self.Owner:ProgressStat("steadyaim", self.Recoil * 1.5)
					self.Owner:ProgressStat("wepprof", self.Recoil * 0.5)
				else
					self.Owner:ProgressStat("wepprof", self.Recoil * 1.5)
				end
				
				self.Owner:ProgressStat("rechandle", self.Recoil)
			end
		end
		
		if self.BurstAmount > 0 then
			self.AddSpread = math.Clamp(self.AddSpread + self.SpreadPerShot * self.BurstSpreadIncMul * mul, 0, self.MaxSpreadInc)
		else
			self.AddSpread = math.Clamp(self.AddSpread + self.SpreadPerShot * mul, 0, self.MaxSpreadInc)
		end
		
		self.AddSpreadSpeed = math.Clamp(self.AddSpreadSpeed - 0.2, 0, 1)
		
		if CLIENT then
			if self.dt.State == SWB_AIMING then
				self.FireMove = 1
			else
				self.FireMove = 0.4
			end
		end
		
		if SP and SERVER then
			SendUserMessage("SWB_Recoil", self.Owner)
		end
	end
	
	self:TakePrimaryAmmo(self.AmmoPerShot)
	self:SetNextPrimaryFire(CT + self.FireDelay)
	self:SetNextSecondaryFire(CT + self.FireDelay)
	self.ReloadWait = CT + (self.WaitForReloadAfterFiring and self.WaitForReloadAfterFiring or self.FireDelay)
end