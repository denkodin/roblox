local PrimaryPart = script.Parent.PrimaryPart
local Handle1 = script.Parent.Handle1
local Handle2 = script.Parent.Handle2
local Opened = false

Handle1.ClickDetector.MouseClick:Connect(function()
	
	if Opened == false then
		
		Opened = true
		for i = 1, 18 do
			
			script.Parent:SetPrimaryPartCFrame(PrimaryPart.CFrame * CFrame.Angles(0, math.rad(5), 0))
			wait()
			
		end
		
	else
		
		Opened = false
		for i = 1, 18 do
			
			script.Parent:SetPrimaryPartCFrame(PrimaryPart.CFrame * CFrame.Angles(0, math.rad(-5), 0))
			wait()
			
		end
		
	end
	
end)

Handle2.ClickDetector.MouseClick:Connect(function()
	
	if Opened == false then
		
		Opened = true
		for i = 1, 18 do
			
			script.Parent:SetPrimaryPartCFrame(PrimaryPart.CFrame * CFrame.Angles(0, math.rad(5), 0))
			wait()
			
		end
		
	else
		
		Opened = false
		for i = 1, 18 do
			
			script.Parent:SetPrimaryPartCFrame(PrimaryPart.CFrame * CFrame.Angles(0, math.rad(-5), 0))
			wait()
			
		end
		
	end
	
end)