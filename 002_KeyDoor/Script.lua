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
