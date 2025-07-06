local Utils = {}

---@param text string
---@param substring string
---@return boolean or nil
function Utils.StringContains(text, substring)
    -- The 'true' argument disables pattern matching for a plain text search, which is faster.
    return string.find(text, substring, 1, true) ~= nil
end


-- A logging helper to print to both the in-game console and the debug log
function Utils.Log(Ar, Message)
    print(Message)
    if Ar and Ar:IsValid() then
        Ar:Log(Message)
    end
end


function Utils.GetVirtueByName(Name)
    print("GET VIRTUE BY NAME: " .. Name)

    ---@class UVirtueStats : UAttributeSet_Extension
    local virtue_instance = FindFirstOf("VirtueStats")
    if virtue_instance then
        return virtue_instance[Name]
    end
    
    print("No VirtueStats instance found")
    return nil

    -- TODO: Find a simple way to trigger the virtue stats to update
    -- Currently the levels update automatically in game, but you have
    -- to quit to main menu / fast travel and reload char to see the stats updated
end


return Utils

