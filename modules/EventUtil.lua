EventUtil = {}

EventUtil.ContinueOnAddOnLoaded = function(addonName, callback)
    local frame = CreateFrame("Frame")
    frame:RegisterEvent("ADDON_LOADED")
    frame:SetScript("OnEvent", function()
        if arg1 == addonName then
            callback(addonName)
            frame:UnregisterAllEvents()
        end
    end)
end
