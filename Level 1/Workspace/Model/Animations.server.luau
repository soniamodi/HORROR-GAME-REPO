local anims = script.Anims
local walk = anims:WaitForChild("Walk")
local rig = script.Parent

while task.wait(1) do
	local w = rig.Humanoid.Animator:LoadAnimation(walk)
	w:Play()
end