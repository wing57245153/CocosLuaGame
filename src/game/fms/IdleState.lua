cClass.IdleState(BaseState)

function IdleState:__init()

end

function IdleState:enter(owner)
	print('-----i enter idle-----------')
end

function IdleState:execute(owner)
	print("----i execute idle")
end

function IdleState:exit(owner)
	print("----i exit idle")
end

function IdleState:onMessage(owner, telegram)
	if telegram.msg == fms.message_type.idle2walk then
		print("----change to walk state----")
        owner:getFsm():changeState(WalkState(), telegram)
	end
end