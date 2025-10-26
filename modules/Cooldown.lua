CooldownFrame_OnUpdateModel = function()
	if this.stopping == 0 then
		local finished = (GetTime() - this.start) / this.duration
		if finished < 1.0 then
			local time
			if this.reverse then time = (1 - finished) * 1000
			else time = finished * 1000 end
			this:SetSequenceTime(0, time)
			return
		end
		this.stopping = 1
		this:SetSequence(1)
		this:SetSequenceTime(1, 0)
	else
		this:AdvanceTime()
	end
end

CooldownFrame_Set = function(frame, start, duration, enable)
    CooldownFrame_SetTimer(frame, start, duration, enable and 1 or 0)
end

CooldownFrame_Clear = function(frame)
	frame:Hide()
end
