local Vortex = loadstring(readfile("main.lua"))()

local Window = Vortex:CreateWindow({
    Title = "Versus Airlines",
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

local MainTab = Window:CreateTab("Main")
local UpgradesTab = Window:CreateTab("Upgrades")
local RewardsTab = Window:CreateTab("Rewards")
local PlayerTab = Window:CreateTab("Local Player")
local PerformanceTab = Window:CreateTab("FPS / Performance")

local RewardsSection = RewardsTab:CreateSection("Extra Useful Features")

RewardsSection:CreateToggle({
    Name = "Auto Redeem Cash Drops",
    Default = false,
    Callback = function(value)
        print("Auto Redeem Cash Drops:", value)
    end
})

RewardsSection:CreateToggle({
    Name = "Auto Use Cash Vines",
    Default = false,
    Callback = function(value)
        print("Auto Use Cash Vines:", value)
    end
})

RewardsSection:CreateToggle({
    Name = "Auto Click Fruit / Click Hints",
    Default = false,
    Callback = function(value)
        print("Auto Click Fruit:", value)
    end
})

RewardsSection:CreateSlider({
    Name = "Phone Offer Raises",
    Min = 1,
    Max = 10,
    Default = 2,
    Step = 1,
    Callback = function(value)
        print("Phone Offer Raises level:", value)
    end
})

RewardsSection:CreateToggle({
    Name = "Auto Raise + Accept Phone Offers",
    Default = false,
    Info = "Automatically raises and accepts phone offers.",
    Callback = function(value)
        print("Auto Raise + Accept Phone Offers:", value)
    end
})

local PlayerSection = PlayerTab:CreateSection("Player Settings")

PlayerSection:CreateSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 100,
    Default = 16,
    Step = 1,
    Callback = function(value)
        print("WalkSpeed set to:", value)
    end
})

PlayerSection:CreateSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 200,
    Default = 50,
    Step = 5,
    Callback = function(value)
        print("JumpPower set to:", value)
    end
})

local UtilitiesSection = MainTab:CreateSection("Universal Utilities")

UtilitiesSection:CreateButton({
    Name = "Destroy Lobby",
    Callback = function()
        print("Lobby destroyed")
    end
})

UtilitiesSection:CreateDropdown({
    Name = "Teleport Destination",
    List = {"Lobby", "Farm", "Shop", "VIP Area"},
    Default = "Lobby",
    Callback = function(value)
        print("Teleporting to:", value)
    end
})

UtilitiesSection:CreateTextBox({
    Name = "Announcement Title",
    Placeholder = "Type announcement...",
    Callback = function(text, enter)
        print("Announcement text:", text, "Pressed enter:", enter)
    end
})

UtilitiesSection:CreateKeybind({
    Name = "Self Destruct Keybind",
    Default = Enum.KeyCode.K,
    Callback = function(key)
        print("Keybound bound to:", key.Name)
    end
})
