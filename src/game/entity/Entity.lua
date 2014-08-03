cClass.sEntity()

function sEntity:__init(entityVo)
    
    self.entityVo = entityVo

    self.val = {}

    local mt = {}
    mt.__index = function(table, key)
            return self:getAttrValue(key)
        end

    mt.__newindex = function(table, key, value)
            self:setAttrValue(key, value)
        end

    setmetatable(self.val, mt)
end

----------------
function sEntity:finalize()
end

function sEntity:onEnterWorld()
end

function sEntity:onLeaveWorld()

end

function sEntity:update(dt)

end

----------------------
function sEntity:getAttrValue(key)
    return self.entityVo[key]
end

function sEntity:setAttrValue(key, value)
    if(key == "hp") then
        print("id:", self.entityVo.id, "cur hp:", self.entityVo[key], "after cut hp:", value)
    end
    self.entityVo[key] = value
end