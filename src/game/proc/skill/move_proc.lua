---------%% @doc 逻辑动作触发流程第一步
----------%% @doc 判定是客户端选定目标还是服务端选定目标-
-----%% @doc 如果是服务端选定目标则为其选中目标
-------%% @doc 操作完成后进入下一步
move_proc = {}

--- 都是由服务器端选择怪物
function move_proc:check_do_move(caster, moveId)
    local serverTagetList = data_move:get_target(caster, moveId)
    self:do_move(caster, serverTagetList, moveId)
end

function move_proc:do_move(caster, allTargetList, moveId)
    local newTargetList = {}
    for k,target in pairs(allTargetList) do
        local result = data_move:check_can_move_cond(caster, target, moveId)
        if result ~= false then
           table.insert(newTargetList, target) 
        end
    end

    self:next_do_move(caster, newTargetList, moveId)

    --------发送数据到客户端---一个触发点
    --self:handle_pack_back(caster, moveId)
end

--*--对每一个对象和Target进行逻辑判定操作
function move_proc:next_do_move(caster, allTargetList, moveId)
    local codeList = data_move:get_all_move_code(moveId)   
    for k,v in pairs(codeList) do 
    	self:parse_do_move(k, v, caster, allTargetList, moveId)
    end

    for k,target in pairs(allTargetList) do
        --self:handle_skill_continue_scd(caster, target, moveId)
    end
end

---各种逻辑操作
function move_proc:parse_do_move(code, codeValue, caster, allTargetList, moveId)
    if codeValue == nil or type(codeValue) ~= "table" then
        return
    end

    code = codeValue[1]

    for k, target in pairs(allTargetList) do
        if code == "normal_damage" then  ----普通攻击		
            move_effect:check_damage(target, caster, codeValue[2], codeValue[3], moveId, codeValue[4])

        elseif code == "magic_damage" then ----魔法攻击
            print(".....................magic_damage.....", codeValue[2])
            move_effect:magic_damage(target, caster, codeValue[2], codeValue[3], moveId, codeValue[4])

        else
        end
    end
end