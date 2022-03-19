-- Script vytvoril Perek • https://linktr.ee/IamPerek --

RegisterServerEvent("DostalSiKickLeboSiBolDlhoAFK")
AddEventHandler("DostalSiKickLeboSiBolDlhoAFK", function()
	DropPlayer(source, "Byl jsi AFK příliš dlouho.")
end)