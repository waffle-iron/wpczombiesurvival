CreateClientConVar("zs_damagefloatersstyle", "1", true, false)
CreateClientConVar("zs_classichud", "1", true, false)

hook.Add("AddExtraOptions", "AddExtraOptions.Life", function(panellist, optionsmenu)
	local but = vgui.Create("DButton", optionsmenu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText("Life: Options")
	but:SetTall(32)
	but.DoClick = function() Life_OpenMenu() end
	panellist:AddItem(but)
	
	local but = vgui.Create("DButton", optionsmenu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText("Gore: Options")
	but:SetTall(32)
	but.DoClick = function() MakeGoreOptions() end
	panellist:AddItem(but)
	
	local check = vgui.Create("DCheckBoxLabel", optionsmenu)
	check:SetText("Enable TeamWallSpy")
	check:SetConVar("zs_teamwallspy")
	check:SizeToContents()
	panellist:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", optionsmenu)
	check:SetText("Enable Classic HUD")
	check:SetConVar("zs_classichud")
	check:SizeToContents()
	panellist:AddItem(check)
	
	panellist:AddItem(EasyLabel(optionsmenu, "Damage Indicator Style", "DefaultFontSmall", color_white))
	local dropdown = vgui.Create("DComboBox", optionsmenu)
	dropdown:SetMouseInputEnabled(true)
	dropdown:AddChoice("Classic")
	dropdown:AddChoice("New")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("zs_damagefloatersstyle", value == "Classic" and 1 or 0)
	end
	dropdown:SetText(GetConVarNumber("zs_damagefloatersstyle") == 1 and "Classic" or "New")
	panellist:AddItem(dropdown)
end)

function MakeGoreOptions()
	PlayMenuOpenSound()

	if pGore then
		pGore:SetAlpha(0)
		pGore:AlphaTo(255, 0.5, 0)
		pGore:SetVisible(true)
		pGore:SetSkin("zombiesurvivaloptions")
		pGore:MakePopup()
		return
	end

	local Window = vgui.Create("DFrame")
	local wide = math.min(ScrW(), 500)
	local tall = math.min(ScrH(), 580)
	Window:SetSkin("zombiesurvivaloptions")
	Window:SetSize(wide, tall)
	Window:Center()
	Window:SetTitle(" ")
	Window:SetDeleteOnClose(false)
	pGore = Window

	local y = 8

	local label = EasyLabel(Window, "Gore Options", "ZSHUDFont", color_white)
	label:SetPos(wide * 0.5 - label:GetWide() * 0.5, y)
	y = y + label:GetTall() + 8

	local list = vgui.Create("DPanelList", pGore)
	list:EnableVerticalScrollbar()
	list:EnableHorizontal(false)
	list:SetSize(wide - 24, tall - y - 12)
	list:SetPos(12, y)
	list:SetPadding(8)
	list:SetSpacing(4)
	
	local but = vgui.Create("DButton", optionsmenu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText("Clean Blood From Weapon")
	but:SetTall(32)
	but.DoClick = function() 
		LocalPlayer():ConCommand("cl_bgo_fx_blood_weapon_clean")
		ULib.tsayColor(LocalPlayer(), true, Color( 0, 255, 255 ), "Weapon cleaned if you do not wish to hit the button everytime then bind cl_bgo_fx_blood_weapon_clean to a key or disable it")
	end
	list:AddItem(but)

	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Death Post-Processing Enabled")
	check:SetConVar("cl_bgo_death_postprocessing")
	check:SizeToContents()
	list:AddItem(check)

	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Blood Impacts Enabled")
	check:SetConVar("cl_bgo_fx_blood")
	check:SizeToContents()
	list:AddItem(check)

	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Blood Spray Enabled")
	check:SetConVar("cl_bgo_fx_blood_spray_enabled")
	check:SizeToContents()
	list:AddItem(check)

	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Blood Spurt Enabled")
	check:SetConVar("cl_bgo_fx_blood_spurt_enabled")
	check:SizeToContents()
	list:AddItem(check)

	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Blood Stream Enabled")
	check:SetConVar("cl_bgo_fx_blood_stream_enabled")
	check:SizeToContents()
	list:AddItem(check)

	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Blood Stream Impact FX Enabled")
	check:SetConVar("cl_bgo_fx_blood_stream_impacteffect")
	check:SizeToContents()
	list:AddItem(check)

	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("HUD Blood Enabled")
	check:SetConVar("cl_bgo_fx_blood_hud_enabled")
	check:SizeToContents()
	list:AddItem(check)

	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("HUD Blood From Particles Enabled")
	check:SetConVar("cl_bgo_fx_blood_hud_from_particle_enabled")
	check:SizeToContents()
	list:AddItem(check)

	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("HUD Blood Given Enabled")
	check:SetConVar("cl_bgo_fx_blood_hud_given_enabled")
	check:SizeToContents()
	list:AddItem(check)

	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("HUD Blood Taken Enabled")
	check:SetConVar("cl_bgo_fx_blood_hud_taken_enabled")
	check:SizeToContents()
	list:AddItem(check)

	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Weapon Blood Enabled")
	check:SetConVar("cl_bgo_fx_blood_weapon_enabled")
	check:SizeToContents()
	list:AddItem(check)

	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Weapon Blood From Particles Enabled")
	check:SetConVar("cl_bgo_fx_blood_weapon_from_particle")
	check:SizeToContents()
	list:AddItem(check)

	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(32, 128)
	slider:SetConVar("cl_bgo_fx_blood_hud_from_particle_range")
	slider:SetText("HUD Blood Part. Range")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(0, 3)
	slider:SetConVar("cl_bgo_fx_blood_hud_given_scale")
	slider:SetText("HUD Blood Given Scale")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(0, 3)
	slider:SetConVar("cl_bgo_fx_blood_hud_taken_scale")
	slider:SetText("HUD Blood Taken Scale")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(0, 3)
	slider:SetConVar("cl_bgo_fx_blood_hud_from_particle_scale")
	slider:SetText("HUD Blood Part. Scale")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(32, 128)
	slider:SetConVar("cl_bgo_fx_blood_weapon_from_particle_range")
	slider:SetText("Weap. Blood Part. Range")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(0, 3)
	slider:SetConVar("cl_bgo_fx_blood_weapon_scale")
	slider:SetText("Weap. Blood Scale")
	slider:SizeToContents()
	list:AddItem(slider)

	Window:SetAlpha(0)
	Window:AlphaTo(255, 0.5, 0)
	Window:SetSkin("zombiesurvivaloptions")
	Window:MakePopup()
end