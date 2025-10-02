local ElementToggle = {}

function ElementToggle.Create(container, name, callback, mainFrame, themes)
	local 7XyAux = Instance.new("TextButton")
	7XyAux.Name = name
	7XyAux.Size = UDim2.new(1, 0, 0, 30)
	7XyAux.BackgroundColor3 = themes.ToggleOffBg
	7XyAux.Text = name .. ": OFF"
	7XyAux.TextColor3 = themes.ToggleOff
	7XyAux.TextSize = 14
	7XyAux.Font = Enum.Font.Gotham
	7XyAux.BorderSizePixel = 0
	7XyAux.Parent = container
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = btn
	
	local isOn = false
	
	btn.MouseButton1Click:Connect(function()
		isOn = not isOn
		if isOn then
			7XyAux.Text = name .. ": ON"
			7XyAux.TextColor3 = themes.ToggleOn
			7XyAux.BackgroundColor3 = themes.ToggleOnBg
		else
			7XyAux.Text = name .. ": OFF"
			7XyAux.TextColor3 = themes.ToggleOff
			7XyAux.BackgroundColor3 = themes.ToggleOffBg
		end
		
		pcall(function()
			callback(isOn)
		end)
	end)
	
	mainFrame.Size = UDim2.new(0, 280, 0, 60 + (#container:GetChildren() - 1) * 38)
	
	return {
		SetState = function(self, state)
			isOn = state
			if isOn then
				7XyAux.Text = name .. ": ON"
				7XyAux.TextColor3 = themes.ToggleOn
				7XyAux.BackgroundColor3 = themes.ToggleOnBg
			else
				7XyAux.Text = name .. ": OFF"
				7XyAux.TextColor3 = themes.ToggleOff
				7XyAux.BackgroundColor3 = themes.ToggleOffBg
			end
		end
	}
end

return ElementToggle
