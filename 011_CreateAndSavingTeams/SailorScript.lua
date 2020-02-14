local Player = game.Players.LocalPlayer
local ChangeTeamButton = script.Parent.Parent.Parent.ChangeTeam
local ReplicatedStorage = game.ReplicatedStorage
local ChangeTeamEvent = ReplicatedStorage:WaitForChild("ChangeTeamEvent")

if Player.TeamColor == BrickColor.new("Medium stone grey") then
	ChangeTeamButton.Visible = false
	script.Parent.Parent.Visible = true
end

script.Parent.MouseButton1Down:Connect(function()
	ChangeTeamEvent:FireServer(BrickColor.new("White"))
	script.Parent.Parent.Visible = false
	if ChangeTeamButton.Visible == false then
		ChangeTeamButton.Visible = true
	end
end)