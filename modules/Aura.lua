local UnitDebuff = UnitDebuff
local UnitBuff = UnitBuff
local SpellInfo = SpellInfo

function C_UnitDebuff(unit, index, showDispellable)
    local texture, applications, type, id = UnitDebuff(unit, index, showDispellable)
    local name, rank, _, minrange, maxrange = SpellInfo(id)
    local duration, expire = 0, 0
    local caster, steal, consolidate = nil, nil, nil

    return name, texture, applications, type, duration, expire, caster, steal, consolidate, id
end

function C_UnitBuff(unit, index, showCastable)
    local texture, applications, id = UnitBuff(unit, index, showCastable)
    local name, rank, _, minrange, maxrange = SpellInfo(id)
    local duration, expire = 0, 0
    local type, caster, steal, consolidate = nil, nil, nil, nil

    return name, texture, applications, type, duration, expire, caster, steal, consolidate, id
end

function UnitAura()
end
