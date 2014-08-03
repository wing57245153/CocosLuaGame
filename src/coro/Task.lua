cClass.Task()

function Task:__init(func, obj)
	self.task = TaskManager:createTask(func, obj)
	self:start()
end

function Task:start()
	self.task:start()
end