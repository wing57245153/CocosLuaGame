--------技能处理----------


skill_proc = {}


------技能开始（引导流程）
function skill_proc:begin_skill(caster, skillId, Type)
    if Type == skill_common.SKILL_BEGIN_ACT then
        self:do_skill_act(caster, skillId)
    elseif Type == skill_common.SKILL_BEFORE_ACT then ---  前摇
        self:do_skill_before_act(caster, skillId)
        --self:setIsAiSleep(caster, true)
    elseif Type == skill_common.SKILL_AFTER_ACT then ---后摇结束 结束技能
        --self:setIsAiSleep(caster, false)
        print("--------end skill---------------")
	else
		local result, newTargets = self:check_skill_cast(caster, skillId)
        if result == false then
            return result, newTargets ---返回执行结果
        end
        self:check_guide(caster, skillId)
    end
    return true
end


----判断一个技能的条件码能不能通过
function skill_proc:check_skill_cast(caster, skillId)
	return true
end


-----判断需不需要引导（引导包）
function skill_proc:check_guide(caster, skillId)
    local is_need_guide = data_skill:get_skill_is_need_guide(skillId)


    if is_need_guide == skill_common.NO_GUIDE then
        self:begin_skill(caster, skillId, skill_common.SKILL_BEFORE_ACT) --前摇
    else ----------有引导
        ---send package
    end
end


--前摇处理
function skill_proc:do_skill_before_act(caster, skillId)
	---send package

    local before_act_time = data_skill:get_before_act_time(skillId) ---callback
    --print("---------before_act_time--------------", before_act_time)

    self:begin_skill(caster, skillId, skill_common.SKILL_BEGIN_ACT)
end


--技能打击
function skill_proc:do_skill_act( caster, skillId )
	local moveId =  data_skill:get_skill_act_move(skillId)

    if moveId ~= 0 then 
        --caster.curSkillId = skillId --设置了这个逻辑动作中所对应的技能
        move_proc:check_do_move(caster, moveId)
        ------释放逻辑动作　设置技能ＣＤ
        --data_skill:set_skill_cd(caster, skillId)
        --data_skill:set_skill_mp(caster, skillId)

        --caster.curSkillId = nil

        self:do_skill_after_act(caster, skillId)
    end
end


---后摇
function skill_proc:do_skill_after_act(caster, skillId)
	---send package
    local after_act_time = data_skill:get_after_act_time(skillId) ---callback

    print("---------after_act_time--------------", after_act_time)
    self:begin_skill(caster, skillId, skill_common.SKILL_AFTER_ACT)
end
