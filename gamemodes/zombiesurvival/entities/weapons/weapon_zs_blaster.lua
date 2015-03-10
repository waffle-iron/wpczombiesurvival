AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "'Blaster' Shotgun"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(4.221, 0, 1.776)
	SWEP.AimAng = Vector(0.216, 0, 0)
		
	SWEP.SprintPos = Vector(-0.84, -5.93, -5.209)
	SWEP.SprintAng = Vector(29.149, -33.541, -7.523)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "shotshell"
	SWEP.ShellOnEvent = true
	
	SWEP.MuzzleEffect = "swb_shotgun"
	
	SWEP.HUD3DPos = Vector(6, 3.1, 1.3)
	SWEP.HUD3DAng = Angle(-90, -180, -30)
	SWEP.HUD3DScale = 0.023
	SWEP.HUD3DBone = "main.bone"
end

sound.Add(
{
	name = "Remington.FireSingle",
	channel = CHAN_STATIC,
	volume = 1.0,
	sound = "weapons/cw_ber_870/shot2.wav"
})

sound.Add(
{
	name = "Remington.ReloadShell",
	channel = CHAN_WEAPON,
	volume = 1.0,
	sound = "weapons/cw_ber_870/insertshell.wav"
})

sound.Add(
{
	name = "Remington.Pump",
	channel = CHAN_WEAPON,
	volume = 1.0,
	sound = "weapons/cw_ber_870/pump.wav"
})

sound.Add(
{
	name = "Remington.Draw",
	channel = CHAN_WEAPON,
	volume = 1.0,
	sound = "weapons/cw_ber_870/draw.wav"
})

SWEP.PlayBackRate = 1
SWEP.PlayBackRateSV = 1
SWEP.SpeedDec = 30
SWEP.BulletDiameter = 5
SWEP.CaseLength = 10

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_box_buckshot_ttt"

SWEP.Slot = 1
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

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/weapons/v_remington_shot.mdl"
SWEP.WorldModel		= "models/weapons/w_remington_shot.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 6
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Buckshot"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.FireDelay = 0.9
SWEP.FireSound = Sound("Remington.FireSingle")
SWEP.ShotgunReloadSound = Sound("Remington.ReloadShell")
SWEP.ShotgunPumpSound = Sound("Remington.Pump")
SWEP.DrawSound = Sound("Remington.Draw")
SWEP.Recoil = 3
SWEP.ShotgunReload = true
SWEP.ReloadStartWait = 0.6
SWEP.ReloadFinishWait = 1.1
SWEP.ReloadShellInsertWait = 0.6
SWEP.Chamberable = false
SWEP.UseHands = false

SWEP.HipSpread = 0.07
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.06
SWEP.ClumpSpread = 0.02
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.8
SWEP.Shots = 6
SWEP.Damage = 12
SWEP.DeployTime = 1

SWEP.ConeMax = 0.18
SWEP.ConeMin = 0.155

SWEP.WalkSpeed = SPEED_SLOWER