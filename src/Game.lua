local game = {}
Time = {}

function game:init()
    require "luaclass"
    require "utils.__init"
    self:initGame()
    self:initCoroSystem()
    self:startGame()
end

function game:initCoroSystem()
require "coro.__init"
    end
    
function game:initGame()
    require "game.__init"
end

function game:startGame()
    local update =
        function(dt) 
            self:update(dt)
        end
    local deltaTime = cc.Director:getInstance():getDeltaTime()
    Time.delta = deltaTime
    cc.Director:getInstance():getScheduler():scheduleScriptFunc(update,deltaTime,false)
    
    local func = 
    function() 
        print("---------11------------", os.clock())
        coroutine.yield(0)
        print("---------22------------", os.clock())
        local a = 1
        while a <= 10 do
            print("----------", a, os.clock())
            a = a + 1
            coroutine.yield(0)
        end
    end
    
    CoroutineManager:startCoroutine(func)
    self:testEntity()
end

function game:testEntity()
    local vo = EntityVo()
    vo.id = 1000
    vo.hp = 1000
    local ent = sEntityFactory:getInstance():create(vo)

    print(ent.val.id)
    local extralInfo = {}
    extralInfo.desX = 10
    extralInfo.desY = 10
    MsgDispatcher:getInstance():dispatchMsg(vo.id, vo.id, fms.message_type.idle2walk,extralInfo)
end

function game:update(dt)
    Time.delta = dt
    TaskManager:update(dt)
end

game:init()