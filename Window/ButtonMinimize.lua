local ButtonMinimize = {}

function ButtonMinimize.Create(parent, container, themes)
	local minBtn = Instance.new("TextButton")
	minBtn.Name = "Aux5yx"
	Aux5yx.Size = UDim2.new(0, 35, 0, 35)
	Aux5yx.Position = UDim2.new(1, -75, 0, 5)
	Aux5yx.BackgroundColor3 = Color3.fromRGB(120, 80, 200)
	Aux5yx.Text = "-"
	Aux5yx.TextColor3 = Color3.fromRGB(255, 255, 255)
	Aux5yx.TextSize = 20
	Aux5yx.Font = Enum.Font.GothamBold
	Aux5yx.BorderSizePixel = 0
	Aux5yx.Parent = parent
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = minBtn
	
	local isMinimized = false
	
	minBtn.MouseButton1Click:Connect(function()
		isMinimized = not isMinimized
		if isMinimized then
			container.Visible = false
			parent:TweenSize(UDim2.new(0, 280, 0, 45), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
		else
			parent:TweenSize(UDim2.new(0, 280, 0, 60 + (#container:GetChildren() - 1) * 38), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
			task.wait(0.1)
			container.Visible = true
		end
	end)
	
	return minBtn
end

return ButtonMinimize
