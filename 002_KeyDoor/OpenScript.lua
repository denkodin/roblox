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

local InnerLocker = script.Parent.InnerLockerV
local Opened = script.Parent.Opened
local DoorId = script.Parent.Id
local PrimaryPart = script.Parent.PrimaryPart
local OpenDuration = 3

script.Parent.Door.Touched:Connect(function(hit)

	if hit.Parent.Name == 'Key' and hit.Parent:FindFirstChild("Id") and hit.Parent.Id:IsA("NumberValue") and hit.Parent.Id.Value == DoorId.Value then

		if InnerLocker.Value == false then

			if Opened.Value == false then

				Opened.Value = true

				for i = 1, 21 do

					script.Parent:SetPrimaryPartCFrame(PrimaryPart.CFrame * CFrame.Angles(0, math.rad(5), 0))
					wait()

				end

				wait(OpenDuration)

				for i = 1, 21 do

					script.Parent:SetPrimaryPartCFrame(PrimaryPart.CFrame * CFrame.Angles(0, math.rad(-5), 0))
					wait()

				end

				Opened.Value = false

			end

		end

	end

end)

script.Parent.I_E.Touched:Connect(function(hit)

	if hit.Parent:FindFirstChild("Humanoid") and hit.Name == "HumanoidRootPart" then

		if InnerLocker.Value == false then

			if Opened.Value == false then

				Opened.Value = true

				for i = 1, 21 do

					script.Parent:SetPrimaryPartCFrame(PrimaryPart.CFrame * CFrame.Angles(0, math.rad(5), 0))
					wait()

				end

				wait(OpenDuration)

				for i = 1, 21 do

					script.Parent:SetPrimaryPartCFrame(PrimaryPart.CFrame * CFrame.Angles(0, math.rad(-5), 0))
					wait()

				end

				Opened.Value = false

			end

		end

	end

end)
