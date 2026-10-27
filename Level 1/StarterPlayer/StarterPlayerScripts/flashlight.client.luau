local UIS = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local flashlightTemplate = game.ReplicatedStorage:WaitForChild("Flashlight")
local flashlight 
local LightOn = false

local StarterGui = game:GetService("StarterGui")

while wait() do
	local success, result = pcall(function()
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
	end)

	if success then break end
end

print("Backpack disabled")

UIS.InputBegan:Connect(function(input, chatting)
	if not chatting and input.KeyCode == Enum.KeyCode.F then
		if not LightOn then
			LightOn = true
			flashlight = flashlightTemplate:Clone()
			flashlight.Parent = player.Character 

			player.Character.Humanoid:EquipTool(flashlight)


		else
			LightOn = false
			if flashlight then
				flashlight:Destroy() 
				flashlight = nil
			end
		end
	end
end)
