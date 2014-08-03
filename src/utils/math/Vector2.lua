cClass.Vector2()

function Vector2:__init(x, y)
    self.x = x
    self.y = y
end

function Vector2:normalized()
    local m = self:magnitudeof()
    local v = Vector2(self.x / m, self.y / m)
    return v
end

function Vector2:magnitudeof() --模
    return math.sqrt(self.x * self.x + self.y + self.y)
end

function Vector2:add(vector2)
    local v = Vector2()
    v.x = self.x + vector2.x
    v.y = self.y + vector2.y
    return v
end

function Vector2:mul(value)
	local v = Vector2()
	if type(value) == type(0) then
		v.x = self.x * value
		v.y = self.y * value
	end
	return v
end

Vector2.__add = Vector2.add
Vector2.__mul = Vector2.mul