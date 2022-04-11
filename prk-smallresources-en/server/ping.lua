-- Script by Perek • https://linktr.ee/IamPerek --

-- Ping Limit
pingLimit = 600

RegisterServerEvent("checkMyPing")
AddEventHandler("checkMyPing", function()
	ping = GetPlayerPing(source)
	if ping >= pingLimit then
		DropPlayer(source, "Your ping is too high (Limit: " .. pingLimit .. " Your Ping: " .. ping .. ")")
	end
end)