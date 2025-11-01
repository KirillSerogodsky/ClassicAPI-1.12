local SpellInfo = SpellInfo
local GetSpellTexture = GetSpellTexture

-- @param spellID or spellName or spellLink
-- @return name, rank, icon, castTime, minRange, maxRange 
GetSpellInfo = function(spellID)
    local name, rank, icon, minRange, maxRange = SpellInfo(spellID)
    return name or "spell_"..spellID, rank, icon, 0, minRange, maxRange
end

GetSpellDescription = function(spellID)
    return ""
end

-- @param spellID or spellName, bookType
-- @return texture
C_GetSpellTexture = function(spellID, bookType)
    local _, icon
	if (bookType) then
		icon = GetSpellTexture(spellID, bookType)
	else
		_, _, icon = SpellInfo(spellID)
	end
	return icon
end

-- @param spellID or spellName
-- @return usable, noMana
IsUsableSpell = function(spellID)
    return false
end

-- @param spellID
-- @return isKnown
IsPlayerSpell = function(spellID)
    return false
end

-- @param spellName or spellID or slotID
-- @return startTime, duration, enabled, modRate
C_GetSpellCooldown = function(spellID, bookType)
    --print(GetSpellCooldown(spellID))
    return GetTime(), 10, true, 10
end

C_Spell = {}
C_Spell.cache = {}

C_Spell.CreateFromspellID = function(spellID)
    if not self.cache[spellID] then
        local spell = {}
        setmetatable(spell, { __index = Spell })
        self.cache[spellID] = spell
    end
    
    return self.cache[spellID]
end

C_Spell.GetSpellTexture = function(spellID)
    return C_GetSpellTexture(spellID)
end

C_Spell.GetSpellDescription = function(spellID)
    return GetSpellDescription(spellID)
end
