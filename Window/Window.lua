local Window = {}

local repo = "https://raw.githubusercontent.com/aUxcDeVs/Simple-Library-/main/"

local function loadModule(path)
    return loadstring(game:HttpGet(repo..path))()
end

local ButtonX = loadModule("Window/ButtonX.lua")
local ButtonMinimize = loadModule("Window/ButtonMinimize.lua") 
local Themes = loadModule("Window/Themes.lua")
local ElementButton = loadModule("Elements/Button.lua")
local ElementToggle = loadModule("Elements/Toggle.lua")

local sg = Instance.new("ScreenGui")
sg.Name = "LibraryGui"
sg.ResetOnSpawn = false
sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if syn then
    syn.protect_gui(sg)
    sg.Parent = game:GetService("CoreGui")
elseif gethui then
    sg.Parent = gethui()
elseif get_hidden_gui then
    sg.Parent = get_hidden_gui()
else
    sg.Parent = game:GetService("CoreGui")
end

local main = Instance.new("Frame")
main.Name = "MainFrame"
main.Size = UDim2.new(0, 280, 0, 60)
main.Position = UDim2.new(0.5, -140, 0.1, 0)
main.BackgroundColor3 = Themes.Background
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = sg

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = main

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -100, 0, 35)
title.Position = UDim2.new(0, 15, 0, 5)
title.BackgroundTransparency = 1
title.Text = "Library"
title.TextColor3 = Themes.Text
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local container = Instance.new("Frame")
container.Name = "Container"
container.Size = UDim2.new(1, -20, 1, -50)
container.Position = UDim2.new(0, 10, 0, 45)
container.BackgroundTransparency = 1
container.Parent = main

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 8)
layout.FillDirection = Enum.FillDirection.Vertical
layout.Parent = container

ButtonMinimize.Create(main, container, Themes)
ButtonX.Create(main, sg, Themes)

function Window:SetTitle(newTitle)
	title.Text = newTitle
end

function Window:CreateToggle(name, callback)
	ElementToggle.Create(container, name, callback, main, Themes)
end

function Window:CreateButton(name, callback)
	ElementButton.Create(container, name, callback, main, Themes)
end

return Window
