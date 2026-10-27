local WS = game:GetService("Workspace")
local locPla = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Gui = script.Parent.Parent
local camera = workspace:WaitForChild("Camera")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AttackEvent = ReplicatedStorage:WaitForChild("AttackEvent")
local dragStartTime = 0
local magazine1 = WS:WaitForChild("Magazine3")
local prompt1 = magazine1:WaitForChild("Read1")
local loud = Gui:WaitForChild("Loud")
local quiet = Gui:WaitForChild("Quiet")


local prev = Gui:WaitForChild("Right1")
local post = Gui:WaitForChild("Right3")



local right1 = script.Parent
local rightDetector = right1:WaitForChild("UIDragDetector")

local image = right1:WaitForChild("ImageLabel")
local image1 = "rbxassetid://79462177421262"
local image2 = "rbxassetid://128049335620400"



right1.Visible = false

local dragging = false
local initialSize = 0
local initialDragPos = 0
local initialPositionX = 0 

local newScale = 0
local side = "right"
prompt1.Triggered:Connect(function(player)
	if locPla == player then
		player.Character.HumanoidRootPart.Anchored = true
		player.CameraMode = Enum.CameraMode.Classic
		camera.CameraType = Enum.CameraType.Scriptable
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default

		right1.Visible = true
	end
end)

rightDetector.DragStart:Connect(function()
	dragging = true
	dragStartTime = os.clock()
	right1.ZIndex=2
	prev.ZIndex=1
	post.ZIndex=0
	print(prev.LayoutOrder)
	print(right1.LayoutOrder)
	local mouseX = UserInputService:GetMouseLocation().X / camera.ViewportSize.X

	if(side == "right") then
		initialSize = right1.Size.X.Scale
		initialPositionX = right1.Position.X.Scale
	else
		initialSize = -right1.Size.X.Scale
		initialPositionX = right1.Position.X.Scale
	end

	initialDragPos = mouseX
end)

rightDetector.DragContinue:Connect(function()
	if dragging then
		local mouseX = UserInputService:GetMouseLocation().X / camera.ViewportSize.X

		local deltaX = mouseX - initialDragPos
		newScale = initialSize + deltaX

		local maxSize = math.abs(initialSize)
		if newScale > maxSize then
			newScale = maxSize
		elseif newScale < -maxSize then
			newScale = -maxSize
		end
		
		if newScale < 0 then
			right1.Position = UDim2.new(0.5 - (-newScale), 0, right1.Position.Y.Scale, right1.Position.Y.Offset)
			right1.Size = UDim2.new(-newScale, 0, right1.Size.Y.Scale, right1.Size.Y.Offset)
			side = "left"
			image.Image=image2

		else
			right1.Position = UDim2.new(0.5, 0, right1.Position.Y.Scale, right1.Position.Y.Offset)
			right1.Size = UDim2.new(newScale, 0, right1.Size.Y.Scale, right1.Size.Y.Offset)
			side = "right"
			image.Image=image1

		end
	end
end)

rightDetector.DragEnd:Connect(function()
	dragging = false
	print(os.clock()-dragStartTime)
	local maxSize = math.abs(initialSize)
	if(os.clock()-dragStartTime<3) then
		loud:Play()
		AttackEvent:FireServer(game.Players.LocalPlayer.Character)
	else
		quiet:Play()
	end
	if newScale == nil then
		newScale = initialSize 
	end

	if newScale >= 0 then
		newScale = maxSize
		right1.Position = UDim2.new(0.5, 0, right1.Position.Y.Scale, right1.Position.Y.Offset)
		right1.Size = UDim2.new(newScale, 0, right1.Size.Y.Scale, right1.Size.Y.Offset)
	else
		newScale = -maxSize
		right1.Position = UDim2.new(0.5 - maxSize, 0, right1.Position.Y.Scale, right1.Position.Y.Offset)
		right1.Size = UDim2.new(maxSize, 0, right1.Size.Y.Scale, right1.Size.Y.Offset)
	end
end)
