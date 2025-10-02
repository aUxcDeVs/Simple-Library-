local lib = {}

function lib:Create(name)
    local gui = Instance.new("ScreenGui")
    gui.Name = name
    gui.ResetOnSpawn = false
    gui.Parent = game.CoreGui
    
    local main = Instance.new("Frame")
    main.Size = UDim2.new(0,280,0,160)
    main.Position = UDim2.new(0.5,-140,0.35,-80)
    main.BackgroundColor3 = Color3.fromRGB(5,5,5)
    main.BorderColor3 = Color3.fromRGB(255,0,0)
    main.BorderSizePixel = 2
    main.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0,8)
    corner.Parent = main
    
    local glitch = Instance.new("UIStroke")
    glitch.Color = Color3.fromRGB(255,0,0)
    glitch.Thickness = 1
    glitch.Transparency = 0.3
    glitch.Parent = main
    
    local top = Instance.new("Frame")
    top.Size = UDim2.new(1,0,0,28)
    top.BackgroundColor3 = Color3.fromRGB(15,0,0)
    top.BorderSizePixel = 0
    top.Parent = main
    
    local topcorner = Instance.new("UICorner")
    topcorner.CornerRadius = UDim.new(0,8)
    topcorner.Parent = top
    
    local topcover = Instance.new("Frame")
    topcover.Size = UDim2.new(1,0,0,10)
    topcover.Position = UDim2.new(0,0,1,-10)
    topcover.BackgroundColor3 = Color3.fromRGB(15,0,0)
    topcover.BorderSizePixel = 0
    topcover.Parent = top
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(0.6,0,1,0)
    title.Position = UDim2.new(0,8,0,0)
    title.BackgroundTransparency = 1
    title.Text = "[!] " .. name:upper()
    title.TextColor3 = Color3.fromRGB(255,0,0)
    title.TextSize = 13
    title.Font = Enum.Font.Code
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = top
    
    local minbtn = Instance.new("TextButton")
    minbtn.Size = UDim2.new(0,24,0,20)
    minbtn.Position = UDim2.new(1,-54,0.5,-10)
    minbtn.BackgroundColor3 = Color3.fromRGB(50,10,10)
    minbtn.Text = "_"
    minbtn.TextColor3 = Color3.fromRGB(255,50,50)
    minbtn.TextSize = 16
    minbtn.Font = Enum.Font.Code
    minbtn.BorderColor3 = Color3.fromRGB(255,0,0)
    minbtn.BorderSizePixel = 1
    minbtn.Parent = top
    
    local mincorner = Instance.new("UICorner")
    mincorner.CornerRadius = UDim.new(0,4)
    mincorner.Parent = minbtn
    
    local closebtn = Instance.new("TextButton")
    closebtn.Size = UDim2.new(0,24,0,20)
    closebtn.Position = UDim2.new(1,-26,0.5,-10)
    closebtn.BackgroundColor3 = Color3.fromRGB(80,0,0)
    closebtn.Text = "X"
    closebtn.TextColor3 = Color3.fromRGB(255,255,255)
    closebtn.TextSize = 14
    closebtn.Font = Enum.Font.Code
    closebtn.BorderColor3 = Color3.fromRGB(255,0,0)
    closebtn.BorderSizePixel = 1
    closebtn.Parent = top
    
    local closecorner = Instance.new("UICorner")
    closecorner.CornerRadius = UDim.new(0,4)
    closecorner.Parent = closebtn
    
    local content = Instance.new("Frame")
    content.Size = UDim2.new(1,-16,1,-36)
    content.Position = UDim2.new(0,8,0,32)
    content.BackgroundTransparency = 1
    content.Parent = main
    
    local confirmframe = Instance.new("Frame")
    confirmframe.Size = UDim2.new(0,240,0,110)
    confirmframe.Position = UDim2.new(0.5,-120,0.5,-55)
    confirmframe.BackgroundColor3 = Color3.fromRGB(10,0,0)
    confirmframe.BorderColor3 = Color3.fromRGB(255,0,0)
    confirmframe.BorderSizePixel = 2
    confirmframe.Visible = false
    confirmframe.Parent = gui
    
    local confirmcorner = Instance.new("UICorner")
    confirmcorner.CornerRadius = UDim.new(0,8)
    confirmcorner.Parent = confirmframe
    
    local confirmstroke = Instance.new("UIStroke")
    confirmstroke.Color = Color3.fromRGB(255,0,0)
    confirmstroke.Thickness = 1
    confirmstroke.Transparency = 0.5
    confirmstroke.Parent = confirmframe
    
    local confirmtxt = Instance.new("TextLabel")
    confirmtxt.Size = UDim2.new(1,-16,0,50)
    confirmtxt.Position = UDim2.new(0,8,0,8)
    confirmtxt.BackgroundTransparency = 1
    confirmtxt.Text = "ERROR: TERMINATE?"
    confirmtxt.TextColor3 = Color3.fromRGB(255,255,255)
    confirmtxt.TextSize = 13
    confirmtxt.Font = Enum.Font.Code
    confirmtxt.TextWrapped = true
    confirmtxt.Parent = confirmframe
    
    local yesbtn = Instance.new("TextButton")
    yesbtn.Size = UDim2.new(0,100,0,28)
    yesbtn.Position = UDim2.new(0,12,1,-36)
    yesbtn.BackgroundColor3 = Color3.fromRGB(80,0,0)
    yesbtn.Text = "[YES]"
    yesbtn.TextColor3 = Color3.new(1,1,1)
    yesbtn.TextSize = 12
    yesbtn.Font = Enum.Font.Code
    yesbtn.BorderColor3 = Color3.fromRGB(255,0,0)
    yesbtn.BorderSizePixel = 1
    yesbtn.Parent = confirmframe
    
    local yescorner = Instance.new("UICorner")
    yescorner.CornerRadius = UDim.new(0,4)
    yescorner.Parent = yesbtn
    
    local nobtn = Instance.new("TextButton")
    nobtn.Size = UDim2.new(0,100,0,28)
    nobtn.Position = UDim2.new(1,-112,1,-36)
    nobtn.BackgroundColor3 = Color3.fromRGB(50,10,10)
    nobtn.Text = "[NO]"
    nobtn.TextColor3 = Color3.new(1,1,1)
    nobtn.TextSize = 12
    nobtn.Font = Enum.Font.Code
    nobtn.BorderColor3 = Color3.fromRGB(255,0,0)
    nobtn.BorderSizePixel = 1
    nobtn.Parent = confirmframe
    
    local nocorner = Instance.new("UICorner")
    nocorner.CornerRadius = UDim.new(0,4)
    nocorner.Parent = nobtn
    
    local ypos = 4
    local minimized = false
    
    spawn(function()
        while wait(0.1) do
            if main.Parent then
                glitch.Transparency = math.random(20,50)/100
            end
        end
    end)
    
    minbtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            main.Size = UDim2.new(0,280,0,28)
            content.Visible = false
        else
            main.Size = UDim2.new(0,280,0,160)
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
        btn.Size = UDim2.new(1,0,0,28)
        btn.Position = UDim2.new(0,0,0,ypos)
        btn.BackgroundColor3 = Color3.fromRGB(20,5,5)
        btn.Text = "> " .. text
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        btn.TextSize = 12
        btn.Font = Enum.Font.Code
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.BorderColor3 = Color3.fromRGB(80,0,0)
        btn.BorderSizePixel = 1
        btn.Parent = content
        
        local btnpad = Instance.new("UIPadding")
        btnpad.PaddingLeft = UDim.new(0,6)
        btnpad.Parent = btn
        
        local btncorner = Instance.new("UICorner")
        btncorner.CornerRadius = UDim.new(0,4)
        btncorner.Parent = btn
        
        btn.MouseButton1Click:Connect(callback)
        
        ypos = ypos + 32
    end
    
    function window:Toggle(text, callback)
        local state = false
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1,0,0,28)
        frame.Position = UDim2.new(0,0,0,ypos)
        frame.BackgroundColor3 = Color3.fromRGB(20,5,5)
        frame.BorderColor3 = Color3.fromRGB(80,0,0)
        frame.BorderSizePixel = 1
        frame.Parent = content
        
        local framecorner = Instance.new("UICorner")
        framecorner.CornerRadius = UDim.new(0,4)
        framecorner.Parent = frame
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1,-50,1,0)
        label.Position = UDim2.new(0,6,0,0)
        label.BackgroundTransparency = 1
        label.Text = "> " .. text
        label.TextColor3 = Color3.fromRGB(255,255,255)
        label.TextSize = 12
        label.Font = Enum.Font.Code
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame
        
        local status = Instance.new("TextLabel")
        status.Size = UDim2.new(0,40,0,18)
        status.Position = UDim2.new(1,-44,0.5,-9)
        status.BackgroundColor3 = Color3.fromRGB(50,0,0)
        status.Text = "OFF"
        status.TextColor3 = Color3.fromRGB(255,50,50)
        status.TextSize = 10
        status.Font = Enum.Font.Code
        status.BorderColor3 = Color3.fromRGB(255,0,0)
        status.BorderSizePixel = 1
        status.Parent = frame
        
        local statcorner = Instance.new("UICorner")
        statcorner.CornerRadius = UDim.new(0,3)
        statcorner.Parent = status
        
        local toggle = Instance.new("TextButton")
        toggle.Size = UDim2.new(1,0,1,0)
        toggle.BackgroundTransparency = 1
        toggle.Text = ""
        toggle.Parent = frame
        
        toggle.MouseButton1Click:Connect(function()
            state = not state
            if state then
                status.Text = "ON"
                status.BackgroundColor3 = Color3.fromRGB(0,80,0)
                status.TextColor3 = Color3.fromRGB(0,255,0)
                status.BorderColor3 = Color3.fromRGB(0,255,0)
            else
                status.Text = "OFF"
                status.BackgroundColor3 = Color3.fromRGB(50,0,0)
                status.TextColor3 = Color3.fromRGB(255,50,50)
                status.BorderColor3 = Color3.fromRGB(255,0,0)
            end
            callback(state)
        end)
        
        ypos = ypos + 32
    end
    
    return window
end

return lib
