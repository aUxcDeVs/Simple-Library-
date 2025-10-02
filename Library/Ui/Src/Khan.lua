local lib = {}

function lib:Create(name)
    local gui = Instance.new("ScreenGui")
    gui.Name = name
    gui.ResetOnSpawn = false
    gui.Parent = game.CoreGui
    
    local main = Instance.new("Frame")
    main.Size = UDim2.new(0,400,0,300)
    main.Position = UDim2.new(0.5,-200,0.5,-150)
    main.BackgroundColor3 = Color3.fromRGB(25,25,25)
    main.BorderSizePixel = 0
    main.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0,12)
    corner.Parent = main
    
    local top = Instance.new("Frame")
    top.Size = UDim2.new(1,0,0,35)
    top.BackgroundColor3 = Color3.fromRGB(35,35,35)
    top.BorderSizePixel = 0
    top.Parent = main
    
    local topcorner = Instance.new("UICorner")
    topcorner.CornerRadius = UDim.new(0,12)
    topcorner.Parent = top
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(0.7,0,1,0)
    title.Position = UDim2.new(0,8,0,0)
    title.BackgroundTransparency = 1
    title.Text = name
    title.TextColor3 = Color3.new(1,1,1)
    title.TextSize = 16
    title.Font = Enum.Font.SourceSans
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = top
    
    local minbtn = Instance.new("TextButton")
    minbtn.Size = UDim2.new(0,30,0,25)
    minbtn.Position = UDim2.new(1,-70,0.5,-12.5)
    minbtn.BackgroundColor3 = Color3.fromRGB(100,50,120)
    minbtn.Text = "-"
    minbtn.TextColor3 = Color3.new(1,1,1)
    minbtn.TextSize = 18
    minbtn.Font = Enum.Font.SourceSansBold
    minbtn.BorderSizePixel = 0
    minbtn.Parent = top
    
    local mincorner = Instance.new("UICorner")
    mincorner.CornerRadius = UDim.new(0,6)
    mincorner.Parent = minbtn
    
    local closebtn = Instance.new("TextButton")
    closebtn.Size = UDim2.new(0,30,0,25)
    closebtn.Position = UDim2.new(1,-35,0.5,-12.5)
    closebtn.BackgroundColor3 = Color3.fromRGB(200,50,80)
    closebtn.Text = "X"
    closebtn.TextColor3 = Color3.new(1,1,1)
    closebtn.TextSize = 16
    closebtn.Font = Enum.Font.SourceSansBold
    closebtn.BorderSizePixel = 0
    closebtn.Parent = top
    
    local closecorner = Instance.new("UICorner")
    closecorner.CornerRadius = UDim.new(0,6)
    closecorner.Parent = closebtn
    
    local content = Instance.new("Frame")
    content.Size = UDim2.new(1,-16,1,-43)
    content.Position = UDim2.new(0,8,0,38)
    content.BackgroundTransparency = 1
    content.Parent = main
    
    local confirmframe = Instance.new("Frame")
    confirmframe.Size = UDim2.new(0,280,0,130)
    confirmframe.Position = UDim2.new(0.5,-140,0.5,-65)
    confirmframe.BackgroundColor3 = Color3.fromRGB(30,30,30)
    confirmframe.BorderSizePixel = 0
    confirmframe.Visible = false
    confirmframe.Parent = gui
    
    local confirmcorner = Instance.new("UICorner")
    confirmcorner.CornerRadius = UDim.new(0,12)
    confirmcorner.Parent = confirmframe
    
    local confirmtxt = Instance.new("TextLabel")
    confirmtxt.Size = UDim2.new(1,-20,0.5,0)
    confirmtxt.Position = UDim2.new(0,10,0,15)
    confirmtxt.BackgroundTransparency = 1
    confirmtxt.Text = "You sure want to destroy?"
    confirmtxt.TextColor3 = Color3.new(1,1,1)
    confirmtxt.TextSize = 16
    confirmtxt.Font = Enum.Font.SourceSans
    confirmtxt.Parent = confirmframe
    
    local yesbtn = Instance.new("TextButton")
    yesbtn.Size = UDim2.new(0,110,0,35)
    yesbtn.Position = UDim2.new(0,15,1,-45)
    yesbtn.BackgroundColor3 = Color3.fromRGB(50,180,50)
    yesbtn.Text = "Yes"
    yesbtn.TextColor3 = Color3.new(1,1,1)
    yesbtn.TextSize = 16
    yesbtn.Font = Enum.Font.SourceSansBold
    yesbtn.BorderSizePixel = 0
    yesbtn.Parent = confirmframe
    
    local yescorner = Instance.new("UICorner")
    yescorner.CornerRadius = UDim.new(0,6)
    yescorner.Parent = yesbtn
    
    local nobtn = Instance.new("TextButton")
    nobtn.Size = UDim2.new(0,110,0,35)
    nobtn.Position = UDim2.new(1,-125,1,-45)
    nobtn.BackgroundColor3 = Color3.fromRGB(180,50,50)
    nobtn.Text = "No"
    nobtn.TextColor3 = Color3.new(1,1,1)
    nobtn.TextSize = 16
    nobtn.Font = Enum.Font.SourceSansBold
    nobtn.BorderSizePixel = 0
    nobtn.Parent = confirmframe
    
    local nocorner = Instance.new("UICorner")
    nocorner.CornerRadius = UDim.new(0,6)
    nocorner.Parent = nobtn
    
    local ypos = 10
    local minimized = false
    
    minbtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            main.Size = UDim2.new(0,400,0,35)
            content.Visible = false
        else
            main.Size = UDim2.new(0,400,0,300)
            content.Visible = true
        end
    end)
    
    closebtn.MouseButton1Click:Connect(function()
        confirmframe.Visible = true
    end)
    
    yesbtn.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)
    
    nobtn.MouseButton1Click:Connect(function()
        confirmframe.Visible = false
    end)
    
    local drag
    local dragInput
    local dragStart
    local startPos
    
    top.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            drag = true
            dragStart = input.Position
            startPos = main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    drag = false
                end
            end)
        end
    end)
    
    top.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and drag then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    local window = {}
    
    function window:Button(text, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1,-10,0,35)
        btn.Position = UDim2.new(0,5,0,ypos)
        btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
        btn.Text = text
        btn.TextColor3 = Color3.new(1,1,1)
        btn.TextSize = 14
        btn.Font = Enum.Font.SourceSans
        btn.BorderSizePixel = 0
        btn.Parent = content
        
        local btncorner = Instance.new("UICorner")
        btncorner.CornerRadius = UDim.new(0,6)
        btncorner.Parent = btn
        
        btn.MouseButton1Click:Connect(function()
            callback()
        end)
        
        ypos = ypos + 40
    end
    
    function window:Toggle(text, callback)
        local state = false
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1,-10,0,35)
        frame.Position = UDim2.new(0,5,0,ypos)
        frame.BackgroundColor3 = Color3.fromRGB(45,45,45)
        frame.BorderSizePixel = 0
        frame.Parent = content
        
        local framecorner = Instance.new("UICorner")
        framecorner.CornerRadius = UDim.new(0,6)
        framecorner.Parent = frame
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.65,0,1,0)
        label.Position = UDim2.new(0,8,0,0)
        label.BackgroundTransparency = 1
        label.Text = text .. ": OFF"
        label.TextColor3 = Color3.new(1,1,1)
        label.TextSize = 14
        label.Font = Enum.Font.SourceSans
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame
        
        local toggle = Instance.new("TextButton")
        toggle.Size = UDim2.new(0,70,0,28)
        toggle.Position = UDim2.new(1,-75,0.5,-14)
        toggle.BackgroundColor3 = Color3.fromRGB(60,60,60)
        toggle.Text = "Toggle"
        toggle.TextColor3 = Color3.new(1,1,1)
        toggle.TextSize = 13
        toggle.Font = Enum.Font.SourceSans
        toggle.BorderSizePixel = 0
        toggle.Parent = frame
        
        local togglecorner = Instance.new("UICorner")
        togglecorner.CornerRadius = UDim.new(0,6)
        togglecorner.Parent = toggle
        
        toggle.MouseButton1Click:Connect(function()
            state = not state
            if state then
                label.Text = text .. ": ON"
                toggle.BackgroundColor3 = Color3.fromRGB(50,150,50)
            else
                label.Text = text .. ": OFF"
                toggle.BackgroundColor3 = Color3.fromRGB(60,60,60)
            end
            callback(state)
        end)
        
        ypos = ypos + 40
    end
    
    return window
end

return lib
