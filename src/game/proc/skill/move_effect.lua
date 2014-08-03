-------------
move_effect = {}


-----%% @doc 普通攻击
-----%% @doc 先检测闪避
function move_effect:check_damage(target, caster, ratio, extra, moveId, hits)
    local is_hit = move_metic:is_hit(caster, target)
    --print("move_effect....check_damage....is_hit", is_hit)
    if is_hit == true then -----击中
        self:damage(skill_common.damage_type.NORMAL, target, caster, ratio, extra, moveId, hits)
    else ------闪避-------

    end
end

----魔法攻击
function move_effect:magic_damage(target, caster, ratio, extra, moveId, hits)
    self:damage(skill_common.damage_type.MAGIC, target, caster, ratio, extra, moveId, hits)
end

-----伤害计算 伤害次数hits
function move_effect:damage(Type, target, caster, argRatio, argExtra, moveId, hits)
    --print("move_effect....damage.....hits....", hits, moveId)
    local hits = hits or 1
    while hits > 0 do
        self:damage_one(Type, target, caster, argRatio, argExtra, moveId, hits)
        hits = hits - 1
    end
end

function move_effect:damage_one(Type, target, caster, argRatio, argExtra, moveId)
    local ration = 1
    local extra = 0
    local arithId = 0
    ------将伤害比率扩展为可以使用运算公式
    if type(argRatio) == 'table' then
        arithId = argRatio[2]
        ration = move_metic:metic(arithId, caster, target)
    else
        ration = argRatio 
    end

    if ration == 0 then
        ration = 1
    end

    ----------神圣伤害扩展为可以使用运算公式
    if type(argExtra) == 'table' then
        arithId = argExtra[2]
        extra = move_metic:metic(arithId, caster, target)
    else
        extra = argExtra
    end

    local damageType, damageBase = self:get_crit_damage(Type, caster, target)
    local realDamage = move_metic:rounding(damageBase * ration + extra)

    print("move_effect....damage...", realDamage)
    ----给对方造成伤害扣血
    local oldHp = target.val.hp
    local newHp = oldHp - realDamage
    target.val.hp = target.val.hp - realDamage --直接扣血，将直接产生效果
end

----获取暴击加成之后的伤害值
---要做神圣一击的判断
function move_effect:get_crit_damage(Type, caster, target)
    local is_holy = move_metic:is_holy(caster, target)
    if is_holy == true then ---神圣一击
        return skill_common.HOLY_HP_CHANGE, move_metic:holy_damage_base(caster, target)
    end
	local damageType = skill_common.NORMAL_HURT_HP_CHANGE
	if Type == skill_common.damage_type.MAGIC then --魔法攻击不暴击
		damageType = skill_common.MAGIC_HURT_HP_CHANGE
        return damageType, move_metic:hit_damage_base(caster, target)
	end
    local is_crit = move_metic:is_crit(caster, target)
    local damageBase = 0
    if is_crit ~= true then ---不暴击
    	damageType = skill_common.NORMAL_HURT_HP_CHANGE
        damageBase = move_metic:hit_damage_base(caster, target)
    else
    	damageType = skill_common.CRIT_HURT_HP_CHANGE
    	damageBase = move_metic:crit_damage_base(caster, target)

        -----暴击触发Buff
        new_buff:trigger_buff_type( caster,skill_common. CRIT_TRIGGER )
    end
    return damageType, damageBase
end
