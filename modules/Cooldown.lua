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

SetCooldown = function(self, start, duration)
	CooldownFrame_SetTimer(self, start, duration, 1)
end

SetSwipeColor = function(self, r, g, b, a)
	if (a) then self:SetAlpha(a) end
end

GetCooldownTimes = function(self)
	local start = self.start
	local duration = self.duration
	if (start and duration and (GetTime() - (start + duration)) >= 0) then
		start = nil
		duration = nil
	end
	return start or 0, duration or 0
end