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
