function MakepLifeOptions()
	PlayMenuOpenSound()

	if pLifeOptions then
		pLifeOptions:SetAlpha(0)
		pLifeOptions:AlphaTo(255, 0.5, 0)
		pLifeOptions:SetVisible(true)
		pLifeOptions:MakePopup()
		return
	end

	local Window = vgui.Create("DFrame")
	local wide = math.min(ScrW(), 500)
	local tall = math.min(ScrH(), 580)
	Window:SetSize(wide, tall)
	Window:Center()
	Window:SetTitle(" ")
	Window:SetDeleteOnClose(false)
	pLifeOptions = Window

	local y = 8

	local label = EasyLabel(Window, "Life: Options", "ZSHUDFont", color_white)
	label:SetPos(wide * 0.5 - label:GetWide() * 0.5, y)
	y = y + label:GetTall() + 8

	local list = vgui.Create("DPanelList", pLifeOptions)
	list:EnableVerticalScrollbar()
	list:EnableHorizontal(false)
	list:SetSize(wide - 24, tall - y - 12)
	list:SetPos(12, y)
	list:SetPadding(8)
	list:SetSpacing(4)

	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Life: Enable Motion Blue")
	check:SetConVar("mat_motion_blur_forward_enabled")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Life: Color Correction")
	check:SetConVar("mat_colorcorrection")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Life: High Quality Faces")
	check:SetConVar("mp_usehwmmodels")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Life: High Quality Facial Animations")
	check:SetConVar("mp_usehwmvcds")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Life: Specular")
	check:SetConVar("mat_specular")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Life: Parallax Mapping")
	check:SetConVar("mat_parallaxmap")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Life: Bloom")
	check:SetConVar("Life_Bloom")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Life: BugTrip")
	check:SetConVar("Life_BugTrip")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Life: Depth of Field")
	check:SetConVar("Life_DOF")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Life: ToyTown")
	check:SetConVar("Life_ToyTown")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Life: Sunbeams")
	check:SetConVar("Life_Sunbeams")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("Life: Sharpen")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	list:AddItem(EasyLabel(Window, "Life: Color Overlay", "DefaultFontSmall", color_white))
	local dropdown = vgui.Create("DComboBox", Window)
	dropdown:SetMouseInputEnabled(true)
	dropdown:AddChoice("Off")
	dropdown:AddChoice("Classic(Balanced)")
	dropdown:AddChoice("Pure(Dark)")
	dropdown:AddChoice("Legacy(Bright)")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("Life_ColourModify", value == "Legacy(Bright)" and 3 or value == "Pure(Dark)" and 2 or value == "Classic(Balanced)" and 1 or 0)
	end
	dropdown:SetText(GetConVarNumber("Life_ColourModify") == 3 and "Legacy(Bright)" or GetConVarNumber("Life_ColourModify") == 2 and "Pure(Dark)" or GetConVarNumber("Life_ColourModify") == 1 and "Classic(Balanced)" or "Off")
	list:AddItem(dropdown)
	
	list:AddItem(EasyLabel(Window, "Life: Vignette", "DefaultFontSmall", color_white))
	local dropdown = vgui.Create("DComboBox", Window)
	dropdown:SetMouseInputEnabled(true)
	dropdown:AddChoice("Off")
	dropdown:AddChoice("Version 1")
	dropdown:AddChoice("Version 2")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("Life_Vignette", value == "Version 2" and 2 or value == "Version 1" and 1 or 0)
	end
	dropdown:SetText(GetConVarNumber("Life_Vignette") == 2 and "Version 2" or GetConVarNumber("Life_Vignette") == 1 and "Version 1" or "Off")
	list:AddItem(dropdown)
	
	list:AddItem(EasyLabel(Window, "Life: Resolution of Flashlight Shadows (Heavy FPS Impact)", "DefaultFontSmall", color_white))
	local dropdown = vgui.Create("DComboBox", Window)
	dropdown:SetMouseInputEnabled(true)
	dropdown:AddChoice("256")
	dropdown:AddChoice("512")
	dropdown:AddChoice("1024")
	dropdown:AddChoice("2048")
	dropdown:AddChoice("4096")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("r_flashlightdepthres", value)
	end
	dropdown:SetText(GetConVarNumber("r_flashlightdepthres") == 256 and "256" or GetConVarNumber("r_flashlightdepthres") == 512 and "512" or GetConVarNumber("r_flashlightdepthres") == 1024 and "1024" or GetConVarNumber("r_flashlightdepthres") == 2048 and "2048" or GetConVarNumber("r_flashlightdepthres") == 4096 and "4096" or "Off")
	list:AddItem(dropdown)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 9999)
	slider:SetConVar("r_worldlights")
	slider:SetText("Life: Max world lights per vertex")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 100)
	slider:SetConVar("jpeg_quality")
	slider:SetText("Life: Screenshot quality")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 9999)
	slider:SetConVar("r_maxdlights")
	slider:SetText("Life: Max renderable dynamic lights")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 9999)
	slider:SetConVar("r_cheapwaterend")
	slider:SetText("Life: End of the CheapWater rendering")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 9999)
	slider:SetConVar("r_cheapwaterstart")
	slider:SetText("Life: Start of the CheapWater rendering")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 9999)
	slider:SetConVar("cl_detaildist")
	slider:SetText("Life: Distance that detail props can be seen (Animated grass)")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 8192)
	slider:SetConVar("mat_wateroverlaysize")
	slider:SetText("Life: Water Overlay Size")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 9999)
	slider:SetConVar("r_shadowmaxrendered")
	slider:SetText("Life: Maximum renderable shadows")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_projectedtexture_filter")
	slider:SetText("Life: Shadow smoothness")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 9999)
	slider:SetConVar("cl_detailfade")
	slider:SetText("Life: Detail Fade")
	slider:SizeToContents()
	list:AddItem(slider)

	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 8192)
	slider:SetConVar("mat_envmapsize")
	slider:SetText("Life: Material Env Size")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 512)
	slider:SetConVar("mat_envmaptgasize")
	slider:SetText("Life: Spray Env Size")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 5)
	slider:SetConVar("mat_motion_blur_strength")
	slider:SetText("Life: Motion Blur Amount")
	slider:SizeToContents()
	list:AddItem(slider)

	Window:SetAlpha(0)
	Window:AlphaTo(255, 0.5, 0)
	Window:MakePopup()
end
