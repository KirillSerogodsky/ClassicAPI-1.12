EventRegistry = {}

EventRegistry.RegisterFrameEventAndCallback = function(self, frameEvent, func, owner)
    local frame = CreateFrame("Frame")
    frame:RegisterEvent(frameEvent)
    frame:SetScript("OnEvent", function()
        func()
        frame:UnregisterAllEvents()
    end)
end
