local Cooldown = 3
local CurrentPlayer = nil
local CallbackHandler = nil
local CName = 'BedCooldown'
local Creak = script.Parent.Creak
local Animation = script.Parent.Animation
local loadedanim = nil

function StandupFromBed()
	if CurrentPlayer ~= nil and script.Parent:FindFirstChild("WeldConstraint") then
		if loadedanim ~= nil then
			loadedanim:Stop()
			loadedanim = nil
		end
		local C = Instance.new("StringValue", CurrentPlayer)
		C.Name = CName
		game.Debris:AddItem(C, Cooldown)
		script.Parent.WeldConstraint:Remove()
		if CallbackHandler ~= nil then
			CallbackHandler:disconnect()
			CallbackHandler = nil
		end
		CurrentPlayer.Humanoid.PlatformStand = false
		CurrentPlayer.HumanoidRootPart.CFrame = script.Parent.CFrame * CFrame.Angles(0, math.rad(180), 0) + Vector3.new(0, 5, 0)
		CurrentPlayer.HumanoidRootPart.Anchored = true
		wait()
		CurrentPlayer.HumanoidRootPart.Anchored = false
		CurrentPlayer = nil
	end
end

function OnRotate()
	Creak:Play()
end

function LayToBed(character)
	if character ~= nil and not script.Parent:FindFirstChild("WeldConstraint") then
		if character:FindFirstChild("Humanoid") then
			loadedanim = character.Humanoid:LoadAnimation(Animation)
			loadedanim:Play()
		end
		if loadedanim ~= nil then
			loadedanim:GetMarkerReachedSignal("creak"):Connect(OnRotate)
		end
		CurrentPlayer = character
		CurrentPlayer.HumanoidRootPart.CFrame = script.Parent.CFrame * CFrame.Angles(math.rad(90), 0, math.rad(-90))
		CurrentPlayer.Humanoid.PlatformStand = true
		local Weld = Instance.new("WeldConstraint", script.Parent)
		Weld.Part0 = script.Parent
		Weld.Part1 = character.HumanoidRootPart
		CallbackHandler = CurrentPlayer.Humanoid.Changed:Connect(function(property)
			if CurrentPlayer ~= nil and property == 'Jump' then
				StandupFromBed()
			end
		end)
	end
end

script.Parent.Touched:Connect(function(hit)
	local Character = hit.Parent
	if Character:FindFirstChild("Humanoid") and CurrentPlayer == nil and not Character:FindFirstChild(CName) then
		LayToBed(Character)
	end
end)