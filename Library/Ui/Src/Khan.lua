local lib = {}

function lib:Create(name)
    local gui = Instance.new("ScreenGui")
    gui.Name = name
    gui.ResetOnSpawn = false
    gui.Parent = game.CoreGui
    
    local main = Instance.new("Frame")
    main.Size = UDim2.new(0,340,0,180)
    main.Position = UDim2.new(0.5,-170,0.35,-90)
    main.BackgroundColor3 = Color3.fromRGB(10,10,10)
    main.BorderColor3 = Color3.fromRGB(255,50,150)
    main.BorderSizePixel = 4
    main.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0,12)
    corner.Parent = main
    
    local top = Instance.new("Frame")
    top.Size = UDim2.new(1,0,0,32)
    top.BackgroundTransparency = 1
    top.Parent = main
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(0.6,0,1,0)
    title.Position = UDim2.new(0,10,0,0)
    title.BackgroundTransparency = 1
    title.Text = name
    title.TextColor3 = Color3.fromRGB(255,50,150)
    title.TextSize = 16
    title.Font = Enum.Font.SourceSans
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = top
    
    local minbtn = Instance.new("TextButton")
    minbtn.Size = UDim2.new(0,28,0,24)
    minbtn.Position = UDim2.new(1,-62,0.5,-12)
    minbtn.BackgroundColor3 = Color3.fromRGB(100,40,120)
    minbtn.Text = "-"
    minbtn.TextColor3 = Color3.new(1,1,1)
    minbtn.TextSize = 20
    minbtn.Font = Enum.Font.SourceSansBold
    minbtn.BorderSizePixel = 0
    minbtn.Parent = top
    
    local mincorner = Instance.new("UICorner")
    mincorner.CornerRadius = UDim.new(0,6)
    mincorner.Parent = minbtn
    
    local closebtn = Instance.new("TextButton")
    closebtn.Size = UDim2.new(0,28,0,24)
    closebtn.Position = UDim2.new(1,-30,0.5,-12)
    closebtn.BackgroundColor3 = Color3.fromRGB(230,40,100)
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
    content.Size = UDim2.new(1,-20,1,-42)
    content.Position = UDim2.new(0,10,0,36)
    content.BackgroundTransparency = 1
    content.Parent = main
    
    local confirmframe = Instance.new("Frame")
    confirmframe.Size = UDim2.new(0,260,0,120)
    confirmframe.Position = UDim2.new(0.5,-130,0.5,-60)
    confirmframe.BackgroundColor3 = Color3.fromRGB(15,15,15)
    confirmframe.BorderColor3 = Color3.fromRGB(255,50,150)
    confirmframe.BorderSizePixel = 3
    confirmframe.Visible = false
    confirmframe.Parent = gui
    
    local confirmcorner = Instance.new("UICorner")
    confirmcorner.CornerRadius = UDim.new(0,10)
    confirmcorner.Parent = confirmframe
    
    local confirmtxt = Instance.new("TextLabel")
    confirmtxt.Size = UDim2.new(1,-20,0,60)
    confirmtxt.Position = UDim2.new(0,10,0,10)
    confirmtxt.BackgroundTransparency = 1
    confirmtxt.Text = "You sure want to destroy?"
    confirmtxt.TextColor3 = Color3.new(1,1,1)
    confirmtxt.TextSize = 15
    confirmtxt.Font = Enum.Font.SourceSans
    confirmtxt.Parent = confirmframe
    
    local yesbtn = Instance.new("TextButton")
    yesbtn.Size = UDim2.new(0,110,0,32)
    yesbtn.Position = UDim2.new(0,15,1,-42)
    yesbtn.BackgroundColor3 = Color3.fromRGB(40,180,40)
    yesbtn.Text = "Yes"
    yesbtn.TextColor3 = Color3.new(1,1,1)
    yesbtn.TextSize = 15
    yesbtn.Font = Enum.Font.SourceSansBold
    yesbtn.BorderSizePixel = 0
    yesbtn.Parent = confirmframe
    
    local yescorner = Instance.new("UICorner")
    yescorner.CornerRadius = UDim.new(0,6)
    yescorner.Parent = yesbtn
    
    local nobtn = Instance.new("TextButton")
    nobtn.Size = UDim2.new(0,110,0,32)
    nobtn.Position = UDim2.new(1,-125,1,-42)
    nobtn.BackgroundColor3 = Color3.fromRGB(180,40,40)
    nobtn.Text = "No"
    nobtn.TextColor3 = Color3.new(1,1,1)
    nobtn.TextSize = 15
    nobtn.Font = Enum.Font.SourceSansBold
    nobtn.BorderSizePixel = 0
    nobtn.Parent = confirmframe
    
    local nocorner = Instance.new("UICorner")
    nocorner.CornerRadius = UDim.new(0,6)
    nocorner.Parent = nobtn
    
    local ypos = 8
    local minimized = false
    
    minbtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            main.Size = UDim2.new(0,340,0,32)
            content.Visible = false
        else
            main.Size = UDim2.new(0,340,0,180)
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
    
    local UIS = game:GetService("UserInputService")
    local drag = false
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    top.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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
    
    UIS.InputChanged:Connect(function(input)
        if drag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)
    
    local window = {}
    
    function window:Button(text, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1,0,0,32)
        btn.Position = UDim2.new(0,0,0,ypos)
        btn.BackgroundColor3 = Color3.fromRGB(25,25,25)
        btn.Text = text
        btn.TextColor3 = Color3.new(1,1,1)
        btn.TextSize = 14
        btn.Font = Enum.Font.SourceSans
        btn.BorderSizePixel = 0
        btn.Parent = content
        
        local btncorner = Instance.new("UICorner")
        btncorner.CornerRadius = UDim.new(0,6)
        btncorner.Parent = btn
        
        btn.MouseButton1Click:Connect(callback)
        
        ypos = ypos + 38
    end
    
    function window:Toggle(text, callback)
        local state = false
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1,0,0,32)
        label.Position = UDim2.new(0,0,0,ypos)
        label.BackgroundTransparency = 1
        label.Text = text .. ": OFF"
        label.TextColor3 = Color3.fromRGB(255,80,180)
        label.TextSize = 14
        label.Font = Enum.Font.SourceSans
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = content
        
        local toggle = Instance.new("TextButton")
        toggle.Size = UDim2.new(0,1,0,1)
        toggle.BackgroundTransparency = 1
        toggle.Text = ""
        toggle.Parent = label
        
        toggle.MouseButton1Click:Connect(function()
            state = not state
            if state then
                label.Text = text .. ": ON"
            else
                label.Text = text .. ": OFF"
            end
            callback(state)
        end)
        
        ypos = ypos + 38
    end
    
    return window
end

return lib
