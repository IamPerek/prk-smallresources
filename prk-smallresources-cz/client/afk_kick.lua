-- Script vytvoril Perek • https://linktr.ee/IamPerek --

-- Časový limit AFK (v sekundách)
secondsUntilKick = 1200 -- (1200 sekund = 20 minut)

-- Upozorněte hráče, když vyprší 3/4 časového limitu
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
						TriggerEvent("chatMessage", "WARNING", {255, 0, 0}, "^1Budeš kicknuti za " .. time .. " sekund za to, že jsi AFK!")
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