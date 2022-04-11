-- Script vytvoril Perek • https://linktr.ee/IamPerek --

-- Ping Limit
pingLimit = 600

RegisterServerEvent("checkMyPing")
AddEventHandler("checkMyPing", function()
	ping = GetPlayerPing(source)
	if ping >= pingLimit then
		DropPlayer(source, "Tvůj ping je příliš vysoký (Limit: " .. pingLimit .. " Tvoj Ping: " .. ping .. ")")
	end
end)