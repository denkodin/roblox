--[[                 Made by denkodin
YouTube channels:
https://www.youtube.com/c/H2MinRobloxStudio
http://www.youtube.com/c/EasyQuestinRobloxStudio

                      License to use

What is allowed?
You are allowed to use these scripts and this model in your
games without restrictions, including monetize games.

What is forbidden?
It is forbidden to sell and distribute in any way these
scripts and this model.
Also you may not distribute the model incorporated in
a derivative model (for instance, you may not made a modified
version of it and sell it or distribute it).
And you may not claim you are the creator or copyright holder
of this model or these scripts.
It is forbidden to remove this comment from the scripts.
]]

local opened = false
local moving = false
local Loops = 100
local DoorName = 'Door'
local Button = script.Parent:FindFirstChild("Button")
local Doors = {}

function OpenDoor(Door, Loop)
	local door = Door.door
	local pos = Door.pos
	local size = Door.size
	local height = size.Y - (size.Y - 0.05) * Loop / Loops
	door.Size = Vector3.new(size.X, height, size.Z)
	door.CFrame = CFrame.new(pos) + door.CFrame.UpVector * (size.Y - height) / 2
end

function CloseDoor(Door, Loop)
	local door = Door.door
	local pos = Door.pos
	local size = Door.size
	local height = (size.Y - 0.05) * Loop / Loops
	door.Size = Vector3.new(size.X, height, size.Z)
	door.CFrame = CFrame.new(pos) + door.CFrame.UpVector * (size.Y - height) /  2
end

function OpenDoors(Doors)
	moving = true
	for i = 1, Loops do
		for n, v in pairs(Doors) do
			OpenDoor(v, i)
		end
		wait()
	end
	opened = true
	moving = false
end

function CloseDoors(Doors)
	moving = true
	for i = 1, Loops do
		for n, v in pairs(Doors) do
			CloseDoor(v, i)
		end
		wait()
	end
	opened = false
	moving = false
end

function InitDoors(Doors)
	local childs = script.Parent:GetChildren()
	for i, v in pairs(childs) do
		if v:IsA("BasePart") and v.Name == DoorName then
			Doors[table.getn(Doors) + 1] = {door = v, pos = v.Position, size = v.Size}
		end
	end
	--[[print(table.getn(Doors))
	for i, v in pairs(Doors) do
		print(v)
	end--]]
end

if Button and Button:FindFirstChild("ClickDetector") then
	InitDoors(Doors)
	Button.ClickDetector.MouseClick:Connect(function()
		if moving == false then
			if opened == false then
				OpenDoors(Doors)
			else
				CloseDoors(Doors)
			end
		end
	end)
end
