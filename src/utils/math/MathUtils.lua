MathUtils = {}

function MathUtils:isPointInCircle(des, src, radius)
	local r2 = (des.x - src.x) * (des.x - src.x) + (des.y - src.y) * (des.y - src.y)
	return r2 <= radius * radius
end

----fanAngle 角度 度数
function MathUtils:isPointInFan(des, src, srcDir, radius, fanAngle)
    if self:IsPointInCircle(des, src, radius) == false then
        return false
    end

    srcDir = srcDir:normalized()
    local tempDir = Vector2(des.x - src.x, des.y - src.y)
    tempDir = tempDir:normalized()

    local dot = tempDir.x * srcDir.x + tempDir.y * srcDir.y
    local a = math.acos(dot)

    local da = math.deg(a)
    return da <= fanAngle / 2
end

function MathUtils:isPointInRect(des, src, srcDic, width, height)
	srcDic = srcDic:normalized()

	local verticalSDirX = 1
	local verticalSDirY = 0
	local verticalDic = nil
	if srcDic.y == 0 then
		verticalDic = Vector2(0, 1)
	else
		verticalSDirY = (srcDic.y * src.y - srcDic.x * (verticalSDirX - src.x)) / srcDic.y
		verticalDic = Vector2(verticalSDirX, verticalSDirY)
		verticalDic = verticalDic:normalized()
	end

	local a1 = srcDic.x
	local b1 = srcDic.y
	local c1 = srcDic.x * src.x + srcDic.y * src.y

	local a2 = verticalDic.x
	local b2 = verticalDic.y
	local c2 = verticalDic.x * des.x + verticalDic.y * des.y

	local x, y = self:equationTwo(a1, b1, c1, a2, b2, c2)
	local bw = (x - src.x) * (x - src.x) + (y - src.y) * (y - src.y) <= (width / 2) * (width / 2)
    local bh = (x - des.x) * (x - des.x) + (y - des.y) * (y - des.y) <= height * height
    return bw and bh
end

function MathUtils:isPointInArea(des, src, srcDic, args)
	local result = false
	local rangeType = args['attack_range_type']
	if rangeType == AttackRangeType.ATTACK_RANGE_TYPE_FAN then
		local fRadius = args["range_value2"]
        local fAngle = args["range_value1"]
        result = self:isPointInFan(des, src, srcDic, fRadius, fAngle) 
    elseif rangeType == AttackRangeType.ATTACK_RANGE_TYPE_RECT then
    	local rWidth = args["range_value2"]
        local rHeight = args["range_value1"]
        result = self:isPointInRect(des, src, srcDic, rWidth, rHeight)
    elseif rangeType == AttackRangeType.ATTACK_RANGE_TYPE_SELF_CIRCLE then
    	local cRadius = Convert.ToSingle(args["range_value1"])
    	result = self:isPointInCircle(des, src, cRadius)
    end

    return result
end

function MathUtils:equationTwo(a1, b1, c1, a2, b2, c2)
	local x = (c1 * b2 - c2 * b1) / (a1 * b2 - a2 * b1)
    local y = (a1 * c2 - a2 * c1) / (a1 * b2 - a2 * b1)

    return x, y
end

AttackRangeType = {}
AttackRangeType.ATTACK_RANGE_TYPE_NOTARGET = 0
AttackRangeType.ATTACK_RANGE_TYPE_FAN = 1
AttackRangeType.ATTACK_RANGE_TYPE_RECT = 2
AttackRangeType.ATTACK_RANGE_TYPE_SELF_CIRCLE = 3