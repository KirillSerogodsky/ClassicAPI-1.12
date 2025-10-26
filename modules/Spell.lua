local SpellInfo = SpellInfo
local GetSpellTexture = GetSpellTexture

-- @param spellID or spellName or spellLink
-- @return name, rank, icon, castTime, minRange, maxRange 
GetSpellInfo = function(spellID)
    local name = SpellInfo(spellID)
    return name or "spell_"..spellID
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

Spell = {}
Spell.cache = {}

Spell.CreateFromspellID = function(spellID)
    if not self.cache[spellID] then
        local spell = {}
        setmetatable(spell, { __index = Spell })
        self.cache[spellID] = spell
    end
    
    return self.cache[spellID]
end

Spell.GetSpellDescription = function(self)
    return ""
end
