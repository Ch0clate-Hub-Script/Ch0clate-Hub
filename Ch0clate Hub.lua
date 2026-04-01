
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

local MovementTab = Window:Tab({
    Title = "Movement",
    Icon = "bird",
    Locked = false,
})

MovementTab:Button({
    Title = "Fly Script",
    Desc = "Float in the air and move freely.",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end
})
