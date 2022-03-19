-- Script by Perek • https://linktr.ee/IamPerek --

RegisterServerEvent("DostalSiKickLeboSiBolDlhoAFK")
AddEventHandler("DostalSiKickLeboSiBolDlhoAFK", function()
	DropPlayer(source, "You've been AFK too long.")
end)