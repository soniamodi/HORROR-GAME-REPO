local Players = game:GetService("Players")
local player = Players.LocalPlayer

local rigTemplate = game.Workspace:WaitForChild("Rig")

local localRig = rigTemplate:Clone()
localRig.Parent = game.Workspace
localRig.Name = "LocalRig_" .. player.Name

task.wait()

local humanoid = localRig:FindFirstChildOfClass("Humanoid")
if humanoid then
	local description = Players:GetHumanoidDescriptionFromUserId(player.UserId)
	humanoid:ApplyDescription(description)
else
	warn("No Humanoid found inside Rig")
end
