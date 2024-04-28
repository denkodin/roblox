--[[            Made by denkodin
https://www.roblox.com/users/342156146/profile
https://www.youtube.com/c/H2MinRobloxStudio
https://www.youtube.com/c/EasyQuestinRobloxStudio
]]

local ReplicatedStorage = game.ReplicatedStorage
local ChangeTeamEvent = ReplicatedStorage:WaitForChild("ChangeTeamEvent")

ChangeTeamEvent.OnServerEvent:Connect(function(player, team)
	if player and team then
		player.TeamColor = team
	end
end)
