local WS = game.Workspace
local cam = WS.CurrentCamera
local locPla = game.Players.LocalPlayer
local locName = locPla.Name
local UserInputService = game.UserInputService
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AttackEvent = ReplicatedStorage:WaitForChild("AttackEvent")

local sounds = WS:WaitForChild("Sounds")
local LC = sounds.LoudClick
local QC = sounds.QuietClick

local Gui = script.Parent
local one = Gui.C1
local two = Gui.C2
local three = Gui.C3
local four = Gui.C4
local five = Gui.C5
local six = Gui.C6
local seven = Gui.C7
local eight = Gui.C8
local nine = Gui.C9
local zero = Gui.C0
local code = Gui.Code
local sub = Gui.Submit

local Comp = WS.Computer
local Screen = Comp:WaitForChild("Screen")
print(Screen.Name)
local c = '4279'
local prompt = Screen.ProximityPrompt
local active = Screen.Active
local playerS = Screen.Player
local CamPos = Comp.CamPos
print(c)




prompt.Triggered:Connect(function(player)
	print(player.Name .. " activated the prompt")
	playerS = player.Name
	active.Value = true
	prompt.Enabled = false

	if(playerS==locName) then
		player.Character.HumanoidRootPart.Anchored = true	
		player.CameraMode = Enum.CameraMode.Classic
		cam.CameraType = Enum.CameraType.Scriptable
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
		cam.CFrame = CamPos.CFrame
		
		one.Active=true
		two.Active=true
		three.Active=true
		four.Active=true
		five.Active=true
		six.Active=true
		seven.Active=true
		eight.Active=true
		nine.Active=true
		zero.Active=true
		sub.Active = true

		local humanoid = player.Character:WaitForChild("Humanoid")

		humanoid.Died:Connect(function()
			active.Value = false
			prompt.Enabled = true
			player.Character.HumanoidRootPart.Anchored = false	
			cam.CameraType = Enum.CameraType.Custom
			one.Active=false
			two.Active=false
			three.Active=false
			four.Active=false
			five.Active=false
			six.Active=false
			seven.Active=false
			eight.Active=false
			nine.Active=false
			zero.Active=false
			sub.Active = false
		end)
		
		
		UserInputService.InputBegan:Connect(function(input, isProcessed)
			if not isProcessed then 
				if input.KeyCode == Enum.KeyCode.E then
					active.Value = false
					prompt.Enabled = true
					player.Character.HumanoidRootPart.Anchored = false	
					cam.CameraType = Enum.CameraType.Custom
					one.Active=false
					two.Active=false
					three.Active=false
					four.Active=false
					five.Active=false
					six.Active=false
					seven.Active=false
					eight.Active=false
					nine.Active=false
					zero.Active=false
					sub.Active = false
				end
			end		
		end)
		
		
		
		
		
		local oneDownTime = 0
		one.MouseButton1Down:Connect(function()
			oneDownTime = tick()
		end)
		one.MouseButton1Up:Connect(function()
			local oneUpTime = tick()
			local oneduration = oneUpTime - oneDownTime
			if(oneduration<2) then
				if(math.random(0,10)<=4) then
					LC:Play()
					task.wait(1)
					AttackEvent:FireServer(player.Character)
				else
					QC:Play()
				end
			else
				QC:Play()
			end
		end)

		local twoDownTime = 0
		two.MouseButton1Down:Connect(function()
			twoDownTime = tick()
		end)
		two.MouseButton1Up:Connect(function()
			local twoUpTime = tick()
			local twoduration = twoUpTime - twoDownTime
			if(twoduration<2) then
				if(math.random(0,10)<=4) then
					LC:Play()
					task.wait(1)
					AttackEvent:FireServer(game.Players.LocalPlayer.Character)
				else
					QC:Play()
				end
			else
				QC:Play()
			end
		end)

		local threeDownTime = 0
		three.MouseButton1Down:Connect(function()
			threeDownTime = tick()
		end)
		three.MouseButton1Up:Connect(function()
			local threeUpTime = tick()
			local threeduration = threeUpTime - threeDownTime
			if(threeduration<2) then
				if(math.random(0,10)<=4) then
					LC:Play()
					task.wait(1)
					AttackEvent:FireServer(game.Players.LocalPlayer.Character)
				else
					QC:Play()
				end
			else
				QC:Play()
			end
		end)

		local fourDownTime = 0
		four.MouseButton1Down:Connect(function()
			fourDownTime = tick()
		end)
		four.MouseButton1Up:Connect(function()
			local fourUpTime = tick()
			local fourduration = fourUpTime - fourDownTime
			if(fourduration<2) then
				if(math.random(0,10)<=4) then
					LC:Play()
					task.wait(1)
					AttackEvent:FireServer(game.Players.LocalPlayer.Character)
				else
					QC:Play()
				end
			else
				QC:Play()
			end
		end)

		local fiveDownTime = 0
		five.MouseButton1Down:Connect(function()
			fiveDownTime = tick()
		end)
		five.MouseButton1Up:Connect(function()
			local fiveUpTime = tick()
			local fiveduration = fiveUpTime - fiveDownTime
			if(fiveduration<2) then
				if(math.random(0,10)<=4) then
					LC:Play()
					task.wait(1)
					AttackEvent:FireServer(game.Players.LocalPlayer.Character)
				else
					QC:Play()
				end
			else
				QC:Play()
			end
		end)

		local sixDownTime = 0
		six.MouseButton1Down:Connect(function()
			sixDownTime = tick()
		end)
		six.MouseButton1Up:Connect(function()
			local sixUpTime = tick()
			local sixduration = sixUpTime - sixDownTime
			if(sixduration<2) then
				if(math.random(0,10)<=4) then
					LC:Play()
					task.wait(1)
					AttackEvent:FireServer(game.Players.LocalPlayer.Character)
				else
					QC:Play()
				end
			else
				QC:Play()
			end
		end)

		local sevenDownTime = 0
		seven.MouseButton1Down:Connect(function()
			sevenDownTime = tick()
		end)
		seven.MouseButton1Up:Connect(function()
			local sevenUpTime = tick()
			local sevenduration = sevenUpTime - sevenDownTime
			if(sevenduration<2) then
				if(math.random(0,10)<=4) then
					LC:Play()
					task.wait(1)
					AttackEvent:FireServer(game.Players.LocalPlayer.Character)
				else
					QC:Play()
				end
			else
				QC:Play()
			end
		end)

		local eightDownTime = 0
		eight.MouseButton1Down:Connect(function()
			eightDownTime = tick()
		end)
		eight.MouseButton1Up:Connect(function()
			local eightUpTime = tick()
			local eightduration = eightUpTime - eightDownTime
			if(eightduration<2) then
				if(math.random(0,10)<=4) then
					LC:Play()
					task.wait(1)
					AttackEvent:FireServer(game.Players.LocalPlayer.Character)
				else
					QC:Play()
				end
			else
				QC:Play()
			end
		end)

		local nineDownTime = 0
		nine.MouseButton1Down:Connect(function()
			nineDownTime = tick()
		end)
		nine.MouseButton1Up:Connect(function()
			local nineUpTime = tick()
			local nineduration = nineUpTime - nineDownTime
			if(nineduration<2) then
				if(math.random(0,10)<=4) then
					LC:Play()
					task.wait(1)
					AttackEvent:FireServer(game.Players.LocalPlayer.Character)
				else
					QC:Play()
				end
			else
				QC:Play()
			end
		end)

		local zeroDownTime = 0
		zero.MouseButton1Down:Connect(function()
			zeroDownTime = tick()
		end)
		zero.MouseButton1Up:Connect(function()
			local zeroUpTime = tick()
			local zeroduration = zeroUpTime - zeroDownTime
			if(zeroduration<2) then
				if(math.random(0,10)<=4) then
					LC:Play()
					task.wait(1)
					AttackEvent:FireServer(game.Players.LocalPlayer.Character)
				else
					QC:Play()
				end
			else
				QC:Play()
			end
		end)


		
		
		
		local currentString = "____" 
		local currentText = currentString

		local function replaceWithNumber(number)
			for i = 1, #currentText do
				if currentText:sub(i, i) == "_" then
					currentText = currentText:sub(1, i - 1) .. tostring(number) .. currentText:sub(i + 1)
					code.Text=currentText 
					break
				end
			end
		end

		one.MouseButton1Click:Connect(function()
			replaceWithNumber(1)
		end)
		two.MouseButton1Click:Connect(function()
			replaceWithNumber(2)
		end)
		three.MouseButton1Click:Connect(function()
			replaceWithNumber(3)
		end)
		four.MouseButton1Click:Connect(function()
			replaceWithNumber(4)
		end)
		five.MouseButton1Click:Connect(function()
			replaceWithNumber(5)
		end)
		six.MouseButton1Click:Connect(function()
			replaceWithNumber(6)
		end)
		seven.MouseButton1Click:Connect(function()
			replaceWithNumber(7)
		end)
		eight.MouseButton1Click:Connect(function()
			replaceWithNumber(8)
		end)
		nine.MouseButton1Click:Connect(function()
			replaceWithNumber(9)
		end)
		zero.MouseButton1Click:Connect(function()
			replaceWithNumber(0)
		end)
		
		sub.MouseButton1Click:Connect(function()
		
			if (code.Text == c) then
				Gui.ElevatorStat.Text = "Elevator Status: Success"
				currentText = "____"
				code.Text = currentText
				QC:Play()
				active.Value = false
				prompt.Enabled = false
				player.Character.HumanoidRootPart.Anchored = false	
				cam.CameraType = Enum.CameraType.Custom
				one.Active=false
				two.Active=false
				three.Active=false
				four.Active=false
				five.Active=false
				six.Active=false
				seven.Active=false
				eight.Active=false
				nine.Active=false
				zero.Active=false
				sub.Active = false
				ReplicatedStorage.CodeSuccess:FireServer()
			else
				currentText = "____"
				code.Text = currentText
				LC:Play()
				AttackEvent:FireServer(player.Character)
			end
		end)

		UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if not gameProcessed then
				if input.KeyCode == Enum.KeyCode.Backspace then
					for i = #currentText, 1, -1 do
						if currentText:sub(i, i) ~= "_" then
							currentText = currentText:sub(1, i - 1) .. "_" .. currentText:sub(i + 1)
							code.Text=currentText 
							break
						end
					end
				end
			end
		end)	
	end
end)