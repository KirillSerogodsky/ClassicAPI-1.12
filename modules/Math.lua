local ceil = math.ceil
local floor = math.floor

Round = function(value)
    if value < 0.0 then
        return ceil(value - .5);
    end
    return floor(value + .5);
end

Mod = function(a, b)
    return a - math.floor(a / b) * b
end