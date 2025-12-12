local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local MainWindow = Rayfield:CreateWindow({
    Name = "Ch0clate Hub",
    Icon = 0,
    LoadingTitle = "Loading Ch0clate Hub...",
    LoadingSubtitle = "by Ch0clate",
    ShowText = "Choclate Hub",
    Theme = "Amethyst",
    ToggleUIKeybind = "K",

    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Ch0clate Hub"
    },

    KeySystem = true,
    KeySettings = {
        Title = "Ch0clate key system",
        Subtitle = "Key System",
        Note = "Get your key from discord.gg/Rv472pgSFM",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"SDvrfCrge3dcsfr4EFw3"}
    }
})

-- Main Tab
local MainTab = MainWindow:CreateTab("Main", 4483362458)

---------------------------------------------------------
-- RESET CHARACTER BUTTON
---------------------------------------------------------
MainTab:CreateButton({
    Name = "Reset Character",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = 0 end
    end,
})


---------------------------------------------------------
-- INFINITE JUMP (SAFE VERSION)
---------------------------------------------------------
local UIS = game:GetService("UserInputService")
local InfiniteJumpEnabled = false

UIS.JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        local hum = game.Players.LocalPlayer.Character and
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

MainTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJump_Toggle",
    Callback = function(v)
        InfiniteJumpEnabled = v
    end,
})


---------------------------------------------------------
-- WALKSPEED SLIDER
---------------------------------------------------------
MainTab:CreateSlider({
    Name = "Walkspeed",
    Range = {16, 250},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "WalkspeedValueSave",
    Callback = function(v)
        local lp = game.Players.LocalPlayer
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = v end
    end,
})


---------------------------------------------------------
-- JUMPPOWER SLIDER
---------------------------------------------------------
MainTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 500},
    Increment = 10,
    Suffix = "Power",
    CurrentValue = 50,
    Flag = "JumpPowerValueSave",
    Callback = function(v)
        local lp = game.Players.LocalPlayer
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = v end
    end,
})


---------------------------------------------------------
-- FIELD OF VIEW SLIDER
---------------------------------------------------------
MainTab:CreateSlider({
    Name = "Field of View",
    Range = {60, 120},
    Increment = 1,
    Suffix = "FOV",
    CurrentValue = 70,
    Flag = "FOV_Save",
    Callback = function(v)
        workspace.CurrentCamera.FieldOfView = v
    end,
})


---------------------------------------------------------
-- CHARACTER TRANSPARENCY SLIDER
---------------------------------------------------------
MainTab:CreateSlider({
    Name = "Character Transparency",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "",
    CurrentValue = 0,
    Flag = "Transparency_Save",
    Callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if not char then return end
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = v
            end
        end
    end,
})


---------------------------------------------------------
-- CAMERA MAX ZOOM SLIDER
---------------------------------------------------------
MainTab:CreateSlider({
    Name = "Max Camera Zoom",
    Range = {10, 200},
    Increment = 5,
    Suffix = "",
    CurrentValue = 50,
    Flag = "Zoom_Save",
    Callback = function(v)
        local p = game.Players.LocalPlayer
        p.CameraMaxZoomDistance = v
        p.CameraMinZoomDistance = 0.5
    end,
})


---------------------------------------------------------
-- AUTO RESPAWN TOGGLE
---------------------------------------------------------
local autoRespawn = false

MainTab:CreateToggle({
    Name = "Auto Respawn",
    CurrentValue = false,
    Flag = "AutoRespawn_Save",
    Callback = function(v)
        autoRespawn = v
    end,
})

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    if autoRespawn then
        task.wait(1)
        local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = 0 end
    end
end)


---------------------------------------------------------
-- SPIN BUTTON
---------------------------------------------------------
MainTab:CreateButton({
    Name = "Spin (1 second)",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        
        for i = 1, 50 do
            root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(20), 0)
            task.wait(0.02)
        end
    end,
})


---------------------------------------------------------
-- SIT BUTTON
---------------------------------------------------------
MainTab:CreateButton({
    Name = "Sit",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.Sit = true end
    end,
})


---------------------------------------------------------
-- FIRST PERSON LOCK
---------------------------------------------------------
local fpLock = false

MainTab:CreateToggle({
    Name = "Force First Person",
    CurrentValue = false,
    Flag = "FP_Save",
    Callback = function(v)
        fpLock = v
        local p = game.Players.LocalPlayer
        if v then
            p.CameraMode = Enum.CameraMode.LockFirstPerson
        else
            p.CameraMode = Enum.CameraMode.Classic
        end
    end,
})
