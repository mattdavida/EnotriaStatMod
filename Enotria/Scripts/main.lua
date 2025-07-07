local UEHelpers = require("UEHelpers.UEHelpers")
local Utils = require("Utils.Utils")

if not UEHelpers then
    print("[FATAL ERROR] require('UEHelpers.UEHelpers') failed.")
    print("Please ensure the 'shared/UEHelpers/UEHelpers.lua' file exists relative to the Mods folder.")
end

if not Utils then
    print("[FATAL ERROR] require('Utils.Utils') failed.")
    print("Please ensure the 'shared/Utils/Utils.lua' file exists relative to the Mods folder.")
end

local function max_current_inventory()
    print("--- F7: Max Inventory ---")
    ---@class ABPC_MainCharacter_C : ABPC_Humanoid_C
    local player = UEHelpers.GetPlayer()
    local inventory = player.Inventory.InventoryList
    local inv_size = inventory:GetArrayNum()

    for i = 1, inv_size - 1 do
        local item = inventory[i]

        if Utils.StringContains(item.ItemDef:GetFullName(), "Estus") then
            -- Max out the Estus shards and set the level to 20
            item.CurrentQuantity = 999
            item.MaxQuantity = 999
            item.CurrentLevel = 20
        end

        if Utils.StringContains(item.ItemDef:GetFullName(), "Weapon") then
            -- Max out the weapons to level 10
            item.CurrentLevel = 10
        end

        if item then
            if item.MaxQuantity == 1 then
                -- Max out the unique items
                item.CurrentQuantity = 1
            else
                -- Max out the stackable items
                item.CurrentQuantity = 999
                item.MaxQuantity = 999
            end
        end
    end
end

local function max_virtues()
    print("--- F8: Max Virtues ---")

    ---@class UVirtueStats : UAttributeSet_Extension
    local virtue_instance = FindFirstOf("VirtueStats")
    if virtue_instance then
        virtue_instance.Assassin.BaseValue = 100
        virtue_instance.Bruiser.BaseValue = 100
        virtue_instance.Battlemage.BaseValue = 100
        virtue_instance.Elementalist.BaseValue = 100
        virtue_instance.Trickster.BaseValue = 100
    else
        print("No VirtueStats instance found")
    end

    -- TODO: Find a simple way to trigger the virtue stats to update
    -- Currently the levels update automatically in game, but you have
    -- to quit to main menu / fast travel and reload char to see the stats updated
end

local function max_health_and_inspiration()
    print("--- F9: One Million Health ---")

    ---@class UDAS_FrameworkStats : UDAS_CoreStats | nil
    local framework_stats = FindAllOf("DAS_FrameworkStats")
    if framework_stats then
        for _, ability in pairs(framework_stats) do
            if Utils.StringContains(ability:GetFullName(), "BPC_MainCharacter_C") then
                ability.HealthMax.CurrentValue = 999999
                ability.HealthMax.BaseValue = 999999
                ability.Health.CurrentValue = 999999
                ability.Health.BaseValue = 999999

                --  increase inspiration
                ability.Inspiration.BaseValue = 9999
                ability.Inspiration.CurrentValue = 9999
            end
        end
    end
end

local function one_million_stamina()
    print("--- F6: One Million Stamina ---")
    ---@class UStaminaStats : UAttributeSet_Extension
    local stamina_data = FindFirstOf("StaminaStats")
    if stamina_data then
        stamina_data.MaxValue.BaseValue = 999999
        stamina_data.MaxValue.CurrentValue = 999999
        stamina_data.RegenValue.BaseValue = 999999
        stamina_data.RegenValue.CurrentValue = 999999
        stamina_data.RegenMultiplier.BaseValue = 999999
        stamina_data.RegenMultiplier.CurrentValue = 999999
        stamina_data.CostMultiplier.BaseValue = 0
        stamina_data.CostMultiplier.CurrentValue = 0
    end
end

function level_up_handler(FullCommand, Parameters, Ar)
    Utils.Log(Ar, "---- LEVEL UP COMMANDS HELP ----")
    Utils.Log(Ar, "@param <virtue_name> - One of the following: Assassin, Bruiser, Battlemage, Elementalist, Trickster")
    Utils.Log(Ar, "@param <level> - The level to set the virtue to")
    Utils.Log(Ar, "stat_level_up <virtue_name> <level>")
    return true
end

function level_up_virtue(FullCommand, Parameters, Ar)
    if not Parameters[1] or not Parameters[2] then
        Utils.Log(Ar, "Error: Missing parameters. Use stat_help for usage.")
        return false
    end

    local virtue_name = tostring(Parameters[1])
    local virtue_to_update = Utils.GetVirtueByName(virtue_name)
    local LevelInput = tonumber(Parameters[2])

    if not LevelInput then
        Utils.Log(Ar, "Error: Invalid level. Must be a number.")
        return false
    end
    if virtue_to_update then
        virtue_to_update.BaseValue = LevelInput
        virtue_to_update.CurrentValue = LevelInput
        Utils.Log(Ar, "" .. virtue_name .. " LEVELED UP TO::: " .. tostring(virtue_to_update.BaseValue))
    end
    return true
end

local function infinite_line_casts()
    print("--- F5: Infinite Line Casts ---")
    ---@class ABPC_MainCharacter_C : ABPC_Humanoid_C
    local player = UEHelpers.GetPlayer()
    local inventory = player.Inventory.InventoryList
    local inv_size = inventory:GetArrayNum()
    for i = 1, inv_size - 1 do
        local item = inventory[i]
        if Utils.StringContains(item.ItemDef:GetFullName(), "Line") then
            local item_def = item.ItemDef
            -- NOTE: GetCDO() returns different types based on the actual class at runtime
            -- The Actual class is UItemDefinition_Line
            local instance_type = item_def:GetCDO()

            if instance_type then
                -- Disable the field check for the LineData field
                -- Type system can't infer that GetCDO() returns UItemDefinition_Line at runtime
                ---@diagnostic disable-next-line: undefined-field
                local line_data = instance_type.LineData
                if line_data then
                    -- Infinite line casts -- no need to damage enemies to get off cooldown
                    line_data.LineWarmup.Value = 0
                else
                    print("No stat requirements found")
                end
            else
                print("No instance type found")
            end
        end
    end
end

local function stat_mod_keybinds(FullCommand, Parameters, Ar)
    Utils.Log(Ar, "--- All Keybinds ---")
    Utils.Log(Ar, "F5: Infinite Line Casts - No need to damage enemies to get line skills off cooldown")
    Utils.Log(Ar, "F6: One Million Stamina")
    Utils.Log(Ar, "F7: Max Inventory - 999 all current items; Estus shards level 20; All weapons to level 10;")
    Utils.Log(Ar, "F8: Max Virtues - All virtues to 100")
    Utils.Log(Ar, "F9: One Million Health; Inspiration to 9999")
    return true
end


-- Keybinds for Hotkeys - instant effects
RegisterKeyBind(Key.F5, {}, infinite_line_casts)
RegisterKeyBind(Key.F6, {}, one_million_stamina)
RegisterKeyBind(Key.F7, {}, max_current_inventory)
RegisterKeyBind(Key.F8, {}, max_virtues)
RegisterKeyBind(Key.F9, {}, max_health_and_inspiration)
-- Console Commands for more granular control
RegisterConsoleCommandHandler("stat_keybinds", stat_mod_keybinds)
RegisterConsoleCommandHandler("stat_help", level_up_handler)
RegisterConsoleCommandHandler("stat_level_up", level_up_virtue)
