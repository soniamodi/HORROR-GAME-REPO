local PS = game:GetService("PhysicsService")

local cG = "Model"
local oG = "Obstacles"



PS:RegisterCollisionGroup(cG)
PS:RegisterCollisionGroup(oG)

local hR = game.Workspace.Model.HumanoidRootPart
hR.CollisionGroup = cG

local floor = game.Workspace.Environ["Main Room"].Construction.Walls.Floor
floor.CollisionGroup = oG
local wall1 = game.Workspace.Environ["Main Room"].Construction.Walls["Front Wall"]
local wall2 = game.Workspace.Environ["Main Room"].Construction.Walls["Wall 1"]
local wall3 = game.Workspace.Environ["Main Room"].Construction.Walls["Wall 2"]
local wall4 = game.Workspace.Environ["Main Room"].Construction.Walls["Wall 3"]
wall1.CollisionGroup=oG
wall2.CollisionGroup=oG
wall3.CollisionGroup=oG
wall4.CollisionGroup=oG

PS:CollisionGroupSetCollidable(cG,oG,true)