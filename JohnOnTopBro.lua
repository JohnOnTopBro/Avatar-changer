--==================================================
-- JOHN ON TOP 👑
-- UNIVERSAL AVATAR CHANGER
-- ONE LOCAL SCRIPT
-- FULLSCREEN LOADING
-- TOP OF EXISTING GUI
--==================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--==================================================
-- SETTINGS
--==================================================

local GUI_NAME = "JohnOnTopUniversalAvatar"
local CIRCLE_IMAGE = "rbxassetid://134112829099529"

local SelectedDescription = nil
local SelectedUsername = nil
local Changing = false

-- Remove only our previous GUI if script gets executed again
local OldGui = PlayerGui:FindFirstChild(GUI_NAME)
if OldGui then
	OldGui:Destroy()
end

--==================================================
-- SCREEN GUI
--==================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = GUI_NAME
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

-- Extremely high display order so it sits above normal GUIs
ScreenGui.DisplayOrder = 2147483647

ScreenGui.Parent = PlayerGui

--==================================================
-- LOADING SCREEN
--==================================================

local Loading = Instance.new("Frame")
Loading.Name = "UniversalLoading"
Loading.Parent = ScreenGui
Loading.Size = UDim2.fromScale(1, 1)
Loading.Position = UDim2.fromScale(0, 0)
Loading.BackgroundColor3 = Color3.fromRGB(5, 13, 27)
Loading.BorderSizePixel = 0
Loading.ZIndex = 10000

local LoadingTitle = Instance.new("TextLabel")
LoadingTitle.Parent = Loading
Loading.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingTitle.Position = UDim2.fromScale(0.5, 0.40)
LoadingTitle.Size = UDim2.new(0, 500, 0, 55)
LoadingTitle.BackgroundTransparency = 1
LoadingTitle.Text = "JOHN ON TOP 👑"
LoadingTitle.TextColor3 = Color3.fromRGB(70, 200, 255)
LoadingTitle.TextSize = 30
LoadingTitle.Font = Enum.Font.GothamBold
LoadingTitle.ZIndex = 10001

local LoadingText = Instance.new("TextLabel")
LoadingText.Parent = Loading
LoadingText.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingText.Position = UDim2.fromScale(0.5, 0.48)
LoadingText.Size = UDim2.new(0, 400, 0, 30)
LoadingText.BackgroundTransparency = 1
LoadingText.Text = "Starting..."
LoadingText.TextColor3 = Color3.fromRGB(100, 150, 190)
LoadingText.TextSize = 13
LoadingText.Font = Enum.Font.Gotham
LoadingText.ZIndex = 10001

local Percent = Instance.new("TextLabel")
Percent.Parent = Loading
Percent.AnchorPoint = Vector2.new(0.5, 0.5)
Percent.Position = UDim2.fromScale(0.5, 0.54)
Percent.Size = UDim2.new(0, 100, 0, 30)
Percent.BackgroundTransparency = 1
Percent.Text = "0%"
Percent.TextColor3 = Color3.fromRGB(70, 200, 255)
Percent.TextSize = 14
Percent.Font = Enum.Font.GothamBold
Percent.ZIndex = 10001

local BarBG = Instance.new("Frame")
BarBG.Parent = Loading
BarBG.AnchorPoint = Vector2.new(0.5, 0.5)
BarBG.Position = UDim2.fromScale(0.5, 0.59)
BarBG.Size = UDim2.new(0, 400, 0, 12)
BarBG.BackgroundColor3 = Color3.fromRGB(8, 25, 45)
BarBG.BorderSizePixel = 0
BarBG.ZIndex = 10001

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(1, 0)
BarCorner.Parent = BarBG

local Bar = Instance.new("Frame")
Bar.Parent = BarBG
Bar.Size = UDim2.new(0, 0, 1, 0)
Bar.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Bar.BorderSizePixel = 0
Bar.ZIndex = 10002

local BarCorner2 = Instance.new("UICorner")
BarCorner2.CornerRadius = UDim.new(1, 0)
BarCorner2.Parent = Bar

--==================================================
-- MAIN FRAME
--==================================================

local Main = Instance.new("Frame")
Main.Name = "AvatarChanger"
Main.Parent = ScreenGui
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.fromScale(0.5, 0.5)
Main.Size = UDim2.new(0, 350, 0, 245)
Main.BackgroundColor3 = Color3.fromRGB(7, 20, 38)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Visible = false
Main.ZIndex = 100

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 170, 255)
MainStroke.Thickness = 2
MainStroke.Parent = Main

--==================================================
-- TOP BAR
--==================================================

local Top = Instance.new("Frame")
Top.Parent = Main
Top.Size = UDim2.new(1, 0, 0, 60)
Top.BackgroundColor3 = Color3.fromRGB(10, 30, 55)
Top.BorderSizePixel = 0
Top.ZIndex = 101

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 14)
TopCorner.Parent = Top

local Title = Instance.new("TextLabel")
Title.Parent = Top
Title.Position = UDim2.new(0, 18, 0, 7)
Title.Size = UDim2.new(1, -70, 0, 28)
Title.BackgroundTransparency = 1
Title.Text = "JOHN ON TOP 👑"
Title.TextColor3 = Color3.fromRGB(70, 200, 255)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 102

local Subtitle = Instance.new("TextLabel")
Subtitle.Parent = Top
Subtitle.Position = UDim2.new(0, 19, 0, 34)
Subtitle.Size = UDim2.new(1, -70, 0, 18)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "UNIVERSAL AVATAR CHANGER"
Subtitle.TextColor3 = Color3.fromRGB(90, 140, 180)
Subtitle.TextSize = 10
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.ZIndex = 102

--==================================================
-- CLOSE BUTTON
--==================================================

local Close = Instance.new("TextButton")
Close.Parent = Top
Close.Position = UDim2.new(1, -48, 0, 13)
Close.Size = UDim2.new(0, 35, 0, 35)
Close.BackgroundColor3 = Color3.fromRGB(15, 50, 80)
Close.BorderSizePixel = 0
Close.Text = "×"
Close.TextColor3 = Color3.fromRGB(100, 210, 255)
Close.TextSize = 25
Close.Font = Enum.Font.GothamBold
Close.ZIndex = 103

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 9)
CloseCorner.Parent = Close

--==================================================
-- USERNAME BOX
--==================================================

local UsernameBox = Instance.new("TextBox")
UsernameBox.Parent = Main
UsernameBox.Position = UDim2.new(0, 20, 0, 85)
UsernameBox.Size = UDim2.new(1, -40, 0, 48)
UsernameBox.BackgroundColor3 = Color3.fromRGB(8, 27, 48)
UsernameBox.BorderSizePixel = 0
UsernameBox.PlaceholderText = "Enter Roblox username"
UsernameBox.PlaceholderColor3 = Color3.fromRGB(90, 120, 145)
UsernameBox.Text = ""
UsernameBox.TextColor3 = Color3.fromRGB(220, 240, 255)
UsernameBox.TextSize = 14
UsernameBox.Font = Enum.Font.Gotham
UsernameBox.ClearTextOnFocus = false
UsernameBox.ZIndex = 102

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 10)
BoxCorner.Parent = UsernameBox

local BoxStroke = Instance.new("UIStroke")
BoxStroke.Color = Color3.fromRGB(20, 80, 120)
BoxStroke.Thickness = 1
BoxStroke.Parent = UsernameBox

--==================================================
-- CHANGE BUTTON
--==================================================

local Change = Instance.new("TextButton")
Change.Parent = Main
Change.Position = UDim2.new(0, 20, 0, 145)
Change.Size = UDim2.new(1, -40, 0, 48)
Change.BackgroundColor3 = Color3.fromRGB(10, 65, 100)
Change.BorderSizePixel = 0
Change.Text = "CHANGE AVATAR"
Change.TextColor3 = Color3.fromRGB(220, 245, 255)
Change.TextSize = 14
Change.Font = Enum.Font.GothamBold
Change.ZIndex = 102

local ChangeCorner = Instance.new("UICorner")
ChangeCorner.CornerRadius = UDim.new(0, 10)
ChangeCorner.Parent = Change

local ChangeStroke = Instance.new("UIStroke")
ChangeStroke.Color = Color3.fromRGB(0, 170, 255)
ChangeStroke.Thickness = 1
ChangeStroke.Parent = Change

--==================================================
-- STATUS
--==================================================

local Status = Instance.new("TextLabel")
Status.Parent = Main
Status.Position = UDim2.new(0, 20, 0, 202)
Status.Size = UDim2.new(1, -40, 0, 25)
Status.BackgroundTransparency = 1
Status.Text = "Enter a username."
Status.TextColor3 = Color3.fromRGB(100, 160, 195)
Status.TextSize = 11
Status.Font = Enum.Font.Gotham
Status.ZIndex = 102

--==================================================
-- CIRCLE BUTTON
--==================================================

local CircleBtn = Instance.new("ImageButton")
CircleBtn.Name = "JohnOnTopCircle"
CircleBtn.Parent = ScreenGui
CircleBtn.AnchorPoint = Vector2.new(0, 0.5)
CircleBtn.Position = UDim2.new(0.03, 0, 0.5, 0)
CircleBtn.Size = UDim2.new(0, 58, 0, 58)
CircleBtn.BackgroundColor3 = Color3.fromRGB(8, 30, 55)
CircleBtn.BorderSizePixel = 0
CircleBtn.Image = CIRCLE_IMAGE
CircleBtn.ScaleType = Enum.ScaleType.Fit
CircleBtn.Visible = false
CircleBtn.Active = true
CircleBtn.Draggable = true
CircleBtn.ZIndex = 500

local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = CircleBtn

local CircleStroke = Instance.new("UIStroke")
CircleStroke.Color = Color3.fromRGB(0, 170, 255)
CircleStroke.Thickness = 2
CircleStroke.Parent = CircleBtn

--==================================================
-- CLOSE / OPEN
--==================================================

Close.MouseButton1Click:Connect(function()
	Main.Visible = false
	CircleBtn.Visible = true
end)

CircleBtn.MouseButton1Click:Connect(function()
	CircleBtn.Visible = false
	Main.Visible = true
end)

--==================================================
-- APPLY AVATAR
--==================================================

local function ApplyAvatar(Description)
	local Character = Player.Character

	if not Character then
		return false
	end

	local Humanoid = Character:FindFirstChildOfClass("Humanoid")

	if not Humanoid then
		return false
	end

	return pcall(function()
		Humanoid:ApplyDescriptionResetAsync(Description)
	end)
end

--==================================================
-- CHANGE AVATAR
--==================================================

Change.MouseButton1Click:Connect(function()

	if Changing then
		return
	end

	local Username = UsernameBox.Text
	Username = Username:gsub("^%s+", ""):gsub("%s+$", "")

	if Username == "" then
		Status.Text = "Enter a username first."
		Status.TextColor3 = Color3.fromRGB(255, 100, 100)
		return
	end

	Changing = true
	Change.Text = "LOADING..."
	Status.Text = "Finding @" .. Username .. "..."
	Status.TextColor3 = Color3.fromRGB(100, 190, 255)

	local Success, UserId = pcall(function()
		return Players:GetUserIdFromNameAsync(Username)
	end)

	if not Success or not UserId then
		Status.Text = "Username not found."
		Status.TextColor3 = Color3.fromRGB(255, 100, 100)
		Change.Text = "CHANGE AVATAR"
		Changing = false
		return
	end

	Status.Text = "Loading avatar..."

	local DescriptionSuccess, Description = pcall(function()
		return Players:GetHumanoidDescriptionFromUserIdAsync(UserId)
	end)

	if not DescriptionSuccess or not Description then
		Status.Text = "Couldn't load avatar."
		Status.TextColor3 = Color3.fromRGB(255, 100, 100)
		Change.Text = "CHANGE AVATAR"
		Changing = false
		return
	end

	SelectedDescription = Description
	SelectedUsername = Username

	if ApplyAvatar(Description) then
		Status.Text = "Changed to @" .. Username
		Status.TextColor3 = Color3.fromRGB(80, 220, 130)
	else
		Status.Text = "Failed to apply avatar."
		Status.TextColor3 = Color3.fromRGB(255, 100, 100)
	end

	Change.Text = "CHANGE AVATAR"
	Changing = false
end)

--==================================================
-- KEEP SELECTED AVATAR AFTER RESET
--==================================================

Player.CharacterAdded:Connect(function(Character)

	if not SelectedDescription then
		return
	end

	local Humanoid = Character:WaitForChild("Humanoid", 10)

	if not Humanoid then
		return
	end

	task.wait(0.5)

	pcall(function()
		Humanoid:ApplyDescriptionResetAsync(SelectedDescription)
	end)

	if SelectedUsername then
		Status.Text = "Avatar: @" .. SelectedUsername
		Status.TextColor3 = Color3.fromRGB(80, 220, 130)
	end
end)

--==================================================
-- LOADING ANIMATION
--==================================================

task.spawn(function()

	local Steps = {
		{10, "Starting..."},
		{25, "Checking interface..."},
		{40, "Loading avatar changer..."},
		{55, "Preparing components..."},
		{70, "Initializing universal UI..."},
		{85, "Almost ready..."},
		{100, "Ready!"}
	}

	for _, Step in ipairs(Steps) do

		local Number = Step[1]
		local Text = Step[2]

		Percent.Text = Number .. "%"
		LoadingText.Text = Text

		TweenService:Create(
			Bar,
			TweenInfo.new(
				0.25,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				Size = UDim2.new(Number / 100, 0, 1, 0)
			}
		):Play()

		task.wait(0.28)
	end

	task.wait(0.4)

	-- Fade loading screen
	for _, Object in ipairs(Loading:GetDescendants()) do

		if Object:IsA("TextLabel") then

			TweenService:Create(
				Object,
				TweenInfo.new(0.4),
				{
					TextTransparency = 1
				}
			):Play()

		elseif Object:IsA("Frame") then

			TweenService:Create(
				Object,
				TweenInfo.new(0.4),
				{
					BackgroundTransparency = 1
				}
			):Play()

		end
	end

	TweenService:Create(
		Loading,
		TweenInfo.new(0.5),
		{
			BackgroundTransparency = 1
		}
	):Play()

	task.wait(0.55)

	Loading:Destroy()
	Main.Visible = true

end)
