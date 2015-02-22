CreateClientConVar("zs_damagefloatersstyle", "0", true, false)
CreateClientConVar("zs_classichud", "0", true, false)

hook.Add("AddExtraOptions", "AddExtraOptions.Life", function(panellist, optionsmenu)
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