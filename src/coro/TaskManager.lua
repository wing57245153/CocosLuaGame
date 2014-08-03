
TaskManager = {}

function TaskManager:init()
	self.coroutineId = 1
    self.coroutineList = {}
end

function TaskManager:createTask(func, obj)
	return TaskState(func, obj)
end


function TaskManager:startCoroutine(coro, taskState)
	local result, value = coroutine.resume(coro, taskState)
	--print("first", result, value)
	if result == true then
		if value == 0 or value == nil then
			value = 1
		end
    	self.coroutineList[self.coroutineId] = {coro = coro, cur = value, taskState = taskState}
    	self.coroutineId = self.coroutineId + 1
    end
end

--update by extra
function TaskManager:update(dt)
	for key,item in pairs(self.coroutineList) do
		local coro = item["coro"]
		local cur = item["cur"]
		local taskState = item["taskState"]
		if cur <= 1 then
			local result, value = coroutine.resume(coro, taskState)
			--print(result, value)
			if result == false then
				self.coroutineList[key] = nil
				item["cur"] = value
                print("end coro result", value)
			end
		else
			item["cur"] = cur - 1
		end
	end
end

------------------------------------
cClass.TaskState()

function TaskState:__init(func, obj)
	self.coroutine = coroutine.create(func)
	self.obj = obj
end

function TaskState:start()
	self.running = true
	local coro = coroutine.create(self.CallWrapper)
	TaskManager:startCoroutine(coro, self)
end

----
function TaskState:CallWrapper()
	while self.running == true do
		local result = self:moveNext()
    	if result == true then
    		coroutine.yield(self.current)
    	else
    		self.running = false
    	end
    end
end

function TaskState:moveNext()
	local result, value = coroutine.resume(self.coroutine, self.obj)
	--print("TaskState", result, value)
	self.current = value
	return result
end

TaskManager:init()