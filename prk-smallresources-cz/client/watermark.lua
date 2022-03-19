-- Script vytvoril Perek • https://linktr.ee/IamPerek --

-- Text
servername = "TEXT"

-- coords
offset = {x = 0.970, y = 0.001}

-- Default: 64, 64, 64
-- Farba
rgb = {r = 0, g = 178, b = 255}

-- Tieň
alpha = 255

-- Veľkosť textu
scale = 0.5

-- Text Font (0-5)
font = 4

-- Farebný text
bringontherainbows = false

Citizen.CreateThread(function()
	while true do
		Wait(1)

		if bringontherainbows then
			rgb = RGBRainbow(1)
		end
		SetTextColour(rgb.r, rgb.g, rgb.b, alpha)

		SetTextFont(font)
		SetTextScale(scale, scale)
		SetTextWrap(0.0, 1.0)
		SetTextCentre(false)
		SetTextDropshadow(2, 2, 0, 0, 0)
		SetTextEdge(1, 0, 0, 0, 205)
		SetTextEntry("STRING")
		AddTextComponentString(servername)
		DrawText(offset.x, offset.y)
	end
end)

function RGBRainbow(frequency)
    local result = {}
    local curtime = GetGameTimer() / 1000

    result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

    return result
end