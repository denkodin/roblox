script.Parent.MouseButton1Down:Connect(function()
	game.ReplicatedStorage.ChangeRole:FireServer(BrickColor.new("Bright blue"))
	script.Parent.Parent.Visible = false
end)