-------逻辑动作的计算公式
move_metic = {}

----技能是否命中
function move_metic:is_hit(caster, target)
    -- do
    --     return true
    -- end
    local result = self:metic(100007, caster, target)
    return result
end  

----技能是否暴击
function move_metic:is_crit(caster, target)
	local result = self:metic(100008, caster, target)
    return result
end         

----是否触发神圣一击
function move_metic:is_holy(caster, target)
    local result = self:metic(100009, caster, target)
    return result
end   

----普通攻击造成的伤害的伤害基础因数
function move_metic:hit_damage_base(caster, target)
    local result = self:metic(360011, caster, target)
    return result
end     

----暴击攻击造成的伤害的伤害基础因数
function move_metic:crit_damage_base(caster, target)
    local result = self:metic(360012, caster, target)
    return result
end 

----神圣一击造成的伤害的伤害基础因数
function move_metic:holy_damage_base(caster, target)
    local result = self:metic(360013, caster, target)
    return result
end 

--获取距离的公式
function move_metic:get_dist(caster, target)
	local result = self:metic(100086, caster, target)
    return result
end

-- %% @doc 获取普通反伤结果值的伤害基础因数
function move_metic:pay_back_normal_base(caster, target)
    local result = self:metic(420011, caster, target)
    return result
end


-----------

function move_metic:metic( meticId, caster, target )
    metic.C = caster
    metic.T = target

    local fun = metic[meticId]
    local result = nil
    if fun ~= nil then
        result = fun()
    end

    return result
end

-----------------
---四舍五入
function move_metic:rounding(a)
    local r1, r2 = math.modf(a)
    r2 = r2 >= 0.5 and 1 or 0
    return r1 + r2
end