COMBATLOG_OBJECT_AFFILIATION_MINE = tonumber("00000001", 16)
COMBATLOG_OBJECT_REACTION_FRIENDLY = tonumber("00000010", 16)
COMBATLOG_OBJECT_CONTROL_PLAYER = tonumber("00000100", 16)
COMBATLOG_OBJECT_TYPE_PLAYER = tonumber("00000400", 16)

CombatLogGetCurrentEventInfo = function()
    local event, text = string.gsub(arg1, "CHAT_MSG_SPELL_", ""), arg2

    local timestamp = GetTime()
    local eventType = nil
    local hideCaster = nil
    local srcGUID = nil
    local srcName = nil
    local srcFlags = 0
    local srcFlags2 = 0
    local dstGUID = nil
    local dstName = nil
    local dstFlags = 0
    local dstFlags2 = 0
    local spellID = 0
    local spellName = nil
    local spellSchool = nil
    local auraType = nil
    local isCrit = nil

    if event == "PERIODIC_SELF_BUFFS"
        and string.find(text, "from") == nil then
        local _, _, spell = string.find(text, "You gain (.+)%.")
        eventType = "SPELL_AURA_APPLIED"
        srcGUID = UnitGUID("player")
        srcName = playerName
        srcFlags = COMBATLOG_OBJECT_REACTION_FRIENDLY
        dstGUID = srcGUID
        dstName = srcName
        dstFlags = COMBATLOG_OBJECT_TYPE_PLAYER
        auraType = "BUFF"
        spellName = spell
    elseif event == "PERIODIC_SELF_DAMAGE"
        and string.find(text, "from") == nil then
        local _, _, spell = string.find(text, "You are afflicted by (.+)%.")
        eventType = "SPELL_AURA_APPLIED"
        srcGUID = UnitGUID("player")
        srcName = playerName
        srcFlags = COMBATLOG_OBJECT_REACTION_FRIENDLY
        dstGUID = srcGUID
        dstName = srcName
        dstFlags = COMBATLOG_OBJECT_TYPE_PLAYER
        auraType = "DEBUFF"
        spellName = spell
    elseif event == "PERIODIC_FRIENDLYPLAYER_BUFFS"
        and string.find(text, "from") == nil then
        local _, _, unit, spell = string.find(text, "(.+) gains (.+)%.")
        eventType = "SPELL_AURA_APPLIED"
        srcGUID = unit
        srcName = UnitName(unit)
        srcFlags = COMBATLOG_OBJECT_REACTION_FRIENDLY
        dstGUID = unit
        dstName = srcName
        dstFlags = COMBATLOG_OBJECT_REACTION_FRIENDLY
        auraType = "BUFF"
        spellName = spell
    elseif event == "PERIODIC_FRIENDLYPLAYER_DAMAGE"
        and string.find(text, "from") == nil then
        local _, _, unit, spell = string.find(text, "(.+) is afflicted by (.+)%.")
        eventType = "SPELL_AURA_APPLIED"
        srcGUID = unit
        srcName = UnitName(unit)
        srcFlags = COMBATLOG_OBJECT_REACTION_FRIENDLY
        dstGUID = unit
        dstName = srcName
        dstFlags = COMBATLOG_OBJECT_REACTION_FRIENDLY
        auraType = "DEBUFF"
        spellName = spell
    elseif event == "PERIODIC_CREATURE_BUFFS"
        and string.find(text, "from") == nil then
        local _, _, unit, spell = string.find(text, "(.+) gains (.+)%.")
        eventType = "SPELL_AURA_APPLIED"
        srcGUID = unit
        srcName = UnitName(unit)
        srcFlags = 0
        dstGUID = unit
        dstName = srcName
        auraType = "BUFF"
        dstFlags = 0
        spellName = spell
    elseif event == "PERIODIC_CREATURE_DAMAGE"
        and string.find(text, "from") == nil then
        local _, _, unit, spell = string.find(text, "(.+) is afflicted by (.+)%.")
        eventType = "SPELL_AURA_APPLIED"
        srcGUID = unit
        srcName = UnitName(unit)
        srcFlags = 0
        dstGUID = unit
        dstName = srcName
        dstFlags = 0
        auraType = "DEBUFF"
        spellName = spell
    elseif event == "PERIODIC_HOSTILEPLAYER_BUFFS"
        and string.find(text, "from") == nil then
        local _, _, unit, spell = string.find(text, "(.+) gains (.+)%.")
        eventType = "SPELL_AURA_APPLIED"
        srcGUID = unit
        srcName = UnitName(unit)
        srcFlags = 0
        dstGUID = unit
        dstName = srcName
        dstFlags = 0
        auraType = "BUFF"
        spellName = spell
    elseif event == "PERIODIC_HOSTILEPLAYER_DAMAGE"
        and string.find(text, "from") == nil then
        local _, _, unit, spell = string.find(text, "(.+) is afflicted by (.+)%.")
        eventType = "SPELL_AURA_APPLIED"
        srcGUID = unit
        srcName = UnitName(unit)
        srcFlags = 0
        dstGUID = unit
        dstName = srcName
        dstFlags = 0
        auraType = "DEBUFF"
        spellName = spell
    elseif event == "AURA_GONE_SELF" then
        local _, _, spell = string.find(text, "(.+) fades from you.")
        eventType = "SPELL_AURA_REMOVED"
        srcGUID = UnitGUID("player")
        srcName = playerName
        srcFlags = COMBATLOG_OBJECT_TYPE_PLAYER
        dstGUID = srcGUID
        dstName = srcName
        dstFlags = COMBATLOG_OBJECT_TYPE_PLAYER
        auraType = "BUFF"
        spellName = spell
    elseif event == "AURA_GONE_OTHER" then
        local _, _, spell, unit = string.find(text, "(.+) fades from (.+)%.")
        eventType = "SPELL_AURA_REMOVED"
        srcGUID = unit
        srcName = UnitName(unit)
        srcFlags = 0
        dstGUID = unit
        dstName = srcName
        dstFlags = 0
        auraType = "BUFF"
        spellName = spell
    elseif event == "PERIODIC_PARTY_BUFFS"
        and string.find(text, "from") == nil then
        local _, _, unit, spell = string.find(text, "(.+) gains (.+)%.")
        eventType = "SPELL_AURA_APPLIED"
        srcGUID = unit
        srcName = UnitName(unit)
        srcFlags = COMBATLOG_OBJECT_REACTION_FRIENDLY
        dstGUID = unit
        dstName = srcName
        dstFlags = COMBATLOG_OBJECT_REACTION_FRIENDLY
        auraType = "BUFF"
        spellName = spell
    elseif event == "PERIODIC_PARTY_DAMAGE"
        and string.find(text, "from") == nil then
        local _, _, unit, spell = string.find(text, "(.+) is afflicted by (.+)%.")
        eventType = "SPELL_AURA_APPLIED"
        srcGUID = unit
        srcName = UnitName(unit)
        srcFlags = COMBATLOG_OBJECT_REACTION_FRIENDLY
        dstGUID = unit
        dstName = srcName
        dstFlags = COMBATLOG_OBJECT_REACTION_FRIENDLY
        auraType = "DEBUFF"
        spellName = spell
    end

    if spellName ~= nil then
        --print(event, dstName, spellName)
    end

    return timestamp,
           eventType,
           hideCaster,
           srcGUID,
           srcName,
           srcFlags,
           srcFlags2,
           dstGUID,
           dstName,
           dstFlags,
           dstFlags2,
           spellID,
           spellName,
           spellSchool,
           auraType,
           nil,
           nil,
           nil,
           nil,
           nil,
           isCrit
end