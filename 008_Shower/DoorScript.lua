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
