local placeId = game.PlaceId
print(_G.YourKey)

if _G.YourKey == "1234567890" then

if placeId == 110829983956014 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ObbedHub/ObbedHubPub/refs/heads/main/Games/110829983956014.luau"))()
else
    game:GetService("Players").LocalPlayer:Kick("Join https://discord.gg/WmPbSgVb8g for support")
end
else
    game:GetService("Players").LocalPlayer:Kick("Join https://discord.gg/WmPbSgVb8g for support")
end
