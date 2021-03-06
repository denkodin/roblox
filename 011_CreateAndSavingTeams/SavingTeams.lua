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
