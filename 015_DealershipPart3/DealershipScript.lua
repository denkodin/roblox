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

local ShopCars = game.ServerStorage:WaitForChild("ShopCars")
local PurchaseEvent = game.ReplicatedStorage:WaitForChild("PurchaseCar")
local PurchaseFailedEvent = game.ReplicatedStorage:WaitForChild("PurchaseCarFailed")
local AddCarEvent = game.ReplicatedStorage:WaitForChild("AddCar")
local GetCarParamsFunc = game.ReplicatedStorage:WaitForChild("GetCarParams")
local ServerPurchasedCars = game.ServerStorage:WaitForChild("PurchasedCars")

function AddCar(Cost, Cash, PurchasedCars, car, player, carname)
	if Cost and Cash.Value >= Cost.Value and not PurchasedCars:FindFirstChild(carname) then
		local ClonedCar = car:Clone()
		ClonedCar.Parent = PurchasedCars
		Cash.Value = Cash.Value - Cost.Value
		AddCarEvent:FireClient(player, carname)
	elseif Cost and Cash.Value < Cost.Value and not PurchasedCars:FindFirstChild(carname) then
		PurchaseFailedEvent:FireClient(player, Color3.fromRGB(255, 0, 0), "You don't have enough money")
	elseif PurchasedCars:FindFirstChild(carname) then
		PurchaseFailedEvent:FireClient(player, Color3.fromRGB(255, 0, 0), "You already have this car")
	end
end

PurchaseEvent.OnServerEvent:Connect(function(player, carname)
	local leaderstats = player:FindFirstChild("leaderstats")
	local PurchasedCars = ServerPurchasedCars:FindFirstChild(player.Name)
	if leaderstats and PurchasedCars then
		local car = ShopCars:FindFirstChild(carname)
		if car then
			local Cash = leaderstats:FindFirstChild("$")
			local Cost = car:FindFirstChild("Cost")
			AddCar(Cost, Cash, PurchasedCars, car, player, carname)
		end
	end
end)

function comma_value(n)
	local left, num, right = string.match(n, '^([^%d]*%d)(%d*)(.-)$')
	return left .. (num:reverse():gsub('(%d%d%d)', '%1 '):reverse()) .. right
end

function GetCarParams(player, carname)
	local Result = {}
	Result.Name = "No name"
	Result.Cost = "No price"
	Result.Power = "--"
	local Car = ShopCars:FindFirstChild(carname)

	if Car then
		local CarName = Car:FindFirstChild("CarName")
		if CarName then
			Result.Name = CarName.Value
		end
		local Cost = Car:FindFirstChild("Cost")
		if Cost then
			Result.Cost = Cost.Value > 0 and '$' .. comma_value(Cost.Value) or 'Free'
		end
		local Power = Car:FindFirstChild("Power")
		if Power then
			Result.Power = Power.Value
		end
	end
	return Result
end

GetCarParamsFunc.OnServerInvoke = GetCarParams
