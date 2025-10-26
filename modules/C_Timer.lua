C_Timer = {}

C_Timer.After = function(seconds, callback)
    local timerFrame = CreateFrame("Frame")
    local elapsed = 0
    timerFrame:SetScript("OnUpdate", function()
        elapsed = elapsed + arg1
        if elapsed >= seconds then
            callback()
            this:SetScript("OnUpdate", nil)
            this:Hide()
        end
    end)
end

C_Timer.NewTimer = function(seconds, callback, iterations)
end

C_Timer.NewTicker = function(seconds, callback, iterations)
end
