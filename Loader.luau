local placeId = game.PlaceId
local baseUrl = "http://localhost:3000/getscript/"  -- Update with your public IP or domain if hosted remotely

local scriptContent = game:HttpGet(baseUrl .. tostring(placeId))
if tostring(scriptContent):find("loadstring") then
    loadstring(scriptContent)()
else
    game:GetService("Players").LocalPlayer:Kick("Join https://discord.gg/WmPbSgVb8g for support")
end