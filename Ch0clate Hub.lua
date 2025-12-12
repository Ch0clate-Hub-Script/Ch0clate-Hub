local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local MainWindow = Rayfield:CreateWindow({
   Name = "Ch0clate Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading Ch0clate Hub...",
   LoadingSubtitle = "by Ch0clate",
   ShowText = "Choclate Hub", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Ch0clate Hub" -- The name of the configuration file (without extension)
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Ch0clate key system",
      Subtitle = "Key System",
      Note = "Free Key: Ch0clate, WARNING this key might get changed", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Ch0clate"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})


local MainTab = MainWindow:CreateTab("Main", 4483362458) -- Title, Image


local Button = MainTab:CreateButton({
   Name = "Test Button",
   Callback = function()
   -- The function that takes place when the button is pressed
   end,
})




local Toggle = MainTab:CreateToggle({
   Name = "Ifinite jump [W?]",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(InfiniteJumpEnabled)
      local InfiniteJumpEnabled = true
      game:GetService("UserInputService").JumpRequest:Connect(function()
          if InfiniteJumpEnabled then
              game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
          end
      end)
   end,
})


local Slider = MainTab:CreateSlider({
   Name = "Walkspeed",
   Range = {16, 250},
   Increment = 10,
   Suffix = "Walksoeed",
   CurrentValue = 10,
   Flag = "Walkspeed Value save", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(v)
   game.Players.Localplayer.Character.Humanoid.WalkSpeed = v
   end,
})




local Slider = MainTab:CreateSlider({
   Name = "JumpPower",
   Range = {50, 500},
   Increment = 10,
   Suffix = "JumpPower",
   CurrentValue = 10,
   Flag = "Jump power value save", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(v)
   game.Players.place.Character.Humanoid.JumpPower = v
   end,
})
