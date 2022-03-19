-- Script vytvoril Perek • https://linktr.ee/IamPerek --

Citizen.CreateThread(function()
	while true do
        -- Toto je Application ID (nahraďte svým vlastním)
		SetDiscordAppId(000000000000000000)

        -- Zde budete muset zadat název obrázku pro "velkou" ikonu.
		SetDiscordRichPresenceAsset('logo_name')

        -- Zde můžete přidat text umístění pro „velkou“ ikonu.
        SetDiscordRichPresenceAssetText('Ahoj')
       
        -- Zde budete muset zadat název obrázku pro "malou" ikonu.
        SetDiscordRichPresenceAssetSmall('logo_name')

        -- Zde můžete přidat text umístění pro „malou“ ikonu.
        SetDiscordRichPresenceAssetSmallText('Hello')

        --[[ 
            Zde můžete přidat tlačítka, která se objeví ve vašem stavu Discord,
            Prvním parametrem je index tlačítka (0 nebo 1), druhým je název a
            poslední je adresa URL (musí začínat "fivem: // connect /" nebo "https: //")
        --]]
		
        SetDiscordRichPresenceAction(0, "První tlačítko!", "fivem://connect/localhost:30120")
        SetDiscordRichPresenceAction(1, "Druhé tlačítko!", "https://discord.com/invite/5JMzcwB2XX")

        -- Aktualizuje se každou minutu.
		Citizen.Wait(60000)
	end
end)