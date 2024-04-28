--[[            Made by denkodin
https://www.roblox.com/users/342156146/profile
https://www.youtube.com/c/H2MinRobloxStudio
https://www.youtube.com/c/EasyQuestinRobloxStudio
]]

local DataStoreService = game:GetService("DataStoreService")
local PlayerTeams = DataStoreService:GetDataStore("PlayerTeams")

function LoadData(Player)
	local Data = nil
	local success, err = pcall(function()
		Data = PlayerTeams:GetAsync(Player.UserId)
	end)
	if success then
		print("Data loaded!")
		if Data then
			if game.Teams:FindFirstChild(Data) and game.Teams:FindFirstChild(Data):IsA("Team") then
				Player.TeamColor = game.Teams:FindFirstChild(Data).TeamColor
			else
				print("Team not found")
			end
		else
			print("Data not found")
		end
	else
		print("There was an error while getting a data of player" .. Player.Name)
		warn(err)
	end
end

function SaveData(Player)
	local success, err = pcall(function()
		PlayerTeams:SetAsync(Player.UserId, Player.Team.Name)
	end)
	if success then
		print("Data saved!")
	else
		print("There was an error while saving a data of player " .. Player.Name)
		warn(err)
	end
end

game.Players.PlayerAdded:Connect(LoadData)
game.Players.PlayerRemoving:Connect(SaveData)
