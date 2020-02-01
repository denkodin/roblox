local Drop = script.Parent.Drop

function MakeBlock()
	local Block = Instance.new("Part", game.Workspace)
	Block.CFrame = Drop.CFrame
	Block.Size = Vector3.new(2, 1, 2)
	Block.Material = Enum.Material.Concrete
	Block.BrickColor = BrickColor.new("White")
	game.Debris:AddItem(Block, 15)
end

while true do
	wait(2)
	MakeBlock()
end