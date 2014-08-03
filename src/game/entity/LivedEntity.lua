cClass.sLivedEntity(sEntity)

function sLivedEntity:__init(entityVo)
    self._stateMachine = nil
    self:addStateMachine()
end

-------------------------
function sLivedEntity:finalize()
end 

function sLivedEntity:onEnterWorld()
end

function sLivedEntity:onLeaveWorld()
end

function sLivedEntity:update(dt)
	self._stateMachine:update(dt)
end
---------------StateMachine--------
function sLivedEntity:addStateMachine()
	self._stateMachine = StateMachine(self)
	self._stateMachine:setCurState(IdleState())
end

function sLivedEntity:handleMessage(telegram)
	self._stateMachine:handleMessage(telegram)
end

function sLivedEntity:getFsm()
	return self._stateMachine
end

------------------