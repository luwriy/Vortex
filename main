local Vortex = {
    Options = {}
}

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

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

function Vortex:CreateWindow(options)
    options = options or {}
    local TitleText = options.Title or "Vortex"
    local SubTitleText = options.SubTitle or ""
    local MinimizeText = options.MinimizeText or "Versus Airlines"
    
    local FolderCallback = options.FolderCallback
    local TrashCallback = options.TrashCallback
    local BugCallback = options.BugCallback
    local ThemeCallback = options.ThemeCallback

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

    CreateShadow(MainFrame)

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
        btn.BackgroundColor3 = Color3.fromRGB(28, 32, 45)
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
        btnStroke.Color = Color3.fromRGB(40, 46, 64)
        btnStroke.Thickness = 1
        btnStroke.Parent = btn

        btn.MouseEnter:Connect(function()
            Tween(btn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = Color3.fromRGB(35, 40, 55)})
            Tween(btnStroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = color})
        end)

        btn.MouseLeave:Connect(function()
            Tween(btn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = Color3.fromRGB(28, 32, 45)})
            Tween(btnStroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = Color3.fromRGB(40, 46, 64)})
        end)

        btn.MouseButton1Click:Connect(function()
            if callback then
                callback()
            end
        end)

        btn.Parent = FooterFrame
        return btn
    end

    AddFooterButton(Color3.fromRGB(255, 215, 0), "rbxassetid://10734947470", FolderCallback)
    AddFooterButton(Color3.fromRGB(255, 75, 75), "rbxassetid://10734948332", TrashCallback)
    AddFooterButton(Color3.fromRGB(255, 90, 120), "rbxassetid://10734950309", BugCallback)
    AddFooterButton(Color3.fromRGB(90, 150, 255), "rbxassetid://10734951478", ThemeCallback)

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

    CreateShadow(MinimizeButton)

    local dragging = false
    local dragStart, startPos
    MainFrame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and (input.Target == MainFrame or input.Target == SidebarFrame or input.Target == ContentContainer) then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    local isMinimized = false
    local lastPosition = MainFrame.Position

    MinimizeButton.MouseEnter:Connect(function()
        Tween(MinimizeButton, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = Color3.fromRGB(28, 32, 45)})
        Tween(MinimizeStroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = Color3.fromRGB(58, 147, 255)})
    end)

    MinimizeButton.MouseLeave:Connect(function()
        Tween(MinimizeButton, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = Color3.fromRGB(22, 25, 36)})
        Tween(MinimizeStroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = Color3.fromRGB(33, 38, 54)})
    end)

    MinimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            lastPosition = MainFrame.Position
            local targetPos = UDim2.new(lastPosition.X.Scale, lastPosition.X.Offset, 1.5, 0)
            local t = Tween(MainFrame, {0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In}, {Position = targetPos})
            t.Completed:Connect(function()
                MainFrame.Visible = false
            end)
        else
            MainFrame.Visible = true
            Tween(MainFrame, {0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Position = lastPosition})
        end
    end)

    local window = {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        Tabs = {},
        CurrentTab = nil,
        TooltipFrame = TooltipFrame,
        TooltipLabel = TooltipLabel
    }

    function window:AddTab(tabOptions)
        tabOptions = tabOptions or {}
        local name = tabOptions.Title or "Tab"
        local icon = tabOptions.Icon

        local TabButton = Instance.new("TextButton")
        TabButton.Name = name .. "TabBtn"
        TabButton.Size = UDim2.new(1, -4, 0, 32)
        TabButton.BackgroundColor3 = Color3.fromRGB(22, 25, 36)
        TabButton.BackgroundTransparency = 1
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

        if icon then
            local TabIcon = Instance.new("ImageLabel")
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

        local function Select()
            if window.CurrentTab then
                window.CurrentTab.ContentFrame.Visible = false
                window.CurrentTab.Label.TextColor3 = Color3.fromRGB(150, 155, 170)
                if window.CurrentTab.Button:FindFirstChildOfClass("ImageLabel") then
                    window.CurrentTab.Button:FindFirstChildOfClass("ImageLabel").ImageColor3 = Color3.fromRGB(150, 155, 170)
                end
                Tween(window.CurrentTab.Stroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = Color3.fromRGB(45, 50, 65)})
            end
            window.CurrentTab = tab
            tab.ContentFrame.Visible = true
            tab.Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            if TabButton:FindFirstChildOfClass("ImageLabel") then
                TabButton:FindFirstChildOfClass("ImageLabel").ImageColor3 = Color3.fromRGB(255, 255, 255)
            end
            Tween(tab.Stroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = Color3.fromRGB(58, 147, 255)})
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
                Type = "Toggle",
                ChangedCallbacks = {}
            }

            local function UpdateVisual(animate)
                local targetColor = toggleObject.Value and Color3.fromRGB(58, 147, 255) or Color3.fromRGB(40, 45, 55)
                local targetStrokeColor = toggleObject.Value and Color3.fromRGB(58, 147, 255) or Color3.fromRGB(55, 62, 77)
                if animate then
                    Tween(Switch, {0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = targetColor})
                    Tween(SwitchStroke, {0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = targetStrokeColor})
                else
                    Switch.BackgroundColor3 = targetColor
                    SwitchStroke.Color = targetStrokeColor
                end
            end

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
                Type = "Slider",
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
            moveCon = UserInputService.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    HandleInput()
                end
            end)

            endCon = UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
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
            Btn.Size = UDim2.new(1, -24, 1, -12)
            Btn.Position = UDim2.new(0, 12, 0, 6)
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

            Btn.MouseEnter:Connect(function()
                Tween(Btn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = Color3.fromRGB(40, 45, 60)})
                Tween(BtnStroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = Color3.fromRGB(58, 147, 255)})
            end)

            Btn.MouseLeave:Connect(function()
                Tween(Btn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = Color3.fromRGB(35, 40, 55)})
                Tween(BtnStroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = Color3.fromRGB(45, 52, 71)})
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
                Type = "Dropdown",
                ChangedCallbacks = {}
            }

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

                OptBtn.MouseEnter:Connect(function()
                    Tween(OptBtn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = Color3.fromRGB(40, 45, 60)})
                    Tween(OptStroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = Color3.fromRGB(58, 147, 255)})
                end)

                OptBtn.MouseLeave:Connect(function()
                    Tween(OptBtn, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = Color3.fromRGB(35, 40, 55)})
                    Tween(OptStroke, {0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = Color3.fromRGB(45, 52, 71)})
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
                Type = "Input",
                ChangedCallbacks = {}
            }

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
                Type = "Keybind",
                ChangedCallbacks = {}
            }

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
