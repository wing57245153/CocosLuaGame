cClass.WalkState(BaseState)

function WalkState:__init(owner)

end

function WalkState:enter(owner, telegram)
	print('-----i enter walk-----------')
	self.owner = owner
    self._desX = telegram.extraInfo.desX
    self._desY = telegram.extraInfo.desY
    CoroutineManager:startCoroutine(self.startWalk,self)
end

function WalkState:startWalk()
    local srcX = self.owner.val.x
    local srcY = self.owner.val.y
    
    local dir = 1
    if self._desX - srcX >= 0 then
        dir = 1
    else
        dir = -1
    end
    while srcX <= self._desX do
        local dt = Time.delta
        srcX = srcX + dir * dt * 1
        self.owner.val.x = srcX
        print("walking....", self.owner.val.x)
        coroutine.yield(0)
    end
end

function WalkState:execute(owner)
	print("----i execute walk")
end

function WalkState:exit(owner)
	print("----i exit walk")
end