local ElementButton = {}

function ElementButton.Create(container, name, callback, mainFrame, themes)
	local btn = Instance.new("TextButton")
	btn.Name = name
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.BackgroundColor3 = themes.ButtonBackground
	btn.Text = name
	btn.TextColor3 = themes.ButtonText
	btn.TextSize = 14
	btn.Font = Enum.Font.Gotham
	btn.BorderSizePixel = 0
	btn.Parent = container
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = btn
	
	btn.MouseButton1Click:Connect(function()
		
		btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		task.wait(0.1)
		btn.BackgroundColor3 = themes.ButtonBackground
		
		pcall(function()
			callback()
		end)
	end)
	
	mainFrame.Size = UDim2.new(0, 280, 0, 60 + (#container:GetChildren() - 1) * 38)
	
	return btn
end

return ElementButton
