local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Cherry Hub",
    Icon = 0,
    LoadingTitle = "Loading Cherry Scripts",
    LoadingSubtitle = "by CherryGt",
    ShowText = "Cherry Hub",
    Theme = "Amethyst",

    ToggleUIKeybind = "K",

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Cherry Hub"
    },

    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },

    KeySystem = true,
    KeySettings = {
        Title = "Cherry Hub: Key System",
        Subtitle = "Cherry Hub: Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Cherry Hub: Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"cherryhub"}
    }
})

--========================================================--
-- PLAYER TAB
--========================================================--

local PlayerTab = Window:CreateTab("Player Scripts", 1049060234)

--========================================================--
-- Fly + Noclip Button
--========================================================--

PlayerTab:CreateButton({
   Name = "Fly and Noclip",
   Callback = function()
         loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gui-Fly-v3-37111"))()
         loadstring(game:HttpGet("https://pastebin.com/raw/2JZWpiKn", true))()
   end,
})

--========================================================--
-- Godmode Button
--========================================================--

PlayerTab:CreateButton({
   Name = "God Mode",
   Callback = function()
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local GodmodeEnabled = false

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GodmodeGUI"
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 0, 0, 0)
Frame.Position = UDim2.new(0.5, 0, 0.1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.BackgroundTransparency = 0.2
Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0)
Frame.Active = true
Frame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 180, 0, 40)
Button.Position = UDim2.new(0, 10, 0, 10)
Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button.BorderSizePixel = 0
Button.Text = "Enable Godmode"
Button.Font = Enum.Font.GothamBold
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextSize = 16
Button.Parent = Frame

local ButtonUICorner = Instance.new("UICorner")
ButtonUICorner.CornerRadius = UDim.new(0, 8)
ButtonUICorner.Parent = Button

local Credit = Instance.new("TextLabel")
Credit.Size = UDim2.new(0, 180, 0, 20)
Credit.Position = UDim2.new(0, 10, 0, 60)
Credit.BackgroundTransparency = 1
Credit.Text = "--Made By HilosHAX--"
Credit.Font = Enum.Font.GothamSemibold
Credit.TextColor3 = Color3.fromRGB(150, 150, 150)
Credit.TextSize = 14
Credit.Parent = Frame

TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 200, 0, 100)}):Play()

local GlowTween = TweenService:Create(Button, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)})
GlowTween:Play()

local function setupGodmode()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            if string.find(part.Name:lower(), "kill") or string.find(part.Name:lower(), "lava") or part.Material == Enum.Material.Neon then
                part.CanTouch = false
                part.CanCollide = false
                part.Transparency = 0.5
            end
        end
    end
end

local function revertGodmode()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            if string.find(part.Name:lower(), "kill") or string.find(part.Name:lower(), "lava") or part.Material == Enum.Material.Neon then
                part.CanTouch = true
                part.CanCollide = true
                part.Transparency = 0
            end
        end
    end
end

Button.MouseButton1Click:Connect(function()
    GodmodeEnabled = not GodmodeEnabled
    if GodmodeEnabled then
        setupGodmode()
        Button.Text = "Disable Godmode"
    else
        revertGodmode()
        Button.Text = "Enable Godmode"
    end
end)

LocalPlayer.CharacterAdded:Connect(function()
    if ScreenGui then
        ScreenGui:Destroy()
    end
end)
   end,
})

--========================================================--
-- NEW PLAYER SCRIPTS ADDED BELOW
--========================================================--

-- Infinite Jump
PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJump",
    Callback = function(state)
        _G.InfiniteJumpEnabled = state
        local UIS = game:GetService("UserInputService")
        UIS.JumpRequest:Connect(function()
            if _G.InfiniteJumpEnabled then
                local plr = game.Players.LocalPlayer
                if plr.Character and plr.Character:FindFirstChild("Humanoid") then
                    plr.Character.Humanoid:ChangeState("Jumping")
                end
            end
        end)
    end,
})

-- WalkSpeed Slider
PlayerTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 200},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "WalkSpeed",
    Callback = function(value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = value
        end
    end,
})

-- JumpPower Slider
PlayerTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 300},
    Increment = 1,
    Suffix = "Power",
    CurrentValue = 50,
    Flag = "JumpPower",
    Callback = function(value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = value
        end
    end,
})

-- ESP
PlayerTab:CreateButton({
    Name = "Player ESP",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/xuSMWfDu"))()
    end,
})

-- Noclip Toggle
PlayerTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "Noclip",
    Callback = function(state)
        _G.Noclip = state
        local RunService = game:GetService("RunService")
        local Player = game.Players.LocalPlayer

        RunService.Stepped:Connect(function()
            if _G.Noclip and Player.Character then
                for _, part in pairs(Player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end,
})

-- Anti-AFK
PlayerTab:CreateButton({
    Name = "Anti-AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    end,
})
