
---------------------------------
-- Use Animation Script @ V92
-- Hash Code #00035
---------------------------------

local function UseAnimations(ply, ent)
	ply:DoAnimationEvent( ACT_GMOD_GESTURE_ITEM_GIVE )
end
hook.Add("PlayerUse", "UseAnims", UseAnimations)

MsgN("V92 Scripts - Use Animations Loaded")