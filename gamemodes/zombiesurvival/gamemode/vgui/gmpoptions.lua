function MakeGMPOptions()
	PlayMenuOpenSound()

	if GMPOptions then
		GMPOptions:SetAlpha(0)
		GMPOptions:AlphaTo(255, 0.5, 0)
		GMPOptions:SetVisible(true)
		GMPOptions:MakePopup()
		return
	end

	local Window = vgui.Create("DFrame")
	local wide = math.min(ScrW(), 500)
	local tall = math.min(ScrH(), 580)
	Window:SetSize(wide, tall)
	Window:Center()
	Window:SetTitle(" ")
	Window:SetDeleteOnClose(false)
	GMPOptions = Window

	local y = 8

	local label = EasyLabel(Window, "GM+: Options", "ZSHUDFont", color_white)
	label:SetPos(wide * 0.5 - label:GetWide() * 0.5, y)
	y = y + label:GetTall() + 8

	local list = vgui.Create("DPanelList", GMPOptions)
	list:EnableVerticalScrollbar()
	list:EnableHorizontal(false)
	list:SetSize(wide - 24, tall - y - 12)
	list:SetPos(12, y)
	list:SetPadding(8)
	list:SetSpacing(4)

	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [DSP]: Enabled")
	check:SetConVar("gmp_dsp_enabled")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [DSP]: Low-Health Sound")
	check:SetConVar("gmp_dsp_lowhealth")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [DSP]: Death Enabled")
	check:SetConVar("gmp_dsp_death")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: Dynaview Enabled")
	check:SetConVar("mp_usehwmvcds")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: Dynaview Smooth")
	check:SetConVar("Life_Bloom")
	check:SizeToContents()
	list:AddItem(check)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Pos Strength")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Ang Strength")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: PosAdd Strength")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: AngAdd Strength")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: ViewModel Enabled")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: FreeLook Enabled")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 255)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Freelook Deadzone X")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 255)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Freelook Deadzone Y")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Freelook Ang Multiplier X")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Freelook Ang Multiplier Y")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: VM Dynamics")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: VM Dynamics Smooth")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: VM Dynamics Smooth Ang Strength")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: VM Dynamics Crowbar Compat")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: VM Dynamics SMG Compat")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: VM Dynamics AR2 Compat")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: VM Dynamics Shotgun Compat")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: VM Dynamics Grenade Compat")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: Bob Enabled")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: Bob Override Old")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)

	list:AddItem(EasyLabel(Window, "Life: Color Overlay", "DefaultFontSmall", color_white))
	local dropdown = vgui.Create("DComboBox", Window)
	dropdown:SetMouseInputEnabled(true)
	dropdown:AddChoice("Off")
	dropdown:AddChoice("Source Like")
	dropdown:AddChoice("GM+ Custom")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("Life_ColourModify", value == "Source Like" and 1 or value == "GM+ Custom" and 2 or 0)
	end
	dropdown:SetText(GetConVarNumber("Life_ColourModify") == 2 and "GM+ Custom" or GetConVarNumber("Life_ColourModify") == 1 and "Source Like" or "Off")
	list:AddItem(dropdown)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Bob Multiplier X")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Bob Multiplier Y")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Bob Multiplier Pos")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Bob Multiplier Ang")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Bob Multiplier VM Pos")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Bob Multiplier VM Ang")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Bob Type2 Strength Current X")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Bob Type2 Strength Current Y")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Bob Type2 Strength Desired X")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Bob Type2 Strength Desired Y")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: Lean Enabled")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Lean Multiplier")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: Stop Enabled")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Stop Multiplier")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: Sway Enabled")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Sway Time Multiplier")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Sway VM Time Multiplier")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Sway Multiplier")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Sway VM Multiplier")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: Close Enabled")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: VM Swing Enabled")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: VM Swing Multiplier X")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: VM Swing Multiplier Y")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: VM Swing Multiplier Z")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: Crouch Offset Enabled")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Crouch Offset Multiplier")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: Crouch Dampening Enabled")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Crouch Dampening Multiplier")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: Punch Enabled")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Punch Multiplier")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: Punch Override Old")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Punch Strength Current")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Punch Strength Desired")
	slider:SizeToContents()
	list:AddItem(slider)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText("GMP [Dynaview]: Punch OnPain")
	check:SetConVar("Life_Sharpen")
	check:SizeToContents()
	list:AddItem(check)
	
	local check = vgui.Create("DCheckBoxLabel", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("r_worldlights")
	slider:SetText("GMP [Dynaview]: Punch OnPain Multiplier")
	slider:SizeToContents()
	list:AddItem(slider)

	Window:SetAlpha(0)
	Window:AlphaTo(255, 0.5, 0)
	Window:MakePopup()
end
