local Vortex = {
    Options = {}
}

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function GetGuiParent()
    local success, parent = pcall(function()
        return CoreGui
    end)
    if success and parent then
        return parent
    end
    return LocalPlayer:WaitForChild("PlayerGui")
end

local function Tween(object, info, properties)
    local tween = TweenService:Create(object, TweenInfo.new(unpack(info)), properties)
    tween:Play()
    return tween
end

local function CreateShadow(parent)
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    shadow.Size = UDim2.new(1, 30, 1, 30)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://6014261993"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.5
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    shadow.Parent = parent
    return shadow
end

local function SanitizeName(name)
    local sanitized = string.gsub(name, "[%s%p]", "_")
    return sanitized
end

local function GetHoverColor(color)
    local h, s, v = color:ToHSV()
    if v > 0.5 then
        return Color3.fromHSV(h, s, math.clamp(v - 0.1, 0, 1))
    else
        return Color3.fromHSV(h, s, math.clamp(v + 0.1, 0, 1))
    end
end

function Vortex:CreateWindow(options)
    options = options or {}
    local window
    local TitleText = options.Title or "Vortex"
    local SubTitleText = options.SubTitle or ""
    local MinimizeText = options.MinimizeText or "Vortex"
    
    local FolderCallback = options.FolderCallback
    local TrashCallback = options.TrashCallback
    local BugCallback = options.BugCallback
    local ThemeCallback = options.ThemeCallback

    local ConfigFolder = "Vortex_" .. SanitizeName(TitleText)

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "VortexGui"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = GetGuiParent()

    local TooltipFrame = Instance.new("Frame")
    TooltipFrame.Name = "Tooltip"
    TooltipFrame.Size = UDim2.new(0, 160, 0, 32)
    TooltipFrame.BackgroundColor3 = Color3.fromRGB(15, 17, 25)
    TooltipFrame.BorderSizePixel = 0
    TooltipFrame.Visible = false
    TooltipFrame.ZIndex = 100
    TooltipFrame.Parent = ScreenGui

    local TooltipCorner = Instance.new("UICorner")
    TooltipCorner.CornerRadius = UDim.new(0, 6)
    TooltipCorner.Parent = TooltipFrame

    local TooltipStroke = Instance.new("UIStroke")
    TooltipStroke.Color = Color3.fromRGB(58, 147, 255)
    TooltipStroke.Thickness = 1
    TooltipStroke.Parent = TooltipFrame

    local TooltipLabel = Instance.new("TextLabel")
    TooltipLabel.Size = UDim2.new(1, -12, 1, 0)
    TooltipLabel.Position = UDim2.new(0, 6, 0, 0)
    TooltipLabel.BackgroundTransparency = 1
    TooltipLabel.Font = Enum.Font.Gotham
    TooltipLabel.TextSize = 11
    TooltipLabel.TextColor3 = Color3.fromRGB(200, 205, 220)
    TooltipLabel.TextWrapped = true
    TooltipLabel.TextXAlignment = Enum.TextXAlignment.Center
    TooltipLabel.TextYAlignment = Enum.TextYAlignment.Center
    TooltipLabel.Parent = TooltipFrame

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 550, 0, 360)
    MainFrame.Position = UDim2.new(0.5, -275, 0.5, -180)
    MainFrame.BackgroundColor3 = Color3.fromRGB(18, 20, 29)
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 10)
    MainCorner.Parent = MainFrame

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = Color3.fromRGB(26, 30, 44)
    MainStroke.Thickness = 1.2
    MainStroke.Parent = MainFrame

    local MainShadow = CreateShadow(MainFrame)



    local SidebarFrame = Instance.new("Frame")
    SidebarFrame.Name = "Sidebar"
    SidebarFrame.Size = UDim2.new(0, 125, 1, -20)
    SidebarFrame.Position = UDim2.new(0, 10, 0, 10)
    SidebarFrame.BackgroundColor3 = Color3.fromRGB(22, 25, 36)
    SidebarFrame.BorderSizePixel = 0
    SidebarFrame.Parent = MainFrame

    local SidebarCorner = Instance.new("UICorner")
    SidebarCorner.CornerRadius = UDim.new(0, 8)
    SidebarCorner.Parent = SidebarFrame

    local SidebarStroke = Instance.new("UIStroke")
    SidebarStroke.Color = Color3.fromRGB(33, 38, 54)
    SidebarStroke.Thickness = 1
    SidebarStroke.Parent = SidebarFrame

    local SearchContainer = Instance.new("Frame")
    SearchContainer.Name = "SearchContainer"
    SearchContainer.Size = UDim2.new(1, -16, 0, 24)
    SearchContainer.Position = UDim2.new(0, 8, 0, 8)
    SearchContainer.BackgroundColor3 = Color3.fromRGB(28, 32, 45)
    SearchContainer.BorderSizePixel = 0
    SearchContainer.Parent = SidebarFrame

    local SearchCorner = Instance.new("UICorner")
    SearchCorner.CornerRadius = UDim.new(0, 6)
    SearchCorner.Parent = SearchContainer

    local SearchStroke = Instance.new("UIStroke")
    SearchStroke.Color = Color3.fromRGB(40, 46, 64)
    SearchStroke.Thickness = 1
    SearchStroke.Parent = SearchContainer

    local SearchBox = Instance.new("TextBox")
    SearchBox.Size = UDim2.new(1, -12, 1, 0)
    SearchBox.Position = UDim2.new(0, 6, 0, 0)
    SearchBox.BackgroundTransparency = 1
    SearchBox.Font = Enum.Font.Gotham
    SearchBox.TextSize = 12
    SearchBox.TextColor3 = Color3.fromRGB(240, 240, 240)
    SearchBox.PlaceholderColor3 = Color3.fromRGB(120, 125, 140)
    SearchBox.PlaceholderText = "Search..."
    SearchBox.Text = ""
    SearchBox.TextXAlignment = Enum.TextXAlignment.Left
    SearchBox.ClearTextOnFocus = false
    SearchBox.Parent = SearchContainer

    local TabScroll = Instance.new("ScrollingFrame")
    TabScroll.Name = "Tabs"
    TabScroll.Size = UDim2.new(1, -16, 1, -80)
    TabScroll.Position = UDim2.new(0, 8, 0, 40)
    TabScroll.BackgroundTransparency = 1
    TabScroll.BorderSizePixel = 0
    TabScroll.ScrollBarThickness = 0
    TabScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    TabScroll.Parent = SidebarFrame

    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 6)
    TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabListLayout.Parent = TabScroll

    local FooterFrame = Instance.new("Frame")
    FooterFrame.Name = "Footer"
    FooterFrame.Size = UDim2.new(1, -16, 0, 24)
    FooterFrame.Position = UDim2.new(0, 8, 1, -32)
    FooterFrame.BackgroundTransparency = 1
    FooterFrame.Parent = SidebarFrame

    local FooterListLayout = Instance.new("UIListLayout")
    FooterListLayout.FillDirection = Enum.FillDirection.Horizontal
    FooterListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    FooterListLayout.Padding = UDim.new(0, 6)
    FooterListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    FooterListLayout.Parent = FooterFrame

    local function AddFooterButton(color, iconId, callback)
        local btn = Instance.new("ImageButton")
        btn.Size = UDim2.new(0, 20, 0, 20)
        btn.BorderSizePixel = 0
        btn.Image = iconId
        btn.ImageColor3 = color
        btn.ScaleType = Enum.ScaleType.Fit
        
        local padding = Instance.new("UIPadding")
        padding.PaddingTop = UDim.new(0, 3)
        padding.PaddingBottom = UDim.new(0, 3)
        padding.PaddingLeft = UDim.new(0, 3)
        padding.PaddingRight = UDim.new(0, 3)
        padding.Parent = btn

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 5)
        btnCorner.Parent = btn

        local btnStroke = Instance.new("UIStroke")
        btnStroke.Thickness = 1
        btnStroke.Parent = btn

        window:RegisterTheme(btn, "BackgroundColor3", "Element")
        window:RegisterTheme(btnStroke, "Color", "Border")

        btn.MouseEnter:Connect(function()
            Tween(btn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = GetHoverColor(window.CurrentTheme.Element)})
            Tween(btnStroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = color})
        end)

        btn.MouseLeave:Connect(function()
            Tween(btn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = window.CurrentTheme.Element})
            Tween(btnStroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = window.CurrentTheme.Border})
        end)

        btn.MouseButton1Click:Connect(function()
            if callback then
                callback()
            end
        end)

        btn.Parent = FooterFrame
        return btn
    end

    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "Content"
    ContentContainer.Size = UDim2.new(1, -155, 1, -20)
    ContentContainer.Position = UDim2.new(0, 145, 0, 10)
    ContentContainer.BackgroundColor3 = Color3.fromRGB(22, 25, 36)
    ContentContainer.BorderSizePixel = 0
    ContentContainer.Parent = MainFrame

    local ContentCorner = Instance.new("UICorner")
    ContentCorner.CornerRadius = UDim.new(0, 8)
    ContentCorner.Parent = ContentContainer

    local ContentStroke = Instance.new("UIStroke")
    ContentStroke.Color = Color3.fromRGB(33, 38, 54)
    ContentStroke.Thickness = 1
    ContentStroke.Parent = ContentContainer

    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Size = UDim2.new(0, 120, 0, 30)
    MinimizeButton.Position = UDim2.new(1, -130, 1, -40)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(22, 25, 36)
    MinimizeButton.BorderSizePixel = 0
    MinimizeButton.Font = Enum.Font.GothamMedium
    MinimizeButton.Text = MinimizeText
    MinimizeButton.TextColor3 = Color3.fromRGB(240, 240, 240)
    MinimizeButton.TextSize = 12
    MinimizeButton.Parent = ScreenGui

    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(0, 6)
    MinimizeCorner.Parent = MinimizeButton

    local MinimizeStroke = Instance.new("UIStroke")
    MinimizeStroke.Color = Color3.fromRGB(33, 38, 54)
    MinimizeStroke.Thickness = 1
    MinimizeStroke.Parent = MinimizeButton

    local function MakeDraggable(frame)
        local frameDragging = false
        local dragStart, startPos
        frame.Active = true
        frame.InputBegan:Connect(function(input, processed)
            if not processed and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                frameDragging = true
                dragStart = input.Position
                startPos = frame.Position
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if frameDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart
                frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                frameDragging = false
            end
        end)
    end

    local function MakeButtonDraggable(btn, clickCallback)
        local buttonDragging = false
        local dragStart, startPos
        local dragDistance = 0
        btn.Active = true
        btn.InputBegan:Connect(function(input, processed)
            if not processed and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                buttonDragging = true
                dragDistance = 0
                dragStart = input.Position
                startPos = btn.Position
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if buttonDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart
                dragDistance = dragDistance + delta.Magnitude
                btn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                if buttonDragging then
                    buttonDragging = false
                    if dragDistance < 5 then
                        clickCallback()
                    end
                end
            end
        end)
    end

    MakeDraggable(MainFrame)

    local isMinimized = false

    MinimizeButton.MouseEnter:Connect(function()
        Tween(MinimizeButton, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = GetHoverColor(window.CurrentTheme.Container)})
    end)

    MinimizeButton.MouseLeave:Connect(function()
        Tween(MinimizeButton, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = window.CurrentTheme.Container})
    end)

    MakeButtonDraggable(MinimizeButton, function()
        isMinimized = not isMinimized
        MainFrame.Visible = not isMinimized
    end)

    window = {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        Tabs = {},
        CurrentTab = nil,
        TooltipFrame = TooltipFrame,
        TooltipLabel = TooltipLabel,
        ThemeObjects = {},
        Unloaded = false,
        HUDFrame = nil,
        HUDConnection = nil,
        Themes = {
            Dark = {
                MainFrame = Color3.fromRGB(18, 20, 29),
                Container = Color3.fromRGB(22, 25, 36),
                Element = Color3.fromRGB(28, 32, 45),
                Border = Color3.fromRGB(40, 46, 64),
                Text = Color3.fromRGB(240, 240, 240),
                MutedText = Color3.fromRGB(150, 155, 170),
                Accent = Color3.fromRGB(58, 147, 255)
            },
            Darker = {
                MainFrame = Color3.fromRGB(12, 14, 20),
                Container = Color3.fromRGB(16, 18, 26),
                Element = Color3.fromRGB(22, 25, 36),
                Border = Color3.fromRGB(33, 38, 54),
                Text = Color3.fromRGB(230, 230, 230),
                MutedText = Color3.fromRGB(130, 135, 150),
                Accent = Color3.fromRGB(72, 138, 182)
            },
            Light = {
                MainFrame = Color3.fromRGB(240, 240, 240),
                Container = Color3.fromRGB(248, 248, 248),
                Element = Color3.fromRGB(255, 255, 255),
                Border = Color3.fromRGB(200, 200, 200),
                Text = Color3.fromRGB(30, 30, 30),
                MutedText = Color3.fromRGB(100, 100, 100),
                Accent = Color3.fromRGB(0, 103, 192)
            },
            Rose = {
                MainFrame = Color3.fromRGB(30, 18, 22),
                Container = Color3.fromRGB(36, 22, 27),
                Element = Color3.fromRGB(45, 28, 34),
                Border = Color3.fromRGB(64, 40, 48),
                Text = Color3.fromRGB(240, 230, 230),
                MutedText = Color3.fromRGB(170, 150, 155),
                Accent = Color3.fromRGB(180, 55, 90)
            },
            Amethyst = {
                MainFrame = Color3.fromRGB(20, 18, 28),
                Container = Color3.fromRGB(25, 22, 35),
                Element = Color3.fromRGB(32, 28, 45),
                Border = Color3.fromRGB(48, 40, 64),
                Text = Color3.fromRGB(240, 235, 240),
                MutedText = Color3.fromRGB(165, 150, 170),
                Accent = Color3.fromRGB(142, 68, 173)
            },
            Aqua = {
                MainFrame = Color3.fromRGB(16, 24, 28),
                Container = Color3.fromRGB(20, 30, 35),
                Element = Color3.fromRGB(25, 38, 45),
                Border = Color3.fromRGB(38, 56, 66),
                Text = Color3.fromRGB(230, 240, 240),
                MutedText = Color3.fromRGB(150, 165, 165),
                Accent = Color3.fromRGB(26, 188, 156)
            }
        },
        AccentColors = {
            Color3.fromRGB(58, 147, 255),
            Color3.fromRGB(46, 204, 113),
            Color3.fromRGB(230, 126, 34),
            Color3.fromRGB(232, 67, 147),
            Color3.fromRGB(155, 89, 182)
        },
        AccentIndex = 1
    }

    window.CurrentTheme = window.Themes.Dark
    window.ThemeName = "Dark"

    function window:RegisterTheme(object, property, themeKey, condition, fallback)
        table.insert(self.ThemeObjects, {
            Object = object,
            Property = property,
            Key = themeKey,
            Condition = condition,
            Fallback = fallback
        })
        if not condition or condition() then
            object[property] = self.CurrentTheme[themeKey]
        elseif fallback then
            if type(fallback) == "string" then
                object[property] = self.CurrentTheme[fallback]
            else
                object[property] = fallback
            end
        end
    end

    function window:UpdateThemeObject(object)
        for _, item in ipairs(self.ThemeObjects) do
            if item.Object == object then
                pcall(function()
                    if not item.Condition or item.Condition() then
                        item.Object[item.Property] = self.CurrentTheme[item.Key]
                    elseif item.Fallback then
                        if type(item.Fallback) == "string" then
                            item.Object[item.Property] = self.CurrentTheme[item.Fallback]
                        else
                            item.Object[item.Property] = item.Fallback
                        end
                    end
                end)
            end
        end
    end

    function window:SetTheme(themeName)
        local theme = self.Themes[themeName]
        if not theme then return end
        self.CurrentTheme = theme
        self.ThemeName = themeName
        
        for _, item in ipairs(self.ThemeObjects) do
            pcall(function()
                if not item.Condition or item.Condition() then
                    item.Object[item.Property] = theme[item.Key]
                elseif item.Fallback then
                    if type(item.Fallback) == "string" then
                        item.Object[item.Property] = theme[item.Fallback]
                    else
                        item.Object[item.Property] = item.Fallback
                    end
                end
            end)
        end
        
        for _, opt in pairs(Vortex.Options) do
            if opt.Type == "Toggle" then
                opt:UpdateVisual(false)
            elseif opt.Type == "Slider" then
                opt.Fill.BackgroundColor3 = theme.Accent
            end
        end
        
        for _, t in ipairs(self.Tabs) do
            self:UpdateThemeObject(t.Button)
            self:UpdateThemeObject(t.Stroke)
            self:UpdateThemeObject(t.Label)
            if t.Button:FindFirstChildOfClass("ImageLabel") then
                self:UpdateThemeObject(t.Button:FindFirstChildOfClass("ImageLabel"))
            end
        end
    end

    window:RegisterTheme(MainFrame, "BackgroundColor3", "MainFrame")
    window:RegisterTheme(MainStroke, "Color", "Border")
    window:RegisterTheme(SidebarFrame, "BackgroundColor3", "Container")
    window:RegisterTheme(SidebarStroke, "Color", "Border")
    window:RegisterTheme(ContentContainer, "BackgroundColor3", "Container")
    window:RegisterTheme(ContentStroke, "Color", "Border")
    window:RegisterTheme(SearchContainer, "BackgroundColor3", "Element")
    window:RegisterTheme(SearchStroke, "Color", "Border")
    window:RegisterTheme(SearchBox, "TextColor3", "Text")
    window:RegisterTheme(SearchBox, "PlaceholderColor3", "MutedText")
    window:RegisterTheme(MinimizeButton, "BackgroundColor3", "Container")
    window:RegisterTheme(MinimizeStroke, "Color", "Border")
    window:RegisterTheme(MinimizeButton, "TextColor3", "Text")
    window:RegisterTheme(TooltipFrame, "BackgroundColor3", "MainFrame")
    window:RegisterTheme(TooltipStroke, "Color", "Accent")
    window:RegisterTheme(TooltipLabel, "TextColor3", "Text")


    function window:Notify(titleText, contentText)
        local NotifyFrame = Instance.new("Frame")
        NotifyFrame.Size = UDim2.new(0, 220, 0, 55)
        NotifyFrame.Position = UDim2.new(1, 30, 1, -75)
        NotifyFrame.BackgroundColor3 = self.CurrentTheme.Container
        NotifyFrame.BorderSizePixel = 0
        NotifyFrame.Parent = ScreenGui
        
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 6)
        Corner.Parent = NotifyFrame
        
        local Stroke = Instance.new("UIStroke")
        Stroke.Color = self.CurrentTheme.Accent
        Stroke.Thickness = 1
        Stroke.Parent = NotifyFrame
        
        CreateShadow(NotifyFrame)
        
        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, -24, 0, 20)
        Title.Position = UDim2.new(0, 12, 0, 6)
        Title.BackgroundTransparency = 1
        Title.Font = Enum.Font.GothamBold
        Title.Text = titleText
        Title.TextColor3 = self.CurrentTheme.Text
        Title.TextSize = 12
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.Parent = NotifyFrame
        
        local Content = Instance.new("TextLabel")
        Content.Size = UDim2.new(1, -24, 0, 20)
        Content.Position = UDim2.new(0, 12, 0, 24)
        Content.BackgroundTransparency = 1
        Content.Font = Enum.Font.Gotham
        Content.Text = contentText
        Content.TextColor3 = self.CurrentTheme.MutedText
        Content.TextSize = 11
        Content.TextXAlignment = Enum.TextXAlignment.Left
        Content.Parent = NotifyFrame
        
        window:RegisterTheme(NotifyFrame, "BackgroundColor3", "Container")
        window:RegisterTheme(Stroke, "Color", "Accent")
        window:RegisterTheme(Title, "TextColor3", "Text")
        window:RegisterTheme(Content, "TextColor3", "MutedText")

        Tween(NotifyFrame, {0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Position = UDim2.new(1, -235, 1, -75)})
        task.delay(3, function()
            local t = Tween(NotifyFrame, {0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In}, {Position = UDim2.new(1, 30, 1, -75)})
            t.Completed:Connect(function()
                NotifyFrame:Destroy()
            end)
        end)
    end

    function window:Dialog(titleText, contentText, yesCallback)
        local Overlay = Instance.new("TextButton")
        Overlay.Size = UDim2.new(1, 0, 1, 0)
        Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Overlay.BackgroundTransparency = 0.5
        Overlay.Text = ""
        Overlay.AutoButtonColor = false
        Overlay.Parent = MainFrame
        
        local DialogFrame = Instance.new("Frame")
        DialogFrame.Size = UDim2.new(0, 280, 0, 130)
        DialogFrame.Position = UDim2.new(0.5, -140, 0.5, -65)
        DialogFrame.BackgroundColor3 = self.CurrentTheme.MainFrame
        DialogFrame.BorderSizePixel = 0
        DialogFrame.Parent = Overlay
        
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 8)
        Corner.Parent = DialogFrame
        
        local Stroke = Instance.new("UIStroke")
        Stroke.Color = self.CurrentTheme.Accent
        Stroke.Thickness = 1.2
        Stroke.Parent = DialogFrame
        
        CreateShadow(DialogFrame)
        
        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, -24, 0, 30)
        Title.Position = UDim2.new(0, 12, 0, 10)
        Title.BackgroundTransparency = 1
        Title.Font = Enum.Font.GothamBold
        Title.Text = titleText
        Title.TextColor3 = self.CurrentTheme.Text
        Title.TextSize = 14
        Title.TextXAlignment = Enum.TextXAlignment.Center
        Title.Parent = DialogFrame
        
        local Content = Instance.new("TextLabel")
        Content.Size = UDim2.new(1, -24, 0, 40)
        Content.Position = UDim2.new(0, 12, 0, 40)
        Content.BackgroundTransparency = 1
        Content.Font = Enum.Font.Gotham
        Content.Text = contentText
        Content.TextColor3 = self.CurrentTheme.MutedText
        Content.TextSize = 12
        Content.TextWrapped = true
        Content.TextXAlignment = Enum.TextXAlignment.Center
        Content.Parent = DialogFrame
        
        local YesBtn = Instance.new("TextButton")
        YesBtn.AnchorPoint = Vector2.new(0.5, 0.5)
        YesBtn.Size = UDim2.new(0, 100, 0, 28)
        YesBtn.Position = UDim2.new(0.5, -60, 1, -24)
        YesBtn.BackgroundColor3 = self.CurrentTheme.Container
        YesBtn.BorderSizePixel = 0
        YesBtn.Font = Enum.Font.GothamMedium
        YesBtn.Text = "Yes"
        YesBtn.TextColor3 = self.CurrentTheme.Text
        YesBtn.TextSize = 12
        YesBtn.Parent = DialogFrame
        
        local YesCorner = Instance.new("UICorner")
        YesCorner.CornerRadius = UDim.new(0, 5)
        YesCorner.Parent = YesBtn
        
        local YesStroke = Instance.new("UIStroke")
        YesStroke.Color = self.CurrentTheme.Border
        YesStroke.Thickness = 1
        YesStroke.Parent = YesBtn
        
        local NoBtn = Instance.new("TextButton")
        NoBtn.AnchorPoint = Vector2.new(0.5, 0.5)
        NoBtn.Size = UDim2.new(0, 100, 0, 28)
        NoBtn.Position = UDim2.new(0.5, 60, 1, -24)
        NoBtn.BackgroundColor3 = self.CurrentTheme.Container
        NoBtn.BorderSizePixel = 0
        NoBtn.Font = Enum.Font.GothamMedium
        NoBtn.Text = "No"
        NoBtn.TextColor3 = self.CurrentTheme.Text
        NoBtn.TextSize = 12
        NoBtn.Parent = DialogFrame
        
        local NoCorner = Instance.new("UICorner")
        NoCorner.CornerRadius = UDim.new(0, 5)
        NoCorner.Parent = NoBtn
        
        local NoStroke = Instance.new("UIStroke")
        NoStroke.Color = self.CurrentTheme.Border
        NoStroke.Thickness = 1
        NoStroke.Parent = NoBtn

        window:RegisterTheme(DialogFrame, "BackgroundColor3", "MainFrame")
        window:RegisterTheme(Stroke, "Color", "Accent")
        window:RegisterTheme(Title, "TextColor3", "Text")
        window:RegisterTheme(Content, "TextColor3", "MutedText")
        window:RegisterTheme(YesBtn, "BackgroundColor3", "Container")
        window:RegisterTheme(YesBtn, "TextColor3", "Text")
        window:RegisterTheme(YesStroke, "Color", "Border")
        window:RegisterTheme(NoBtn, "BackgroundColor3", "Container")
        window:RegisterTheme(NoBtn, "TextColor3", "Text")
        window:RegisterTheme(NoStroke, "Color", "Border")

        local function SetupDialogButton(btn, stroke, normalSize)
            btn.MouseEnter:Connect(function()
                Tween(btn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = GetHoverColor(self.CurrentTheme.Container)})
                Tween(stroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = self.CurrentTheme.Accent})
            end)
            btn.MouseLeave:Connect(function()
                Tween(btn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = self.CurrentTheme.Container})
                Tween(stroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = self.CurrentTheme.Border})
            end)
        end
        SetupDialogButton(YesBtn, YesStroke, UDim2.new(0, 100, 0, 28))
        SetupDialogButton(NoBtn, NoStroke, UDim2.new(0, 100, 0, 28))
        
        YesBtn.MouseButton1Click:Connect(function()
            Overlay:Destroy()
            if yesCallback then yesCallback() end
        end)
        
        NoBtn.MouseButton1Click:Connect(function()
            Overlay:Destroy()
        end)
    end

    function window:Unload()
        if self.HUDConnection then
            self.HUDConnection:Disconnect()
        end
        if self.HUDFrame then
            self.HUDFrame:Destroy()
        end
        self.Unloaded = true
        ScreenGui:Destroy()
        print("[Vortex] Unloaded successfully.")
        if TrashCallback then
            TrashCallback()
        end
    end

    function window:ToggleHUD()
        if self.HUDFrame then
            self.HUDFrame.Visible = not self.HUDFrame.Visible
            if self.HUDFrame.Visible then
                self:Notify("HUD Enabled", "Developer FPS & Ping HUD overlay enabled.")
            else
                self:Notify("HUD Disabled", "Developer FPS & Ping HUD overlay disabled.")
            end
            return
        end
        
        local HUDFrame = Instance.new("Frame")
        HUDFrame.Size = UDim2.new(0, 150, 0, 28)
        HUDFrame.Position = UDim2.new(0.5, -75, 0, 10)
        HUDFrame.BackgroundColor3 = self.CurrentTheme.MainFrame
        HUDFrame.BorderSizePixel = 0
        HUDFrame.ZIndex = 200
        HUDFrame.Parent = ScreenGui
        
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 6)
        Corner.Parent = HUDFrame
        
        local Stroke = Instance.new("UIStroke")
        Stroke.Color = self.CurrentTheme.Accent
        Stroke.Thickness = 1
        Stroke.Parent = HUDFrame
        
        CreateShadow(HUDFrame)
        
        local HUDLabel = Instance.new("TextLabel")
        HUDLabel.Size = UDim2.new(1, 0, 1, 0)
        HUDLabel.BackgroundTransparency = 1
        HUDLabel.Font = Enum.Font.GothamMedium
        HUDLabel.Text = "FPS: -- | Ping: --ms"
        HUDLabel.TextColor3 = self.CurrentTheme.Text
        HUDLabel.TextSize = 11
        HUDLabel.TextXAlignment = Enum.TextXAlignment.Center
        HUDLabel.Parent = HUDFrame

        self:RegisterTheme(HUDFrame, "BackgroundColor3", "MainFrame")
        self:RegisterTheme(Stroke, "Color", "Accent")
        self:RegisterTheme(HUDLabel, "TextColor3", "Text")

        local lastUpdate = tick()
        local frameCount = 0
        local fps = 60

        local hudConnection = RunService.RenderStepped:Connect(function()
            frameCount = frameCount + 1
            local now = tick()
            if now - lastUpdate >= 0.5 then
                fps = math.floor(frameCount / (now - lastUpdate))
                frameCount = 0
                lastUpdate = now
                local ping = math.floor(LocalPlayer:GetNetworkPing() * 1000)
                HUDLabel.Text = "FPS: " .. tostring(fps) .. " | Ping: " .. tostring(ping) .. "ms"
            end
        end)
        
        MakeDraggable(HUDFrame)

        self.HUDFrame = HUDFrame
        self.HUDConnection = hudConnection
        self:Notify("HUD Enabled", "Developer FPS & Ping HUD overlay enabled.")
        if BugCallback then
            BugCallback()
        end
    end

    function window:OpenThemeDialog()
        local Overlay = Instance.new("TextButton")
        Overlay.Size = UDim2.new(1, 0, 1, 0)
        Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Overlay.BackgroundTransparency = 0.5
        Overlay.Text = ""
        Overlay.AutoButtonColor = false
        Overlay.Parent = MainFrame
        
        local DialogFrame = Instance.new("Frame")
        DialogFrame.Size = UDim2.new(0, 300, 0, 180)
        DialogFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
        DialogFrame.BackgroundColor3 = self.CurrentTheme.MainFrame
        DialogFrame.BorderSizePixel = 0
        DialogFrame.ClipsDescendants = true
        DialogFrame.Parent = Overlay
        
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 8)
        Corner.Parent = DialogFrame
        
        local Stroke = Instance.new("UIStroke")
        Stroke.Color = self.CurrentTheme.Accent
        Stroke.Thickness = 1.2
        Stroke.Parent = DialogFrame
        
        CreateShadow(DialogFrame)
        
        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, -24, 0, 30)
        Title.Position = UDim2.new(0, 12, 0, 10)
        Title.BackgroundTransparency = 1
        Title.Font = Enum.Font.GothamBold
        Title.Text = "Theme Manager"
        Title.TextColor3 = self.CurrentTheme.Text
        Title.TextSize = 14
        Title.TextXAlignment = Enum.TextXAlignment.Center
        Title.Parent = DialogFrame

        local DropdownBtn = Instance.new("TextButton")
        DropdownBtn.Size = UDim2.new(1, -24, 0, 32)
        DropdownBtn.Position = UDim2.new(0, 12, 0, 50)
        DropdownBtn.BackgroundColor3 = self.CurrentTheme.Container
        DropdownBtn.BorderSizePixel = 0
        DropdownBtn.Font = Enum.Font.GothamMedium
        DropdownBtn.Text = "Current Theme: " .. self.ThemeName
        DropdownBtn.TextColor3 = self.CurrentTheme.Text
        DropdownBtn.TextSize = 12
        DropdownBtn.Parent = DialogFrame

        local DropdownCorner = Instance.new("UICorner")
        DropdownCorner.CornerRadius = UDim.new(0, 5)
        DropdownCorner.Parent = DropdownBtn

        local DropdownStroke = Instance.new("UIStroke")
        DropdownStroke.Color = self.CurrentTheme.Border
        DropdownStroke.Thickness = 1
        DropdownStroke.Parent = DropdownBtn

        local OptionsFrame = Instance.new("ScrollingFrame")
        OptionsFrame.Size = UDim2.new(1, -24, 0, 0)
        OptionsFrame.Position = UDim2.new(0, 12, 0, 86)
        OptionsFrame.BackgroundColor3 = self.CurrentTheme.Container
        OptionsFrame.BorderSizePixel = 0
        OptionsFrame.ScrollBarThickness = 0
        OptionsFrame.Visible = false
        OptionsFrame.ZIndex = 50
        OptionsFrame.Parent = DialogFrame

        local OptionsCorner = Instance.new("UICorner")
        OptionsCorner.CornerRadius = UDim.new(0, 5)
        OptionsCorner.Parent = OptionsFrame

        local OptionsStroke = Instance.new("UIStroke")
        OptionsStroke.Color = self.CurrentTheme.Border
        OptionsStroke.Thickness = 1
        OptionsStroke.Parent = OptionsFrame

        local OptionsLayout = Instance.new("UIListLayout")
        OptionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
        OptionsLayout.Padding = UDim.new(0, 4)
        OptionsLayout.Parent = OptionsFrame

        local selectedTheme = self.ThemeName

        self:RegisterTheme(DialogFrame, "BackgroundColor3", "MainFrame")
        self:RegisterTheme(Stroke, "Color", "Accent")
        self:RegisterTheme(Title, "TextColor3", "Text")
        self:RegisterTheme(DropdownBtn, "BackgroundColor3", "Container")
        self:RegisterTheme(DropdownBtn, "TextColor3", "Text")
        self:RegisterTheme(DropdownStroke, "Color", "Border")
        self:RegisterTheme(OptionsFrame, "BackgroundColor3", "Container")
        self:RegisterTheme(OptionsStroke, "Color", "Border")

        local open = false
        local function ToggleOptions()
            open = not open
            if open then
                OptionsFrame.Visible = true
                Tween(OptionsFrame, {0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Size = UDim2.new(1, -24, 0, 75)})
            else
                local t = Tween(OptionsFrame, {0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Size = UDim2.new(1, -24, 0, 0)})
                t.Completed:Connect(function()
                    OptionsFrame.Visible = false
                end)
            end
        end
        DropdownBtn.MouseButton1Click:Connect(ToggleOptions)

        local themeNames = {"Dark", "Darker", "Light", "Rose", "Amethyst", "Aqua"}
        for _, tName in ipairs(themeNames) do
            local OptBtn = Instance.new("TextButton")
            OptBtn.Size = UDim2.new(1, 0, 0, 24)
            OptBtn.BorderSizePixel = 0
            OptBtn.Font = Enum.Font.GothamMedium
            OptBtn.Text = tName
            OptBtn.TextSize = 11
            OptBtn.Parent = OptionsFrame

            local OptCorner = Instance.new("UICorner")
            OptCorner.CornerRadius = UDim.new(0, 4)
            OptCorner.Parent = OptBtn

            self:RegisterTheme(OptBtn, "BackgroundColor3", "Container")
            self:RegisterTheme(OptBtn, "TextColor3", "Text")

            OptBtn.MouseEnter:Connect(function()
                Tween(OptBtn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = GetHoverColor(self.CurrentTheme.Container)})
            end)
            OptBtn.MouseLeave:Connect(function()
                Tween(OptBtn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = self.CurrentTheme.Container})
            end)

            OptBtn.MouseButton1Click:Connect(function()
                selectedTheme = tName
                DropdownBtn.Text = "Theme: " .. tName
                ToggleOptions()
            end)
        end

        local ApplyBtn = Instance.new("TextButton")
        ApplyBtn.AnchorPoint = Vector2.new(0.5, 0.5)
        ApplyBtn.Size = UDim2.new(0, 110, 0, 30)
        ApplyBtn.Position = UDim2.new(0.5, -65, 1, -25)
        ApplyBtn.BackgroundColor3 = self.CurrentTheme.Container
        ApplyBtn.BorderSizePixel = 0
        ApplyBtn.Font = Enum.Font.GothamMedium
        ApplyBtn.Text = "Apply"
        ApplyBtn.TextColor3 = self.CurrentTheme.Text
        ApplyBtn.TextSize = 12
        ApplyBtn.Parent = DialogFrame

        local ApplyCorner = Instance.new("UICorner")
        ApplyCorner.CornerRadius = UDim.new(0, 5)
        ApplyCorner.Parent = ApplyBtn

        local ApplyStroke = Instance.new("UIStroke")
        ApplyStroke.Color = self.CurrentTheme.Border
        ApplyStroke.Thickness = 1
        ApplyStroke.Parent = ApplyBtn

        local CloseBtn = Instance.new("TextButton")
        CloseBtn.AnchorPoint = Vector2.new(0.5, 0.5)
        CloseBtn.Size = UDim2.new(0, 110, 0, 30)
        CloseBtn.Position = UDim2.new(0.5, 65, 1, -25)
        CloseBtn.BackgroundColor3 = self.CurrentTheme.Container
        CloseBtn.BorderSizePixel = 0
        CloseBtn.Font = Enum.Font.GothamMedium
        CloseBtn.Text = "Close"
        CloseBtn.TextColor3 = self.CurrentTheme.Text
        CloseBtn.TextSize = 12
        CloseBtn.Parent = DialogFrame

        local CloseCorner = Instance.new("UICorner")
        CloseCorner.CornerRadius = UDim.new(0, 5)
        CloseCorner.Parent = CloseBtn

        local CloseStroke = Instance.new("UIStroke")
        CloseStroke.Color = self.CurrentTheme.Border
        CloseStroke.Thickness = 1
        CloseStroke.Parent = CloseBtn

        self:RegisterTheme(ApplyBtn, "BackgroundColor3", "Container")
        self:RegisterTheme(ApplyBtn, "TextColor3", "Text")
        self:RegisterTheme(ApplyStroke, "Color", "Border")
        self:RegisterTheme(CloseBtn, "BackgroundColor3", "Container")
        self:RegisterTheme(CloseBtn, "TextColor3", "Text")
        self:RegisterTheme(CloseStroke, "Color", "Border")

        local function DialogButtonHover(btn, stroke, normalSize)
            btn.MouseEnter:Connect(function()
                Tween(btn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = GetHoverColor(self.CurrentTheme.Container)})
                Tween(stroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = self.CurrentTheme.Accent})
            end)
            btn.MouseLeave:Connect(function()
                Tween(btn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = self.CurrentTheme.Container})
                Tween(stroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = self.CurrentTheme.Border})
            end)
        end
        DialogButtonHover(ApplyBtn, ApplyStroke, UDim2.new(0, 110, 0, 30))
        DialogButtonHover(CloseBtn, CloseStroke, UDim2.new(0, 110, 0, 30))

        ApplyBtn.MouseButton1Click:Connect(function()
            self:SetTheme(selectedTheme)
            Overlay:Destroy()
            self:Notify("Theme Applied", "Successfully set interface theme to " .. selectedTheme)
            if ThemeCallback then
                ThemeCallback(selectedTheme)
            end
        end)

        CloseBtn.MouseButton1Click:Connect(function()
            Overlay:Destroy()
        end)
    end

    function window:OpenConfigDialog()
        local Overlay = Instance.new("TextButton")
        Overlay.Size = UDim2.new(1, 0, 1, 0)
        Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Overlay.BackgroundTransparency = 0.5
        Overlay.Text = ""
        Overlay.AutoButtonColor = false
        Overlay.Parent = MainFrame
        
        local DialogFrame = Instance.new("Frame")
        DialogFrame.Size = UDim2.new(0, 310, 0, 220)
        DialogFrame.Position = UDim2.new(0.5, -155, 0.5, -110)
        DialogFrame.BackgroundColor3 = self.CurrentTheme.MainFrame
        DialogFrame.BorderSizePixel = 0
        DialogFrame.ClipsDescendants = true
        DialogFrame.Parent = Overlay
        
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 8)
        Corner.Parent = DialogFrame
        
        local Stroke = Instance.new("UIStroke")
        Stroke.Color = self.CurrentTheme.Accent
        Stroke.Thickness = 1.2
        Stroke.Parent = DialogFrame
        
        CreateShadow(DialogFrame)
        
        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, -24, 0, 30)
        Title.Position = UDim2.new(0, 12, 0, 10)
        Title.BackgroundTransparency = 1
        Title.Font = Enum.Font.GothamBold
        Title.Text = "Configuration Manager"
        Title.TextColor3 = self.CurrentTheme.Text
        Title.TextSize = 14
        Title.TextXAlignment = Enum.TextXAlignment.Center
        Title.Parent = DialogFrame

        local InputFrame = Instance.new("Frame")
        InputFrame.Size = UDim2.new(1, -24, 0, 28)
        InputFrame.Position = UDim2.new(0, 12, 0, 46)
        InputFrame.BackgroundColor3 = self.CurrentTheme.Container
        InputFrame.BorderSizePixel = 0
        InputFrame.Parent = DialogFrame

        local InputCorner = Instance.new("UICorner")
        InputCorner.CornerRadius = UDim.new(0, 5)
        InputCorner.Parent = InputFrame

        local InputStroke = Instance.new("UIStroke")
        InputStroke.Color = self.CurrentTheme.Border
        InputStroke.Thickness = 1
        InputStroke.Parent = InputFrame

        local ConfigInput = Instance.new("TextBox")
        ConfigInput.Size = UDim2.new(1, -12, 1, 0)
        ConfigInput.Position = UDim2.new(0, 6, 0, 0)
        ConfigInput.BackgroundTransparency = 1
        ConfigInput.Font = Enum.Font.GothamMedium
        ConfigInput.Text = ""
        ConfigInput.PlaceholderText = "New Config Name..."
        ConfigInput.PlaceholderColor3 = self.CurrentTheme.MutedText
        ConfigInput.TextColor3 = self.CurrentTheme.Text
        ConfigInput.TextSize = 12
        ConfigInput.TextXAlignment = Enum.TextXAlignment.Left
        ConfigInput.Parent = InputFrame

        local DropdownBtn = Instance.new("TextButton")
        DropdownBtn.Size = UDim2.new(1, -24, 0, 28)
        DropdownBtn.Position = UDim2.new(0, 12, 0, 80)
        DropdownBtn.BackgroundColor3 = self.CurrentTheme.Container
        DropdownBtn.BorderSizePixel = 0
        DropdownBtn.Font = Enum.Font.GothamMedium
        DropdownBtn.Text = "Select Configuration..."
        DropdownBtn.TextColor3 = self.CurrentTheme.Text
        DropdownBtn.TextSize = 12
        DropdownBtn.Parent = DialogFrame

        local DropdownCorner = Instance.new("UICorner")
        DropdownCorner.CornerRadius = UDim.new(0, 5)
        DropdownCorner.Parent = DropdownBtn

        local DropdownStroke = Instance.new("UIStroke")
        DropdownStroke.Color = self.CurrentTheme.Border
        DropdownStroke.Thickness = 1
        DropdownStroke.Parent = DropdownBtn

        local OptionsFrame = Instance.new("ScrollingFrame")
        OptionsFrame.Size = UDim2.new(1, -24, 0, 0)
        OptionsFrame.Position = UDim2.new(0, 12, 0, 110)
        OptionsFrame.BackgroundColor3 = self.CurrentTheme.Container
        OptionsFrame.BorderSizePixel = 0
        OptionsFrame.ScrollBarThickness = 0
        OptionsFrame.Visible = false
        OptionsFrame.ZIndex = 50
        OptionsFrame.Parent = DialogFrame

        local OptionsCorner = Instance.new("UICorner")
        OptionsCorner.CornerRadius = UDim.new(0, 5)
        OptionsCorner.Parent = OptionsFrame

        local OptionsStroke = Instance.new("UIStroke")
        OptionsStroke.Color = self.CurrentTheme.Border
        OptionsStroke.Thickness = 1
        OptionsStroke.Parent = OptionsFrame

        local OptionsLayout = Instance.new("UIListLayout")
        OptionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
        OptionsLayout.Padding = UDim.new(0, 4)
        OptionsLayout.Parent = OptionsFrame

        local selectedConfig = nil

        local function RefreshConfigs()
            local list = {}
            if isfolder(ConfigFolder .. "/settings") then
                local files = listfiles(ConfigFolder .. "/settings")
                for _, file in ipairs(files) do
                    if string.sub(file, -5) == ".json" then
                        local name = string.gsub(file, "^.*[/\\]", "")
                        name = string.gsub(name, "%.json$", "")
                        table.insert(list, name)
                    end
                end
            end
            return list
        end

        local open = false
        local function PopulateList()
            for _, child in ipairs(OptionsFrame:GetChildren()) do
                if child:IsA("TextButton") then child:Destroy() end
            end
            local list = RefreshConfigs()
            for _, cName in ipairs(list) do
                local OptBtn = Instance.new("TextButton")
                OptBtn.Size = UDim2.new(1, 0, 0, 24)
                OptBtn.BorderSizePixel = 0
                OptBtn.Font = Enum.Font.GothamMedium
                OptBtn.Text = cName
                OptBtn.TextSize = 11
                OptBtn.Parent = OptionsFrame

                local OptCorner = Instance.new("UICorner")
                OptCorner.CornerRadius = UDim.new(0, 4)
                OptCorner.Parent = OptBtn

                window:RegisterTheme(OptBtn, "BackgroundColor3", "Container")
                window:RegisterTheme(OptBtn, "TextColor3", "Text")

                OptBtn.MouseEnter:Connect(function()
                    Tween(OptBtn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = GetHoverColor(self.CurrentTheme.Container)})
                end)
                OptBtn.MouseLeave:Connect(function()
                    Tween(OptBtn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = self.CurrentTheme.Container})
                end)

                OptBtn.MouseButton1Click:Connect(function()
                    selectedConfig = cName
                    DropdownBtn.Text = "Config: " .. cName
                    open = false
                    local t = Tween(OptionsFrame, {0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Size = UDim2.new(1, -24, 0, 0)})
                    t.Completed:Connect(function()
                        OptionsFrame.Visible = false
                    end)
                end)
            end
        end

        local function ToggleOptions()
            open = not open
            if open then
                PopulateList()
                OptionsFrame.Visible = true
                Tween(OptionsFrame, {0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Size = UDim2.new(1, -24, 0, 60)})
            else
                local t = Tween(OptionsFrame, {0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Size = UDim2.new(1, -24, 0, 0)})
                t.Completed:Connect(function()
                    OptionsFrame.Visible = false
                end)
            end
        end
        DropdownBtn.MouseButton1Click:Connect(ToggleOptions)

        local function SaveConfig(name)
            if not name or name == "" then return end
            if not isfolder(ConfigFolder) then makefolder(ConfigFolder) end
            if not isfolder(ConfigFolder .. "/settings") then makefolder(ConfigFolder .. "/settings") end
            
            local data = { objects = {} }
            for idx, opt in pairs(Vortex.Options) do
                local val = opt.Value
                if opt.Type == "Keybind" then
                    val = typeof(val) == "EnumItem" and val.Name or tostring(val)
                elseif opt.Type == "Colorpicker" then
                    val = typeof(val) == "Color3" and { val.R, val.G, val.B } or { 1, 1, 1 }
                end
                table.insert(data.objects, { idx = idx, type = opt.Type, value = val })
            end
            local success, encoded = pcall(game:GetService("HttpService").JSONEncode, game:GetService("HttpService"), data)
            if success then
                writefile(ConfigFolder .. "/settings/" .. name .. ".json", encoded)
                window:Notify("Config Saved", "Successfully saved configuration: " .. name)
            end
        end

        local function LoadConfig(name)
            if not name then return end
            local file = ConfigFolder .. "/settings/" .. name .. ".json"
            if isfile(file) then
                local success, decoded = pcall(game:GetService("HttpService").JSONDecode, game:GetService("HttpService"), readfile(file))
                if success then
                    for _, item in ipairs(decoded.objects) do
                        local opt = Vortex.Options[item.idx]
                        if opt then
                            opt:SetValue(item.value)
                        end
                    end
                    window:Notify("Config Loaded", "Successfully loaded configuration: " .. name)
                end
            end
        end

        local function DeleteConfig(name)
            if not name then return end
            local file = ConfigFolder .. "/settings/" .. name .. ".json"
            if isfile(file) then
                delfile(file)
                window:Notify("Config Deleted", "Deleted configuration: " .. name)
                selectedConfig = nil
                DropdownBtn.Text = "Select Configuration..."
            end
        end

        local function CreateBtn(text, pos, callback)
            local btn = Instance.new("TextButton")
            btn.AnchorPoint = Vector2.new(0.5, 0.5)
            btn.Size = UDim2.new(0, 85, 0, 24)
            btn.Position = UDim2.new(pos.X.Scale, pos.X.Offset + 42.5, pos.Y.Scale, pos.Y.Offset + 12)
            btn.BackgroundColor3 = self.CurrentTheme.Container
            btn.BorderSizePixel = 0
            btn.Font = Enum.Font.GothamMedium
            btn.Text = text
            btn.TextColor3 = self.CurrentTheme.Text
            btn.TextSize = 11
            btn.Parent = DialogFrame

            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 4)
            btnCorner.Parent = btn

            local btnStroke = Instance.new("UIStroke")
            btnStroke.Color = self.CurrentTheme.Border
            btnStroke.Thickness = 1
            btnStroke.Parent = btn

            window:RegisterTheme(btn, "BackgroundColor3", "Container")
            window:RegisterTheme(btn, "TextColor3", "Text")
            window:RegisterTheme(btnStroke, "Color", "Border")

            btn.MouseEnter:Connect(function()
                Tween(btn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = GetHoverColor(self.CurrentTheme.Container)})
                Tween(btnStroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = self.CurrentTheme.Accent})
            end)

            btn.MouseLeave:Connect(function()
                Tween(btn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = self.CurrentTheme.Container})
                Tween(btnStroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = self.CurrentTheme.Border})
            end)

            btn.MouseButton1Click:Connect(callback)
            return btn
        end

        CreateBtn("Save/New", UDim2.new(0, 12, 1, -70), function()
            local name = ConfigInput.Text
            if name and name ~= "" then
                SaveConfig(name)
                ConfigInput.Text = ""
                selectedConfig = name
                DropdownBtn.Text = "Config: " .. name
            else
                window:Notify("Error", "Please enter a valid configuration name.")
            end
        end)

        CreateBtn("Load", UDim2.new(0, 110, 1, -70), function()
            if selectedConfig then
                LoadConfig(selectedConfig)
                Overlay:Destroy()
            else
                window:Notify("Error", "Please select a configuration.")
            end
        end)

        CreateBtn("Overwrite", UDim2.new(0, 208, 1, -70), function()
            if selectedConfig then
                SaveConfig(selectedConfig)
            else
                window:Notify("Error", "Please select a configuration to overwrite.")
            end
        end)

        CreateBtn("Autoload", UDim2.new(0, 12, 1, -38), function()
            if selectedConfig then
                if not isfolder(ConfigFolder) then makefolder(ConfigFolder) end
                if not isfolder(ConfigFolder .. "/settings") then makefolder(ConfigFolder .. "/settings") end
                writefile(ConfigFolder .. "/settings/autoload.txt", selectedConfig)
                window:Notify("Autoload Set", "Set " .. selectedConfig .. " as default config.")
            else
                window:Notify("Error", "Please select a configuration.")
            end
        end)

        CreateBtn("Delete", UDim2.new(0, 110, 1, -38), function()
            if selectedConfig then
                DeleteConfig(selectedConfig)
            else
                window:Notify("Error", "Please select a configuration.")
            end
        end)

        CreateBtn("Close", UDim2.new(0, 208, 1, -38), function()
            Overlay:Destroy()
        end)

        self:RegisterTheme(DialogFrame, "BackgroundColor3", "MainFrame")
        self:RegisterTheme(Stroke, "Color", "Accent")
        self:RegisterTheme(Title, "TextColor3", "Text")
        self:RegisterTheme(InputFrame, "BackgroundColor3", "Container")
        self:RegisterTheme(InputStroke, "Color", "Border")
        self:RegisterTheme(ConfigInput, "TextColor3", "Text")
        self:RegisterTheme(DropdownBtn, "BackgroundColor3", "Container")
        self:RegisterTheme(DropdownBtn, "TextColor3", "Text")
        self:RegisterTheme(DropdownStroke, "Color", "Border")
        self:RegisterTheme(OptionsFrame, "BackgroundColor3", "Container")
        self:RegisterTheme(OptionsStroke, "Color", "Border")

        if FolderCallback then
            FolderCallback()
        end
    end

    local function TryLoadAutoload()
        if isfolder(ConfigFolder) and isfolder(ConfigFolder .. "/settings") then
            local file = ConfigFolder .. "/settings/autoload.txt"
            if isfile(file) then
                local name = readfile(file)
                local configFile = ConfigFolder .. "/settings/" .. name .. ".json"
                if isfile(configFile) then
                    task.delay(0.5, function()
                        local success, decoded = pcall(game:GetService("HttpService").JSONDecode, game:GetService("HttpService"), readfile(configFile))
                        if success then
                            for _, item in ipairs(decoded.objects) do
                                local opt = Vortex.Options[item.idx]
                                if opt then
                                    opt:SetValue(item.value)
                                end
                            end
                            window:Notify("Autoloaded Config", "Automatically loaded " .. name .. " settings.")
                        end
                    end)
                end
            end
        end
    end
    task.spawn(TryLoadAutoload)

    AddFooterButton(Color3.fromRGB(255, 215, 0), "rbxassetid://10723387563", function() window:OpenConfigDialog() end)
    AddFooterButton(Color3.fromRGB(255, 75, 75), "rbxassetid://10747362393", function()
        window:Dialog("Unload Interface", "Are you sure you want to completely unload and close this interface?", function()
            window:Unload()
        end)
    end)
    AddFooterButton(Color3.fromRGB(255, 90, 120), "rbxassetid://10709782845", function() window:ToggleHUD() end)
    AddFooterButton(Color3.fromRGB(90, 150, 255), "rbxassetid://10709782758", function() window:OpenThemeDialog() end)

    function window:AddTab(tabOptions)
        tabOptions = tabOptions or {}
        local name = tabOptions.Title or "Tab"
        local icon = tabOptions.Icon

        local TabButton = Instance.new("TextButton")
        TabButton.Name = name .. "TabBtn"
        TabButton.Size = UDim2.new(1, -4, 0, 32)
        TabButton.BackgroundColor3 = Color3.fromRGB(22, 25, 36)
        TabButton.BackgroundTransparency = 0
        TabButton.BorderSizePixel = 0
        TabButton.Font = Enum.Font.GothamMedium
        TabButton.Text = ""
        TabButton.Parent = TabScroll

        local TabBtnCorner = Instance.new("UICorner")
        TabBtnCorner.CornerRadius = UDim.new(0, 6)
        TabBtnCorner.Parent = TabButton

        local TabBtnStroke = Instance.new("UIStroke")
        TabBtnStroke.Color = Color3.fromRGB(45, 50, 65)
        TabBtnStroke.Thickness = 1
        TabBtnStroke.Parent = TabButton

        local LabelOffset = icon and 32 or 12
        local TabLabel = Instance.new("TextLabel")
        TabLabel.Size = UDim2.new(1, -LabelOffset, 1, 0)
        TabLabel.Position = UDim2.new(0, LabelOffset, 0, 0)
        TabLabel.BackgroundTransparency = 1
        TabLabel.Font = Enum.Font.GothamMedium
        TabLabel.Text = name
        TabLabel.TextColor3 = Color3.fromRGB(150, 155, 170)
        TabLabel.TextSize = 12
        TabLabel.TextXAlignment = Enum.TextXAlignment.Left
        TabLabel.Parent = TabButton

        local TabIcon
        if icon then
            TabIcon = Instance.new("ImageLabel")
            TabIcon.Size = UDim2.new(0, 16, 0, 16)
            TabIcon.Position = UDim2.new(0, 8, 0.5, -8)
            TabIcon.BackgroundTransparency = 1
            TabIcon.Image = icon
            TabIcon.ImageColor3 = Color3.fromRGB(150, 155, 170)
            TabIcon.Parent = TabButton
        end

        local TabScrollContent = Instance.new("ScrollingFrame")
        TabScrollContent.Name = name .. "Content"
        TabScrollContent.Size = UDim2.new(1, -24, 1, -24)
        TabScrollContent.Position = UDim2.new(0, 12, 0, 12)
        TabScrollContent.BackgroundTransparency = 1
        TabScrollContent.BorderSizePixel = 0
        TabScrollContent.ScrollBarThickness = 2
        TabScrollContent.ScrollBarImageColor3 = Color3.fromRGB(58, 147, 255)
        TabScrollContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabScrollContent.AutomaticCanvasSize = Enum.AutomaticSize.Y
        TabScrollContent.Visible = false
        TabScrollContent.Parent = ContentContainer

        local TabContentLayout = Instance.new("UIListLayout")
        TabContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabContentLayout.Padding = UDim.new(0, 8)
        TabContentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        TabContentLayout.Parent = TabScrollContent

        local tab = {
            Name = name,
            Button = TabButton,
            Label = TabLabel,
            Stroke = TabBtnStroke,
            ContentFrame = TabScrollContent,
            Elements = {}
        }

        window:RegisterTheme(TabButton, "BackgroundColor3", "Container", function() return window.CurrentTab == tab end, "Container")
        window:RegisterTheme(TabBtnStroke, "Color", "Accent", function() return window.CurrentTab == tab end, "Border")
        window:RegisterTheme(TabLabel, "TextColor3", "Text", function() return window.CurrentTab == tab end, "MutedText")
        if TabIcon then
            window:RegisterTheme(TabIcon, "ImageColor3", "Text", function() return window.CurrentTab == tab end, "MutedText")
        end
        window:RegisterTheme(TabScrollContent, "ScrollBarImageColor3", "Accent")

        local function Select()
            if window.CurrentTab then
                local prev = window.CurrentTab
                prev.ContentFrame.Visible = false
                task.spawn(function()
                    window:UpdateThemeObject(prev.Button)
                    window:UpdateThemeObject(prev.Stroke)
                    window:UpdateThemeObject(prev.Label)
                    if prev.Button:FindFirstChildOfClass("ImageLabel") then
                        window:UpdateThemeObject(prev.Button:FindFirstChildOfClass("ImageLabel"))
                    end
                end)
            end
            window.CurrentTab = tab
            tab.ContentFrame.Visible = true
            task.spawn(function()
                window:UpdateThemeObject(TabButton)
                window:UpdateThemeObject(TabBtnStroke)
                window:UpdateThemeObject(TabLabel)
                if TabIcon then
                    window:UpdateThemeObject(TabIcon)
                end
            end)
        end

        TabButton.MouseButton1Click:Connect(Select)
        if not window.CurrentTab then
            Select()
        end

        function tab:AddSection(title)
            local SectionLabel = Instance.new("TextLabel")
            SectionLabel.Size = UDim2.new(1, 0, 0, 24)
            SectionLabel.BackgroundTransparency = 1
            SectionLabel.Font = Enum.Font.GothamBold
            SectionLabel.TextSize = 13
            SectionLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
            SectionLabel.RichText = true
            SectionLabel.Text = "<u><i>" .. title .. "</i></u>"
            SectionLabel.TextXAlignment = Enum.TextXAlignment.Center
            SectionLabel.TextYAlignment = Enum.TextYAlignment.Center
            SectionLabel.Parent = TabScrollContent

            window:RegisterTheme(SectionLabel, "TextColor3", "Text")

            local section = {}

            function section:AddToggle(id, options)
                return tab:AddToggle(id, options)
            end

            function section:AddSlider(id, options)
                return tab:AddSlider(id, options)
            end

            function section:AddButton(options)
                return tab:AddButton(options)
            end

            function section:AddDropdown(id, options)
                return tab:AddDropdown(id, options)
            end

            function section:AddInput(id, options)
                return tab:AddInput(id, options)
            end

            function section:AddKeybind(id, options)
                return tab:AddKeybind(id, options)
            end

            function section:AddColorpicker(id, options)
                return tab:AddColorpicker(id, options)
            end

            return section
        end

        local function SetupTooltip(hoverObject, text)
            hoverObject.MouseEnter:Connect(function()
                if text and text ~= "" then
                    TooltipLabel.Text = text
                    local size = TooltipLabel.TextBounds
                    TooltipFrame.Size = UDim2.new(0, size.X + 20, 0, size.Y + 12)
                    TooltipFrame.Visible = true
                end
            end)

            hoverObject.MouseMoved:Connect(function()
                local mX, mY = Mouse.X, Mouse.Y
                TooltipFrame.Position = UDim2.new(0, mX + 15, 0, mY - TooltipFrame.AbsoluteSize.Y - 10)
            end)

            hoverObject.MouseLeave:Connect(function()
                TooltipFrame.Visible = false
            end)
        end

        function tab:AddToggle(id, options)
            options = options or {}
            local titleText = options.Title or "Toggle"
            local default = options.Default or false
            local infoText = options.Info

            local Container = Instance.new("Frame")
            Container.Name = titleText
            Container.Size = UDim2.new(1, 0, 0, 38)
            Container.BackgroundColor3 = Color3.fromRGB(28, 32, 45)
            Container.BorderSizePixel = 0
            Container.Parent = TabScrollContent

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 6)
            Corner.Parent = Container

            local Stroke = Instance.new("UIStroke")
            Stroke.Color = Color3.fromRGB(40, 46, 64)
            Stroke.Thickness = 1
            Stroke.Parent = Container

            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, -80, 1, 0)
            Label.Position = UDim2.new(0, 12, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.Gotham
            Label.TextSize = 13
            Label.TextColor3 = Color3.fromRGB(230, 230, 230)
            Label.Text = titleText
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = Container

            local Switch = Instance.new("TextButton")
            Switch.Size = UDim2.new(0, 22, 0, 22)
            Switch.Position = UDim2.new(1, -34, 0.5, -11)
            Switch.BackgroundColor3 = Color3.fromRGB(40, 45, 55)
            Switch.BorderSizePixel = 0
            Switch.Text = ""
            Switch.Parent = Container

            local SwitchCorner = Instance.new("UICorner")
            SwitchCorner.CornerRadius = UDim.new(0, 6)
            SwitchCorner.Parent = Switch

            local SwitchStroke = Instance.new("UIStroke")
            SwitchStroke.Color = Color3.fromRGB(55, 62, 77)
            SwitchStroke.Thickness = 1
            SwitchStroke.Parent = Switch

            local toggleObject = {
                Value = default,
                DefaultValue = default,
                Type = "Toggle",
                ChangedCallbacks = {}
            }

            local function UpdateVisual(animate)
                local currentColor = window.CurrentTheme.Accent
                local targetColor = toggleObject.Value and currentColor or window.CurrentTheme.Container
                local targetStrokeColor = toggleObject.Value and currentColor or window.CurrentTheme.Border
                if animate then
                    Tween(Switch, {0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = targetColor})
                    Tween(SwitchStroke, {0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = targetStrokeColor})
                else
                    Switch.BackgroundColor3 = targetColor
                    SwitchStroke.Color = targetStrokeColor
                end
            end
            toggleObject.UpdateVisual = UpdateVisual

            window:RegisterTheme(Container, "BackgroundColor3", "Element")
            window:RegisterTheme(Stroke, "Color", "Border")
            window:RegisterTheme(Label, "TextColor3", "Text")
            window:RegisterTheme(Switch, "BackgroundColor3", "Accent", function() return toggleObject.Value end, "Container")
            window:RegisterTheme(SwitchStroke, "Color", "Accent", function() return toggleObject.Value end, "Border")

            function toggleObject:OnChanged(callback)
                table.insert(self.ChangedCallbacks, callback)
                task.spawn(callback, self.Value)
                return {
                    Disconnect = function()
                        local idx = table.find(self.ChangedCallbacks, callback)
                        if idx then
                            table.remove(self.ChangedCallbacks, idx)
                        end
                    end
                }
            end

            function toggleObject:SetValue(val)
                self.Value = val
                UpdateVisual(true)
                for _, cb in ipairs(self.ChangedCallbacks) do
                    task.spawn(cb, self.Value)
                end
            end

            UpdateVisual(false)

            Switch.MouseButton1Click:Connect(function()
                toggleObject:SetValue(not toggleObject.Value)
            end)

            if infoText and infoText ~= "" then
                local InfoBtn = Instance.new("ImageButton")
                InfoBtn.Size = UDim2.new(0, 18, 0, 18)
                InfoBtn.Position = UDim2.new(1, -60, 0.5, -9)
                InfoBtn.BackgroundTransparency = 1
                InfoBtn.Image = "rbxassetid://10734950020"
                InfoBtn.ImageColor3 = Color3.fromRGB(58, 147, 255)
                InfoBtn.Parent = Container
                SetupTooltip(InfoBtn, infoText)
                window:RegisterTheme(InfoBtn, "ImageColor3", "Accent")
            end

            local el = {
                Name = titleText,
                Frame = Container
            }
            table.insert(tab.Elements, el)
            Vortex.Options[id] = toggleObject
            return toggleObject
        end

        function tab:AddSlider(id, options)
            options = options or {}
            local titleText = options.Title or "Slider"
            local min = options.Min or 0
            local max = options.Max or 100
            local default = options.Default or min
            local rounding = options.Rounding or 1

            local Container = Instance.new("Frame")
            Container.Name = titleText
            Container.Size = UDim2.new(1, 0, 0, 45)
            Container.BackgroundColor3 = Color3.fromRGB(28, 32, 45)
            Container.BorderSizePixel = 0
            Container.Parent = TabScrollContent

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 6)
            Corner.Parent = Container

            local Stroke = Instance.new("UIStroke")
            Stroke.Color = Color3.fromRGB(40, 46, 64)
            Stroke.Thickness = 1
            Stroke.Parent = Container

            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(0.5, 0, 0, 16)
            Label.Position = UDim2.new(0, 12, 0, 6)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.Gotham
            Label.TextSize = 13
            Label.TextColor3 = Color3.fromRGB(230, 230, 230)
            Label.Text = titleText
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = Container

            local ValueLabel = Instance.new("TextLabel")
            ValueLabel.Size = UDim2.new(0.5, -12, 0, 16)
            ValueLabel.Position = UDim2.new(0.5, 0, 0, 6)
            ValueLabel.BackgroundTransparency = 1
            ValueLabel.Font = Enum.Font.Gotham
            ValueLabel.TextSize = 13
            ValueLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
            ValueLabel.Text = tostring(default)
            ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
            ValueLabel.Parent = Container

            local Track = Instance.new("TextButton")
            Track.Size = UDim2.new(1, -24, 0, 8)
            Track.Position = UDim2.new(0, 12, 0, 26)
            Track.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
            Track.BorderSizePixel = 0
            Track.AutoButtonColor = false
            Track.Text = ""
            Track.Parent = Container

            local TrackCorner = Instance.new("UICorner")
            TrackCorner.CornerRadius = UDim.new(0, 4)
            TrackCorner.Parent = Track

            local TrackStroke = Instance.new("UIStroke")
            TrackStroke.Color = Color3.fromRGB(50, 58, 80)
            TrackStroke.Thickness = 1
            TrackStroke.Parent = Track

            local Fill = Instance.new("Frame")
            Fill.Size = UDim2.new(0, 0, 1, 0)
            Fill.BackgroundColor3 = Color3.fromRGB(58, 147, 255)
            Fill.BorderSizePixel = 0
            Fill.Parent = Track

            local FillCorner = Instance.new("UICorner")
            FillCorner.CornerRadius = UDim.new(0, 4)
            FillCorner.Parent = Fill

            local sliderObject = {
                Value = default,
                DefaultValue = default,
                Type = "Slider",
                Fill = Fill,
                ChangedCallbacks = {}
            }

            local function UpdateVisual(animate)
                local range = max - min
                local pct = range == 0 and 0 or (sliderObject.Value - min) / range
                ValueLabel.Text = tostring(sliderObject.Value)
                if animate then
                    Tween(Fill, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Size = UDim2.new(pct, 0, 1, 0)})
                else
                    Fill.Size = UDim2.new(pct, 0, 1, 0)
                end
            end

            window:RegisterTheme(Container, "BackgroundColor3", "Element")
            window:RegisterTheme(Stroke, "Color", "Border")
            window:RegisterTheme(Label, "TextColor3", "Text")
            window:RegisterTheme(ValueLabel, "TextColor3", "Text")
            window:RegisterTheme(Track, "BackgroundColor3", "Container")
            window:RegisterTheme(TrackStroke, "Color", "Border")
            window:RegisterTheme(Fill, "BackgroundColor3", "Accent")

            function sliderObject:OnChanged(callback)
                table.insert(self.ChangedCallbacks, callback)
                task.spawn(callback, self.Value)
                return {
                    Disconnect = function()
                        local idx = table.find(self.ChangedCallbacks, callback)
                        if idx then
                            table.remove(self.ChangedCallbacks, idx)
                        end
                    end
                }
            end

            function sliderObject:SetValue(val)
                val = math.clamp(val, min, max)
                self.Value = val
                UpdateVisual(true)
                for _, cb in ipairs(self.ChangedCallbacks) do
                    task.spawn(cb, self.Value)
                end
            end

            UpdateVisual(false)

            local dragging = false

            local function HandleInput()
                local mouseX = Mouse.X
                local trackX = Track.AbsolutePosition.X
                local trackWidth = Track.AbsoluteSize.X
                local pct = math.clamp((mouseX - trackX) / trackWidth, 0, 1)
                local rawVal = min + pct * (max - min)
                local val
                if rounding == 0 then
                    val = rawVal
                else
                    val = math.floor((rawVal - min) / rounding + 0.5) * rounding + min
                end
                val = math.clamp(val, min, max)
                sliderObject:SetValue(val)
            end

            Track.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    HandleInput()
                end
            end)

            local moveCon, endCon

            Track.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    HandleInput()
                    if moveCon then moveCon:Disconnect() end
                    if endCon then endCon:Disconnect() end
                    moveCon = UserInputService.InputChanged:Connect(function(moveInput)
                        if dragging and (moveInput.UserInputType == Enum.UserInputType.MouseMovement or moveInput.UserInputType == Enum.UserInputType.Touch) then
                            HandleInput()
                        end
                    end)
                    endCon = UserInputService.InputEnded:Connect(function(endInput)
                        if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
                            dragging = false
                            if moveCon then moveCon:Disconnect() moveCon = nil end
                            if endCon then endCon:Disconnect() endCon = nil end
                        end
                    end)
                end
            end)

            local el = {
                Name = titleText,
                Frame = Container
            }
            table.insert(tab.Elements, el)
            Vortex.Options[id] = sliderObject
            return sliderObject
        end

        function tab:AddButton(options)
            options = options or {}
            local titleText = options.Title or "Button"
            local callback = options.Callback

            local Container = Instance.new("Frame")
            Container.Name = titleText
            Container.Size = UDim2.new(1, 0, 0, 38)
            Container.BackgroundColor3 = Color3.fromRGB(28, 32, 45)
            Container.BorderSizePixel = 0
            Container.Parent = TabScrollContent

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 6)
            Corner.Parent = Container

            local Stroke = Instance.new("UIStroke")
            Stroke.Color = Color3.fromRGB(40, 46, 64)
            Stroke.Thickness = 1
            Stroke.Parent = Container

            local Btn = Instance.new("TextButton")
            Btn.AnchorPoint = Vector2.new(0.5, 0.5)
            Btn.Size = UDim2.new(1, -24, 1, -12)
            Btn.Position = UDim2.new(0.5, 0, 0.5, 0)
            Btn.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
            Btn.BorderSizePixel = 0
            Btn.Font = Enum.Font.GothamMedium
            Btn.Text = titleText
            Btn.TextColor3 = Color3.fromRGB(240, 240, 240)
            Btn.TextSize = 13
            Btn.Parent = Container

            local BtnCorner = Instance.new("UICorner")
            BtnCorner.CornerRadius = UDim.new(0, 5)
            BtnCorner.Parent = Btn

            local BtnStroke = Instance.new("UIStroke")
            BtnStroke.Color = Color3.fromRGB(45, 52, 71)
            BtnStroke.Thickness = 1
            BtnStroke.Parent = Btn

            window:RegisterTheme(Container, "BackgroundColor3", "Element")
            window:RegisterTheme(Stroke, "Color", "Border")
            window:RegisterTheme(Btn, "BackgroundColor3", "Container")
            window:RegisterTheme(BtnStroke, "Color", "Border")
            window:RegisterTheme(Btn, "TextColor3", "Text")

            Btn.MouseEnter:Connect(function()
                Tween(Btn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = GetHoverColor(window.CurrentTheme.Container)})
                Tween(BtnStroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = window.CurrentTheme.Accent})
            end)

            Btn.MouseLeave:Connect(function()
                Tween(Btn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = window.CurrentTheme.Container})
                Tween(BtnStroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = window.CurrentTheme.Border})
            end)

            Btn.MouseButton1Click:Connect(function()
                if callback then
                    task.spawn(callback)
                end
            end)

            local el = {
                Name = titleText,
                Frame = Container
            }
            table.insert(tab.Elements, el)
            return el
        end

        function tab:AddDropdown(id, options)
            options = options or {}
            local titleText = options.Title or "Dropdown"
            local list = options.Values or {}
            local default = options.Default
            local callback = options.Callback

            local Container = Instance.new("Frame")
            Container.Name = titleText
            Container.Size = UDim2.new(1, 0, 0, 38)
            Container.BackgroundColor3 = Color3.fromRGB(28, 32, 45)
            Container.BorderSizePixel = 0
            Container.ClipsDescendants = true
            Container.Parent = TabScrollContent

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 6)
            Corner.Parent = Container

            local Stroke = Instance.new("UIStroke")
            Stroke.Color = Color3.fromRGB(40, 46, 64)
            Stroke.Thickness = 1
            Stroke.Parent = Container

            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, -40, 0, 38)
            Label.Position = UDim2.new(0, 12, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.Gotham
            Label.TextSize = 13
            Label.TextColor3 = Color3.fromRGB(230, 230, 230)
            Label.Text = titleText .. (default and (" - " .. tostring(default)) or "")
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = Container

            local Icon = Instance.new("ImageLabel")
            Icon.Size = UDim2.new(0, 16, 0, 16)
            Icon.Position = UDim2.new(1, -28, 0, 11)
            Icon.BackgroundTransparency = 1
            Icon.Image = "rbxassetid://10734950375"
            Icon.ImageColor3 = Color3.fromRGB(150, 155, 170)
            Icon.Parent = Container

            local ClickBtn = Instance.new("TextButton")
            ClickBtn.Size = UDim2.new(1, 0, 0, 38)
            ClickBtn.BackgroundTransparency = 1
            ClickBtn.Text = ""
            ClickBtn.Parent = Container

            local OptionsContainer = Instance.new("Frame")
            OptionsContainer.Size = UDim2.new(1, -24, 0, 0)
            OptionsContainer.Position = UDim2.new(0, 12, 0, 38)
            OptionsContainer.BackgroundTransparency = 1
            OptionsContainer.ClipsDescendants = true
            OptionsContainer.Parent = Container

            local OptionsLayout = Instance.new("UIListLayout")
            OptionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
            OptionsLayout.Padding = UDim.new(0, 4)
            OptionsLayout.Parent = OptionsContainer

            local dropdownObject = {
                Value = default,
                DefaultValue = default,
                Type = "Dropdown",
                ChangedCallbacks = {}
            }

            window:RegisterTheme(Container, "BackgroundColor3", "Element")
            window:RegisterTheme(Stroke, "Color", "Border")
            window:RegisterTheme(Label, "TextColor3", "Text")
            window:RegisterTheme(Icon, "ImageColor3", "MutedText")

            local open = false

            local function ToggleOpen()
                open = not open
                local targetHeight = 38
                if open then
                    targetHeight = 38 + OptionsLayout.AbsoluteContentSize.Y + 8
                end
                Tween(Container, {0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Size = UDim2.new(1, 0, 0, targetHeight)})
                Tween(OptionsContainer, {0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Size = UDim2.new(1, -24, 0, open and (targetHeight - 42) or 0)})
                Tween(Icon, {0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Rotation = open and 180 or 0})
            end

            function dropdownObject:OnChanged(callback)
                table.insert(self.ChangedCallbacks, callback)
                task.spawn(callback, self.Value)
                return {
                    Disconnect = function()
                        local idx = table.find(self.ChangedCallbacks, callback)
                        if idx then
                            table.remove(self.ChangedCallbacks, idx)
                        end
                    end
                }
            end

            function dropdownObject:SetValue(val)
                self.Value = val
                Label.Text = titleText .. " - " .. tostring(val)
                for _, cb in ipairs(self.ChangedCallbacks) do
                    task.spawn(cb, self.Value)
                end
            end

            ClickBtn.MouseButton1Click:Connect(ToggleOpen)

            for i, val in ipairs(list) do
                local OptBtn = Instance.new("TextButton")
                OptBtn.Size = UDim2.new(1, 0, 0, 28)
                OptBtn.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
                OptBtn.BorderSizePixel = 0
                OptBtn.Font = Enum.Font.GothamMedium
                OptBtn.Text = tostring(val)
                OptBtn.TextColor3 = Color3.fromRGB(200, 205, 220)
                OptBtn.TextSize = 12
                OptBtn.Parent = OptionsContainer

                local OptCorner = Instance.new("UICorner")
                OptCorner.CornerRadius = UDim.new(0, 5)
                OptCorner.Parent = OptBtn

                local OptStroke = Instance.new("UIStroke")
                OptStroke.Color = Color3.fromRGB(45, 52, 71)
                OptStroke.Thickness = 1
                OptStroke.Parent = OptBtn

                window:RegisterTheme(OptBtn, "BackgroundColor3", "Container")
                window:RegisterTheme(OptStroke, "Color", "Border")
                window:RegisterTheme(OptBtn, "TextColor3", "Text")

                OptBtn.MouseEnter:Connect(function()
                    Tween(OptBtn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = GetHoverColor(window.CurrentTheme.Container)})
                    Tween(OptStroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = window.CurrentTheme.Accent})
                end)

                OptBtn.MouseLeave:Connect(function()
                    Tween(OptBtn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = window.CurrentTheme.Container})
                    Tween(OptStroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = window.CurrentTheme.Border})
                end)

                OptBtn.MouseButton1Click:Connect(function()
                    dropdownObject:SetValue(val)
                    ToggleOpen()
                end)
            end

            local el = {
                Name = titleText,
                Frame = Container
            }
            table.insert(tab.Elements, el)
            Vortex.Options[id] = dropdownObject
            return dropdownObject
        end

        function tab:AddInput(id, options)
            options = options or {}
            local titleText = options.Title or "TextBox"
            local placeholder = options.Placeholder or "Enter text..."
            local default = options.Default or ""

            local Container = Instance.new("Frame")
            Container.Name = titleText
            Container.Size = UDim2.new(1, 0, 0, 38)
            Container.BackgroundColor3 = Color3.fromRGB(28, 32, 45)
            Container.BorderSizePixel = 0
            Container.Parent = TabScrollContent

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 6)
            Corner.Parent = Container

            local Stroke = Instance.new("UIStroke")
            Stroke.Color = Color3.fromRGB(40, 46, 64)
            Stroke.Thickness = 1
            Stroke.Parent = Container

            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(0.5, -12, 1, 0)
            Label.Position = UDim2.new(0, 12, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.Gotham
            Label.TextSize = 13
            Label.TextColor3 = Color3.fromRGB(230, 230, 230)
            Label.Text = titleText
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = Container

            local BoxContainer = Instance.new("Frame")
            BoxContainer.Size = UDim2.new(0.5, -12, 0, 24)
            BoxContainer.Position = UDim2.new(0.5, 0, 0.5, -12)
            BoxContainer.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
            BoxContainer.BorderSizePixel = 0
            BoxContainer.Parent = Container

            local BoxCorner = Instance.new("UICorner")
            BoxCorner.CornerRadius = UDim.new(0, 5)
            BoxCorner.Parent = BoxContainer

            local BoxStroke = Instance.new("UIStroke")
            BoxStroke.Color = Color3.fromRGB(45, 52, 71)
            BoxStroke.Thickness = 1
            BoxStroke.Parent = BoxContainer

            local Box = Instance.new("TextBox")
            Box.Size = UDim2.new(1, -12, 1, 0)
            Box.Position = UDim2.new(0, 6, 0, 0)
            Box.BackgroundTransparency = 1
            Box.Font = Enum.Font.Gotham
            Box.TextSize = 12
            Box.TextColor3 = Color3.fromRGB(240, 240, 240)
            Box.PlaceholderColor3 = Color3.fromRGB(120, 125, 140)
            Box.PlaceholderText = placeholder
            Box.Text = default
            Box.TextXAlignment = Enum.TextXAlignment.Left
            Box.Parent = BoxContainer

            local inputObject = {
                Value = default,
                DefaultValue = default,
                Type = "Input",
                ChangedCallbacks = {}
            }

            window:RegisterTheme(Container, "BackgroundColor3", "Element")
            window:RegisterTheme(Stroke, "Color", "Border")
            window:RegisterTheme(Label, "TextColor3", "Text")
            window:RegisterTheme(BoxContainer, "BackgroundColor3", "Container")
            window:RegisterTheme(BoxStroke, "Color", "Border")
            window:RegisterTheme(Box, "TextColor3", "Text")
            window:RegisterTheme(Box, "PlaceholderColor3", "MutedText")

            function inputObject:OnChanged(callback)
                table.insert(self.ChangedCallbacks, callback)
                task.spawn(callback, self.Value)
                return {
                    Disconnect = function()
                        local idx = table.find(self.ChangedCallbacks, callback)
                        if idx then
                            table.remove(self.ChangedCallbacks, idx)
                        end
                    end
                }
            end

            function inputObject:SetValue(val)
                self.Value = val
                Box.Text = tostring(val)
                for _, cb in ipairs(self.ChangedCallbacks) do
                    task.spawn(cb, self.Value)
                end
            end

            Box.FocusLost:Connect(function(enterPressed)
                inputObject:SetValue(Box.Text)
            end)

            local el = {
                Name = titleText,
                Frame = Container
            }
            table.insert(tab.Elements, el)
            Vortex.Options[id] = inputObject
            return inputObject
        end

        function tab:AddKeybind(id, options)
            options = options or {}
            local titleText = options.Title or "Keybind"
            local default = options.Default or Enum.KeyCode.F

            local Container = Instance.new("Frame")
            Container.Name = titleText
            Container.Size = UDim2.new(1, 0, 0, 38)
            Container.BackgroundColor3 = Color3.fromRGB(28, 32, 45)
            Container.BorderSizePixel = 0
            Container.Parent = TabScrollContent

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 6)
            Corner.Parent = Container

            local Stroke = Instance.new("UIStroke")
            Stroke.Color = Color3.fromRGB(40, 46, 64)
            Stroke.Thickness = 1
            Stroke.Parent = Container

            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, -80, 1, 0)
            Label.Position = UDim2.new(0, 12, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.Gotham
            Label.TextSize = 13
            Label.TextColor3 = Color3.fromRGB(230, 230, 230)
            Label.Text = titleText
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = Container

            local KeyBtn = Instance.new("TextButton")
            KeyBtn.Size = UDim2.new(0, 60, 0, 24)
            KeyBtn.Position = UDim2.new(1, -72, 0.5, -12)
            KeyBtn.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
            KeyBtn.BorderSizePixel = 0
            KeyBtn.Font = Enum.Font.GothamMedium
            KeyBtn.Text = default.Name
            KeyBtn.TextColor3 = Color3.fromRGB(240, 240, 240)
            KeyBtn.TextSize = 12
            KeyBtn.Parent = Container

            local KeyCorner = Instance.new("UICorner")
            KeyCorner.CornerRadius = UDim.new(0, 5)
            KeyCorner.Parent = KeyBtn

            local KeyStroke = Instance.new("UIStroke")
            KeyStroke.Color = Color3.fromRGB(45, 52, 71)
            KeyStroke.Thickness = 1
            KeyStroke.Parent = KeyBtn

            local keybindObject = {
                Value = default,
                DefaultValue = default,
                Type = "Keybind",
                ChangedCallbacks = {}
            }

            window:RegisterTheme(Container, "BackgroundColor3", "Element")
            window:RegisterTheme(Stroke, "Color", "Border")
            window:RegisterTheme(Label, "TextColor3", "Text")
            window:RegisterTheme(KeyBtn, "BackgroundColor3", "Container")
            window:RegisterTheme(KeyStroke, "Color", "Border")
            window:RegisterTheme(KeyBtn, "TextColor3", "Text")

            local connection
            local listening = false

            function keybindObject:OnChanged(callback)
                table.insert(self.ChangedCallbacks, callback)
                task.spawn(callback, self.Value)
                return {
                    Disconnect = function()
                        local idx = table.find(self.ChangedCallbacks, callback)
                        if idx then
                            table.remove(self.ChangedCallbacks, idx)
                        end
                    end
                }
            end

            function keybindObject:SetValue(val)
                if typeof(val) == "string" then
                    local success, code = pcall(function() return Enum.KeyCode[val] end)
                    val = success and code or self.DefaultValue
                elseif typeof(val) ~= "EnumItem" then
                    val = self.DefaultValue
                end
                self.Value = val
                KeyBtn.Text = val.Name
                for _, cb in ipairs(self.ChangedCallbacks) do
                    task.spawn(cb, self.Value)
                end
            end

            KeyBtn.MouseButton1Click:Connect(function()
                if listening then return end
                listening = true
                KeyBtn.Text = "..."
                connection = UserInputService.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.Keyboard then
                        listening = false
                        connection:Disconnect()
                        keybindObject:SetValue(input.KeyCode)
                    end
                end)
            end)

            UserInputService.InputBegan:Connect(function(input, processed)
                if not processed and not UserInputService:GetFocusedTextBox() then
                    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == keybindObject.Value then
                        for _, cb in ipairs(keybindObject.ChangedCallbacks) do
                            task.spawn(cb, keybindObject.Value)
                        end
                    end
                end
            end)

            local el = {
                Name = titleText,
                Frame = Container
            }
            table.insert(tab.Elements, el)
            Vortex.Options[id] = keybindObject
            return keybindObject
        end

        function tab:AddColorpicker(id, options)
            options = options or {}
            local titleText = options.Title or "Colorpicker"
            local default = options.Default or Color3.fromRGB(255, 255, 255)

            local Container = Instance.new("Frame")
            Container.Name = titleText
            Container.Size = UDim2.new(1, 0, 0, 38)
            Container.BackgroundColor3 = Color3.fromRGB(28, 32, 45)
            Container.BorderSizePixel = 0
            Container.Parent = TabScrollContent

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 6)
            Corner.Parent = Container

            local Stroke = Instance.new("UIStroke")
            Stroke.Color = Color3.fromRGB(40, 46, 64)
            Stroke.Thickness = 1
            Stroke.Parent = Container

            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, -80, 1, 0)
            Label.Position = UDim2.new(0, 12, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.Gotham
            Label.TextSize = 13
            Label.TextColor3 = Color3.fromRGB(230, 230, 230)
            Label.Text = titleText
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = Container

            local ColorBtn = Instance.new("TextButton")
            ColorBtn.Size = UDim2.new(0, 45, 0, 22)
            ColorBtn.Position = UDim2.new(1, -57, 0.5, -11)
            ColorBtn.BackgroundColor3 = default
            ColorBtn.BorderSizePixel = 0
            ColorBtn.Text = ""
            ColorBtn.Parent = Container

            local ColorCorner = Instance.new("UICorner")
            ColorCorner.CornerRadius = UDim.new(0, 4)
            ColorCorner.Parent = ColorBtn

            local ColorStroke = Instance.new("UIStroke")
            ColorStroke.Color = Color3.fromRGB(45, 52, 71)
            ColorStroke.Thickness = 1
            ColorStroke.Parent = ColorBtn

            local colorpickerObject = {
                Value = default,
                DefaultValue = default,
                Type = "Colorpicker",
                ChangedCallbacks = {}
            }

            window:RegisterTheme(Container, "BackgroundColor3", "Element")
            window:RegisterTheme(Stroke, "Color", "Border")
            window:RegisterTheme(Label, "TextColor3", "Text")
            window:RegisterTheme(ColorBtn, "BackgroundColor3", "Container")
            window:RegisterTheme(ColorStroke, "Color", "Border")

            function colorpickerObject:OnChanged(callback)
                table.insert(self.ChangedCallbacks, callback)
                task.spawn(callback, self.Value)
                return {
                    Disconnect = function()
                        local idx = table.find(self.ChangedCallbacks, callback)
                        if idx then
                            table.remove(self.ChangedCallbacks, idx)
                        end
                    end
                }
            end

            function colorpickerObject:SetValue(val)
                if typeof(val) == "Color3" then
                    self.Value = val
                elseif typeof(val) == "table" then
                    self.Value = Color3.new(val[1], val[2], val[3])
                else
                    self.Value = self.DefaultValue
                end
                ColorBtn.BackgroundColor3 = self.Value
                for _, cb in ipairs(self.ChangedCallbacks) do
                    task.spawn(cb, self.Value)
                end
            end

            ColorBtn.MouseButton1Click:Connect(function()
                local Overlay = Instance.new("TextButton")
                Overlay.Size = UDim2.new(1, 0, 1, 0)
                Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Overlay.BackgroundTransparency = 0.6
                Overlay.Text = ""
                Overlay.AutoButtonColor = false
                Overlay.Parent = MainFrame

                local DialogFrame = Instance.new("Frame")
                DialogFrame.Size = UDim2.new(0, 360, 0, 240)
                DialogFrame.Position = UDim2.new(0.5, -180, 0.5, -120)
                DialogFrame.BackgroundColor3 = window.CurrentTheme.MainFrame
                DialogFrame.BorderSizePixel = 0
                DialogFrame.Parent = Overlay

                local DialogCorner = Instance.new("UICorner")
                DialogCorner.CornerRadius = UDim.new(0, 8)
                DialogCorner.Parent = DialogFrame

                local DialogStroke = Instance.new("UIStroke")
                DialogStroke.Color = window.CurrentTheme.Accent
                DialogStroke.Thickness = 1.2
                DialogStroke.Parent = DialogFrame

                CreateShadow(DialogFrame)

                local Title = Instance.new("TextLabel")
                Title.Size = UDim2.new(1, -20, 0, 30)
                Title.Position = UDim2.new(0, 10, 0, 8)
                Title.BackgroundTransparency = 1
                Title.Font = Enum.Font.GothamBold
                Title.Text = titleText
                Title.TextColor3 = window.CurrentTheme.Text
                Title.TextSize = 13
                Title.TextXAlignment = Enum.TextXAlignment.Center
                Title.Parent = DialogFrame

                local SatVibMap = Instance.new("ImageLabel")
                SatVibMap.Size = UDim2.new(0, 140, 0, 120)
                SatVibMap.Position = UDim2.new(0, 15, 0, 45)
                SatVibMap.Image = "rbxassetid://4155801252"
                SatVibMap.BorderSizePixel = 0
                SatVibMap.Parent = DialogFrame

                local SatVibCorner = Instance.new("UICorner")
                SatVibCorner.CornerRadius = UDim.new(0, 4)
                SatVibCorner.Parent = SatVibMap

                local SatCursor = Instance.new("ImageLabel")
                SatCursor.Size = UDim2.new(0, 10, 0, 10)
                SatCursor.AnchorPoint = Vector2.new(0.5, 0.5)
                SatCursor.BackgroundTransparency = 1
                SatCursor.Image = "rbxassetid://4805639000"
                SatCursor.Parent = SatVibMap

                local HueSlider = Instance.new("Frame")
                HueSlider.Size = UDim2.new(0, 12, 0, 120)
                HueSlider.Position = UDim2.new(0, 170, 0, 45)
                HueSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                HueSlider.BorderSizePixel = 0
                HueSlider.Parent = DialogFrame

                local HueSliderCorner = Instance.new("UICorner")
                HueSliderCorner.CornerRadius = UDim.new(0, 4)
                HueSliderCorner.Parent = HueSlider

                local HueGradient = Instance.new("UIGradient")
                local kps = {}
                for idx = 0, 10 do
                    local p = idx / 10
                    table.insert(kps, ColorSequenceKeypoint.new(p, Color3.fromHSV(p, 1, 1)))
                end
                HueGradient.Color = ColorSequence.new(kps)
                HueGradient.Rotation = 90
                HueGradient.Parent = HueSlider

                local HueIndicator = Instance.new("Frame")
                HueIndicator.Size = UDim2.new(1, 4, 0, 4)
                HueIndicator.Position = UDim2.new(0, -2, 0, 0)
                HueIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                HueIndicator.BorderSizePixel = 0
                HueIndicator.Parent = HueSlider

                local HueIndicatorStroke = Instance.new("UIStroke")
                HueIndicatorStroke.Color = Color3.fromRGB(0, 0, 0)
                HueIndicatorStroke.Thickness = 1
                HueIndicatorStroke.Parent = HueIndicator

                local HexInputContainer = Instance.new("Frame")
                HexInputContainer.Size = UDim2.new(0, 90, 0, 24)
                HexInputContainer.Position = UDim2.new(0, 200, 0, 45)
                HexInputContainer.BackgroundColor3 = window.CurrentTheme.Container
                HexInputContainer.BorderSizePixel = 0
                HexInputContainer.Parent = DialogFrame

                local HexInputCorner = Instance.new("UICorner")
                HexInputCorner.CornerRadius = UDim.new(0, 4)
                HexInputCorner.Parent = HexInputContainer

                local HexInputStroke = Instance.new("UIStroke")
                HexInputStroke.Color = window.CurrentTheme.Border
                HexInputStroke.Thickness = 1
                HexInputStroke.Parent = HexInputContainer

                local HexInput = Instance.new("TextBox")
                HexInput.Size = UDim2.new(1, -10, 1, 0)
                HexInput.Position = UDim2.new(0, 5, 0, 0)
                HexInput.BackgroundTransparency = 1
                HexInput.Font = Enum.Font.Gotham
                HexInput.TextSize = 11
                HexInput.TextColor3 = window.CurrentTheme.Text
                HexInput.Text = ""
                HexInput.Parent = HexInputContainer

                local HexLabel = Instance.new("TextLabel")
                HexLabel.Size = UDim2.new(0, 40, 0, 24)
                HexLabel.Position = UDim2.new(0, 295, 0, 45)
                HexLabel.BackgroundTransparency = 1
                HexLabel.Font = Enum.Font.Gotham
                HexLabel.TextSize = 11
                HexLabel.TextColor3 = window.CurrentTheme.MutedText
                HexLabel.Text = "HEX"
                HexLabel.TextXAlignment = Enum.TextXAlignment.Left
                HexLabel.Parent = DialogFrame

                local function CreateRGBInput(yPos, labelText)
                    local ContainerFrame = Instance.new("Frame")
                    ContainerFrame.Size = UDim2.new(0, 40, 0, 24)
                    ContainerFrame.Position = UDim2.new(0, 200, 0, yPos)
                    ContainerFrame.BackgroundColor3 = window.CurrentTheme.Container
                    ContainerFrame.BorderSizePixel = 0
                    ContainerFrame.Parent = DialogFrame

                    local CornerFrame = Instance.new("UICorner")
                    CornerFrame.CornerRadius = UDim.new(0, 4)
                    CornerFrame.Parent = ContainerFrame

                    local StrokeFrame = Instance.new("UIStroke")
                    StrokeFrame.Color = window.CurrentTheme.Border
                    StrokeFrame.Thickness = 1
                    StrokeFrame.Parent = ContainerFrame

                    local Box = Instance.new("TextBox")
                    Box.Size = UDim2.new(1, -4, 1, 0)
                    Box.Position = UDim2.new(0, 2, 0, 0)
                    Box.BackgroundTransparency = 1
                    Box.Font = Enum.Font.Gotham
                    Box.TextSize = 11
                    Box.TextColor3 = window.CurrentTheme.Text
                    Box.Text = ""
                    Box.Parent = ContainerFrame

                    local LabelFrame = Instance.new("TextLabel")
                    LabelFrame.Size = UDim2.new(0, 15, 0, 24)
                    LabelFrame.Position = UDim2.new(0, 245, 0, yPos)
                    LabelFrame.BackgroundTransparency = 1
                    LabelFrame.Font = Enum.Font.Gotham
                    LabelFrame.TextSize = 11
                    LabelFrame.TextColor3 = window.CurrentTheme.MutedText
                    LabelFrame.Text = labelText
                    LabelFrame.TextXAlignment = Enum.TextXAlignment.Left
                    LabelFrame.Parent = DialogFrame

                    window:RegisterTheme(ContainerFrame, "BackgroundColor3", "Container")
                    window:RegisterTheme(StrokeFrame, "Color", "Border")
                    window:RegisterTheme(Box, "TextColor3", "Text")
                    window:RegisterTheme(LabelFrame, "TextColor3", "MutedText")

                    return Box
                end

                local RInput = CreateRGBInput(75, "R")
                local GInput = CreateRGBInput(105, "G")
                local BInput = CreateRGBInput(135, "B")

                local PreviewBox = Instance.new("Frame")
                PreviewBox.Size = UDim2.new(0, 65, 0, 84)
                PreviewBox.Position = UDim2.new(0, 275, 0, 75)
                PreviewBox.BackgroundColor3 = colorpickerObject.Value
                PreviewBox.BorderSizePixel = 0
                PreviewBox.Parent = DialogFrame

                local PreviewCorner = Instance.new("UICorner")
                PreviewCorner.CornerRadius = UDim.new(0, 4)
                PreviewCorner.Parent = PreviewBox

                local PreviewStroke = Instance.new("UIStroke")
                PreviewStroke.Color = window.CurrentTheme.Border
                PreviewStroke.Thickness = 1
                PreviewStroke.Parent = PreviewBox

                local currentH, currentS, currentV = Color3.toHSV(colorpickerObject.Value)

                local function UpdateVisuals()
                    local col = Color3.fromHSV(currentH, currentS, currentV)
                    SatVibMap.BackgroundColor3 = Color3.fromHSV(currentH, 1, 1)
                    SatCursor.Position = UDim2.new(currentS, 0, 1 - currentV, 0)
                    HueIndicator.Position = UDim2.new(0, -2, currentH, -2)
                    PreviewBox.BackgroundColor3 = col

                    if not HexInput:IsFocused() then
                        HexInput.Text = "#" .. col:ToHex()
                    end
                    if not RInput:IsFocused() then
                        RInput.Text = tostring(math.round(col.R * 255))
                    end
                    if not GInput:IsFocused() then
                        GInput.Text = tostring(math.round(col.G * 255))
                    end
                    if not BInput:IsFocused() then
                        BInput.Text = tostring(math.round(col.B * 255))
                    end
                end

                local function UpdateSatVib(pos)
                    local relativeX = pos.X - SatVibMap.AbsolutePosition.X
                    local relativeY = pos.Y - SatVibMap.AbsolutePosition.Y
                    currentS = math.clamp(relativeX / SatVibMap.AbsoluteSize.X, 0, 1)
                    currentV = math.clamp(1 - (relativeY / SatVibMap.AbsoluteSize.Y), 0, 1)
                    UpdateVisuals()
                end

                local function UpdateHue(pos)
                    local relativeY = pos.Y - HueSlider.AbsolutePosition.Y
                    currentH = math.clamp(relativeY / HueSlider.AbsoluteSize.Y, 0, 1)
                    UpdateVisuals()
                end

                local satDragging = false
                SatVibMap.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        satDragging = true
                        UpdateSatVib(input.Position)
                    end
                end)

                UserInputService.InputChanged:Connect(function(input)
                    if satDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        UpdateSatVib(input.Position)
                    end
                end)

                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        satDragging = false
                    end
                end)

                local hueDragging = false
                HueSlider.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        hueDragging = true
                        UpdateHue(input.Position)
                    end
                end)

                UserInputService.InputChanged:Connect(function(input)
                    if hueDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        UpdateHue(input.Position)
                    end
                end)

                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        hueDragging = false
                    end
                end)

                local function ApplyRGB()
                    local r = tonumber(RInput.Text) or 0
                    local g = tonumber(GInput.Text) or 0
                    local b = tonumber(BInput.Text) or 0
                    r = math.clamp(r, 0, 255)
                    g = math.clamp(g, 0, 255)
                    b = math.clamp(b, 0, 255)
                    currentH, currentS, currentV = Color3.toHSV(Color3.fromRGB(r, g, b))
                    UpdateVisuals()
                end

                local function ApplyHex()
                    local txt = HexInput.Text
                    if string.sub(txt, 1, 1) ~= "#" then
                        txt = "#" .. txt
                    end
                    local success, result = pcall(Color3.fromHex, txt)
                    if success and typeof(result) == "Color3" then
                        currentH, currentS, currentV = Color3.toHSV(result)
                    end
                    UpdateVisuals()
                end

                RInput.FocusLost:Connect(ApplyRGB)
                GInput.FocusLost:Connect(ApplyRGB)
                BInput.FocusLost:Connect(ApplyRGB)
                HexInput.FocusLost:Connect(ApplyHex)

                local DoneBtn = Instance.new("TextButton")
                DoneBtn.Size = UDim2.new(0, 100, 0, 28)
                DoneBtn.Position = UDim2.new(0.5, -110, 1, -34)
                DoneBtn.BackgroundColor3 = window.CurrentTheme.Container
                DoneBtn.BorderSizePixel = 0
                DoneBtn.Font = Enum.Font.GothamMedium
                DoneBtn.Text = "Done"
                DoneBtn.TextColor3 = window.CurrentTheme.Text
                DoneBtn.TextSize = 12
                DoneBtn.Parent = DialogFrame

                local DoneCorner = Instance.new("UICorner")
                DoneCorner.CornerRadius = UDim.new(0, 5)
                DoneCorner.Parent = DoneBtn

                local DoneStroke = Instance.new("UIStroke")
                DoneStroke.Color = window.CurrentTheme.Border
                DoneStroke.Thickness = 1
                DoneStroke.Parent = DoneBtn

                local CancelBtn = Instance.new("TextButton")
                CancelBtn.Size = UDim2.new(0, 100, 0, 28)
                CancelBtn.Position = UDim2.new(0.5, 10, 1, -34)
                CancelBtn.BackgroundColor3 = window.CurrentTheme.Container
                CancelBtn.BorderSizePixel = 0
                CancelBtn.Font = Enum.Font.GothamMedium
                CancelBtn.Text = "Cancel"
                CancelBtn.TextColor3 = window.CurrentTheme.Text
                CancelBtn.TextSize = 12
                CancelBtn.Parent = DialogFrame

                local CancelCorner = Instance.new("UICorner")
                CancelCorner.CornerRadius = UDim.new(0, 5)
                CancelCorner.Parent = CancelBtn

                local CancelStroke = Instance.new("UIStroke")
                CancelStroke.Color = window.CurrentTheme.Border
                CancelStroke.Thickness = 1
                CancelStroke.Parent = CancelBtn

                local function HoverBtn(btn, stroke)
                    btn.MouseEnter:Connect(function()
                        Tween(btn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = GetHoverColor(window.CurrentTheme.Container)})
                        Tween(stroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = window.CurrentTheme.Accent})
                    end)
                    btn.MouseLeave:Connect(function()
                        Tween(btn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = window.CurrentTheme.Container})
                        Tween(stroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = window.CurrentTheme.Border})
                    end)
                end

                HoverBtn(DoneBtn, DoneStroke)
                HoverBtn(CancelBtn, CancelStroke)

                DoneBtn.MouseButton1Click:Connect(function()
                    colorpickerObject:SetValue(Color3.fromHSV(currentH, currentS, currentV))
                    Overlay:Destroy()
                end)

                CancelBtn.MouseButton1Click:Connect(function()
                    Overlay:Destroy()
                end)

                window:RegisterTheme(DialogFrame, "BackgroundColor3", "MainFrame")
                window:RegisterTheme(DialogStroke, "Color", "Accent")
                window:RegisterTheme(Title, "TextColor3", "Text")
                window:RegisterTheme(HexInputContainer, "BackgroundColor3", "Container")
                window:RegisterTheme(HexInputStroke, "Color", "Border")
                window:RegisterTheme(HexInput, "TextColor3", "Text")
                window:RegisterTheme(HexLabel, "TextColor3", "MutedText")
                window:RegisterTheme(PreviewStroke, "Color", "Border")
                window:RegisterTheme(DoneBtn, "BackgroundColor3", "Container")
                window:RegisterTheme(DoneBtn, "TextColor3", "Text")
                window:RegisterTheme(DoneStroke, "Color", "Border")
                window:RegisterTheme(CancelBtn, "BackgroundColor3", "Container")
                window:RegisterTheme(CancelBtn, "TextColor3", "Text")
                window:RegisterTheme(CancelStroke, "Color", "Border")

                UpdateVisuals()
            end)

            local el = {
                Name = titleText,
                Frame = Container
            }
            table.insert(tab.Elements, el)
            Vortex.Options[id] = colorpickerObject
            return colorpickerObject
        end

        table.insert(window.Tabs, tab)
        return tab
    end

    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local query = string.lower(SearchBox.Text)
        if window.CurrentTab then
            for _, el in ipairs(window.CurrentTab.Elements) do
                if el.Frame and el.Frame:IsA("Frame") then
                    if query == "" then
                        el.Frame.Visible = true
                    else
                        el.Frame.Visible = string.find(string.lower(el.Name), query) ~= nil
                    end
                end
            end
        end
    end)

    return window
end

return Vortex
