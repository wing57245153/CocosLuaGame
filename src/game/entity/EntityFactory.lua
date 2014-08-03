 
cClass.sEntityFactory()
local instance = nil

function sEntityFactory:__init()
    self.entMap = {}
end

function sEntityFactory:getInstance()
	if instance == nil then
		instance = sEntityFactory()
	end

	return instance
end

function sEntityFactory:create(entityVo)
    local ent = sLivedEntity(entityVo)
    self.entMap[entityVo.id] = ent
    return ent
end

function sEntityFactory:remove(id)
	local ent = self.entMap[id]
	if ent ~= nil then
		ent:finalize()
	end
	self.entMap[id] = nil
end 

function sEntityFactory:getEntity(id)
	return self.entMap[id]
end

function sEntityFactory:update(dt)
	for _, ent in pairs(self.entMap) do
		ent:update(dt)
	end
end