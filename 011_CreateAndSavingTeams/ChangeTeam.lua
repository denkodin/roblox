local ReplicatedStorage = game.ReplicatedStorage
local ChangeTeamEvent = ReplicatedStorage:WaitForChild("ChangeTeamEvent")

ChangeTeamEvent.OnServerEvent:Connect(function(player, team)
	if player and team then
		player.TeamColor = team
	end
end)