--[[            Made by denkodin
https://www.roblox.com/users/342156146/profile
https://www.youtube.com/c/H2MinRobloxStudio
https://www.youtube.com/c/EasyQuestinRobloxStudio
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
