-- Script by Perek • https://linktr.ee/IamPerek --

local adminHex = {
    'steam:000000000000000',
}
local afkPlayers = {}

RegisterNetEvent('afk:Afkujem')
AddEventHandler('afk:Afkujem', function()
    TriggerClientEvent('afk:Neplac', source, afkPlayers)
end)

RegisterCommand('afk', function(src, args)
    local argument = table.concat(args, " ", 1, #args) 
    if argument == '' then
        if afkPlayers[src] then
            afkPlayers[src] = nil
            TriggerClientEvent('afk:LeboMedved', src, false)
            TriggerClientEvent('afk:cringe', -1, 'remove', {sId = src})
        end
        return 
    end

    if args[1] ~= '' then
        if argument then
            afkPlayers[src] = argument

            local time = os.date("*t")
            TriggerClientEvent('afk:LeboMedved', src, true)
            TriggerClientEvent('afk:cringe', -1, 'add', {sId = src, text = '~b~Im AFK~w~\n~b~Since:~w~ '..time.hour..':'..time.min..'\n~b~Reason:~w~ '..argument})
        end
    end
end)

RegisterCommand('afkid', function(src, args)
    local plyId = tonumber(args[1])
    local argument = table.concat(args, " ", 2, #args)

    if not isAdmin(src) then return end

    if plyId == nil or GetPlayerPing(plyId) == 0 then
        return 
    end

    if argument == '' then
        if afkPlayers[plyId] then
            afkPlayers[plyId] = nil
            TriggerClientEvent('afk:LeboMedved', plyId, false)
            TriggerClientEvent('afk:cringe', -1, 'remove', {sId = plyId})
        end
        return 
    end

    if args[1] ~= '' then
        if argument then
            afkPlayers[plyId] = argument

            local time = os.date("*t")
            TriggerClientEvent('afk:LeboMedved', plyId, true)
            TriggerClientEvent('afk:cringe', -1, 'add', {sId = plyId, text = '~b~Im AFK~w~\n~b~Since:~w~ '..time.hour..':'..time.min..'\n~b~Reason:~w~ '..argument})
        end
    end
end, false)

function isAdmin(src)
    local srcSteam = GetPlayerIdentifiers(src)[1]
    local result = false
    for k, v in pairs(adminHex) do
        if v == srcSteam then
            result = true
            break
        end
    end
    return result
end