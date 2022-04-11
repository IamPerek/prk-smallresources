-- Script vytvoril Perek • https://linktr.ee/IamPerek --

checkRate = 1000 -- (1000 milisekund = 1 sekunda)

Citizen.CreateThread(function()
	while true do
		Wait(checkRate)

		TriggerServerEvent("checkMyPing")
	end
end)