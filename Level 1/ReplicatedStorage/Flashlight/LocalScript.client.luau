script.Parent.Equipped:Connect(function()
	
	while wait() do
		local Character = script.Parent.Parent
		local Shoulder = Character.RightUpperArm:FindFirstChild("RightShoulder", true)
		local Root = Character:WaitForChild("HumanoidRootPart")
		local CameraDirection = Root.CFrame:toObjectSpace(workspace.CurrentCamera.CFrame).lookVector.unit

		Shoulder.C0 = CFrame.new(Shoulder.C0.p) * CFrame.Angles(math.asin(CameraDirection.y), -math.asin(CameraDirection.x), 0)
	end
end)

script.Parent.Unequipped:Connect(function()
	wait(0.1)
	script.Parent.Parent.Parent.Character.RightUpperArm.RightShoulder.CurrentAngle = 0
	script.Parent.Parent.Parent.Character.RightUpperArm.RightShoulder.DesiredAngle = 0
	script.Parent.Parent.Parent.Character.RightUpperArm.RightShoulder.MaxVelocity = 0
	script.Parent.Parent.Parent.Character.RightUpperArm:FindFirstChild("RightShoulder", false)
	script.Parent.Parent.Parent.Character.RightUpperArm.RightShoulder.C0 = CFrame.new(0.78999,0.58586,0.05672)
end)
