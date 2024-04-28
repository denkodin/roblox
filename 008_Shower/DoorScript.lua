--[[            Made by denkodin
https://www.roblox.com/users/342156146/profile
https://www.youtube.com/c/H2MinRobloxStudio
https://www.youtube.com/c/EasyQuestinRobloxStudio
]]

local Servo = script.Parent.Door.Servo
local Detector = script.Parent.Detector
local OpenTime = 3
local Opened = false

Servo.ActuatorType = Enum.ActuatorType.Servo
Servo.ServoMaxForce = math.huge
Servo.TargetPosition = 4
Servo.Speed = 4

function OpenDoor()
	Servo.TargetPosition = 0
end

function CloseDoor()
	Servo.TargetPosition = 4
end

Detector.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		if Opened == false then
			Opened = true
			OpenDoor()
			wait(OpenTime)
			Opened = false
			CloseDoor()
		end
	end
end)
