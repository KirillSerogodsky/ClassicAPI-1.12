CopyTable = function(src)
    local copy = {}
    for k, v in pairs(src) do
        copy[k] = v
    end
    return copy
end
