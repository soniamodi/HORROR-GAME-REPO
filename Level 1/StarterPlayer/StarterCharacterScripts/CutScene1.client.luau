local ts = game:GetService("TweenService")
local WS = game:GetService("ReplicatedStorage")
local camFolder = WS.camFolder
local camera = game.Workspace.CurrentCamera
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("Head")
local gui = player.PlayerGui.CutSceneUI
local frame = gui.Frame
gui.IgnoreGuiInset = true
frame.Visible = true
local hum = character:WaitForChild("Humanoid")
frame.TextLabel.TextTransparency = 0  
hum.WalkSpeed = 0
local t1 = TweenInfo.new(
	5,  
	Enum.EasingStyle.Cubic,
	Enum.EasingDirection.Out,
	0,  
	false,
	0
)

local textFadeTween = ts:Create(frame.TextLabel, t1, {TextTransparency = 1})

textFadeTween:Play()

textFadeTween.Completed:Wait()

local ti = TweenInfo.new(
	1,  
	Enum.EasingStyle.Cubic,
	Enum.EasingDirection.Out,
	0,  
	false,
	0  
)

camera.CameraType = Enum.CameraType.Scriptable
camera.CFrame = WS.camFolder.cameraNumber1.CFrame
local frameTween = ts:Create(frame, ti, {Transparency = 0.7})
frameTween:Play()
frameTween.Completed:Wait()
local frameTween = ts:Create(frame, ti, {Transparency = 0})
frameTween:Play()
frameTween.Completed:Wait()
local frameTween = ts:Create(frame, ti, {Transparency = 0.7})
frameTween:Play()
frameTween.Completed:Wait()
local frameTween = ts:Create(frame, ti, {Transparency = 0})
frameTween:Play()
frameTween.Completed:Wait()
frame.BackgroundColor3 = Color3.new(256,256,256)

local FlashT = TweenInfo.new(
	10,  
	Enum.EasingStyle.Cubic,
	Enum.EasingDirection.Out,
	0,  
	false,
	0  
)
local fS = script:WaitForChild("Sound")
fS:Play()
local frameTween = ts:Create(frame, FlashT, {Transparency = 1})
frameTween:Play()

local ShakeT = TweenInfo.new(
	1,  
	Enum.EasingStyle.Cubic,
	Enum.EasingDirection.Out,
	0,  
	false,
	0  
)

local cameraTween = ts:Create(camera, ShakeT, {CFrame = WS.camFolder.cameraNumber2.CFrame})
cameraTween:Play()
cameraTween.Completed:Wait()
local cameraTween = ts:Create(camera, ShakeT, {CFrame = WS.camFolder.cameraNumber1.CFrame})
cameraTween:Play()
cameraTween.Completed:Wait()
local cameraTween = ts:Create(camera, ShakeT, {CFrame = WS.camFolder.cameraNumber2.CFrame})
cameraTween:Play()
cameraTween.Completed:Wait()

local cameraTween = ts:Create(camera, ShakeT, {CFrame = WS.camFolder.cameraNumber3.CFrame})
cameraTween:Play()
cameraTween.Completed:Wait()

local cameraTween = ts:Create(camera, ShakeT, {CFrame = WS.camFolder.cameraNumber4.CFrame})
cameraTween:Play()
cameraTween.Completed:Wait()

local cameraTween = ts:Create(camera, ShakeT, {CFrame = WS.camFolder.cameraNumber5.CFrame})
cameraTween:Play()
cameraTween.Completed:Wait()

camera.CFrame = humanoidRootPart.CFrame

camera.CameraType = Enum.CameraType.Custom
hum.WalkSpeed = 16