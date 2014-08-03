cClass.EntityVo()

function EntityVo:__init()
    self:initVo()
end

function EntityVo:initVo()
    self.id = 0
    self.classId = 0
    self.hp = 0
    self.accu = 0
    self.dodge = 0
    self.holy_att = 0
    self.critical = 0
    self.tenacity = 0
    self.dmgadd_per = 0
    self.dmgdec_per = 0
    self.att = 0
    self.def = 0
    self.perfect_def = 0
    self.hp_max = 0

    self.x = 0
    self.y = 0

end