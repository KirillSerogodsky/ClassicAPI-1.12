local UnitExists = UnitExists
local GetCursorPosition = GetCursorPosition

InCombatLockdown = function()
    return false
end

UnitGUID = function(unit)
    local _, GUID = UnitExists(unit)
    return GUID
end

IsMouseOver = function(frame)
    local x, y = GetCursorPosition()
    local scale = frame:GetEffectiveScale()
    local left = frame:GetLeft()
    local right = frame:GetRight()
    local top = frame:GetTop()
    local bottom = frame:GetBottom()

    x, y = x / scale, y / scale
    
    return x >= left and x <= right and y >= bottom and y <= top
end

GetTickTime = function()
    return 0
end

strtrim = function(str)
    if type(str) ~= "string" then return str end
    local trimmed = string.gsub(str, "^[ \t]+", "")
    trimmed = string.gsub(trimmed, "[ \t]+$", "")
    return trimmed
end

strjoin = function(delimiter, ...)
    local result = ""
    for i = 1, getn(arg) do
        if arg[i] ~= nil then
            if result ~= "" then
                result = result .. delimiter
            end
            result = result .. tostring(arg[i])
        end
    end
    return result
end

IsInRaid = function()
    return false
end

IsInGroup = function()
    return false
end

IsInGuild = function()
    return false
end

UnitIsPossessed = function(unit)
    return false
end

local playerName = UnitName("player")
UnitIsUnit = function(unit1, unit2)
    if unit1 == "player" then
        return unit2 == playerName
    end

    return unit1 == unit2
end

GetServerTime = function()
	return GetTime()
end
