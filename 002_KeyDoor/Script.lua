--[[            Made by denkodin
https://www.roblox.com/users/342156146/profile
https://www.youtube.com/c/H2MinRobloxStudio
https://www.youtube.com/c/EasyQuestinRobloxStudio
]]

local InnerLocker = script.Parent.Parent.Parent.InnerLockerV
local InnerLockerP2 = script.Parent.Parent.InnerLockerP2
local InnerLockerP1 = script.Parent.Parent.InnerLockerP1

script.Parent.ClickDetector.MouseClick:Connect(function()

	if InnerLocker.Value == false then

		InnerLocker.Value = true
		script.Parent.Position = InnerLockerP2.Position

	else

		InnerLocker.Value = false
		script.Parent.Position = InnerLockerP1.Position

	end

end)
