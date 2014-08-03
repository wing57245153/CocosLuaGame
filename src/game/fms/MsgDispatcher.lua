cClass.MsgDispatcher()

local instance = nil

function MsgDispatcher:__init()
end

function MsgDispatcher:getInstance()
	if instance == nil then
		instance = MsgDispatcher()
	end
	
	return instance
end

function MsgDispatcher:dispatchMsg(senderId, receiverId, msg, extraInfo)
    local receiver = sEntityFactory:getInstance():getEntity(receiverId)
    local telegram = Telegram(senderId, receiverId, msg, extraInfo)
    self:discharge(receiver, telegram)

end

function MsgDispatcher:discharge(receiver, telegram)
	receiver:handleMessage(telegram)
end