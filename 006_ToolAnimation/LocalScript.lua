--[[            Made by denkodin
https://www.roblox.com/users/342156146/profile
https://www.youtube.com/c/H2MinRobloxStudio
https://www.youtube.com/c/EasyQuestinRobloxStudio
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
