
CoroutineManager = {}

function CoroutineManager:startCoroutine(func, obj)
	local t = Task(func, obj)
	return t
end