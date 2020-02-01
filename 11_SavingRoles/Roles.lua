local DataStoreService = game:GetService("DataStoreService")
local PlayerRoles = DataStoreService:GetDataStore("PlayerRoles")

game.ReplicatedStorage.ChangeRole.OnServerEvent:Connect(function(Player, Team)
	Player.TeamColor = Team
end)

game.Players.PlayerAdded:Connect(function(player)
	--PlayerRoles:RemoveAsync(player.UserId)
	local Data
	local success, err = pcall(function()
		Data = PlayerRoles:GetAsync(player.UserId)
	end)
	
	if success then
		print("Data loaded!")
		if Data then
			local Team = game.Teams:FindFirstChild(Data).TeamColor
			if Team then
				player.TeamColor = Team
			end
		end
	else
		print("There was an error when getting your data")
		warn(err)
	end
end)

game.Players.PlayerRemoving:Connect(function(Player)
	local success, err = pcall(function()
		PlayerRoles:SetAsync(Player.UserId, Player.Team.Name)
	end)
	if success then
		print("Data saved!")
	else
		print("There was an error when saving your data")
		warn(err)
	end
end)