local RP = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")

local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera
local Players = game:GetService("Players")


local deathUI = RP:WaitForChild("DeathUI")

local respawnRemote = RP:WaitForChild("Respawn")
local leaveRemote = RP:WaitForChild("BackToLobby")

local spectating = false

local playerGui = player:WaitForChild("PlayerGui")

local deathUIClone

RP:WaitForChild("Die").OnClientEvent:Connect(function()

	print("h?")
	if not deathUIClone or not deathUIClone.Parent then
		deathUIClone = deathUI:Clone()
		deathUIClone.Parent = playerGui
	end
	
	deathUIClone.Enabled = true
	local lifes = player.lifes.Value
	print(lifes)
	deathUIClone.Lives.Text = lifes .. " lives left"

	local respawnButton = deathUIClone.Buttons:WaitForChild("Respawn")
	local lobbyButton = deathUIClone.Buttons:WaitForChild("Leave")

	player.CameraMode = Enum.CameraMode.Classic
	player.CameraMaxZoomDistance = 14
	player.CameraMinZoomDistance = 7

	UIS.MouseBehavior = Enum.MouseBehavior.Default

	local lifes = player:FindFirstChild("lifes")
	if lifes and lifes.Value <= 0 then
		respawnButton.MouseButton1Click:Connect(function()
			RP.Respawn:FireServer()
		end)
	else
		respawnButton.MouseButton1Click:Connect(function()
			deathUIClone.Enabled = false  
			RP.Respawn:FireServer()
		end)
	end

	lobbyButton.MouseButton1Click:Connect(function()
		deathUIClone.Enabled = false
		RP.BackToLobby:FireServer()
	end)

	deathUIClone.Buttons.Leave.MouseButton1Click:Connect(function()
		leaveRemote:FireServer()
		deathUIClone.Buttons.Leave.Text = "Teleporting"
	end)

	deathUIClone.Spectating.Next.MouseButton1Click:Connect(function()
		local pspec = Players:FindFirstChild(camera.CameraSubject.Parent.Name)

		local playersList = Players:GetPlayers()

		local currentIndex = table.find(playersList, pspec)
		local totalPlayers = #playersList

		if currentIndex then
			currentIndex += 1
			if currentIndex > totalPlayers then
				currentIndex = 1
			end

			camera.CameraSubject = playersList[currentIndex].Character.Head
		end
	end)

	deathUIClone.Spectating.Back.MouseButton1Click:Connect(function()
		local pspec = Players:FindFirstChild(camera.CameraSubject.Parent.Name)

		local playersList = Players:GetPlayers()

		local currentIndex = table.find(playersList, pspec)
		local totalPlayers = #playersList

		if currentIndex then
			currentIndex -= 1
			if currentIndex < 1 then
				currentIndex = totalPlayers
			end

			camera.CameraSubject = playersList[currentIndex].Character.Head
		end
	end)
end)

player.CharacterAdded:Connect(function(char)
	spectating = false
	if deathUIClone then
		deathUIClone.Enabled = false  
	end

	player.CameraMaxZoomDistance = 0
	player.CameraMinZoomDistance = 0
	player.CameraMode = Enum.CameraMode.LockFirstPerson
	UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
end)
