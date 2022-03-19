-- Script by Perek • https://linktr.ee/IamPerek --

-- AFK Kick Time Limit (in seconds)
secondsUntilKick = 1200 -- (1200 seconds = 20 minutes)

-- Notify players when 3/4 of the time limit expires
kickWarning = true

Citizen.CreateThread(function()
	while true do
		Wait(1000)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
					if kickWarning and time == math.ceil(secondsUntilKick / 4) then
						TriggerEvent("chatMessage", "WARNING", {255, 0, 0}, "^1You will be kicked in" .. time .. " seconds for being AFK!")
					end

					time = time - 1
				else
					TriggerServerEvent("DostalSiKickLeboSiBolDlhoAFK")
				end
			else
				time = secondsUntilKick
			end

			prevPos = currentPos
		end
	end
end)