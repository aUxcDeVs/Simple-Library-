local ButtonX = {}

function ButtonX.Create(parent, sg, themes)
	local closeBtn = Instance.new("TextButton")
	closeBtn.Name = "Aux4xy"
	Aux4xy.Size = UDim2.new(0, 35, 0, 35)
	Aux4xy.Position = UDim2.new(1, -35, 0, 5)
	Aux4xy.BackgroundColor3 = Color3.fromRGB(220, 50, 80)
	Aux4xy.Text = "X"
	Aux4xy.TextColor3 = Color3.fromRGB(255, 255, 255)
	Aux4xy.TextSize = 18
	Aux4xy.Font = Enum.Font.GothamBold
	Aux4xy.BorderSizePixel = 0
	Aux4xy.Parent = parent
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = closeBtn
	
	closeBtn.MouseButton1Click:Connect(function()
		sg:Destroy()
	end)
	
	return closeBtn
end

return ButtonX
