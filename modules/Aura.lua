local UnitDebuff = UnitDebuff
local UnitBuff = UnitBuff
local SpellInfo = SpellInfo

-- @param unitId, index, filter?
-- @return name, icon, count, dispelType, duration, expirationTime, source, 
-- isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, 
-- castByPlayer, nameplateShowAll, timeMod, ...
C_UnitDebuff = function(unit, index, filter)
    local texture, applications, type, spellID = UnitDebuff(unit, index)

    if not spellID then return end

    local name = SpellInfo(spellID)
    local duration, expire = 0, 0
    local caster, steal, consolidate = nil, nil, nil

    return name, texture, applications, type, duration, expire, caster, steal, consolidate, spellID
end

-- @param unitId, index, filter?
-- @return name, icon, count, dispelType, duration, expirationTime, source, 
-- isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, 
-- castByPlayer, nameplateShowAll, timeMod, ...
C_UnitBuff = function(unit, index, filter)
    local texture, applications, spellID = UnitBuff(unit, index)

    if not spellID then return end

    local name = SpellInfo(spellID)
    local duration, expire = 0, 0
    local type, caster, steal, consolidate = nil, nil, nil, nil

    return name, texture, applications, type, duration, expire, caster, steal, consolidate, spellID
end

-- @param unitId, index, filter?
-- @return name, icon, count, dispelType, duration, expirationTime, source, 
-- isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, 
-- castByPlayer, nameplateShowAll, timeMod, ...
UnitAura = function(unit, index, filter)
end
