-- Script vytvoril Perek • https://linktr.ee/IamPerek --

Citizen.CreateThread(function()
    Holograms()
end)

function Holograms()
		while true do
			Citizen.Wait(0)			
				-- Hologram 1
		if GetDistanceBetweenCoords( -1082.29, -259.73, 37.79, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1082.35, -254.7, 37.76  -1.400, "Vítej na RolePlay serveru!", 4, 0.1, 0.1)
			Draw3DText( -1082.35, -254.7, 37.76  -1.600, "discord.gg/", 4, 0.1, 0.1)
			Draw3DText( -1086.72, -257.2, 37.76  -1.800, "Preji ti hezkou zábavu na serveru :)", 4, 0.1, 0.1)		
		end		
				--Hologram 2
		--[[if GetDistanceBetweenCoords( -419.50, 1166.00, 326.00, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -419.50, 1166.00, 326.00  -1.400, "Ahoj", 4, 0.1, 0.1)
			Draw3DText( -419.50, 1166.00, 326.00  -1.600, "Ahoj", 4, 0.1, 0.1)
			Draw3DText( -419.50, 1166.00, 326.00  -1.800, "Ahoj", 4, 0.1, 0.1)		
		end--]]
	end
end

-------------------------------------------------------------------------------------------------------------------------

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
         local px,py,pz=table.unpack(GetGameplayCamCoords())
         local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
         local scale = (1/dist)*20
         local fov = (1/GetGameplayCamFov())*100
         local scale = scale*fov   
         SetTextScale(scaleX*scale, scaleY*scale)
         SetTextFont(fontId)
         SetTextProportional(1)
         SetTextColour(57, 153, 255, 255) -- Zde můžete změnit barvu textu
         SetTextDropshadow(1, 1, 1, 1, 255)
         SetTextEdge(2, 0, 0, 0, 150)
         SetTextDropShadow()
         SetTextOutline()
         SetTextEntry("STRING")
         SetTextCentre(1)
         AddTextComponentString(textInput)
         SetDrawOrigin(x,y,z+2, 0)
         DrawText(0.0, 0.0)
         ClearDrawOrigin()
        end