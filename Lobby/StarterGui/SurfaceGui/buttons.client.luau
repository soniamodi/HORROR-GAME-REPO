local gui = script.Parent

local TV = gui:WaitForChild("TV")

local contents = TV:WaitForChild("Contents")

local Settings = contents:WaitForChild("Settings")
local Lobby = contents:WaitForChild("Lobby")
local Credits = contents:WaitForChild("Credits")

local Selection = TV:WaitForChild("Selection")

local PB = Selection:WaitForChild("Play")
local CB = Selection:WaitForChild("Credits")
local SB = Selection:WaitForChild("Settings")

local PBa = PB:WaitForChild("Active")
local CBa = CB:WaitForChild("Active")
local SBa = SB:WaitForChild("Active")

PB.MouseButton1Click:Connect(function()
	PBa.Value = true
	CBa.Value = false
	SBa.Value = false
	Lobby.Visible = true
	Credits.Visible = false
	Settings.Visible = false
end)
CB.MouseButton1Click:Connect(function()
	PBa.Value = false
	CBa.Value = true
	SBa.Value = false
	Lobby.Visible = false
	Credits.Visible = true
	Settings.Visible = false
end)
SB.MouseButton1Click:Connect(function()
	PBa.Value = false
	CBa.Value = false
	SBa.Value = true
	Lobby.Visible = false
	Credits.Visible = false
	Settings.Visible = true
end)