
------逻辑动作数据----
data_move = {}

function data_move:get_all_move_code(moveId)
    local move_data = skill_config.Move_dataConfigData
    local codeList = move_data:getValue(moveId, "move", {})
    return codeList 
    --return {{"normal_damage", 1.1, 2}}
end

local vo = EntityVo()
vo.hp = 10000
vo.id = 10
local ent = sLivedEntity(vo)

function data_move:get_target(caster, moveId)
	-----test---
	
    return {ent}
end

-----能否进行逻辑动作的目标做判定
function data_move:check_can_move_cond(caster, target, moveId)
	local condId = self:get_move_condition(moveId)
	local result = self:get_move_condition_by_cond_id(condId, caster, target)
	return result
end

function data_move:get_move_condition_by_cond_id( condId, caster, target )
	local result = nil
	if metic[condId] ~= nil then
		result = move_metic:metic(condId, caster, target)
	else
		result = true
	end

	return result
end

-----获取逻辑动作的条件码
function data_move:get_move_condition(moveId)
    local moveConf = self:get_move_conf(moveId)
    local trigger_cond = moveConf:getValue(moveId, "trigger_cond", 0)
    return trigger_cond
end

---获取逻辑动作的配置信息
function data_move:get_move_conf()
    local moveConf = skill_config.Move_confData
    return moveConf
end