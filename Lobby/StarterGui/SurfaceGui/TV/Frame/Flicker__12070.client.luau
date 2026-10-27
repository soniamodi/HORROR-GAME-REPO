local frame = script.Parent

while true do
	frame.Position = UDim2.new(math.random(0,100)/100, 0, 0, 0)
	task.wait(0.1)
end