skill_common = {}


skill_common.SKILL_BEGIN_ACT = "SKILL_BEGIN_ACT" --打击
skill_common.SKILL_BEFORE_ACT = "SKILL_BEFORE_ACT" --前摇
skill_common.SKILL_AFTER_ACT = "SKILL_AFTER_ACT" --后摇


--%% @doc 血量变更原因
--%% @doc 受到普通攻击掉血
skill_common.NORMAL_HURT_HP_CHANGE = 1
----%% @doc 受到魔法攻击掉血
skill_common.MAGIC_HURT_HP_CHANGE = 2
----%% @doc 受到暴击攻击掉血
skill_common.CRIT_HURT_HP_CHANGE = 3
----%% @doc 其他原因导致血量变化
skill_common.OTHER_HP_CHANGE = 4
-------%% @doc 闪避
skill_common.DODGE_HP_CHANGE = 5
----神圣一击
skill_common.HOLY_HP_CHANGE = 6
---------
-----%% @doc 技能在施放后结束
skill_common.CAST_END = 0
--------%% @doc 技能释放后技能继续
skill_common.CAST_CONTINUE = 1




-----%% @doc 默认技能不需要引导
skill_common.NO_GUIDE = 0
------%% @doc 需要引导
skill_common.NEED_GUIDE = 1


-----引导开始
skill_common.HANDLE_SKILL_START_GUIDE = 8401
-----前摇开始
skill_common.HANDLE_SKILL_BEFORE_ACT = 8402


----%% @doc BUFF的所有触发类型
----%% @doc 定时轮询触发
skill_common.TIME_TRIGGER = 1
--%% @doc 受到普通伤害触发
skill_common.NORMAL_HURT_TRIGGER = 2
--%% @doc 受到魔法伤害触发
skill_common.MAGIC_HURT_TRIGGER = 3
--%% @doc 造成普通伤害触发
skill_common.NORMAL_DAMAGE_TRIGGER = 4
--%% @doc 造成魔法伤害触发
skill_common.MAGIC_DAMAGE_TRIGGER = 5
--%% @doc 闪避触发
skill_common.DODGE_TRIGGER = 6
--%% @doc 暴击触发
skill_common.CRIT_TRIGGER = 7
--%% @doc 被施加DEBUFF触发
skill_common.DEBUFF_TRIGGER = 8
--%% @doc 被施加BUFF触发
skill_common.BUFF_TRIGGER = 9
--%% @doc 死亡触发
skill_common.DEAD_TRIGGER = 10 
--%% @doc 杀人触发
skill_common.KILL_TRIGGER = 11
--%% @doc 立即触发
skill_common.RIGHT_NOW_TRIGGER = 12


skill_common.ALL_CLEAN = 1 ---一下子全部清除BUFF
skill_common.LAYER_CLEAN = 2 ----- 一下只清除一层BUFF


skill_common.damage_type = {} --伤害类型
skill_common.damage_type.NORMAL = 1
skill_common.damage_type.MAGIC = 2


skill_common.select_type = {}
skill_common.select_type.NOT_TYPE = 'NOT_TYPE'
skill_common.select_type.SERVER = 'SERVER'
skill_common.select_type.CLIENT = 'CLIENT'
skill_common.select_type.SERVER_LASTER_ATTACKER = 'SERVER_LASTER_ATTACKER'
skill_common.select_type.SERVER_LAST_DAMAGE = 'SERVER_LAST_DAMAGE'
