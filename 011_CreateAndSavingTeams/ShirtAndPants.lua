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

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(chr)
		if player.TeamColor == BrickColor.new("Black") then
			local Pants = chr:FindFirstChild("Pants")
			local Shirt = chr:FindFirstChild("Shirt")
			local PirateBandage = script:FindFirstChild("PirateBandage")
			if not Pants then
				Pants = Instance.new("Pants", chr)
				Pants.Name = 'Pants'
				Pants.PantsTemplate = "http://www.roblox.com/asset/?id=2103628504"
			else
				Pants.PantsTemplate = "http://www.roblox.com/asset/?id=2103628504"
			end
			if Shirt then
				Shirt:Remove()
			end
			if not chr:FindFirstChild(PirateBandage.Name) then
				local Cloned = PirateBandage:Clone()
				Cloned.Parent = chr
			end
		elseif player.TeamColor == BrickColor.new("White") then
			local Pants = chr:FindFirstChild("Pants")
			local Shirt = chr:FindFirstChild("Shirt")
			local PirateBandage = chr:FindFirstChild(script:FindFirstChild("PirateBandage").Name)
			if not Pants then
				Pants = Instance.new("Pants", chr)
				Pants.Name = 'Pants'
				Pants.PantsTemplate = "http://www.roblox.com/asset/?id=1959823692"
			else
				Pants.PantsTemplate = "http://www.roblox.com/asset/?id=1959823692"
			end
			if Shirt then
				Shirt:Remove()
			end
			if PirateBandage then
				PirateBandage:Remove()
			end
		end
		player.Changed:Connect(function()
			if player.TeamColor == BrickColor.new("Black") then
				local Pants = chr:FindFirstChild("Pants")
				local Shirt = chr:FindFirstChild("Shirt")
				local PirateBandage = script:FindFirstChild("PirateBandage")
				if not Pants then
					Pants = Instance.new("Pants", chr)
					Pants.Name = 'Pants'
					Pants.PantsTemplate = "http://www.roblox.com/asset/?id=2103628504"
				else
					Pants.PantsTemplate = "http://www.roblox.com/asset/?id=2103628504"
				end
				if Shirt then
					Shirt:Remove()
				end
				if not chr:FindFirstChild(PirateBandage.Name) then
					local Cloned = PirateBandage:Clone()
					Cloned.Parent = chr
				end
			elseif player.TeamColor == BrickColor.new("White") then
				local Pants = chr:FindFirstChild("Pants")
				local Shirt = chr:FindFirstChild("Shirt")
				local PirateBandage = chr:FindFirstChild(script:FindFirstChild("PirateBandage").Name)
				if not Pants then
					Pants = Instance.new("Pants", chr)
					Pants.Name = 'Pants'
					Pants.PantsTemplate = "http://www.roblox.com/asset/?id=1959823692"
				else
					Pants.PantsTemplate = "http://www.roblox.com/asset/?id=1959823692"
				end
				if Shirt then
					Shirt:Remove()
				end
				if PirateBandage then
					PirateBandage:Remove()
				end
			end
		end)
	end)
end)
