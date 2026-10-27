local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PartyEvent = ReplicatedStorage:WaitForChild("PartyEvent")
local Parties = ReplicatedStorage:WaitForChild("Parties")
local TeleportService = game:GetService("TeleportService")
local numLevels = 2
local levelIDs = {124926155050533, 85505087528088}
PartyEvent.OnServerEvent:Connect(function(player, action, partyName, target,id)
	if action == "CreateParty" then
		local newParty = Instance.new("Folder")
		newParty.Name = partyName
		newParty:SetAttribute("Leader", player.Name)
		newParty:SetAttribute("PlayerCount", 1)  
		newParty:SetAttribute("P2","")
		newParty:SetAttribute("P3","")
		newParty:SetAttribute("P4","")
		newParty:SetAttribute("levelIndex",1)
		newParty.Parent = Parties

		PartyEvent:FireAllClients("UpdateParties",newParty,player.Name, target,1)
	elseif action == "JoinParty" then
		local party = Parties:FindFirstChild(partyName)
		local pC = party:GetAttribute("PlayerCount")
		if pC < 4 then
			party:SetAttribute("PlayerCount",pC+1)
			local p2 = party:GetAttribute("P2")
			local p3 = party:GetAttribute("P3")
			local p4 = party:GetAttribute("P4")
			if p2 == "" then
				party:SetAttribute("P2",player.Name)
			elseif p3 == "" then
				party:SetAttribute("P3",player.Name)
			elseif p4 == "" then
				party:SetAttribute("P4",player.Name)
			end
			PartyEvent:FireAllClients("JoinParty",party, player.Name, target,party:GetAttribute("levelIndex"))
		end
	elseif action == "KickPlayer" then
		local party = Parties:FindFirstChild(partyName)
		local pC = party:GetAttribute("PlayerCount")
		local p1 = party:GetAttribute("Leader")
		local p2 = party:GetAttribute("P2")
		local p3 = party:GetAttribute("P3")
		local p4 = party:GetAttribute("P4")
		if target == p1 then
			party:SetAttribute("Leader", "")
			party:SetAttribute("PlayerCount",pC-1)
		elseif target == p2 then
			party:SetAttribute("P2","")
			party:SetAttribute("PlayerCount",pC-1)
		elseif target == p3 then
			party:SetAttribute("P3","")
			party:SetAttribute("PlayerCount",pC-1)
		elseif target == p4 then
			party:SetAttribute("P4","")
			party:SetAttribute("PlayerCount",pC-1)
		end
		
		PartyEvent:FireAllClients("KickPlayer",party, player.Name, target)
	elseif action == "DisbandParty" then
		local party = Parties:FindFirstChild(partyName)
		local p1 = party:GetAttribute("Leader")
		local p2 = party:GetAttribute("P2")
		local p3 = party:GetAttribute("P3")
		local p4 = party:GetAttribute("P4")
		PartyEvent:FireAllClients("DisbandParty",party, player.Name, player.Name)
		PartyEvent:FireAllClients("updateONLY",party, player.Name, player.Name)
		if party then
			party:Destroy()
		end
	elseif action == "Play" then
		local party = Parties:FindFirstChild(partyName)
		local levelIndex = party:GetAttribute("levelIndex")
		local id = levelIDs[levelIndex]
		tpfunc(party,id)
	elseif action == "updateLevel" then
		local party = Parties:FindFirstChild(partyName)
		local p1 = party:GetAttribute("Leader")
		local p2 = party:GetAttribute("P2")
		local p3 = party:GetAttribute("P3")
		local p4 = party:GetAttribute("P4")
		local levelIndex = party:GetAttribute("levelIndex")
		PartyEvent:FireAllClients("updateLevel",party, player.Name, player.Name,levelIndex)
	elseif action == "Right" then
		local party = Parties:FindFirstChild(partyName)
		local levelIndex = party:GetAttribute("levelIndex")
		if levelIndex == numLevels then
			levelIndex = 1
		else
			levelIndex = levelIndex+1
		end
		party:SetAttribute("levelIndex",levelIndex)
		PartyEvent:FireAllClients("updateLevel",party, player.Name, player.Name,levelIndex)
	elseif action == "Left" then
		local party = Parties:FindFirstChild(partyName)
		local levelIndex = party:GetAttribute("levelIndex")
		if levelIndex == 1 then
			levelIndex = numLevels
		else
			levelIndex = levelIndex-1
		end
		party:SetAttribute("levelIndex",levelIndex)
		PartyEvent:FireAllClients("updateLevel",party, player.Name, player.Name,levelIndex)
	end
end)

function tpfunc(group,id) 
	local p1 = group:GetAttribute("Leader")
	local p2 = group:GetAttribute("P2")
	local p3 = group:GetAttribute("P3")
	local p4 = group:GetAttribute("P4")
	
	local party = {}

	table.insert(party, game.Players:FindFirstChild(p1))
	table.insert(party, game.Players:FindFirstChild(p2))
	table.insert(party, game.Players:FindFirstChild(p3))
	table.insert(party, game.Players:FindFirstChild(p4))

	local reservedServer = TeleportService:ReserveServer(id)
	TeleportService:TeleportToPrivateServer(id, reservedServer, party)
	
	if group then
		group:Destroy()
	end
	
	PartyEvent:FireAllClients("updateONLY",group,p1, p1)
	
	task.wait(10)
	game.Players:FindFirstChild(p1):Destroy()
	game.Players:FindFirstChild(p2):Destroy()
	game.Players:FindFirstChild(p3):Destroy()
	game.Players:FindFirstChild(p4):Destroy()
end
