local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AttackEvent = ReplicatedStorage:WaitForChild("AttackEvent")
local PathfindingService = game:GetService("PathfindingService")

local rig = script.Parent
local humanoid = rig:FindFirstChildOfClass("Humanoid")

local attacking = false
local patroling = true 
local attackTarget = nil
local currentPath = nil 


print("testing")

local function calculatePath(destination)
	local path = PathfindingService:CreatePath({
		AgentRadius = 5,
		AgentHeight = 15,
		AgentCanJump = false,
		AgentCanClimb = false,
		AgentJumpHeight = 0,
		AgentWalkableClimb = 2,
		PathfindingUseImprovedSearch = true, 
		Costs = { 
			
		}
	})
	path:ComputeAsync(rig.HumanoidRootPart.Position, destination)
	return path
end

local function walkToDestination(destination)
	local path = calculatePath(destination)
	if path.Status == Enum.PathStatus.Success then
		for _, waypoint in ipairs(path:GetWaypoints()) do
			if not patroling then return end 
			humanoid:MoveTo(waypoint.Position)
			if waypoint.Action == Enum.PathWaypointAction.Jump then
				humanoid.Jump = true
			end
			humanoid.MoveToFinished:Wait()
		end
	else
		print("path calculation failed")
	end
end

local function moveToAttackLocation(destination)
	if (rig.HumanoidRootPart.Position - destination).Magnitude < 2 then
		return true 
	end

	local path = calculatePath(destination)
	if path.Status == Enum.PathStatus.Success then
		for _, waypoint in ipairs(path:GetWaypoints()) do
			humanoid:MoveTo(waypoint.Position)
			if waypoint.Action == Enum.PathWaypointAction.Jump then
				humanoid.Jump = true 
			end
			humanoid.MoveToFinished:Wait()
			if not attacking then
				return false 
			end
		end
	else
		print("Path calculation failed")
	end
	return true
end

local function patrol()
	while true do
		if patroling then
			local waypoints = workspace.Waypoints:GetChildren()
			local randomWaypoint = waypoints[math.random(1, #waypoints)]
			walkToDestination(randomWaypoint.Position)
		end
		task.wait(0.25)
	end
end

AttackEvent.OnServerEvent:Connect(function(player)
	if attacking then
		attacking = false 
		task.wait(1)
	end
	
	patroling = false
	attacking = true
	
	rig.Humanoid.WalkSpeed = 30
	attackTarget = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if (player.Character:FindFirstChild("HumanoidRootPart").Position - rig.HumanoidRootPart.Position).Magnitude <= 20 then
		player.Character.Humanoid.Health =0
		script.Sound2:Play()
		task.wait(5)
	end
	if attackTarget then
		script.Sound:Play()
		while attacking do
			local reachedTarget = moveToAttackLocation(attackTarget.Position) 
			if reachedTarget then
				task.wait(2) 
				break
			end
			task.wait(0.5) 
		end
	end
	
	attacking = false 
	patroling = true 
	rig.Humanoid.WalkSpeed = 16
end)

task.spawn(patrol)


