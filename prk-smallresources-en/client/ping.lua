-- Script by Perek • https://linktr.ee/IamPerek --

checkRate = 1000 -- (1000 milliseconds = 1 second)

Citizen.CreateThread(function()
	while true do
		Wait(checkRate)

		TriggerServerEvent("checkMyPing")
	end
end)