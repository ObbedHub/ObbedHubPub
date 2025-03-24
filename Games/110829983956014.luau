local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/drillygzzly/Roblox-UI-Libs/main/1%20Tokyo%20Lib%20(FIXED)/Tokyo%20Lib%20Source.lua"))({
    cheatname = "Obbed Hub",
    gamename = "Obbed Hub",
})

local autoPickup = false

local function pickupDrops()
    local drops_folder = workspace.Folder
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    for _, v in pairs(drops_folder:GetChildren()) do
        if v:IsA("Model") and v.PrimaryPart then
            character.HumanoidRootPart.CFrame = v.PrimaryPart.CFrame + Vector3.new(0, 10, 0)
            task.wait(0.5)
        end
    end
end



library:init()

local Window = library.NewWindow({
    title = "Obbed Hub",
    size = UDim2.new(0, 510, 0.6, 6)
})

local MainTab = Window:AddTab("Main")
local SettingsTab = library:CreateSettingsTab(Window)

local MainSection = MainTab:AddSection("Welcome", 1)

local enemy_list = {
    "biscuit_warrior", "candy_master", "genie_commander", "juice_queen",
    "mochi_emperor", "soul_queen", "awakened_dark_avenger", "awakened_promised_child",
    "bijuu_beast", "copy_ninja", "six_paths_of_pain", "unstoppable_fist",
    "awakened_earth_strongest", "awakened_galactic_tyrant", "awakened_prideful_prince",
    "body_switcher", "namekian_sage", "ultimate_warrior", "awakened_shadow_summoner",
    "cursed_doll", "cursed_fist", "king_of_curses", "limitless_master",
    "rika_blessing", "armored_giant", "beast_giant", "blade_captain",
    "blade_warrior", "combat_giant", "survey_commander", "awakened_frost_demon",
    "awakened_pale_demon_lord", "awakened_six_eyed_slayer", "childish_demon",
    "compass_demon", "thunder_demon"
}

local boss_list = {
    "bijuu_beast", "awakened_galactic_tyrant", "king_of_curses",
    "combat_giant", "awakened_pale_demon_lord", "soul_queen"
}

-- Removed old single-selection variables; using multi-selection below
 

local function startBattle(enemy)
    game:GetService("ReplicatedStorage"):FindFirstChild("55B"):FindFirstChild("df1a6590-a5e4-4d5d-abf3-e0e99123548b"):FireServer(enemy)
end

MainSection:AddToggle({
    text = "Auto Pickup",
    state = false,
    callback = function(v)
        autoPickup = v
        while autoPickup do
            if #workspace.Folder:GetChildren() > 0 then
                pickupDrops()
            end
            task.wait(1)
        end
    end
})
local autoEnemy = false
local selectedEnemies = {}

MainSection:AddToggle({
    text = "Auto Enemy Battle",
    state = false,
    callback = function(v)
        autoEnemy = v
        while autoEnemy do
            for _, enemy in ipairs(selectedEnemies) do
                startBattle(enemy)
                task.wait(0.2)
            end
        end
    end
})

MainSection:AddList({
    text = "Select Enemies",
    values = enemy_list,
    selected = selectedEnemies,
    multi = true,
    callback = function(v)
        selectedEnemies = v
    end
})

local autoBoss = false
local selectedBosses = {}

MainSection:AddToggle({
    text = "Auto Boss Battle",
    state = false,
    callback = function(v)
        autoBoss = v
        while autoBoss do
            for _, boss in ipairs(selectedBosses) do
                startBattle(boss)
                task.wait(0.2)
            end
        end
    end
})

MainSection:AddList({
    text = "Select Bosses",
    values = boss_list,
    selected = selectedBosses,
    multi = true,
    callback = function(v)
        selectedBosses = v
    end
})

local autoMoon = false

local function rerollMoonFree()
    local args = {
        [1] = "moon_cycle_reroll_potion",
        [2] = 100
    }
    game:GetService("ReplicatedStorage"):FindFirstChild("55B"):FindFirstChild("84f5bfcc-bd82-4feb-bc4e-8d0489c96c0a"):FireServer(unpack(args))
end

MainSection:AddToggle({
    text = "OP Auto Moon",
    state = false,
    callback = function(v)
        autoMoon = v
        while autoMoon do
            rerollMoonFree()
            task.wait(0.1)
        end
    end
})

MainSection:AddSeparator({
    enabled = true,
    text = "Obbed Hub"
})

local TimeLoaded = string.format("%.2f", os.clock())
library:SendNotification("Obbed Hub loaded in "..TimeLoaded.."s", 6)
