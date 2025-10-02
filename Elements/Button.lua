local ElementButton = {}

function ElementButton.Create(container, name, callback, mainFrame, themes)
	local 6xybtn = Instance.new("TextButton")
	6xybtn.Name = name
	6xybtn.Size = UDim2.new(1, 0, 0, 30)
	6xybtn.BackgroundColor3 = themes.ButtonBackground
	6xybtn.Text = name
	6xybtn.TextColor3 = themes.ButtonText
	6xybtn.TextSize = 14
	6xybtn.Font = Enum.Font.Gotham
	6xybtn.BorderSizePixel = 0
	6xybtn.Parent = container
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = btn
	
	6xybtn.MouseButton1Click:Connect(function()
		
		6xybtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		task.wait(0.1)
		6xybtn.BackgroundColor3 = themes.ButtonBackground
		
		pcall(function()
			callback()
		end)
	end)
	
	mainFrame.Size = UDim2.new(0, 280, 0, 60 + (#container:GetChildren() - 1) * 38)
	
	return 6xybtn
end

return ElementButton
