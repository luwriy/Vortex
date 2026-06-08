local Vortex = loadstring(readfile("main.lua"))()

local Window = Vortex:CreateWindow({
    Title = "Versus Airlines",
    SubTitle = "v1.0.0",
    MinimizeText = "Versus Airlines",
    FolderCallback = function()
        print("Folder button clicked")
    end,
    TrashCallback = function()
        print("Trash button clicked")
    end,
    BugCallback = function()
        print("Bug button clicked")
    end,
    ThemeCallback = function()
        print("Theme button clicked")
    end
})

local MainTab = Window:AddTab({ Title = "Main" })
local UpgradesTab = Window:AddTab({ Title = "Upgrades" })
local RewardsTab = Window:AddTab({ Title = "Rewards", Icon = "rbxassetid://10734950309" })
local PlayerTab = Window:AddTab({ Title = "Local Player" })
local PerformanceTab = Window:AddTab({ Title = "FPS / Performance" })

local RewardsSection = RewardsTab:AddSection("Extra Useful Features")

local Toggle1 = RewardsSection:AddToggle("RedeemDrops", {
    Title = "Auto Redeem Cash Drops",
    Default = false
})

Toggle1:OnChanged(function(value)
    print("Auto Redeem Cash Drops changed:", value)
end)

local Toggle2 = RewardsSection:AddToggle("UseVines", {
    Title = "Auto Use Cash Vines",
    Default = false
})

Toggle2:OnChanged(function(value)
    print("Auto Use Cash Vines changed:", value)
end)

local Toggle3 = RewardsSection:AddToggle("ClickFruit", {
    Title = "Auto Click Fruit / Click Hints",
    Default = false
})

Toggle3:OnChanged(function(value)
    print("Auto Click Fruit changed:", value)
end)

local Slider1 = RewardsSection:AddSlider("PhoneRaises", {
    Title = "Phone Offer Raises",
    Min = 1,
    Max = 10,
    Default = 2,
    Rounding = 1
})

Slider1:OnChanged(function(value)
    print("Phone Offer Raises changed:", value)
end)

local Toggle4 = RewardsSection:AddToggle("PhoneOffers", {
    Title = "Auto Raise + Accept Phone Offers",
    Default = false,
    Info = "Automatically raises and accepts phone offers."
})

Toggle4:OnChanged(function(value)
    print("Auto Raise + Accept Phone Offers changed:", value)
end)

local PlayerSection = PlayerTab:AddSection("Player Settings")

local Slider2 = PlayerSection:AddSlider("WalkSpeed", {
    Title = "WalkSpeed",
    Min = 16,
    Max = 100,
    Default = 16,
    Rounding = 1
})

Slider2:OnChanged(function(value)
    print("WalkSpeed changed:", value)
end)

local Slider3 = PlayerSection:AddSlider("JumpPower", {
    Title = "JumpPower",
    Min = 50,
    Max = 200,
    Default = 50,
    Rounding = 5
})

Slider3:OnChanged(function(value)
    print("JumpPower changed:", value)
end)

local UtilitiesSection = MainTab:AddSection("Universal Utilities")

local Button1 = UtilitiesSection:AddButton({
    Title = "Destroy Lobby",
    Callback = function()
        print("Lobby destroyed button pressed")
    end
})

local Dropdown1 = UtilitiesSection:AddDropdown("TeleportDest", {
    Title = "Teleport Destination",
    Values = {"Lobby", "Farm", "Shop", "VIP Area"},
    Default = "Lobby"
})

Dropdown1:OnChanged(function(value)
    print("Teleport destination set to:", value)
end)

local Input1 = UtilitiesSection:AddInput("AnnTitle", {
    Title = "Announcement Title",
    Placeholder = "Type announcement...",
    Default = ""
})

Input1:OnChanged(function(value)
    print("Announcement title set to:", value)
end)

local Keybind1 = UtilitiesSection:AddKeybind("DestructKey", {
    Title = "Self Destruct Keybind",
    Default = Enum.KeyCode.K
})

Keybind1:OnChanged(function(value)
    print("Self destruct hotkey triggered using:", value.Name)
end)

local Colorpicker1 = UtilitiesSection:AddColorpicker("ESPColor", {
    Title = "ESP Box Color",
    Default = Color3.fromRGB(255, 75, 75)
})

Colorpicker1:OnChanged(function(value)
    print("ESP Box color changed to RGB:", value.R * 255, value.G * 255, value.B * 255)
end)
