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
