cClass.StateMachine()
function StateMachine:__init(owner)
	self._owner = owner
	self._curState = nil
	self._preState = nil
	self._globalState = nil
end

---init
function StateMachine:setCurState(state)
	self._curState = state
end

function StateMachine:update(dt)
    self._curState:execute(self._owner)
end

function StateMachine:changeState(newState, telegram)
	assert(self._curState ~= nil)

	self._curState:exit(self._owner)
	self._curState = newState
    self._curState:enter(self._owner, telegram)
end

function StateMachine:handleMessage(telegram)
	self._curState:onMessage(self._owner, telegram)
end
