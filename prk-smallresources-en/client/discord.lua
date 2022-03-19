-- Script by Perek • https://linktr.ee/IamPerek --

Citizen.CreateThread(function()
	while true do
        -- This is the Application ID (replace with your own)
		SetDiscordAppId(000000000000000000)

        -- Here you will need to enter an image name for the "large" icon.
		SetDiscordRichPresenceAsset('logo_name')

        -- Here you can add location text for the "big" icon.
        SetDiscordRichPresenceAssetText('Hello')
       
        -- Here you will need to enter an image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('logo_name')

        -- Here you can add location text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('Hello')

        --[[ 
              Here you can add buttons that appear in your Discord state,
              The first parameter is the index of the button (0 or 1), the second is the name and
              the last is the url (this must start with "fivem: // connect /" or "https: //")
        ]]--
		
        SetDiscordRichPresenceAction(0, "First button!", "fivem://connect/localhost:30120")
        SetDiscordRichPresenceAction(1, "Second button!", "https://discord.com/invite/5JMzcwB2XX")

        -- It is updated every minute.
		Citizen.Wait(60000)
	end
end)