-------技能相关数据处理------
data_skill = {}

----技能ＣＤ时间是否结束
function data_skill:is_skill_cd_over(caster, skillId)
    local remain = self:get_skill_cd_remain(caster, skillId)

    return remain <= 1000 ---ＣＤ没有剩余时间了 (1000为世间误差)
end

---获取ＣＤ剩余时间
function data_skill:get_skill_cd_remain(caster, skillId)
    local remain = 0
    local cdList = caster:getCDList()
    if cdList ~= nil then
        remain = cdList[skillId] or 0
    end
    return remain
end

---设置技能Ｃｄ　时间
function data_skill:set_skill_cd(caster, skillId)
    local cdtime = self:get_skill_cd_time(skillId)
    local cdList = caster:getCDList()
    if cdList == nil then
        return
    end
    cdList[skillId] = cdtime
end

----设置mp
function data_skill:set_skill_mp(caster, skillId)
    local mp_need = data_skill:get_mp_need(skillId)
    caster:updateCurFighterVal('mp', - mp_need)
end

---获取技能ＣＤ时间
function data_skill:get_skill_cd_time(skillId)
    local skillInfo = self:get_skill_info()
    local cd_time = skillInfo:getValue(skillId, "cd_time", 0)
    return cd_time
end
-------%% @doc 获取技能的施法条件判断码
--------%% @doc 失败的时候返回失败条件判断码
-------%% @doc 成功的时候返回判断码
function data_skill:get_skill_cast_condition(skillId)
    local skillInfo = self:get_skill_info()
    local cast_conditon = skillInfo:getValue(skillId, "cast_condition", 0)
    return cast_conditon
end

-----获取技能能否空放
function data_skill:get_skill_empty_cast(skillId)

end

function data_skill:get_skill_is_cast_end(skillId)
    local skillInfo = self:get_skill_info()
    local is_end_cast = skillInfo:getValue(skillId, "is_end_cast", 0)
    return is_end_cast
end

-------获取技能施法逻辑动作码
function data_skill:get_skill_cast_move(skillId)
    local skillInfo = self:get_skill_info()
    local moveId = skillInfo:getValue(skillId, "cast_move", 0)
    return moveId
end

-----
function data_skill:get_skill_act_move(skillId)
    local skillInfo = self:get_skill_info()
    local moveId = skillInfo:getValue(skillId, "act_move", 0)
    return moveId
end

----技能是否需要引导----
function data_skill:get_skill_is_need_guide( skillId )
	local skillInfo = self:get_skill_info()
	local is_need_guide = skillInfo:getValue(skillId, "is_need_guide", 0)
	return is_need_guide
end

function data_skill:get_skill_guide_time( skillId )
    local skillInfo = self:get_skill_info()
    local guide_time = skillInfo:getValue(skillId, "guide_time", 0)
    return guide_time
end

function data_skill:get_before_act_time( skillId )
    local skillInfo = self:get_skill_info()
    local before_act_time = skillInfo:getValue(skillId, "before_act", 0)
    return before_act_time
end 

function data_skill:get_after_act_time( skillId )
    local skillInfo = self:get_skill_info()
    local after_act_time = skillInfo:getValue(skillId, "after_act", 0)
    return after_act_time
end 

function data_skill:get_mp_need( skillId )
    local skillInfo = self:get_skill_info()
    local mp_need = skillInfo:getValue(skillId, "mp_need", 0)
    return mp_need
end

----判断MP值是否足够
function data_skill:is_mp_need_remain( caster,  skillId)
    local mp_need = self:get_mp_need(skillId)
    local curFighterId = caster:getCurFighterId()
    local casterMP = caster:getFighterValByName(curFighterId, 'mp')

    return casterMP >= mp_need
end

----获取技能的信息
function data_skill:get_skill_info()
    local skillInfo = skill_config.Skill_copyConfigData
    return skillInfo
end

----打断玩家引导
function data_skill:break_guide()

end