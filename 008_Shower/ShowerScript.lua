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

local Cooldown = 3
local CurrentPlayer = nil
local CallbackHandler = nil
local CName = 'BedCooldown'
local Water = script.Parent.Parent.Shower.Water
local Sound = script.Parent.Parent.Shower.ShowerRunning
local Animation = script.Parent.Animation
local loadedanim = nil

function LeaveShower()
	if CurrentPlayer ~= nil and script.Parent:FindFirstChild("WeldConstraint") then
		if loadedanim ~= nil then
			loadedanim:Stop()
		end
		Sound:Stop()
		Water.Enabled = false
		local C = Instance.new("StringValue", CurrentPlayer)
		C.Name = CName
		game.Debris:AddItem(C, Cooldown)
		script.Parent.WeldConstraint:Remove()
		if CallbackHandler ~= nil then
			CallbackHandler:disconnect()
			CallbackHandler = nil
		end
		CurrentPlayer.Humanoid.PlatformStand = false
		CurrentPlayer.HumanoidRootPart.CFrame = script.Parent.CFrame * CFrame.Angles(0, math.rad(90), 0)
		CurrentPlayer.HumanoidRootPart.Anchored = true
		wait()
		CurrentPlayer.HumanoidRootPart.Anchored = false
		CurrentPlayer = nil
	end
end

function Shower(character)
	if character ~= nil and not script.Parent:FindFirstChild("WeldConstraint") then
		loadedanim = character.Humanoid:LoadAnimation(Animation)
		loadedanim:Play()
		Water.Enabled = true
		Sound:Play()
		CurrentPlayer = character
		CurrentPlayer.HumanoidRootPart.CFrame = (script.Parent.CFrame + script.Parent.CFrame.RightVector * 0.75) * CFrame.Angles(0, math.rad(90), 0) - Vector3.new(0, script.Parent.Size.Y / 2 - (CurrentPlayer.HumanoidRootPart.Size.Y + CurrentPlayer.HumanoidRootPart.Size.Y / 2), 0)
		CurrentPlayer.Humanoid.PlatformStand = true
		local Weld = Instance.new("WeldConstraint", script.Parent)
		Weld.Part0 = script.Parent
		Weld.Part1 = character.HumanoidRootPart
		CallbackHandler = CurrentPlayer.Humanoid.Changed:Connect(function(property)
			if CurrentPlayer ~= nil and property == 'Jump' then
				LeaveShower()
			end
		end)
	end
end

script.Parent.Touched:Connect(function(hit)
	local Character = hit.Parent
	if Character:FindFirstChild("Humanoid") and CurrentPlayer == nil and not Character:FindFirstChild(CName) and hit.Name == 'HumanoidRootPart' then
		Shower(Character)
	end
end)
