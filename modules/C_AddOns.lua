local LoadAddOn = LoadAddOn

C_AddOns = {}

-- @return loaded, value
C_AddOns.LoadAddOn = function(name)
    return LoadAddOn(name)
end

-- @param name, variable
-- @return value
C_AddOns.GetAddOnMetadata = function(name, variable)
    return nil
end
