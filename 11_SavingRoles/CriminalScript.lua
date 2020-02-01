script.Parent.MouseButton1Down:Connect(function()
	game.ReplicatedStorage.ChangeRole:FireServer(BrickColor.new("Bright orange"))
	script.Parent.Parent.Visible = false
end)