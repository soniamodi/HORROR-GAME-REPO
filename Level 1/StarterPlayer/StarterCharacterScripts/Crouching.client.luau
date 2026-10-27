local UIS = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AttackEvent = ReplicatedStorage:WaitForChild("AttackEvent")
local crouching = false
local char = script.Parent

local hum = char:WaitForChild("Humanoid")


local anim = script:WaitForChild("CrouchAnim")
local loaded = hum:LoadAnimation(anim)

UIS.InputEnded:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.C  then

		if crouching == true then
			crouching = false
			loaded:Stop()

			hum.HipHeight += 2
			hum.WalkSpeed = 16
	end	
	end
end)


UIS.InputBegan:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.C  then

		
		if crouching == false then
			crouching = true
			loaded:Play()
			
			hum.HipHeight -= 2
			hum.WalkSpeed = 8
			
			
		else
			crouching = false
			loaded:Stop()

			hum.HipHeight += 2
			hum.WalkSpeed = 16
		end
	end	
	
end)

local creak = script:WaitForChild("Sound")
hum.Running:Connect(function(speed)
	if(speed>8) then
		if(not crouching) then
			local rand = math.random(1,14)
			if rand<=5 then
				creak:Play()
				AttackEvent:FireServer(char)
			end
		end
	end
end)