do  local ui =  game:GetService("CoreGui"):FindFirstChild("SixZens UI")  if ui then ui:Destroy() end end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local tween = game:GetService("TweenService")
local Red = {RainbowColorValue = 0, HueSelectionPosition = 0}

coroutine.wrap(
	function()
		while wait() do
			Red.RainbowColorValue = Red.RainbowColorValue + 1 / 255
			Red.HueSelectionPosition = Red.HueSelectionPosition + 1

			if Red.RainbowColorValue >= 1 then
				Red.RainbowColorValue = 0
			end

			if Red.HueSelectionPosition == 160 then
				Red.HueSelectionPosition = 0
			end
		end
	end
)()

local FreeUI = Instance.new("ScreenGui")
FreeUI.Name = "SixZens UI"
FreeUI.Parent = game.CoreGui
FreeUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

local function Tween(instance, properties,style,wa)
	if style == nil or "" then
		return Back
	end
	tween:Create(instance,TweenInfo.new(wa,Enum.EasingStyle[style]),{properties}):Play()
end

local uimain = {}

function uimain:cre(text)
	local fs = false

	local MainSceen = Instance.new("Frame")

	MainSceen.Name = "MainSceen"
	MainSceen.Parent = FreeUI
	MainSceen.Active = true
	MainSceen.AnchorPoint = Vector2.new(0.5, 0.5)
	MainSceen.BackgroundColor3 = Color3.fromRGB(2, 2, 2)
	MainSceen.Position = UDim2.new(0.453608245, 0, 0.5, 0)
	MainSceen.Size = UDim2.new(0, 493, 0, 387)

	local Main_UiConner = Instance.new("UICorner")

	Main_UiConner.CornerRadius = UDim.new(0, 2)
	Main_UiConner.Name = "Main_UiConner"
	Main_UiConner.Parent = MainSceen

	local ClickFrame = Instance.new("Frame")

	ClickFrame.Name = "ClickFrame"
	ClickFrame.Parent = MainSceen
	ClickFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ClickFrame.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
	ClickFrame.BackgroundTransparency = 1.000
	ClickFrame.Position = UDim2.new(0.5, 0, 0.0310077518, 0)
	ClickFrame.Size = UDim2.new(0, 516, 0, 25)
	ClickFrame.ClipsDescendants = true

	MakeDraggable(ClickFrame,MainSceen)

	local NameReal = Instance.new("TextLabel")

	NameReal.Name = "NameReal"
	NameReal.Parent = MainSceen
	NameReal.Active = true
	NameReal.AnchorPoint = Vector2.new(0.5, 0)
	NameReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NameReal.BackgroundTransparency = 1.000
	NameReal.Position = UDim2.new(0.47554642, 15, 0, 0)
	NameReal.Size = UDim2.new(1.01789939, -14, 0.0180878546, 20)
	NameReal.Font = Enum.Font.Gotham
	NameReal.Text = text
	NameReal.TextColor3 = Color3.fromRGB(170, 0, 255)
	NameReal.TextSize = 11.000

	local MainSceen2 = Instance.new("Frame")

	MainSceen2.Name = "MainSceen2"
	MainSceen2.Parent = MainSceen
	MainSceen2.AnchorPoint = Vector2.new(0.5, 0.5)
	MainSceen2.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	MainSceen2.BorderSizePixel = 0
	MainSceen2.Position = UDim2.new(0.500075161, 0, 0.527218699, 0)
	MainSceen2.Size = UDim2.new(0, 482, 0, 353)
	MainSceen2.ClipsDescendants = true

	local Main_UiConner2 = Instance.new("UICorner")

	Main_UiConner2.CornerRadius = UDim.new(0, 2)
	Main_UiConner2.Name = "Main_UiConner2"
	Main_UiConner2.Parent = MainSceen2

	local ScolTapBarFrame = Instance.new("Frame")

	ScolTapBarFrame.Name = "ScolTapBarFrame"
	ScolTapBarFrame.Parent = MainSceen2
	ScolTapBarFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ScolTapBarFrame.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
	ScolTapBarFrame.BackgroundTransparency = 1.000
	ScolTapBarFrame.BorderSizePixel = 0
	ScolTapBarFrame.Position = UDim2.new(0.5, 0, 0.0409836061, 5)
	ScolTapBarFrame.Size = UDim2.new(0.993808031, -10, 0, 23)
	ScolTapBarFrame.ClipsDescendants = true

	local ScrollingFrame_Menubar = Instance.new("ScrollingFrame")

	ScrollingFrame_Menubar.Name = "ScrollingFrame_Menubar"
	ScrollingFrame_Menubar.Parent = ScolTapBarFrame
	ScrollingFrame_Menubar.Active = true
	ScrollingFrame_Menubar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame_Menubar.BackgroundTransparency = 1.000
	ScrollingFrame_Menubar.BorderColor3 = Color3.fromRGB(27, 42, 53)
	ScrollingFrame_Menubar.BorderSizePixel = 0
	ScrollingFrame_Menubar.Size = UDim2.new(1.01257861, -10, 0, 23)
	ScrollingFrame_Menubar.ScrollBarThickness = 3
	ScrollingFrame_Menubar.ClipsDescendants = true

	local UIListLayout_Menubar = Instance.new("UIListLayout")

	UIListLayout_Menubar.Name = "UIListLayout_Menubar"
	UIListLayout_Menubar.Parent = ScrollingFrame_Menubar
	UIListLayout_Menubar.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout_Menubar.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_Menubar.Padding = UDim.new(0, 10)

	local UIPadding_Menubar = Instance.new("UIPadding")

	UIPadding_Menubar.Name = "UIPadding_Menubar"
	UIPadding_Menubar.Parent = ScrollingFrame_Menubar
	UIPadding_Menubar.PaddingLeft = UDim.new(0, 20)
	UIPadding_Menubar.PaddingTop = UDim.new(0, 1)

	local PageOrders = -1

	local Container_Page = Instance.new("Frame")

	Container_Page.Name = "Container_Page"
	Container_Page.Parent = MainSceen2
	Container_Page.AnchorPoint = Vector2.new(0.5, 0.5)
	Container_Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Container_Page.BackgroundTransparency = 1.000
	Container_Page.Position = UDim2.new(0.499648929, 0, 0.544792116, 0)
	Container_Page.Size = UDim2.new(0, 502, 0, 318)

	local pagesFolder = Instance.new("Folder")

	pagesFolder.Name = "pagesFolder"
	pagesFolder.Parent = Container_Page

	local UIPage = Instance.new("UIPageLayout")

	UIPage.Name = "UIPage"
	UIPage.Parent = pagesFolder
	UIPage.SortOrder = Enum.SortOrder.LayoutOrder
	UIPage.EasingStyle = Enum.EasingStyle.Quart
	UIPage.Padding = UDim.new(0, 15)
	UIPage.TweenTime = 0.500

	local uimain2 = {}

	function uimain2:tab(text)
		PageOrders = PageOrders + 1

		local name = tostring(text) or tostring(math.random(1,5000))

		local Frame_Tap = Instance.new("Frame")

		Frame_Tap.Name = text.."Server"
		Frame_Tap.Parent = ScrollingFrame_Menubar
		Frame_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_Tap.BackgroundTransparency = 1.000
		Frame_Tap.Size = UDim2.new(0, 90, 0, 16)

		local TextButton_Tap = Instance.new("TextButton")

		TextButton_Tap.Name = "TextButton_Tap"
		TextButton_Tap.Parent = Frame_Tap
		TextButton_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton_Tap.BackgroundTransparency = 1.000
		TextButton_Tap.Position = UDim2.new(0.0480000004, 0, 0.100000001, 0)
		TextButton_Tap.Size = UDim2.new(0, 80, 0, 20)
		TextButton_Tap.Font = Enum.Font.Gotham
		TextButton_Tap.Text = text
		TextButton_Tap.TextColor3 = Color3.fromRGB(155, 155, 155)
		TextButton_Tap.TextSize = 11.000

		local MainPage = Instance.new("Frame")

		MainPage.Name = name.."_MainPage"
		MainPage.Parent = pagesFolder
		MainPage.Active = true
		MainPage.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
		MainPage.BackgroundTransparency = 1.000
		MainPage.BorderSizePixel = 0
		MainPage.ClipsDescendants = true
		MainPage.Size = UDim2.new(0, 504, 0, 319)
		MainPage.LayoutOrder = PageOrders

		TextButton_Tap.MouseButton1Click:connect(function()
			if MainPage.Name == text.."_MainPage" then
				UIPage:JumpToIndex(MainPage.LayoutOrder)

			end
			for i ,v in next , ScrollingFrame_Menubar:GetChildren() do
				if v:IsA("Frame") then
					TweenService:Create(
						v.TextButton_Tap,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(155, 155, 155)}
					):Play()
				end

				TweenService:Create(
					TextButton_Tap,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextColor3 = Color3.fromRGB(170, 0, 255)}
				):Play()
			end
		end)

		if fs == false then
			-- TweenService:Create(
			--     TextLabel_Tap,
			--     TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			--     {Size = UDim2.new(0, 70, 0, 2)}
			-- ):Play()
			TweenService:Create(
				TextButton_Tap,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{TextColor3 = Color3.fromRGB(170, 0, 255)}
			):Play()

			MainPage.Visible = true
			Frame_Tap.Name  = text .. "Server"
			fs  = true
		end

		local ScrollingFrame_Pagefrist = Instance.new("ScrollingFrame")

		ScrollingFrame_Pagefrist.Name = "ScrollingFrame_Pagefrist"
		ScrollingFrame_Pagefrist.Parent = MainPage
		ScrollingFrame_Pagefrist.Active = true
		ScrollingFrame_Pagefrist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingFrame_Pagefrist.BackgroundTransparency = 1.000
		ScrollingFrame_Pagefrist.BorderSizePixel = 0
		ScrollingFrame_Pagefrist.Position = UDim2.new(0.00828067865, 0, 0, 0)
		ScrollingFrame_Pagefrist.Size = UDim2.new(0, 493, 0, 319)
		ScrollingFrame_Pagefrist.ScrollBarThickness = 4

		local UIGridLayout_Pagefrist = Instance.new("UIGridLayout")
		local UIPadding_Pagefrist = Instance.new("UIPadding")

		UIGridLayout_Pagefrist.Name = "UIGridLayout_Pagefrist"
		UIGridLayout_Pagefrist.Parent = ScrollingFrame_Pagefrist
		UIGridLayout_Pagefrist.SortOrder = Enum.SortOrder.LayoutOrder
		UIGridLayout_Pagefrist.CellPadding = UDim2.new(0, 34, 0, 15)
		UIGridLayout_Pagefrist.CellSize = UDim2.new(0, 220, 0, 305)

		UIPadding_Pagefrist.Name = "UIPadding_Pagefrist"
		UIPadding_Pagefrist.Parent = ScrollingFrame_Pagefrist
		UIPadding_Pagefrist.PaddingLeft = UDim.new(0, 10)
		UIPadding_Pagefrist.PaddingTop = UDim.new(0, 10)

		local uimain3 = {}

		function uimain3:page(text)
			local Pageframe = Instance.new("Frame")

			Pageframe.Name = "Pageframe"
			Pageframe.Parent = ScrollingFrame_Pagefrist
			Pageframe.Active = true
			Pageframe.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
			Pageframe.BorderSizePixel = 0
			Pageframe.Size = UDim2.new(0, 100, 0, 100)

			local ScrollingFrame_Pageframe = Instance.new("ScrollingFrame")

			ScrollingFrame_Pageframe.Name = "ScrollingFrame_Pageframe"
			ScrollingFrame_Pageframe.Parent = Pageframe
			ScrollingFrame_Pageframe.Active = true
			ScrollingFrame_Pageframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScrollingFrame_Pageframe.BackgroundTransparency = 1.000
			ScrollingFrame_Pageframe.BorderSizePixel = 0
			ScrollingFrame_Pageframe.Size = UDim2.new(0, 220, 0, 300)
			ScrollingFrame_Pageframe.ScrollBarThickness = 3

			local TextLabel = Instance.new("TextLabel")

			TextLabel.Parent = Pageframe
			TextLabel.Active = true
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.Position = UDim2.new(0.0454545468, 0, -0.0549999811, 0)
			TextLabel.Size = UDim2.new(0, 210, 0, 34)
			TextLabel.ZIndex = 99
			TextLabel.Font = Enum.Font.Gotham
			TextLabel.Text = text
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 11.000
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			local UIPadding_Pageframe = Instance.new("UIPadding")
			local UIListLayout_Pageframe = Instance.new("UIListLayout")
			local UICorner = Instance.new("UICorner")

			UIPadding_Pageframe.Name = "UIPadding_Pageframe"
			UIPadding_Pageframe.Parent = ScrollingFrame_Pageframe
			UIPadding_Pageframe.PaddingLeft = UDim.new(0, 15)
			UIPadding_Pageframe.PaddingTop = UDim.new(0, 10)

			UIListLayout_Pageframe.Name = "UIListLayout_Pageframe"
			UIListLayout_Pageframe.Parent = ScrollingFrame_Pageframe
			UIListLayout_Pageframe.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_Pageframe.Padding = UDim.new(0, 7)

			UICorner.CornerRadius = UDim.new(0, 2)
			UICorner.Parent = MainPage

			UIListLayout_Pageframe:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
				ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,UIListLayout_Pageframe.AbsoluteContentSize.Y + 120 )
			end)

			UIGridLayout_Pagefrist:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
				ScrollingFrame_Pagefrist.CanvasSize = UDim2.new(0,0,0,UIGridLayout_Pagefrist.AbsoluteContentSize.Y + 20 )
			end)

			game:GetService("RunService").Stepped:Connect(function ()
				pcall(function ()
					ScrollingFrame_Menubar.CanvasSize = UDim2.new(0,  UIListLayout_Menubar.AbsoluteContentSize.X, 0,0)
					ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,UIListLayout_Pageframe.AbsoluteContentSize.Y +20 )
					ScrollingFrame_Pagefrist.CanvasSize = UDim2.new(0,0,0,UIGridLayout_Pagefrist.AbsoluteContentSize.Y + 12)
				end)
			end)
			local uiitem = {}
			function uiitem:Label(text)

				local labelfuc = {}

				local Button = Instance.new("Frame")

				Button.Name = "Button"
				Button.Parent = ScrollingFrame_Pageframe
				Button.BackgroundColor3 = Color3.fromRGB(42,42,42)
				Button.BackgroundTransparency = 1
				Button.BorderSizePixel = 0
				Button.Size = UDim2.new(0, 100, 0, 30)

				local ButtonCorner = Instance.new("UICorner")

				ButtonCorner.CornerRadius = UDim.new(0, 4)
				ButtonCorner.Parent = Button

				local  Labelxd = Instance.new("TextLabel")

				Labelxd.Parent = Button
				Labelxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Labelxd.BackgroundTransparency = 1
				Labelxd.AnchorPoint = Vector2.new(0.5, 0.5)
				Labelxd.Position = UDim2.new(0.5, 0, 0.5, 0)
				Labelxd.BorderSizePixel = 0
				Labelxd.Size = UDim2.new(0, 100, 0, 13)
				Labelxd.Font = Enum.Font.Gotham
				Labelxd.Text = tostring(text)
				Labelxd.TextColor3 = Color3.fromRGB(155,155,155)
				Labelxd.TextSize = 11.000
				Labelxd.TextXAlignment = Enum.TextXAlignment.Left
				Labelxd.TextWrapped = true

				function  labelfuc:Change(text2)
					Labelxd.Text = tostring(text2)
				end
				return  labelfuc
			end
			function uiitem:Button(text,callback)
				local Btn = Instance.new("TextButton")
				local BtnName = Instance.new("TextLabel")
				local UICorner_12 = Instance.new("UICorner")

				local Button = Instance.new("Frame")

				Button.Name = "Button"
				Button.Parent = ScrollingFrame_Pageframe
				Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button.BackgroundTransparency = 1
				Button.BorderColor3 = Color3.fromRGB(27, 42, 53)
				Button.Size = UDim2.new(0, 150, 0, 21)

				Btn.Name = "Btn"
				Btn.Parent = Button
				Btn.BackgroundColor3 = Color3.fromRGB(10,10,10)
				Btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Btn.BorderSizePixel = 0
				Btn.Position = UDim2.new(-0.03, 0, 0, 0)
				Btn.Size = UDim2.new(0, 200, 0.8, 0)
				Btn.Text = ""
				Btn.AutoButtonColor = false

				BtnName.Name = "BtnName"
				BtnName.Parent = Btn
				BtnName.BackgroundTransparency = 1.000
				BtnName.BorderColor3 = Color3.fromRGB(0, 0, 0)
				BtnName.BorderSizePixel = 0
				BtnName.Size = UDim2.new(0, 0, 0, 0)
				BtnName.Position = UDim2.new(0.5, 0, 0.5, 0)
				BtnName.Font = Enum.Font.Gotham
				BtnName.Text = "  ".. text
				BtnName.TextColor3 = Color3.fromRGB(255, 255, 255)
				BtnName.TextSize = 11.000
				BtnName.TextXAlignment = Enum.TextXAlignment.Center

				local Main_UiStroke = Instance.new("UIStroke")

				Main_UiStroke.Thickness = 1
				Main_UiStroke.Name = ""
				Main_UiStroke.Parent = Btn
				Main_UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				Main_UiStroke.LineJoinMode = Enum.LineJoinMode.Round
				Main_UiStroke.Color = Color3.fromRGB(0,0,0)
				Main_UiStroke.Transparency = 0

				local Main_UiConner = Instance.new("UICorner")
				Main_UiConner.Name = "Main_UiConner"
				Main_UiConner.CornerRadius = UDim.new(0, 2)
				Main_UiConner.Parent = Btn

				Btn.MouseButton1Click:Connect(function()
					BtnName.TextSize = 0
					TweenService:Create(
						BtnName,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextSize = 11} -- UDim2.new(0, 128, 0, 25)
					):Play()
					pcall(callback)
				end)

				Btn.MouseButton1Down:Connect(function()
					TweenService:Create(
						BtnName,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(170, 0, 255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end)

				Btn.MouseEnter:Connect(function()
					TweenService:Create(
						Main_UiStroke,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Color = Color3.fromRGB(170, 0, 255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end)

				Btn.MouseLeave:Connect(function()
					TweenService:Create(
						Main_UiStroke,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Color = Color3.fromRGB(0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						BtnName,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end)
			end
			function uiitem:Toggle(text,config,callback)
				local Toggle = Instance.new("Frame")

				Toggle.Name = "Toggle"
				Toggle.Parent = ScrollingFrame_Pageframe
				Toggle.Active = true
				Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
				Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.BackgroundTransparency = 1
				Toggle.BorderColor3 = Color3.fromRGB(27, 42, 53)
				Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
				Toggle.Size = UDim2.new(0, 250, 0, 35)

				local TextButton_Toggle = Instance.new("TextButton")
				TextButton_Toggle.Name = "TextButton_Toggle"
				TextButton_Toggle.Parent = Toggle
				TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton_Toggle.BackgroundTransparency = 1.000
				TextButton_Toggle.Size = UDim2.new(0, 213, 0, 35)
				TextButton_Toggle.Font = Enum.Font.SourceSans
				TextButton_Toggle.Text = " "
				TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton_Toggle.TextSize = 14.000

				local TextButton_2_Toggle = Instance.new("TextButton")

				TextButton_2_Toggle.Name = "TextButton_2_Toggle"
				TextButton_2_Toggle.Parent = TextButton_Toggle
				TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
				TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(10,10,10)
				TextButton_2_Toggle.BorderColor3 = Color3.fromRGB(20, 20, 20)
				TextButton_2_Toggle.BorderSizePixel = 0
				TextButton_2_Toggle.Position = UDim2.new(0.0807512328, 0, 0.5, 0)
				TextButton_2_Toggle.Size = UDim2.new(0, 18, 0, 18)
				TextButton_2_Toggle.AutoButtonColor = false
				TextButton_2_Toggle.Font = Enum.Font.SourceSans
				TextButton_2_Toggle.Text = " "
				TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton_2_Toggle.TextSize = 14.000

				local Main_UiStroke = Instance.new("UIStroke")

				Main_UiStroke.Thickness = 1
				Main_UiStroke.Name = ""
				Main_UiStroke.Parent = TextButton_2_Toggle
				Main_UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				Main_UiStroke.LineJoinMode = Enum.LineJoinMode.Round
				Main_UiStroke.Color = Color3.fromRGB(0,0,0)
				Main_UiStroke.Transparency = 0

				local UICorner = Instance.new("UICorner")

				UICorner.CornerRadius = UDim.new(0, 2)
				UICorner.Parent = TextButton_2_Toggle

				local ImageButton = Instance.new("ImageButton")

				local check = {toogle = false ; togfunction = {

				};}

				ImageButton.Parent = TextButton_2_Toggle
				ImageButton.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
				ImageButton.BackgroundTransparency = 1
				ImageButton.BorderSizePixel = 0
				ImageButton.Position = UDim2.new(0, 3, 0, 3)
				ImageButton.Size = UDim2.new(0, 12, 0, 12)
				ImageButton.Image = "rbxassetid://0"
				ImageButton.AutoButtonColor = false
				ImageButton.ImageColor3 = Color3.fromRGB(100, 175, 255)
				ImageButton.ImageTransparency = 1

				local UICorner_2 = Instance.new("UICorner")
				local TextLabel_Toggle = Instance.new("TextLabel")

				UICorner_2.CornerRadius = UDim.new(0, 2)
				UICorner_2.Parent = ImageButton

				TextLabel_Toggle.Name = "TextLabel_Toggle"
				TextLabel_Toggle.Parent = Toggle
				TextLabel_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
				TextLabel_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_Toggle.BackgroundTransparency = 1
				TextLabel_Toggle.Position = UDim2.new(0.43, 0, 0.5, 0)
				TextLabel_Toggle.Size = UDim2.new(0, 150, 0, 25)
				TextLabel_Toggle.Font = Enum.Font.Gotham
				TextLabel_Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_Toggle.TextSize = 11.000
				TextLabel_Toggle.Text = text
				TextLabel_Toggle.TextWrapped = true
				TextLabel_Toggle.TextXAlignment = Enum.TextXAlignment.Left

				TextButton_Toggle.MouseButton1Click:Connect(function()
					if check.toogle == false then
						TweenService:Create(
							Main_UiStroke,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Color = Color3.fromRGB(170, 0, 255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							ImageButton,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundTransparency = 0} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							TextLabel_Toggle,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(170, 0, 255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					else
						TweenService:Create(
							Main_UiStroke,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Color = Color3.fromRGB(0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							ImageButton,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							TextLabel_Toggle,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end
						check.toogle = not check.toogle
						callback(check.toogle)
				end)

				TextButton_2_Toggle.MouseButton1Click:Connect(function()
					if check.toogle == false then
						TweenService:Create(
							Main_UiStroke,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Color = Color3.fromRGB(170, 0, 255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							ImageButton,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundTransparency = 0} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							TextLabel_Toggle,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(170, 0, 255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					else
						TweenService:Create(
							Main_UiStroke,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Color = Color3.fromRGB(0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							ImageButton,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							TextLabel_Toggle,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end
					check.toogle = not check.toogle
						callback(check.toogle)
				end)

				ImageButton.MouseButton1Click:Connect(function()
					if check.toogle == false then
						TweenService:Create(
							Main_UiStroke,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Color = Color3.fromRGB(170, 0, 255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							ImageButton,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundTransparency = 0} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							TextLabel_Toggle,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(170, 0, 255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					else
						TweenService:Create(
							Main_UiStroke,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Color = Color3.fromRGB(0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							ImageButton,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							TextLabel_Toggle,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end
					check.toogle = not check.toogle
						callback(check.toogle)
				end)

				if config == true then
					TweenService:Create(
						Main_UiStroke,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Color = Color3.fromRGB(170, 0, 255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						ImageButton,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						TextLabel_Toggle,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(170, 0, 255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					check.toogle = true
					callback(check.toogle)
				end
				return  check.togfunction
			end
			function uiitem:Dropdown(text,option,callback)
				local DropFrame = Instance.new("Frame")

				DropFrame.Name = "DropFrame"
				DropFrame.Parent = ScrollingFrame_Pageframe
				DropFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				DropFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
				DropFrame.BorderSizePixel = 0
				DropFrame.ClipsDescendants = true
				DropFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
				DropFrame.Size = UDim2.new(0, 190, 0, 21)

				local Main_UiStroke = Instance.new("UIStroke")

				Main_UiStroke.Thickness = 1
				Main_UiStroke.Name = ""
				Main_UiStroke.Parent = DropFrame
				Main_UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				Main_UiStroke.LineJoinMode = Enum.LineJoinMode.Round
				Main_UiStroke.Color = Color3.fromRGB(0,0,0)
				Main_UiStroke.Transparency = 0

				local ConnerDropFrame = Instance.new("UICorner")

				ConnerDropFrame.CornerRadius = UDim.new(0, 2)
				ConnerDropFrame.Name = "ConnerDropFrame"
				ConnerDropFrame.Parent = DropFrame

				local LabelFrameDrop = Instance.new("TextLabel")

				LabelFrameDrop.Name = "LabelFrameDrop"
				LabelFrameDrop.Parent = DropFrame
				LabelFrameDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelFrameDrop.BackgroundTransparency = 1.000
				LabelFrameDrop.Position = UDim2.new(0.05, 0, -0.035, 0)
				LabelFrameDrop.Size = UDim2.new(0, 206, 0, 21)
				LabelFrameDrop.Font = Enum.Font.Gotham
				LabelFrameDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
				LabelFrameDrop.TextSize = 11.000
				LabelFrameDrop.TextWrapped = true
				LabelFrameDrop.TextXAlignment = Enum.TextXAlignment.Left
				LabelFrameDrop.Text = tostring(text).." :"

				local DropArbt_listimage = Instance.new("ImageLabel")

				DropArbt_listimage.Name = "DropArbt_listimage"
				DropArbt_listimage.Parent = LabelFrameDrop
				DropArbt_listimage.AnchorPoint = Vector2.new(0.5, 0.5)
				DropArbt_listimage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropArbt_listimage.BackgroundTransparency = 1.000
				DropArbt_listimage.Position = UDim2.new(1.09, 0, 0.5, 0)
				DropArbt_listimage.Size = UDim2.new(0, 20, 0, 20)
				DropArbt_listimage.Image = "rbxassetid://3926305904"
				DropArbt_listimage.ImageRectOffset = Vector2.new(724, 284)
				DropArbt_listimage.ImageRectSize = Vector2.new(33, 33)

				local ScolDown = Instance.new("ScrollingFrame")

				ScolDown.Name = "ScolDown"
				ScolDown.Parent = LabelFrameDrop
				ScolDown.Active = true
				ScolDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ScolDown.BackgroundTransparency = 1
				ScolDown.BorderSizePixel = 0
				ScolDown.Position = UDim2.new(0, 0, 1.2, 0)
				ScolDown.Size = UDim2.new(0, 165, 0, 80)
				ScolDown.CanvasSize = UDim2.new(0, 0, 0, 2)
				ScolDown.ScrollBarThickness = 0

				local UIListLayoutlist = Instance.new("UIListLayout")
				local UIPaddinglist = Instance.new("UIPadding")

				UIListLayoutlist.Name = "UIListLayoutlist"
				UIListLayoutlist.Parent = ScolDown
				UIListLayoutlist.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayoutlist.Padding = UDim.new(0, 5)

				UIPaddinglist.Name = "UIPaddinglist"
				UIPaddinglist.Parent = ScolDown
				UIPaddinglist.PaddingLeft = UDim.new(0, 12)
				UIPaddinglist.PaddingTop = UDim.new(0, 5)

				local ButtonDrop = Instance.new("TextButton")

				ButtonDrop.Name = "ButtonDrop"
				ButtonDrop.Parent = DropFrame
				ButtonDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ButtonDrop.BackgroundTransparency = 1.000
				ButtonDrop.ClipsDescendants = true
				ButtonDrop.Size = UDim2.new(0, 180, 0, 21)
				ButtonDrop.AutoButtonColor = false
				ButtonDrop.Font = Enum.Font.SourceSans
				ButtonDrop.Text = ""
				ButtonDrop.TextColor3 = Color3.fromRGB(0, 0, 0)
				ButtonDrop.TextSize = 14.000
				ButtonDrop.TextWrapped = true

				local dog = false

				local FrameSize = 55
				local cout = 0
				for i , v in pairs(option) do
					cout =cout + 1
					if cout == 1 then
						FrameSize = 55
					elseif cout == 2 then
						FrameSize = 75
					elseif cout >= 3 then
						FrameSize = 110
					end

					local ListFrame = Instance.new("Frame")

					ListFrame.Name = "ListFrame"
					ListFrame.Parent = ScolDown
					ListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
					ListFrame.BackgroundColor3 = Color3.fromRGB(67,67,67)
					ListFrame.BackgroundTransparency = 1
					ListFrame.ClipsDescendants = true
					ListFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
					ListFrame.Size = UDim2.new(0, 180, 0, 21)

					local TextLabel_TapDro2p = Instance.new("TextLabel")

					TextLabel_TapDro2p.Name = "TextLabel_TapDro2p"
					TextLabel_TapDro2p.Parent = ListFrame
					TextLabel_TapDro2p.AnchorPoint = Vector2.new(0.5, 0.5)
					TextLabel_TapDro2p.BackgroundColor3 = Color3.fromRGB(249, 53, 139)
					TextLabel_TapDro2p.BackgroundTransparency = 1.000
					TextLabel_TapDro2p.Position = UDim2.new(0.40, 0, 0.5, 0)
					TextLabel_TapDro2p.Size = UDim2.new(0, 180, 0, 21)
					TextLabel_TapDro2p.Font = Enum.Font.GothamSemibold
					TextLabel_TapDro2p.TextColor3 = Color3.fromRGB(155, 155, 155)
					TextLabel_TapDro2p.TextSize = 12
					TextLabel_TapDro2p.Text = tostring(v)

					local ButtonDrop2 = Instance.new("TextButton")

					ButtonDrop2.Name = "ButtonDrop2"
					ButtonDrop2.Parent = ListFrame
					ButtonDrop2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ButtonDrop2.BackgroundTransparency = 1.000
					ButtonDrop2.BorderSizePixel = 0
					ButtonDrop2.ClipsDescendants = true
					ButtonDrop2.Position = UDim2.new(-0.0666666701, 0, 0, 0)
					ButtonDrop2.Size = UDim2.new(0, 180, 0, 21)
					ButtonDrop2.AutoButtonColor = false
					ButtonDrop2.Text = ""
					ButtonDrop2.Font = Enum.Font.SourceSans
					ButtonDrop2.TextColor3 = Color3.fromRGB(0, 0, 0)
					ButtonDrop2.TextSize = 14.000
					ButtonDrop2.TextWrapped = true

					ButtonDrop2.MouseEnter:Connect(function ()
						TweenService:Create(
							TextLabel_TapDro2p,
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(170, 0, 255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)

					ButtonDrop2.MouseLeave:Connect(function ()
						TweenService:Create(
							TextLabel_TapDro2p,
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(155,155,155)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)

					ButtonDrop2.MouseButton1Click:Connect(function()
						TweenService:Create(
							DropFrame,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 190, 0, 21)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropArbt_listimage,
							TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
							{Rotation = 0}
						):Play()
						TweenService:Create(
							LabelFrameDrop,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0} -- UDim2.new(0, 128, 0, 25)
						):Play()
						LabelFrameDrop.Text =  text.." : "..tostring(v)
						callback(v)
						dog = not dog
					end)
					ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
				end

				DropFrame.MouseEnter:Connect(function()
					TweenService:Create(
						Main_UiStroke,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Color = Color3.fromRGB(170, 0, 255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end)

				DropFrame.MouseLeave:Connect(function()
					TweenService:Create(
						Main_UiStroke,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Color = Color3.fromRGB(0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end)

				ButtonDrop.MouseButton1Click:Connect(function()
					if dog == false then
						TweenService:Create(
							DropFrame,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 190, 0, FrameSize)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropArbt_listimage,
							TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
							{Rotation = 272}
						):Play()
						TweenService:Create(
							LabelFrameDrop,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 1} -- UDim2.new(0, 128, 0, 25)
						):Play()
						ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
					else
						TweenService:Create(
							DropFrame,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 190, 0, 21)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropArbt_listimage,
							TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
							{Rotation = 0}
						):Play()
						TweenService:Create(
							LabelFrameDrop,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0} -- UDim2.new(0, 128, 0, 25)
						):Play()
						ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
					end
					dog = not dog
				end)
				ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )

				local dropfunc = {}

				function dropfunc:Clear()
					TweenService:Create(
						DropFrame,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 190, 0, 21)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						LabelFrameDrop,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0} -- UDim2.new(0, 128, 0, 25)
					):Play()
					LabelFrameDrop.Text = tostring(text).." :"
					dog = not dog
					for i, v in next, ScolDown:GetChildren() do
						if v:IsA("Frame") then
							v:Destroy()
						end
					end

					function dropfunc:Add(t)

						local ListFrame = Instance.new("Frame")

						ListFrame.Name = "ListFrame"
						ListFrame.Parent = ScolDown
						ListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
						ListFrame.BackgroundColor3 = Color3.fromRGB(67,67,67)
						ListFrame.BackgroundTransparency = 1
						ListFrame.ClipsDescendants = true
						ListFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
						ListFrame.Size = UDim2.new(0, 180, 0, 21)

						local TextLabel_TapDro2p = Instance.new("TextLabel")

						TextLabel_TapDro2p.Parent = ListFrame
						TextLabel_TapDro2p.Name =  tostring(t).."Dropdown"
						TextLabel_TapDro2p.BackgroundColor3 = Color3.fromRGB(0, 136, 255)
						TextLabel_TapDro2p.Position = UDim2.new(0.40, 0, 0.5, 0)
						TextLabel_TapDro2p.Size =  UDim2.new(0, 180, 0, 21)
						TextLabel_TapDro2p.Font = Enum.Font.GothamSemibold
						TextLabel_TapDro2p.Text = tostring(t)
						TextLabel_TapDro2p.TextColor3 = Color3.fromRGB(155, 155, 155)
						TextLabel_TapDro2p.TextSize = 11.000
						TextLabel_TapDro2p.AnchorPoint = Vector2.new(0.5, 0.5)
						TextLabel_TapDro2p.BackgroundTransparency = 1
						TextLabel_TapDro2p.TextXAlignment = Enum.TextXAlignment.Center

						local ButtonDrop2 = Instance.new("TextButton")

						ButtonDrop2.Name = "ButtonDrop2"
						ButtonDrop2.Parent = ListFrame
						ButtonDrop2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						ButtonDrop2.BackgroundTransparency = 1.000
						ButtonDrop2.BorderSizePixel = 0
						ButtonDrop2.ClipsDescendants = true
						ButtonDrop2.Position = UDim2.new(-0.0666666701, 0, 0, 0)
						ButtonDrop2.Size = UDim2.new(0, 180, 0, 21)
						ButtonDrop2.AutoButtonColor = false
						ButtonDrop2.Text = ""
						ButtonDrop2.Font = Enum.Font.SourceSans
						ButtonDrop2.TextColor3 = Color3.fromRGB(0, 0, 0)
						ButtonDrop2.TextSize = 14.000
						ButtonDrop2.TextWrapped = true

						ButtonDrop2.MouseEnter:Connect(function ()
							TweenService:Create(
								TextLabel_TapDro2p,
								TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(170, 0, 255)} -- UDim2.new(0, 128, 0, 25)
							):Play()
						end)

						ButtonDrop2.MouseLeave:Connect(function ()
							TweenService:Create(
								TextLabel_TapDro2p,
								TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(155,155,155)} -- UDim2.new(0, 128, 0, 25)
							):Play()
						end)

						ButtonDrop2.MouseButton1Click:Connect(function()
							TweenService:Create(
								DropFrame,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Size = UDim2.new(0, 190, 0, 21)} -- UDim2.new(0, 128, 0, 25)
							):Play()
							TweenService:Create(
								DropArbt_listimage,
								TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
								{Rotation = 0}
							):Play()
							TweenService:Create(
								LabelFrameDrop,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0} -- UDim2.new(0, 128, 0, 25)
							):Play()
							LabelFrameDrop.Text =  text.." : "..tostring(t)
							callback(t)
							dog = not dog
						end)
					end
					ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
				end
				return dropfunc
			end
			function uiitem:Slider(text,floor,min,max,de,lol,callback)

				local sliderfunc = {}
				local SliderFrame = Instance.new("Frame")

				SliderFrame.Name = "SliderFrame"
				SliderFrame.Parent = ScrollingFrame_Pageframe
				SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				SliderFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
				SliderFrame.BackgroundTransparency = 1
				SliderFrame.ClipsDescendants = true
				SliderFrame.Position = UDim2.new(0.9, 0, 0, 0)
				SliderFrame.Size = UDim2.new(0, 190, 0, 47)

				local SliderFrame_UICorner = Instance.new("UICorner")
				SliderFrame_UICorner.Name = "SliderFrame_UICorner"
				SliderFrame_UICorner.Parent = SliderFrame
				SliderFrame_UICorner.CornerRadius = UDim.new(0, 4)

				local LabelNameSlider = Instance.new("TextLabel")

				LabelNameSlider.Name = "LabelNameSlider"
				LabelNameSlider.Parent = SliderFrame
				LabelNameSlider.AnchorPoint = Vector2.new(0.5, 0.5)
				LabelNameSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelNameSlider.BackgroundTransparency = 1.000
				LabelNameSlider.BorderSizePixel = 0
				LabelNameSlider.Position = UDim2.new(0.3, 0, 0.3, 0)
				LabelNameSlider.Size = UDim2.new(0, 114, 0, 20)
				LabelNameSlider.Font = Enum.Font.Gotham
				LabelNameSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
				LabelNameSlider.Text = tostring(text)
				LabelNameSlider.TextSize = 11.000
				LabelNameSlider.TextWrapped = true
				LabelNameSlider.TextXAlignment = Enum.TextXAlignment.Left

				local ShowValueFrame = Instance.new("Frame")

				ShowValueFrame.Name = "ShowValueFrame"
				ShowValueFrame.Parent = SliderFrame
				ShowValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				ShowValueFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				ShowValueFrame.BorderSizePixel = 0
				ShowValueFrame.Position = UDim2.new(0.81, 0, 0.285106391, 0)
				ShowValueFrame.Size = UDim2.new(0, 50, 0, 15)

				local ShowValueFrameUICorner = Instance.new("UICorner")
				ShowValueFrameUICorner.CornerRadius = UDim.new(0, 2)
				ShowValueFrameUICorner.Name = "ShowValueFrameUICorner"
				ShowValueFrameUICorner.Parent = ShowValueFrame

				local Main_UiStroke = Instance.new("UIStroke")

				Main_UiStroke.Thickness = 1
				Main_UiStroke.Name = ""
				Main_UiStroke.Parent = ShowValueFrame
				Main_UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				Main_UiStroke.LineJoinMode = Enum.LineJoinMode.Round
				Main_UiStroke.Color = Color3.fromRGB(0,0,0)
				Main_UiStroke.Transparency = 0

				local CustomValue = Instance.new("TextBox")

				CustomValue.Name = "CustomValue"
				CustomValue.Parent = ShowValueFrame
				CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
				CustomValue.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				CustomValue.BackgroundTransparency = 1.000
				CustomValue.ClipsDescendants = true
				CustomValue.Position = UDim2.new(0.501112819, 0, 0.5, 0)
				CustomValue.Size = UDim2.new(0, 50, 0, 26)
				CustomValue.Font = Enum.Font.Gotham
				CustomValue.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
				CustomValue.Text = ""
				CustomValue.TextSize = 11
				CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
				if floor == true then
					CustomValue.Text =  tostring(de and string.format("%.1f",(de / max) * (max - min) + min) or 0)
				else
					CustomValue.Text =  tostring(de and math.floor( (de / max) * (max - min) + min) or 0)
				end

				local ValueFrame = Instance.new("Frame")

				ValueFrame.Name = "ValueFrame"
				ValueFrame.Parent = SliderFrame
				ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				ValueFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
				ValueFrame.BorderSizePixel = 0
				ValueFrame.Position = UDim2.new(0.499824077, 0, 0.800000012, 0)
				ValueFrame.Size = UDim2.new(0, 180, 0, 7)

				local Main_UiStrokeValueFrame = Instance.new("UIStroke")

				Main_UiStrokeValueFrame.Thickness = 1
				Main_UiStrokeValueFrame.Name = ""
				Main_UiStrokeValueFrame.Parent = ValueFrame
				Main_UiStrokeValueFrame.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				Main_UiStrokeValueFrame.LineJoinMode = Enum.LineJoinMode.Round
				Main_UiStrokeValueFrame.Color = Color3.fromRGB(0,0,0)
				Main_UiStrokeValueFrame.Transparency = 0

				local ValueFrameUICorner = Instance.new("UICorner")
				ValueFrameUICorner.CornerRadius = UDim.new(0, 2)
				ValueFrameUICorner.Name = "ShowValueFrameUICorner"
				ValueFrameUICorner.Parent = ValueFrame

				local PartValue = Instance.new("Frame")

				PartValue.Name = "PartValue"
				PartValue.Parent = ValueFrame
				PartValue.Active = true
				PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
				PartValue.BackgroundColor3 = Color3.fromRGB(10,10,10)
				PartValue.BackgroundTransparency = 1.000
				PartValue.Position = UDim2.new(0.498982757, 0, 0.300000012, 0)
				PartValue.Size = UDim2.new(0, 180, 0, 5)

				local MainValue = Instance.new("Frame")

				MainValue.Name = "MainValue"
				MainValue.Parent = PartValue
				MainValue.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
				MainValue.Position = UDim2.new(0.00101725257, 0, 0.200000003, 0)
				MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 5)
				MainValue.BorderSizePixel = 0

				local MainValueUICorner = Instance.new("UICorner")
				MainValueUICorner.CornerRadius = UDim.new(0, 2)
				MainValueUICorner.Name = "a"
				MainValueUICorner.Parent = MainValue

				local ConneValue = Instance.new("Frame")

				ConneValue.Name = "ConneValue"
				ConneValue.Parent = PartValue
				ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
				ConneValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.6,0, 0)
				ConneValue.Size = UDim2.new(0, 0, 0, 0)
				ConneValue.BorderSizePixel = 0

				local UICorner = Instance.new("UICorner")

				UICorner.CornerRadius = UDim.new(0, 300)
				UICorner.Parent = ConneValue
				local function move(input)
					local pos =
						UDim2.new(
							math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
							0,
							0.6,
							0
						)
					local pos1 =
						UDim2.new(
							math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
							0,
							0,
							5
						)

					MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)

					ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
					if floor == true then
						local value = string.format("%.1f",((pos.X.Scale * max) / max) * (max - min) + min)
						CustomValue.Text = tostring(value)
						callback(value)
					else
						local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
						CustomValue.Text = tostring(value)
						callback(value)
					end



				end
				local dragging = false
				ConneValue.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true

						end
					end
				)
				ConneValue.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false

						end
					end
				)
				SliderFrame.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true

						end
					end
				)
				SliderFrame.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false

						end
					end
				)


				ValueFrame.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true

						end
					end
				)
				ValueFrame.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false

						end
					end
				)
				game:GetService("UserInputService").InputChanged:Connect(function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end)

				CustomValue.FocusLost:Connect(function()
					if CustomValue.Text == "" then
						CustomValue.Text  = de
					end
					if  tonumber(CustomValue.Text) > max then
						CustomValue.Text  = max
					end
					MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
					ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.6, 0) , "Out", "Sine", 0.2, true)
					if floor == true then
						CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
					else
						CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
					end
					pcall(callback, CustomValue.Text)
				end)
				function sliderfunc:Update(value)
					MainValue:TweenSize(UDim2.new((value or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
					CustomValue.Text = value

					pcall(function()
						callback(value)
					end)
				end
				return sliderfunc
			end
			function uiitem:Textbox(text,text2,callback)
				local TextFrame = Instance.new("Frame")

				TextFrame.Name = "TextFrame"
				TextFrame.Parent = ScrollingFrame_Pageframe
				TextFrame.Active = true
				TextFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				TextFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextFrame.BackgroundTransparency = 1.000
				TextFrame.Position = UDim2.new(0.55, 0, 0.5, 0)
				TextFrame.Size = UDim2.new(0, 180, 0, 35)

				local LabelNameSliderxd = Instance.new("TextLabel")

				LabelNameSliderxd.Name = "LabelNameSliderxd"
				LabelNameSliderxd.Parent = TextFrame
				LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelNameSliderxd.Position = UDim2.new(0.12, 0, 0.5, 0)
				LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
				LabelNameSliderxd.BackgroundTransparency = 1.000
				LabelNameSliderxd.BorderSizePixel = 0
				LabelNameSliderxd.Size = UDim2.new(0, 140, 0, 35)
				LabelNameSliderxd.Font = Enum.Font.Gotham
				LabelNameSliderxd.TextColor3 = Color3.fromRGB(255, 255, 255)
				LabelNameSliderxd.TextSize = 11.000
				LabelNameSliderxd.Text = tostring(text)

				local ConerTextBox = Instance.new("UICorner")

				ConerTextBox.CornerRadius = UDim.new(0, 2)
				ConerTextBox.Name = "ConerTextBox"
				ConerTextBox.Parent = TextFrame

				local FrameBox = Instance.new("Frame")

				FrameBox.Name = "FrameBox"
				FrameBox.Parent = TextFrame
				FrameBox.AnchorPoint = Vector2.new(0.5, 0.5)
				FrameBox.BackgroundColor3 = Color3.fromRGB(10,10,10)
				FrameBox.BorderSizePixel = 0
				FrameBox.ClipsDescendants = true
				FrameBox.Position = UDim2.new(0.75, 0, 0.5, 0)
				FrameBox.Size = UDim2.new(0, 120, 0, 20)

				local Main_UiStrokeValueFrame = Instance.new("UIStroke")

				Main_UiStrokeValueFrame.Thickness = 1
				Main_UiStrokeValueFrame.Name = ""
				Main_UiStrokeValueFrame.Parent = FrameBox
				Main_UiStrokeValueFrame.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				Main_UiStrokeValueFrame.LineJoinMode = Enum.LineJoinMode.Round
				Main_UiStrokeValueFrame.Color = Color3.fromRGB(0,0,0)
				Main_UiStrokeValueFrame.Transparency = 0

				local ConerTextBox2 = Instance.new("UICorner")

				--Properties:

				ConerTextBox2.CornerRadius = UDim.new(0, 2)
				ConerTextBox2.Name = "ConerTextBox2"
				ConerTextBox2.Parent = FrameBox

				local TextFrame2 = Instance.new("TextBox")

				TextFrame2.Name = "TextFrame2"
				TextFrame2.Parent = FrameBox
				TextFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
				TextFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextFrame2.BackgroundTransparency = 1.000
				TextFrame2.BorderSizePixel = 0
				TextFrame2.ClipsDescendants = true
				TextFrame2.Position = UDim2.new(0.499413133, 0, 0.5, 0)
				TextFrame2.Size = UDim2.new(0, 180, 0, 20)
				TextFrame2.Font = Enum.Font.Gotham
				TextFrame2.PlaceholderText = text2
				TextFrame2.PlaceholderColor3 = Color3.fromRGB(155, 155, 155)
				TextFrame2.TextColor3 = Color3.fromRGB(155, 155, 155)
				TextFrame2.TextSize = 11.000

				TextFrame.MouseEnter:Connect(function()
					TweenService:Create(
						TextFrame2,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{PlaceholderColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						TextFrame2,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end)

				TextFrame.MouseLeave:Connect(function()
					TweenService:Create(
						FrameBox,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(10,10,10)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						TextFrame2,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{PlaceholderColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						TextFrame2,
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end)

				TextFrame2.FocusLost:Connect(function ()
					if #TextFrame2.Text > 0 then
						pcall(callback,TextFrame2.Text)
					end
				end)
			end
			function uiitem:Line()
				local LineFrame = Instance.new("Frame")

				LineFrame.Name = "LineFrame"
				LineFrame.Parent = ScrollingFrame_Pageframe
				LineFrame.BackgroundColor3 =  Color3.fromRGB(116, 116, 116)
				LineFrame.BorderSizePixel = 0
				LineFrame.Position = UDim2.new(0.5, 0, 0.7, 0)
				LineFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				LineFrame.Size = UDim2.new(0, 190, 0, 1)
				LineFrame.BackgroundTransparency  = 0
				LineFrame.ClipsDescendants = true

				local LineFrame_BindConner = Instance.new("UICorner")

				LineFrame_BindConner.CornerRadius = UDim.new(0, 30)
				LineFrame_BindConner.Name = ""
				LineFrame_BindConner.Parent = LineFrame
			end
			return uiitem
		end
		return uimain3
	end
	return uimain2
end

local Window = uimain:cre("Free UI")

local Tap = Window:tab("Main")

local Tap2 = Window:tab("Main 2")

local page1 = Tap:page("Page 1")

local page2 = Tap:page("Page 2")

page1:Label("Label")

page1:Button("Button",function()

end)

page1:Toggle("Toggle",false,function()

end)

local dropno = page1:Dropdown("DropDown",{"1","2","3","4","1","2","3","4"},function (v)
	_G.dropno = v
end)

page1:Button("Clear",function()
	dropno:Clear()
end)

page1:Button("Add",function()
	dropno:Add("Test")
end)

local Test2 = page1:Slider("Slider",true,0,100,10,10,function(v)
	print(v)
end)

page1:Textbox("TextBox","TextBox2",function(v)
	_G.Textbox = v
	print(_G.Textbox)
end)

page1:Line()
26+-0x4e)+-#"<@!847154787934011462> shut the fuck up@skid")](__l,____l,_ll)==____l)then _l[___]=__[_l[__ll]]end if(_[(-#"turn around and dont you think about coming back here"+(138-0x51))](__l,_l___,_l___)==_ll)then _l[_lll]=__[_l[_llll]]end if(_[(67+-0x3f)](__l,__l__,__l__)==____l)then _l[__ll_]=__[_l[__l_l]]end _l_l[_l_]=_l;end end;for _=____l,_[(68/0x44)]()do _ll_[_-____l]=_l_l_l();end;return _l_;end;local function __llll(_,_ll__,___ll)local __=_[_l___];local __l__=_[__l__];local __l=_[_ll];return(function(...)local _____={};local _l=_ll;local _l_lll=__;local _=_ll _*=-1 local _lllll=_;local _ll_ll={...};local _l__ll=_lll_l('#',...)-____l;local __l=__l;local ____ll={};local ___lll=_ll__l local __={};local __l__=__l__;for _=0,_l__ll do if(_>=__l__)then ____ll[_-__l__]=_ll_ll[_+____l];else __[_]=_ll_ll[_+_ll];end;end;local _=_l__ll-__l__+_ll local _;local __l__;while true do _=__l[_l];__l__=_[(0x66-101)];_l_=(4731161)while __l__<=(185+-0x4a)do _l_-= _l_ _l_=(182754)while(0x5e+-39)>=__l__ do _l_-= _l_ _l_=(9694650)while((220-0xa5)+-#"moonsec pls add fivem choice")>=__l__ do _l_-= _l_ _l_=(4356852)while __l__<=(-0x79+134)do _l_-= _l_ _l_=(11810958)while __l__<=(-#"Unrepeats your until nil"+(1860/0x3e))do _l_-= _l_ _l_=(781672)while(86+-0x54)>=__l__ do _l_-= _l_ _l_=(2190684)while __l__<=(0x4b+-75)do _l_-= _l_ local _ll=_[___l];local _l=__[_ll]for _=_ll+1,_[__ll_]do _l=_l..__[_];end;__[_[__ll]]=_l;break;end while 587==(_l_)/((7547-0xee7))do _l_=(819660)while __l__>(0x47-70)do _l_-= _l_ local _l_;__[_[_l_l]]=_ll__[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[__lll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=(not __[_[_l_ll]]);_l=_l+_ll;_=__l[_l];__[_[___]][_[_llll]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_ll__[_[____]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_ll__[_[____]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[__lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];do return end;break end while 1140==(_l_)/((-#"no she is 7000 y.o with huuuuuge milkers"+(0x601-778)))do local _l_l_;local _l_;__[_[___]]=_ll__[_[_lll]];_l=_l+_ll;_=__l[_l];_l_=_[__l_];_l_l_=__[_[_lll]];__[_l_+1]=_l_l_;__[_l_]=_l_l_[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_ll__[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[_lll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[__lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[____]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[____]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[___l]][_[_l__l]];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];__[_[___]]={};_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[____]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[____];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[_llll]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];_l_=_[_ll_];_l_l_=__[_[____]];__[_l_+1]=_l_l_;__[_l_]=_l_l_[_[__ll_]];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];do return end;break end;break;end break;end while 1592==(_l_)/((1066-0x23f))do _l_=(6320454)while(12/0x3)>=__l__ do _l_-= _l_ _l_=(2461260)while(0x57-(269-0xb9))<__l__ do _l_-= _l_ local __l__;local _l_;_l_=_[__ll];__l__=__[_[_l_ll]];__[_l_+1]=__l__;__[_l_]=__l__[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_ll__[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_llll]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[___l]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[____]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[_llll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[____]][_[_l__l]];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[___l]))_l=_l+_ll;_=__l[_l];__[_[_l_l]]={};_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[___l]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[___l];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];__[_[__l_]][_[_llll]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[____]))_l=_l+_ll;_=__l[_l];_l_=_[_ll_];__l__=__[_[_lll]];__[_l_+1]=__l__;__[_l_]=__l__[_[_l_l_]];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_ll__[_[__lll]];_l=_l+_ll;_=__l[_l];_l_=_[_l_l];__l__=__[_[___l]];__[_l_+1]=__l__;__[_l_]=__l__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_ll__[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[____]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[____];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[___l]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[___l]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[___l]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_llll]][_[__ll_]];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];__[_[_ll_]]={};_l=_l+_ll;_=__l[_l];__[_[__ll]][_[_l_ll]]=_[_lll_];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[___l]))_l=_l+_ll;_=__l[_l];_l_=_[___];__l__=__[_[_lll]];__[_l_+1]=__l__;__[_l_]=__l__[_[___l_]];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_ll__[_[____]];_l=_l+_ll;_=__l[_l];_l_=_[__ll];__l__=__[_[_l_ll]];__[_l_+1]=__l__;__[_l_]=__l__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[___]]=_ll__[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[____]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[____]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_l_ll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[____]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_lll]][_[_l__l]];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[_l_l]]={};_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_l_ll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[_llll];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[___]][_[_llll]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];_l_=_[___];__l__=__[_[___l]];__[_l_+1]=__l__;__[_l_]=__l__[_[___l_]];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_](__[_l_+____l])break end while 635==(_l_)/(((0x3d0b-7846)-3905))do local ____;local _l_;__[_[_l__]]=_ll__[_[__lll]];_l=_l+_ll;_=__l[_l];_l_=_[__l_];____=__[_[_llll]];__[_l_+1]=____;__[_l_]=____[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_ll__[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[___l]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[_l_ll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[___l]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[___l]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[___l]][_[__ll_]];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];__[_[_l__]]={};_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_l_ll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];__[_[__ll]][_[___l]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];_l_=_[___];____=__[_[__lll]];__[_l_+1]=____;__[_l_]=____[_[_lll_]];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];do return end;break end;break;end while 2562==(_l_)/((0x13a5-(2642+-0x50)))do _l_=(11192985)while((0x94+-98)+-#[[not using moonsec is like jumping of a bridge]])<__l__ do _l_-= _l_ local _lll=_l_lll[_[_lll]];local ___;local _ll={};___=___l_l({},{__index=function(_l,_)local _=_ll[_];return _[1][_[2]];end,__newindex=function(__,_,_l)local _=_ll[_]_[1][_[2]]=_l;end;});for _l_=1,_[__ll_]do _l=_l+____l;local _=__l[_l];if _[(0x7e+-125)]==82 then _ll[_l_-1]={__,_[__lll]};else _ll[_l_-1]={_ll__,_[__lll]};end;_____[#_____+1]=_ll;end;__[_[__l_]]=__llll(_lll,___,___ll);break end while(_l_)/((0x166a-2879))==3915 do local __ll_;local _l_;__[_[___]]=_ll__[_[_l_ll]];_l=_l+_ll;_=__l[_l];_l_=_[_ll_];__ll_=__[_[_lll]];__[_l_+1]=__ll_;__[_l_]=__ll_[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_ll__[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[____]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_lll]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[__lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[____]][_[_lll_]];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];__[_[___]]={};_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_llll]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[___]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[__lll];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[__lll]]=__[_[_lll_]];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];_l_=_[_l__];__ll_=__[_[__lll]];__[_l_+1]=__ll_;__[_l_]=__ll_[_[___l_]];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[__l_]]=_ll__[_[_lll]];_l=_l+_ll;_=__l[_l];_l_=_[___];__ll_=__[_[_llll]];__[_l_+1]=__ll_;__[_l_]=__ll_[_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_ll__[_[___l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[_llll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[_llll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_llll]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[___l]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[__lll]][_[___l_]];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[___l]))_l=_l+_ll;_=__l[_l];__[_[__l_]]={};_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[_lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[____];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[__lll];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[_llll]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];_l_=_[__ll];__ll_=__[_[____]];__[_l_+1]=__ll_;__[_l_]=__ll_[_[_l__l]];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];do return end;break end;break;end break;end break;end while 3279==(_l_)/((914908/0xfe))do _l_=(3149734)while __l__<=(59-0x32)do _l_-= _l_ _l_=(238848)while(-0x30+55)>=__l__ do _l_-= _l_ local _l_;__[_[___]]=_[_l_ll];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_lll]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[__lll];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[___l]))_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[_llll]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[___l]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[_llll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_llll];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[__l_]]={};_l=_l+_ll;_=__l[_l];__[_[__ll]][_[__lll]]=_[__l_l];_l=_l+_ll;_=__l[_l];__[_[_l__]]={};_l=_l+_ll;_=__l[_l];__[_[__l_]][_[____]]=__[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[___]][_[____]]=__[_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[__lll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_llll];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[___l]]=__[_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[_lll]]=_[___l_];_l=_l+_ll;_=__l[_l];__[_[__l_]][_[___l]]=_[___l_];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[___l]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[___]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_llll];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[___]][_[_lll]]=__[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_lll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[____];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[_l_ll]]=__[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[___]][_[_lll]]=_[_lll_];_l=_l+_ll;_=__l[_l];__[_[___]][_[_l_ll]]=_[_l__l];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[____]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[____];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[___l]))_l=_l+_ll;_=__l[_l];__[_[__ll]][_[___l]]=__[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]][_[__lll]]=_[___l_];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_lll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[___l];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[_llll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[___]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[___]][_[_llll]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[__l_]][_[_l_ll]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[___l]]=_[_lll_];_l=_l+_ll;_=__l[_l];__[_[___]][_[_lll]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[_llll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[____];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[____]]=__[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_l_ll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[___l];break;end while 256==(_l_)/((1923-0x3de))do _l_=(26439)while(824/0x67)<__l__ do _l_-= _l_ __[_[_ll_]]=_ll__[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_l_ll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[_llll]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[__lll]][_[_lll_]];_l=_l+_ll;_=__l[_l];if(__[_[_l__]]~=__[_[__l_l]])then _l=_l+____l;else _l=_[____];end;break end while(_l_)/((220325/0xaf))==21 do ___ll[_[__lll]]=__[_[_l_l]];break end;break;end break;end while 1433==(_l_)/((0x68a42/195))do _l_=(8420124)while(77+-0x42)>=__l__ do _l_-= _l_ _l_=(6749029)while(-49+((-32+0xba)+-#'Guys help theyve captured me and lock me inside the obfuscator!!!! debofuscate quick to save me'))<__l__ do _l_-= _l_ if(_[___]<__[_[_lll_]])then _l=_[_lll];else _l=_l+____l;end;break end while(_l_)/(((203040/0x5a)+-#[[moonsec source leak]]))==3017 do local __ll_;local _l_;__[_[__ll]]=_ll__[_[_lll]];_l=_l+_ll;_=__l[_l];_l_=_[_ll_];__ll_=__[_[__lll]];__[_l_+1]=__ll_;__[_l_]=__ll_[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_ll__[_[____]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[___l]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_llll]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_l_ll]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[____]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[___l]][_[_l_l_]];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[___l]))_l=_l+_ll;_=__l[_l];__[_[__ll]]={};_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[___l]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[__lll];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[_llll]]=__[_[_lll_]];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];_l_=_[_ll_];__ll_=__[_[__lll]];__[_l_+1]=__ll_;__[_l_]=__ll_[_[_l__l]];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];do return end;break end;break;end while 3891==(_l_)/((0x1131-2237))do _l_=(3938528)while __l__>((0x33c/(0x2f7/33))+-#'obfuscator tooooo gooood')do _l_-= _l_ local _l_;local ___;_ll__[_[_llll]]=__[_[_l_l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[___l]][_[___l_]];_l=_l+_ll;_=__l[_l];_ll__[_[_llll]]=__[_[__ll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_ll__[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_l_ll]][_[__ll_]];_l=_l+_ll;_=__l[_l];_ll__[_[__lll]]=__[_[__l_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[_llll]][_[__l_l]];_l=_l+_ll;_=__l[_l];___=_[__l_];_l_=__[_[____]];__[___+1]=_l_;__[___]=_l_[_[__l_l]];break end while 1837==(_l_)/((-50+0x892))do local __l__;local _l_;__[_[_l_l]]=_ll__[_[__lll]];_l=_l+_ll;_=__l[_l];_l_=_[__ll];__l__=__[_[_l_ll]];__[_l_+1]=__l__;__[_l_]=__l__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_ll__[_[___l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[____]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_l_ll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[_l_ll]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_llll]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[_l_ll]][_[__ll_]];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];__[_[_ll_]]={};_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_lll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[___l];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];__[_[__ll]][_[_l_ll]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[___l]))_l=_l+_ll;_=__l[_l];_l_=_[__ll];__l__=__[_[___l]];__[_l_+1]=__l__;__[_l_]=__l__[_[_l_l_]];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[__l_]]=_ll__[_[_l_ll]];_l=_l+_ll;_=__l[_l];_l_=_[_ll_];__l__=__[_[____]];__[_l_+1]=__l__;__[_l_]=__l__[_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_ll__[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[___l]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[___l]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[___l]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[____]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[____]][_[_l_l_]];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];__[_[__ll]]={};_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[___l]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[__lll];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[__l_]][_[_llll]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[____]))_l=_l+_ll;_=__l[_l];_l_=_[_l_l];__l__=__[_[_l_ll]];__[_l_+1]=__l__;__[_l_]=__l__[_[___l_]];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[__ll]]=_ll__[_[___l]];_l=_l+_ll;_=__l[_l];_l_=_[_ll_];__l__=__[_[_lll]];__[_l_+1]=__l__;__[_l_]=__l__[_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_ll__[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[___l]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[____]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[_lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[__lll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_llll]][_[__l_l]];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[___l]))_l=_l+_ll;_=__l[_l];__[_[__ll]]={};_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[__lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];__[_[___]][_[_lll]]=__[_[_l_l_]];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];_l_=_[__l_];__l__=__[_[_llll]];__[_l_+1]=__l__;__[_l_]=__l__[_[_l_l_]];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];do return end;break end;break;end break;end break;end break;end while 1164==(_l_)/((0x1d58-3769))do _l_=(3023940)while __l__<=(122-0x66)do _l_-= _l_ _l_=(9758172)while(-0x42+82)>=__l__ do _l_-= _l_ _l_=(5636358)while __l__<=(-#"fivem when they block the PSU watermark"+(0xcd-152))do _l_-= _l_ local _l_;__[_[_l_l]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[__lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[__lll];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[_llll]]=_[__ll_];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_ll__[_[___l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_lll]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[___l]]=_[_lll_];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[__lll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[___l];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[____]))_l=_l+_ll;_=__l[_l];__[_[__ll]][_[___l]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[____]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];__[_[___]][_[_lll]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_l__]][_[_llll]]=_[_l_l_];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[_llll]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[___]]=_[____];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[___l];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[___l]))_l=_l+_ll;_=__l[_l];__[_[__ll]][_[_lll]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[____]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[___]]=_[____];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_llll];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[____]))_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_l_ll]]=__[_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[_llll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[___]]=_[____];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];__[_[__ll]][_[_llll]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[____]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_llll];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[_l__]][_[__lll]]=_[_l__l];_l=_l+_ll;_=__l[_l];__[_[__ll]][_[____]]=__[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[___l]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_l_ll];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[_l__]][_[____]]=__[_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[___l]]=_[__l_l];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[___l]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[___]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[__lll];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[_l__]][_[___l]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[____]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[_l_ll]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[__lll]]=__[_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[__l_]][_[_l_ll]]=_[_lll_];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_llll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[____];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[____];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[_llll]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[__lll]]=_[_l__l];break;end while 3906==(_l_)/((2944-0x5dd))do _l_=(996672)while __l__>((165-0x67)+-#[[psst constant table just below this meme string]])do _l_-= _l_ local __l_;local _llll,_l__;local _l_;__[_[_l_l]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[___l];_l=_l+_ll;_=__l[_l];_l_=_[___]_llll,_l__=___lll(__[_l_](_ll_l(__,_l_+1,_[____])))_lllll=_l__+_l_-1 __l_=0;for _=_l_,_lllll do __l_=__l_+_ll;__[_]=_llll[__l_];end;_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_lllll))break end while(_l_)/((0x309-429))==2864 do local _l_;local __l__;__[_[_l__]]=_ll__[_[____]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[____]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[___]]=_ll__[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[___l]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[___l]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[____];_l=_l+_ll;_=__l[_l];__[_[___]]=_[___l];_l=_l+_ll;_=__l[_l];__l__=_[_ll_]__[__l__]=__[__l__](_ll_l(__,__l__+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_l_ll]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_ll__[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[___l]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[____];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_ll__[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[_lll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_llll]][_[_l__l]];_l=_l+_ll;_=__l[_l];_l_={_,__};_l_[_l___][_l_[____l][_ll_]]=_l_[_l___][_l_[_ll][_llll]]+_l_[____l][_l_l_];_l=_l+_ll;_=__l[_l];__l__=_[_ll_]__[__l__]=__[__l__](_ll_l(__,__l__+_ll,_[____]))_l=_l+_ll;_=__l[_l];__[_[__ll]][_[___l]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_ll__[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_llll]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_ll__[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[__lll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[___l]][_[__ll_]];_l=_l+_ll;_=__l[_l];_l_={_,__};_l_[_l___][_l_[____l][__ll]]=_l_[_l___][_l_[_ll][____]]+_l_[____l][_lll_];_l=_l+_ll;_=__l[_l];__l__=_[___]__[__l__]=__[__l__](_ll_l(__,__l__+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[___]][_[__lll]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];do return end;break end;break;end break;end while(_l_)/((-#'i love perth'+(8151-0xfff)))==2413 do _l_=(14219051)while((-0x32+-71)+139)>=__l__ do _l_-= _l_ _l_=(6891322)while(-#'pssssst the wrapper function is over there'+(128+-0x45))<__l__ do _l_-= _l_ __[_[__ll]]=_[_l_ll];break end while 1858==(_l_)/((7536-0xef3))do local _l_;__[_[_ll_]]=__[_[_llll]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[____]]=_[_l__l];_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[____]]=__[_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[____]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[__lll];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];__[_[_l__]][_[_llll]]=__[_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_llll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[___]]=_[_l_ll];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[____]))_l=_l+_ll;_=__l[_l];__[_[__ll]][_[___l]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[____]]=_[_l__l];_l=_l+_ll;_=__l[_l];__[_[__ll]][_[__lll]]=_[_lll_];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[_llll]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[____]))_l=_l+_ll;_=__l[_l];__[_[__ll]][_[___l]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[_lll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[__lll];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[____]))_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[___l]]=__[_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_llll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_llll];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[___]][_[_lll]]=_[__ll_];_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[__lll]]=__[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[__lll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[____];_l=_l+_ll;_=__l[_l];__[_[___]]=_[__lll];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];__[_[___]][_[_llll]]=__[_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_lll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[___l];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[_l__]][_[__lll]]=__[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_l_ll]]=_[_l_l_];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[_llll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[_llll];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[_lll]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_llll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_llll];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];__[_[___]][_[___l]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[____]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[___l]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_l__]][_[__lll]]=__[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_llll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[___l];break end;break;end while(_l_)/(((167790/0x2a)+-#[[This file has been enchanted with uncrackable V, fuck the fuck off]]))==3619 do _l_=(4506384)while __l__>(-#"1 plus 1 doesnt equal 111"+(0x18c/9))do _l_-= _l_ local __ll;local ___;local _l_;__[_[_l_l]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=#__[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[____];_l=_l+_ll;_=__l[_l];_l_=_[_l_l];___=__[_l_]__ll=__[_l_+2];if(__ll>0)then if(___>__[_l_+1])then _l=_[__lll];else __[_l_+3]=___;end elseif(___<__[_l_+1])then _l=_[_l_ll];else __[_l_+3]=___;end break end while(_l_)/((2582-0x527))==3568 do local _____;local __l__;local _l_;_l_=_[___];__l__=__[_[_lll]];__[_l_+1]=__l__;__[_l_]=__l__[_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_ll__[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_lll]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[____];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_l_ll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_l_ll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_l_ll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[_l_ll]][_[___l_]];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];__[_[_l_l]]={};_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[__lll]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_ll__[_[__lll]];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];__[_[_l__]][_[__lll]]=__[_[_l_l_]];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];_l_=_[___];__l__=__[_[_lll]];__[_l_+1]=__l__;__[_l_]=__l__[_[_lll_]];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[__l_]]=_ll__[_[___l]];_l=_l+_ll;_=__l[_l];_l_=_[___];__l__=__[_[_lll]];__[_l_+1]=__l__;__[_l_]=__l__[_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_ll__[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[____]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[____]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[___l]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[___l]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[_lll]][_[__ll_]];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];__[_[_ll_]]={};_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_l_ll]]=_[__ll_];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];_l_=_[__ll];__l__=__[_[_l_ll]];__[_l_+1]=__l__;__[_l_]=__l__[_[_l__l]];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[___]]=_ll__[_[_l_ll]];_l=_l+_ll;_=__l[_l];_l_=_[_l__];__l__=__[_[_lll]];__[_l_+1]=__l__;__[_l_]=__l__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_ll__[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_l_ll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[___l]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[____]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_l_ll]][_[_l__l]];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];__[_[_l__]]={};_l=_l+_ll;_=__l[_l];__[_[__l_]][_[_lll]]=_[_lll_];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[___l]))_l=_l+_ll;_=__l[_l];_l_=_[__l_];__l__=__[_[_llll]];__[_l_+1]=__l__;__[_l_]=__l__[_[__ll_]];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[__ll]]=_ll__[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[__lll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_ll__[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_l_ll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[____]][_[_l_l_]];_l=_l+_ll;_=__l[_l];_____={_,__};_____[_l___][_____[____l][___]]=_____[_l___][_____[_ll][____]]+_____[____l][__ll_];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[___]][_[____]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];_l=_[_lll];break end;break;end break;end break;end while 2495==(_l_)/((0x38d0/(-85+0x61)))do _l_=(7827597)while __l__<=((0x1deb-3864)/0xa5)do _l_-= _l_ _l_=(1464210)while(0x1014/196)>=__l__ do _l_-= _l_ local _=_[__ll]__[_]=__[_](__[_+____l])break;end while 3366==(_l_)/(((6412/0xe)+-#'Spoiler: You will fail.'))do _l_=(2478768)while __l__>(-105+0x7f)do _l_-= _l_ local _=_[_l_l]__[_](__[_+____l])break end while(_l_)/((0x2f2+-76))==3656 do if(__[_[__ll]]<__[_[_lll_]])then _l=_l+____l;else _l=_[_lll];end;break end;break;end break;end while(_l_)/((0x12de-2473))==3321 do _l_=(10927377)while __l__<=((-0x707e/242)+0x90)do _l_-= _l_ _l_=(1950169)while(0xd38/141)<__l__ do _l_-= _l_ __[_[__ll]]=__[_[_l_ll]]-__[_[_l__l]];break end while(_l_)/((0xd9c/(-#"troll"+(-0x4e+87))))==2239 do local __ll_;local _l_;__[_[_l_l]]=_ll__[_[_l_ll]];_l=_l+_ll;_=__l[_l];_l_=_[_l__];__ll_=__[_[_lll]];__[_l_+1]=__ll_;__[_l_]=__ll_[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_ll__[_[____]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[_lll]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[_l_ll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[____]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[_lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_l_ll]][_[___l_]];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];__[_[_l__]]={};_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[____]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[____]))_l=_l+_ll;_=__l[_l];__[_[__l_]][_[__lll]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];_l_=_[_l_l];__ll_=__[_[_llll]];__[_l_+1]=__ll_;__[_l_]=__ll_[_[_lll_]];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];do return end;break end;break;end while(_l_)/((0x1ba0-3573))==3123 do _l_=(7871544)while(0xb3-153)<__l__ do _l_-= _l_ local _l___;local __l__;local _l_;__[_[_ll_]]=_ll__[_[_l_ll]];_l=_l+_ll;_=__l[_l];_l_=_[_l__];__l__=__[_[_llll]];__[_l_+1]=__l__;__[_l_]=__l__[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_ll__[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[__lll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[__lll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[_l_ll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[_llll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_llll]][_[_l_l_]];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];__[_[___]]={};_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[____]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[____];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[____];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_l_ll]]=__[_[_l_l_]];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[___l]))_l=_l+_ll;_=__l[_l];_l_=_[_ll_];__l__=__[_[_l_ll]];__[_l_+1]=__l__;__[_l_]=__l__[_[___l_]];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[__ll]]=_ll__[_[_l_ll]];_l=_l+_ll;_=__l[_l];_l_=_[_l__];__l__=__[_[___l]];__[_l_+1]=__l__;__[_l_]=__l__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_ll__[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[____]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[___l]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_l_ll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_l_ll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_lll]][_[_lll_]];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[___l]))_l=_l+_ll;_=__l[_l];__[_[_l__]]={};_l=_l+_ll;_=__l[_l];__[_[__l_]][_[_lll]]=_[__ll_];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[____]))_l=_l+_ll;_=__l[_l];_l_=_[_ll_];__l__=__[_[____]];__[_l_+1]=__l__;__[_l_]=__l__[_[_l__l]];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_ll__[_[_l_ll]];_l=_l+_ll;_=__l[_l];_l_=_[__l_];__l__=__[_[_lll]];__[_l_+1]=__l__;__[_l_]=__l__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_ll__[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[__lll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[____]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[__lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[_lll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[___l]][_[_l__l]];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];__[_[_l__]]={};_l=_l+_ll;_=__l[_l];__[_[__ll]][_[___l]]=_[_l_l_];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[____]))_l=_l+_ll;_=__l[_l];_l_=_[___];__l__=__[_[_l_ll]];__[_l_+1]=__l__;__[_l_]=__l__[_[__l_l]];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[_l__]]=_ll__[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_ll__[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_ll__[_[__lll]];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__l__=_[_l_ll];_l___=__[__l__]for _=__l__+1,_[_l_l_]do _l___=_l___..__[_];end;__[_[_ll_]]=_l___;_l=_l+_ll;_=__l[_l];__[_[_l__]][_[_l_ll]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_ll__[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_ll__[_[___l]];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[__ll]]=_ll__[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=(not __[_[___l]]);_l=_l+_ll;_=__l[_l];_ll__[_[___l]]=__[_[_ll_]];_l=_l+_ll;_=__l[_l];do return end;break end while 3924==(_l_)/((0x514c4/166))do local ____l;local _l_;_l_=_[_l_l]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[___l]))_l=_l+_ll;_=__l[_l];__[_[__ll]][_[_lll]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__ll]][_[_lll]]=_[_lll_];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[_llll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[____];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[___l];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];__[_[__ll]][_[_l_ll]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_l_ll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[____];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_llll];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[___l]))_l=_l+_ll;_=__l[_l];__[_[_l__]][_[____]]=__[_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[_lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[_lll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[___]][_[___l]]=__[_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_l_ll]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[____];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[___l];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];__[_[_l__]][_[____]]=__[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[__ll]][_[__lll]]=_[___l_];_l=_l+_ll;_=__l[_l];__[_[__ll]][_[__lll]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_l_ll]]=_[_l__l];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[___l]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[___l]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[____]]=__[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[_llll]][_[_l_l_]];_l=_l+_ll;_=__l[_l];_l_=_[___];____l=__[_[___l]];__[_l_+1]=____l;__[_l_]=____l[_[_l__l]];break end;break;end break;end break;end break;end break;end while 3957==(_l_)/((463050/0xbd))do _l_=(792744)while((166+-0x39)+-#"<@!519139355118534656> stop with the cap ms v3 got my script 30.0 ms")>=__l__ do _l_-= _l_ _l_=(378189)while __l__<=(148-0x72)do _l_-= _l_ _l_=(14474010)while __l__<=(83-0x35)do _l_-= _l_ _l_=(1952425)while(3948/0x8d)>=__l__ do _l_-= _l_ local _=_[_ll_]__[_](__[_+____l])break;end while(_l_)/((-#'<@!847154787934011462> stfu !!!'+(136080/0xb4)))==2693 do _l_=(1008175)while(-#[[im living]]+(4788/0x7e))<__l__ do _l_-= _l_ local _ll=_[___];local _l_=__[_ll+2];local __l=__[_ll]+_l_;__[_ll]=__l;if(_l_>0)then if(__l<=__[_ll+1])then _l=_[___l];__[_ll+3]=__l;end elseif(__l>=__[_ll+1])then _l=_[_lll];__[_ll+3]=__l;end break end while(_l_)/((-0x7f+950))==1225 do local _l=_[__ll]local __l,_=___lll(__[_l](_ll_l(__,_l+1,_[___l])))_lllll=_+_l-1 local _=0;for _l=_l,_lllll do _=_+_ll;__[_l]=__l[_];end;break end;break;end break;end while(_l_)/((7700-0xf46))==3819 do _l_=(11236547)while __l__<=(6784/0xd4)do _l_-= _l_ _l_=(3604900)while(0x70+-81)<__l__ do _l_-= _l_ local _l_;__[_[_l_l]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[___l]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[____];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_lll]]=_[_l__l];_l=_l+_ll;_=__l[_l];__[_[___]]=_ll__[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[_lll]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_l__]][_[_llll]]=_[__ll_];_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_lll]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_l_ll];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[___l]))_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_l_ll]]=__[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[_l_ll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[____];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[___l]))_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[_lll]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[____]]=_[___l_];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[____]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[____];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[___l];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];__[_[__ll]][_[___l]]=__[_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[_llll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];__[_[_l__]][_[_lll]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_llll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[_llll];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[__l_]][_[___l]]=_[___l_];_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[___l]]=__[_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[__lll]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[____];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[_l_ll];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];__[_[___]][_[___l]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_llll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];__[_[___]][_[_l_ll]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[___l]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[____];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_llll]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_l_ll]]=_[___l_];_l=_l+_ll;_=__l[_l];__[_[__ll]][_[____]]=_[___l_];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[____]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[____];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[____]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[____]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[_llll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_l_ll]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[_l_ll]];break end while(_l_)/((-#'This file has been enchanted with uncrackable V, fuck the fuck off'+(7841-0xf64)))==940 do _ll__[_[__lll]]=__[_[__ll]];break end;break;end while 3241==(_l_)/((412573/0x77))do _l_=(142308)while(429/0xd)<__l__ do _l_-= _l_ __[_[___]]=__[_[_llll]];break end while 354==(_l_)/((-121+0x20b))do local _=_[___]__[_]=__[_](_ll_l(__,_+_ll,_lllll))break end;break;end break;end break;end while 1449==(_l_)/((545-0x11c))do _l_=(856032)while __l__<=(138-0x65)do _l_-= _l_ _l_=(942390)while __l__<=(180-0x91)do _l_-= _l_ local _l_;__[_[___]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[_llll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_llll];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[__lll]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[__lll];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[_llll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[____];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_lll]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[__ll]][_[__lll]]=_[_l__l];_l=_l+_ll;_=__l[_l];__[_[___]]=_ll__[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_l_ll]]=__[_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_lll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[____];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[____]))_l=_l+_ll;_=__l[_l];__[_[_l__]][_[_llll]]=__[_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[_lll]]=_[___l_];_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[____]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[_l__]][_[__lll]]=__[_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[_lll]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];__[_[___]][_[____]]=__[_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[___]][_[_llll]]=_[__ll_];_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[__lll]]=__[_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[_llll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[____]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[__lll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[__lll];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[____]))_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[____]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[__ll]][_[_l_ll]]=_[___l_];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[___l]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[____];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];__[_[__ll]][_[___l]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_llll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[___]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[____];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];__[_[__l_]][_[_lll]]=__[_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_l__]][_[_llll]]=_[_l__l];_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[___l]]=_[_l_l_];_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[_l_ll]]=_[_l_l_];_l=_l+_ll;_=__l[_l];__[_[__l_]][_[_l_ll]]=__[_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[__l_]][_[_lll]]=_[_l__l];break;end while(_l_)/((79920/0x18))==283 do _l_=(2108544)while __l__>((752/(0x50-72))+-#[[this meme string was brought to you by raid shadow legends]])do _l_-= _l_ if(_[_l__]<=__[_[___l_]])then _l=_l+____l;else _l=_[___l];end;break end while 3876==(_l_)/((0x17820/177))do do return end;break end;break;end break;end while 3856==(_l_)/((0xee+-16))do _l_=(1664780)while __l__<=(194-0x9b)do _l_-= _l_ _l_=(913944)while((26106/0xe5)+-#[[we dont give owner for feet pics what the fuck stop sending me your feet BRO]])<__l__ do _l_-= _l_ local _l_;__[_[_ll_]]=_[____];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_lll];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];__[_[_l__]][_[_lll]]=__[_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[____]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[____];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[_l__]]=_[_l_ll];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[____]]=__[_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[____]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[____];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_llll]]=_[_l__l];_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[___l]]=__[_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[_lll]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[____];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_l_ll]]=_[_lll_];_l=_l+_ll;_=__l[_l];__[_[__l_]][_[_l_ll]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[__lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[___]][_[_llll]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[_l_ll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[__lll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l__]][_[_llll]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[_lll]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[___l];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[__lll]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[___]][_[_llll]]=_[___l_];_l=_l+_ll;_=__l[_l];__[_[_ll_]]={};break end while(_l_)/((-#[[This file was obfuscated with luraph obfuscator v13.2]]+(376+(-19885/0xcd))))==4044 do ___ll[_[____]]=__[_[_l_l]];break end;break;end while 1685==(_l_)/((0x417+-59))do _l_=(1423490)while(1160/0x1d)<__l__ do _l_-= _l_ if(__[_[__ll]]==__[_[___l_]])then _l=_l+____l;else _l=_[_l_ll];end;break end while 2515==(_l_)/((-#'gav for ms private'+(16936/0x1d)))do local _l_;__[_[_ll_]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[__lll];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[____]))_l=_l+_ll;_=__l[_l];__[_[__l_]][_[__lll]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[_lll]]=_[___l_];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_ll__[_[___l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[_lll]];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_](_ll_l(__,_l_+____l,_[__lll]))_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_lll]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[__lll];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[___]][_[__lll]]=_[__l_l];_l=_l+_ll;_=__l[_l];__[_[__ll]][_[_lll]]=__[_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_lll]]=_[___l_];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_llll]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[___l]]=__[_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[____]];_l=_l+_ll;_=__l[_l];__[_[___]]=__[_[____]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[__lll];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[____]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[___]][_[_llll]]=_[___l_];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[____]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[___l];_l=_l+_ll;_=__l[_l];_l_=_[___]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_l_ll]))_l=_l+_ll;_=__l[_l];__[_[___]][_[_llll]]=__[_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=___ll[_[__lll]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[_lll]][_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[__lll];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[_llll];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[____];_l=_l+_ll;_=__l[_l];_l_=_[_ll_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[_lll]]=__[_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=__[_[_lll]][_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[__ll]]=__[_[____]][_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[__l_]][_[__lll]]=__[_[_lll_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[___l]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[___]]=___ll[_[_l_ll]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=__[_[__lll]][_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[___]]=_[___l];_l=_l+_ll;_=__l[_l];__[_[__l_]]=_[_llll];_l=_l+_ll;_=__l[_l];_l_=_[__l_]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[__lll]))_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[_llll]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[__l_]][_[_llll]]=_[__ll_];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[___l]];_l=_l+_ll;_=__l[_l];__[_[__l_]]=__[_[___l]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[___l];_l=_l+_ll;_=__l[_l];_l_=_[_l_l]__[_l_]=__[_l_](__[_l_+____l])_l=_l+_ll;_=__l[_l];__[_[__l_]][_[_llll]]=_[_l__l];_l=_l+_ll;_=__l[_l];__[_[__l_]][_[____]]=__[_[_l_l_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=___ll[_[_lll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[____]][_[_l__l]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[__ll]]=_[____];_l=_l+_ll;_=__l[_l];_l_=_[__ll]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_llll]))_l=_l+_ll;_=__l[_l];__[_[_ll_]][_[___l]]=__[_[__l_l]];_l=_l+_ll;_=__l[_l];__[_[_l__]]=___ll[_[_llll]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=__[_[__lll]][_[___l_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_l_ll];_l=_l+_ll;_=__l[_l];__[_[_l_l]]=_[_lll];_l=_l+_ll;_=__l[_l];__[_[_ll_]]=_[___l];_l=_l+_ll;_=__l[_l];_l_=_[_l__]__[_l_]=__[_l_](_ll_l(__,_l_+_ll,_[_lll]))_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[__lll]]=__[_[__ll_]];_l=_l+_ll;_=__l[_l];__[_[_l_l]][_[___l]]=_[_l_l_];break end;break;end break;end break;end break;end while(_l_)/(((-0x44+(606-0x13e))+-#'Federal was here...'))==3944 do _l_=(2768864)while((13260/0xff)+-#"c0ck")>=__l__ do _l_-= _l_ _l_=(8124408)while __l__<=(-#[[perth vs memcorrupt boxing match]]+(0x28f8/138))do _l_-= _l_ _l_=(9004849)while __l__<=(-#"i hate noobmaster"+((25371-0x31c9)/214))do _l_-= _l_ if(_[_l_l]<=__[_[_l_l_]])then _l=_[____];else _l=_l+____l;end;break;end while 3689==(_l_)/((-#[[cry about it]]+(0xa02+-109)))do _l_=(509490)while(138+-0x5f)<__l__ do _l_-= _l_ local _ll=_[__l_];local __l=__[_ll]local _l_=__[_ll+2];if(_l_>0)then if(__l>__[_ll+1])then _l=_[_lll];else __[_ll+3]=__l;end elseif(__l<__[_ll+1])then _l=_[____];else __[_ll+3]=__l;end break end while 1530==(_l_)/((726-0x189))do local _ll=_[__l_];local _l=__[_[___l]];__[_ll+1]=_l;__[_ll]=_l[_[_l_l_]];break end;break;end break;end while 2088==(_l_)/((((0x1f14+-89)-3970)+-#'string'))do _l_=(2602908)while(-#"suck on my peanut"+(((21945/0x5f)+-#"free_lua_deobfuscator.hacker.com")-0x88))>=__l__ do _l_-= _l_ _l_=(1522014)while(8685/0xc1)<__l__ do _l_-= _l_ __[_[__ll]][_[_lll]]=__[_[___l_]];break end while 494==(_l_)/((-#'perth thinks psu is bad (it is) and uses ms priv'+(0x2ac78/56)))do local _=_[_l_l]__[_]=__[_]()break end;break;end while(_l_)/((0x60b-791))==3443 do _l_=(2495493)while(-#"i still hate noobmaster"+(-106+0xb0))<__l__ do _l_-= _l_ local __l__;local _l_;__[_[___]]=_ll__[_[____]];_l=_l+_ll;_
