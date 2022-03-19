-- Script vytvoril Perek • https://linktr.ee/IamPerek --

local activeAfk = {}
local closeAfk = {}

Citizen.CreateThread(function()
    TriggerServerEvent('afk:Afkujem')
end)

RegisterNetEvent('afk:Neplac')
AddEventHandler('afk:Neplac', function(data)
    activeAfk = data
    startMainThread()
end)

RegisterNetEvent('afk:cringe')
AddEventHandler('afk:cringe', function(action, data)
    if action == 'remove' then
        activeAfk[data.sId] = nil
        if closeAfk[data.sId] then
            closeAfk[data.sId] = nil
        end
    elseif action == 'add' then
        activeAfk[data.sId] = data.text
    end
end)

RegisterNetEvent('afk:LeboMedved')
AddEventHandler('afk:LeboMedved', function(bool)
    local playerPed = PlayerPedId()
    SetEntityAlpha(playerPed, bool and 190 or 255, false)
    FreezeEntityPosition(playerPed, bool)
    NetworkSetPlayerIsPassive(bool)
end)

function startMainThread()
    Citizen.CreateThread(function()
        while true do
            local myCoords = GetEntityCoords(PlayerPedId())
            for sId, v in pairs(activeAfk) do
                local cId = GetPlayerFromServerId(sId)
                if cId ~= -1 then
                    local cPed = GetPlayerPed(cId)
                    local cCoords = GetEntityCoords(cPed)
                    local dist = #(myCoords - cCoords)
                    if dist < 15.0 and closeAfk[sId] == nil then
                        closeAfk[sId] = {ped = cPed, text = v}
                    elseif dist > 15.0 and closeAfk[sId] then
                        closeAfk[sId] = nil
                    end
                end
            end
            Citizen.Wait(1000)
        end
    end)

    Citizen.CreateThread(function()
        local sleep = 1000
        while true do 
            if next(closeAfk) ~= nil then
                sleep = 0
                for k, v in pairs(closeAfk) do
                    drawText(GetEntityCoords(v.ped), v.text)
                end
            else
                sleep = 1000
            end
            Citizen.Wait(sleep)
        end
    end)
end

function drawText(coords, text)
	local camCoords = GetGameplayCamCoords()
	local distance = #(coords - camCoords)

    local font = 0
    local size = 1
	local scale = (size / distance) * 2
	local fov = (1 / GetGameplayCamFov()) * 100
	scale = scale * fov

	SetTextScale(0.0 * scale, 0.55 * scale)
	SetTextFont(font)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)

	SetDrawOrigin(vector3(coords.x, coords.y, coords.z + 1.0), 0)
	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.0, 0.0)
	ClearDrawOrigin()
end