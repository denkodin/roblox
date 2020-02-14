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