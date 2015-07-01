AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Laser Boom Stick"
	SWEP.Description = "This shotgun allows you to load up to four shells in the chamber at once. Hold down reload for faster loading of each shell."
	SWEP.CSMuzzleFlashes = false
	
	SWEP.AimPos = Vector(-4.08, -9.921, 2.24)
	SWEP.AimAng = Vector(1.1, 0.4, 0)
		
	SWEP.SprintPos = Vector(2.599, -10.32, 1.32)
	SWEP.SprintAng = Vector(-9.101, 54.599, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "shotshell"
	SWEP.ShellOnEvent = true
	
	SWEP.MuzzleEffect = "swb_shotgun"
	
	SWEP.HUD3DBone = "ValveBiped.Gun"
	SWEP.HUD3DPos = Vector(1.4, -6, 0)
	SWEP.HUD3DAng = Angle(180, 0, 270)
	SWEP.HUD3DScale = 0.025
	
	SWEP.VElements = {
		["battery1"] = { type = "Model", model = "models/items/battery.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(0, -4.676, 1.557), angle = Angle(0, 0, -90), size = Vector(0.5, 0.5, 0.82), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["battery2"] = { type = "Model", model = "models/items/battery.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(0, 10.909, 0.518), angle = Angle(0, 0, -90), size = Vector(0.56, 0.56, 2.832), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
		["battery1_wm"] = { type = "Model", model = "models/items/battery.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.869, 1.557, -6.753), angle = Angle(0, -90, -94), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["battery2_wm"] = { type = "Model", model = "models/items/battery.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.869, 1.557, -5.715), angle = Angle(0, -90, -94), size = Vector(0.5, 0.5, 1.404), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.PlayBackRate = 1
SWEP.PlayBackRateSV = 1
SWEP.SpeedDec = 30
SWEP.BulletDiameter = 5
SWEP.CaseLength = 10

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_box_buckshot_ttt"

SWEP.Infliction = 0.8

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "shotgun"
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
SWEP.ViewModel 		= "models/weapons/c_mantuna_shotgun.mdl"
SWEP.WorldModel 	= "models/weapons/w_shotgun.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize 		= 4
SWEP.Primary.ClipMultiplier = 3
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Buckshot"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 1.5
SWEP.FireSound = Sound("weapons/shotgun/shotgun_dbl_fire.wav")
SWEP.ShotgunReloadSound = Sound("Weapon_Shotgun.Reload")
SWEP.ShotgunPumpSound = Sound("Weapon_Shotgun.Special1")
SWEP.DrawSound = Sound("Weapon_Magnum.Spin")
SWEP.Recoil = 12.5
SWEP.ShotgunReload = true
SWEP.PumpAfterReload = true
SWEP.ReloadStartWait = 0.6
SWEP.ReloadFinishWait = 1.1
SWEP.ReloadShellInsertWait = 0.8
SWEP.Chamberable = false

SWEP.HipSpread = 0.056
SWEP.AimSpread = 0.023
SWEP.ClumpSpread = 0.07
SWEP.VelocitySensitivity = 2.2
SWEP.MaxSpreadInc = 0.07
SWEP.SpreadPerShot = 0.04
SWEP.SpreadCooldown = 1.03
SWEP.Shots = 6
SWEP.Damage = 42
SWEP.DeployTime = 1
SWEP.AmmoPerShot = 4

SWEP.ConeMax = 0.23
SWEP.ConeMin = 0.2

SWEP.WalkSpeed = SPEED_SLOWEST

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
	
	local vm = self.Owner:GetViewModel()
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
			
			if self.FadeCrosshairOnAim and vm and vm:IsValid() then
				if SP then
					if SERVER then
						vm:SetPlaybackRate(self.PlayBackRate or 1)
					end
				else
					if SERVER then
						vm:SetPlaybackRate(self.PlayBackRateSV or 1)
					else
						vm:SetPlaybackRate(self.PlayBackRate or 1)
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
			
			if self.FadeCrosshairOnAim and vm and vm:IsValid() then
				vm:SetPlaybackRate(self.PlayBackRateHip or 1)
			end
		end
	end
	
	if IsFirstTimePredicted() then
		if self.dt.Suppressed then
			self:EmitSound(self.FireSoundSuppressed, 105, 100)
		else
			self:EmitSound(self.FireSound, 105, 100)
		end
		
		self:FireBullet(self.Damage * (self.dt.Suppressed and 0.9 or 1), self.CurCone, self.Shots * mag)
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
	
	self.Owner:ViewPunch(mag * 0.5 * self.Recoil * Angle(math.Rand(-0.1, -0.1), math.Rand(-0.1, 0.1), 0))
	self.Owner:SetGroundEntity(NULL)
	self.Owner:SetVelocity(-80 * mag * self.Owner:GetAimVector())
	
	self:TakePrimaryAmmo(mag)
	self:SetNextPrimaryFire(CT + self.FireDelay)
	self:SetNextSecondaryFire(CT + self.FireDelay)
	self.ReloadWait = CT + (self.WaitForReloadAfterFiring and self.WaitForReloadAfterFiring or self.FireDelay)
end

function SWEP.BulletCallback(attacker, tr, dmginfo)
	local ent = tr.Entity
	if ent:IsValid() and ent:IsPlayer() and ent:Team() == TEAM_UNDEAD then
		ent:AddLegDamage(8)
	end

	local e = EffectData()
		e:SetOrigin(tr.HitPos)
		e:SetNormal(tr.HitNormal)
		e:SetRadius(8)
		e:SetMagnitude(1)
		e:SetScale(1)
	util.Effect("cball_bounce", e)
	
	dmginfo:SetDamageType( bit.bor( DMG_ENERGYBEAM, DMG_DISSOLVE ) );
	
	GenericBulletCallback(attacker, tr, dmginfo)
end