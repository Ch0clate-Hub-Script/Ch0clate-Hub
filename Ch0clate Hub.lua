
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:AddTheme({
    Name = "Purple Glint",
    Accent = Color3.fromHex("#7C3AED"),
    Background = Color3.fromHex("#0F0F14"),
    Outline = Color3.fromHex("#E9D5FF"),
    Text = Color3.fromHex("#FAFAFA"),
    Placeholder = Color3.fromHex("#C4B5FD"),
    Button = Color3.fromHex("#A78BFA"),
    Icon = Color3.fromHex("#DDD6FE"),
})

local Window = WindUI:CreateWindow({
    Title = "VioletCore",
    Icon = "door-open",
    Author = "By CheryGt",
    Folder = "VioletCore",
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Purple Glint",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    Keybind = Enum.KeyCode.RightControl,

    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("clicked")
        end,
    },

    KeySystem = {
        Key = { "vilotecorekey", "Vilote#41et3f3*5fd3f5" },
        Note = "This can not be bypassed, just join the discord for the key.",
        URL = "https://discord.gg/ApRhvyP9WJ",
        SaveKey = true,
    }
})

local selectedPlayer = nil
local noclipEnabled = false
local godModeEnabled = false

local function getPlayerList()
    local names = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(names, player.Name)
        end
    end
    return names
end

local MovementTab = Window:Tab({
    Title = "Movement",
    Icon = "bird",
    Locked = false,
})

MovementTab:Button({
    Title = "Fly Script",
    Desc = "Float in the air and move freely.",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end
})

MovementTab:Toggle({
    Title = "Noclip",
    Value = false,
    Callback = function(state)
        noclipEnabled = state
    end
})

RunService.Stepped:Connect(function()
    if noclipEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

MovementTab:Slider({
    Title = "WalkSpeed",
    Value = {
        Min = 16,
        Max = 100,
        Default = 16,
    },
    Callback = function(value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end
})

MovementTab:Slider({
    Title = "JumpPower",
    Value = {
        Min = 50,
        Max = 200,
        Default = 50,
    },
    Callback = function(value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end
})

MovementTab:Toggle({
    Title = "Infinite Jump",
    Value = false,
    Callback = function(state)
        _G.InfiniteJump = state
    end
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if _G.InfiniteJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

local PlayerTab = Window:Tab({
    Title = "Player",
    Icon = "user",
    Locked = false,
})

PlayerTab:Dropdown({
    Title = "Select Player",
    Values = getPlayerList(),
    Value = nil,
    Callback = function(value)
        selectedPlayer = Players:FindFirstChild(value)
    end
})

PlayerTab:Button({
    Title = "Refresh Player List",
    Callback = function()
        Window:Notify({
            Title = "Refreshed",
            Content = "Reopen the dropdown to see updated players.",
            Duration = 3
        })
    end
})

PlayerTab:Button({
    Title = "Teleport To Player",
    Callback = function()
        if selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = selectedPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(2, 0, 2)
        end
    end
})

PlayerTab:Toggle({
    Title = "God Mode",
    Value = false,
    Callback = function(state)
        godModeEnabled = state

        if state and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.MaxHealth = math.huge
            LocalPlayer.Character.Humanoid.Health = math.huge
        end
    end
})

local MM2Tab = Window:Tab({
    Title = "MM2",
    Icon = "sword",
    Locked = false,
})

local autoGrabSheriffGun = false

MM2Tab:Toggle({
    Title = "Auto Grab Sheriff Gun",
    Desc = "Automatically teleports to dropped sheriff gun.",
    Value = false,
    Callback = function(state)
        autoGrabSheriffGun = state
    end
})

RunService.RenderStepped:Connect(function()
    if autoGrabSheriffGun then
        local gunDrop = workspace:FindFirstChild("GunDrop")

        if gunDrop and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = gunDrop.CFrame + Vector3.new(0, 1, 0)
        end
    end
end)

local ESPTab = Window:Tab({
    Title = "ESP",
    Icon = "eye",
    Locked = false,
})

local espEnabled = false

ESPTab:Toggle({
    Title = "ESP",
    Desc = "Enable or disable player ESP.",
    Value = false,
    Callback = function(state)
        espEnabled = state

        if state then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/z4tt483/ItzXery.lua/main/Esp-Players.lua"))()
        else
            for _, v in pairs(game.CoreGui:GetChildren()) do
                if string.find(v.Name:lower(), "esp") then
                    v:Destroy()
                end
            end

            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Character then
                    for _, obj in pairs(player.Character:GetChildren()) do
                        if obj:IsA("Highlight") or obj.Name == "ESP" then
                            obj:Destroy()
                        end
                    end
                end
            end
        end
    end
})

local SettingsTab = Window:Tab({
    Title = "Settings",
    Icon = "settings",
    Locked = false,
})

SettingsTab:Dropdown({
    Title = "Select Theme",
    Values = {"Purple Glint", "Dark", "Light"},
    Value = "Purple Glint",
    Callback = function(theme)
        WindUI:SetTheme(theme)
    end
})

SettingsTab:Dropdown({
    Title = "Open / Close Key",
    Values = {
        "RightControl",
        "LeftControl",
        "RightShift",
        "LeftShift",
        "Insert",
        "Home"
    },
    Value = "RightControl",
    Callback = function(selected)
        Window:SetKeybind(Enum.KeyCode[selected])
    end
})
