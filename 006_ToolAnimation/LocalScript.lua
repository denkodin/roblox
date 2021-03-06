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

local knife = script.Parent
local id = 'rbxassetid://04501649960'

knife.Activated:Connect(function()
	if script.Parent.Parent:FindFirstChild("Humanoid") then
		local anim = Instance.new("Animation")
		anim.AnimationId = id
		local loadedanim = script.Parent.Parent.Humanoid:LoadAnimation(anim)
		loadedanim:Play()
		local PlayingAnimationTracks = script.Parent.Parent.Humanoid:GetPlayingAnimationTracks()
		for i, v in pairs(PlayingAnimationTracks) do
			if v.Name == 'ToolNoneAnim' then
				v:Stop()
				repeat wait() until loadedanim.IsPlaying == false
				v:Play()
			end
		end
	end
end)
