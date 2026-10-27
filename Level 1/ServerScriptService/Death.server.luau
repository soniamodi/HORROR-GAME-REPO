local productID = 3271563817
local lobbyID = 124926155050533

local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local monst = game.Workspace.Model


local function clonePlayerAppearance(player)
	local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	local description = humanoid:GetAppliedDescription()
	local cloneRig = Players:CreateHumanoidModelFromDescription(description, Enum.HumanoidRigType.R15)

	cloneRig.Name = "Rig1"
	cloneRig:SetPrimaryPartCFrame(monst.T.CFrame) 
	cloneRig.Parent = workspace
	
	
end



ReplicatedStorage.Respawn.OnServerEvent:Connect(function(player)
	local lifes = player:FindFirstChild("lifes")
	if lifes and lifes.Value > 0 then
		player:LoadCharacter()
		print("respawning no purchase")
	else
		MarketplaceService:PromptProductPurchase(player, productID)
		print("purchase needed")
	end
end)

MarketplaceService.PromptProductPurchaseFinished:Connect(function(player, purchasedProductID, purchased)
	if purchasedProductID == productID and purchased then
		local lifes = player:FindFirstChild("lifes")
		if lifes then
			lifes.Value = 1 
		end
		player:LoadCharacter()
	end
end)

ReplicatedStorage.BackToLobby.OnServerEvent:Connect(function(player)
	TeleportService:Teleport(lobbyID, player)
end)

Players.PlayerAdded:Connect(function(player)
	local lifes = Instance.new("IntValue")
	lifes.Name = "lifes"
	lifes.Value = 6
	lifes.Parent = player

	

	player.CharacterAdded:Connect(function(character)
		print("'s character added:", character)

		local humanoid = character:WaitForChild("Humanoid")
		humanoid.Died:Connect(function()
			print("YOU DIED")
			
			
			
			local lifes = player:FindFirstChild("lifes")
			if lifes then
				lifes.Value = lifes.Value - 1
			end
			ReplicatedStorage.Die:FireClient(player)
			
		end)
	end)
	player:LoadCharacter()
end)






