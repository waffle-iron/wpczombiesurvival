if SERVER then
    AddCSLuaFile( "cl_optionsaddons.lua" )
    return
end

hook.Add("AddExtraOptions", "AddExtraOptions.Life", function(panellist, optionsmenu)
	local check = vgui.Create("DCheckBoxLabel", optionsmenu)
	check:SetText("Gmod Legs: Enabled")
	check:SetConVar("cl_legs")
	check:SizeToContents()
	panellist:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", optionsmenu)
	check:SetText("Gmod Legs: First-Person Death")
	check:SetConVar("cl_deathview")
	check:SizeToContents()
	panellist:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", optionsmenu)
	check:SetText("Atmos: Hud Effects")
	check:SetConVar("atmos_cl_hudeffects")
	check:SizeToContents()
	panellist:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", optionsmenu)
	check:SetText("Atmos: Weather")
	check:SetConVar("atmos_cl_weather")
	check:SizeToContents()
	panellist:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", optionsmenu)
	check:SetText("Atmos: Rain Splashes")
	check:SetConVar("atmos_cl_rainsplash")
	check:SizeToContents()
	panellist:AddItem(check)
	
	local slider = vgui.Create("DNumSlider", optionsmenu)
	slider:SetDecimals(0)
	slider:SetMinMax(16, 64)
	slider:SetConVar("atmos_cl_rainperparticle")
	slider:SetText("Atmos: Max Rain Particles")
	slider:SizeToContents()
	panellist:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", optionsmenu)
	slider:SetDecimals(0)
	slider:SetMinMax(16, 32)
	slider:SetConVar("atmos_cl_rainradius")
	slider:SetText("Atmos: Max Rain Radius")
	slider:SizeToContents()
	panellist:AddItem(slider)
end)