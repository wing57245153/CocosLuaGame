metic = {}
function metic.f_100000()
return true
end
metic[100000] = metic.f_100000

function metic.f_100001()
local  A = metic.T.val.is_god
local  B = metic.T.val.is_invisible
local  C = metic.C.val.id
local  D = metic.T.val.id
local  E = metic.C.val.hp
local  F = metic.C.val.camp
local  G = metic.T.val.camp
return     (A <= 0) and (B <= 0) and (C ~= D) and (E > 0) and (F ~= G)
end
metic[100001] = metic.f_100001

function metic.f_100003()
return math.random(1, 1000)
end
metic[100003] = metic.f_100003

function metic.f_100004()
return 
end
metic[100004] = metic.f_100004

function metic.f_100086()
local  A = metic.C.val.x
local     B = metic.C.val.y
local     C = metic.T.val.x
local     D = metic.T.val.y
return     math.sqrt(math.pow((A - C), 2) + math.pow((B - D), 2))
end
metic[100086] = metic.f_100086

function metic.f_100087()
local A = metic[100086]()
return 300 - A
end
metic[100087] = metic.f_100087

function metic.f_200001()
local A = metic.C.val.hp
return     A * 0.1
end
metic[200001] = metic.f_200001

function metic.f_200002()
local A = metic.C.val.is_daze
return     A == 0
end
metic[200002] = metic.f_200002

function metic.f_200011()
local A = metic.C.val.career
return     A == 1
end
metic[200011] = metic.f_200011

function metic.f_200012()
local A = metic.C.val.career
return     A == 2
end
metic[200012] = metic.f_200012

function metic.f_200013()
local A = metic.C.val.career
return     A == 3
end
metic[200013] = metic.f_200013

function metic.f_200014()
local A = metic.C.val.career
return     A == 4
end
metic[200014] = metic.f_200014

function metic.f_200086()
local A = metic[100086]()
return     A <= 15
end
metic[200086] = metic.f_200086

function metic.f_200111()
local A = metic.C.val.camp
local B = metic.T.val.camp
local C = metic.T.val.hp
return A == B and C >= 0
end
metic[200111] = metic.f_200111

function metic.f_312001()
local A = metic.T.val.is_god
local     B = metic.T.val.is_invisible
local     C = metic.C.val.id
local     D = metic.T.val.id
local     E = metic.C.val.hp
local     F = metic.C.val.camp
local     G = metic.T.val.camp
local     H = metic.C:buff(312001, 'BUFF_LAYER')
return     (A <= 0) and (B <= 0) and (C ~= D) and (E > 0) and (F ~= G) and  (H >= 0)
end
metic[312001] = metic.f_312001

function metic.f_324001()
local A = metic.C.val.hp_max
return     A * 0.05
end
metic[324001] = metic.f_324001

function metic.f_334021()
local A = metic.T.val.is_god
local     B = metic.T.val.is_invisible
local     C = metic.C.val.id
local     D = metic.T.val.id
local     E = metic.C.val.hp
local     F = metic.C.val.camp
local     G = metic.T.val.camp
local     H = metic.C:buff(334021, 'BUFF_LAYER')
return     (A <= 0) and (B <= 0) and (C ~= D) and (E > 0) and (F ~= G) and  (H >= 0)
end
metic[334021] = metic.f_334021

function metic.f_360001()
local A = metic.C.val.critical
return     (A * 500) / (A + 1000)
end
metic[360001] = metic.f_360001

function metic.f_360005()
local A = metic[360001]() 
local     B = metic[360002]()
return     math.max((A - B), 0)
end
metic[360005] = metic.f_360005

function metic.f_360009()
local C_att = metic.C.val.att
local     C_dga = metic.C.val.dmgadd_per
local     T_dgd = metic.T.val.dmgdec_per
local     C_acri = metic.C.val.add_critical
local T_rcri = metic.T.val.resist_critical
return (C_att * 2) * math.max(((C_dga - T_dgd) + 1), 0) * math.max(((C_acri - T_rcri) + 2), 1.5)
end
metic[360009] = metic.f_360009

function metic.f_410011()
local A =  metic.C.last_damage_val
return     A * 0.5
end
metic[410011] = metic.f_410011

function metic.f_410012()
local A =  metic.C.last_damage_val
return     A * 0.5
end
metic[410012] = metic.f_410012

function metic.f_420011()
local A =  metic.C.attacker_val
return     A * 0.1
end
metic[420011] = metic.f_420011

function metic.f_420012()
local A =  metic.C.attacker_val
return     A * 0.1
end
metic[420012] = metic.f_420012

function metic.f_600001()
local A =  metic.C.last_damage_type
return A == 1 or A == 3 or A == 6
end
metic[600001] = metic.f_600001

function metic.f_600002()
local A =  metic.C.last_damage_type
return A == 2
end
metic[600002] = metic.f_600002

function metic.f_700001()
local A =  metic.C.attacker_type
return A == 1 or A == 3 or A == 6
end
metic[700001] = metic.f_700001

function metic.f_700002()
local A =  metic.C.attacker_type
return A == 2
end
metic[700002] = metic.f_700002

function metic.f_360002()
local T_ten = metic.T.val.tenacity
return     (T_ten * 500) / (T_ten +1000)
end
metic[360002] = metic.f_360002

function metic.f_360003()
local C_acc = metic.C.val.accu
return     (C_acc * 300) / (C_acc + 1000)
end
metic[360003] = metic.f_360003

function metic.f_360004()
local T_acc = metic.T.val.dodge
return     (T_acc * 300) / (T_acc +1000)
end
metic[360004] = metic.f_360004

function metic.f_360006()
local A = metic[360003]()
local     B = metic[360004]()
return     math.max(math.min(((A - B) + 1000), 1000),0)
end
metic[360006] = metic.f_360006

function metic.f_360007()
local C_att = metic.C.val.att
local     T_def = metic.T.val.def
local     C_dga =  metic.C.val.dmgadd_per
local     T_dgd = metic.T.val.dmgdec_per
return     math.max(((C_att - T_def)*2), 1) * math.max(((C_dga - T_dgd) + 1), 0)
end
metic[360007] = metic.f_360007

function metic.f_360008()
local C_acri = metic.C.val.add_critical
local     T_rcri = metic.T.val.resist_critical
local     A = metic[360007]()
return     math.max(((C_acri - T_rcri) + 2), 1.5) * A
end
metic[360008] = metic.f_360008

function metic.f_360010()
local T_pefd = metic.T.val.perfect_def
local     T_hp_max = metic.T.val.hp_max
return     (1000 - T_pefd) / 1000 * T_hp_max
end
metic[360010] = metic.f_360010

function metic.f_360011()
local A = metic[360007]() 
local     B = metic[360010]()
return     math.min(A, B)
end
metic[360011] = metic.f_360011

function metic.f_360012()
local A = metic[360008]() 
local     B = metic[360010]()
return     math.min(A, B)
end
metic[360012] = metic.f_360012

function metic.f_360013()
local A = metic[360009]() 
local     B = metic[360010]()
return     math.min(A, B)
end
metic[360013] = metic.f_360013

function metic.f_350011()
local A = metic.C.val.is_daze
local     B = metic.C.val.is_fly
return     A == 0 and B == 0
end
metic[350011] = metic.f_350011

function metic.f_400016()
local A = math.random(1, 1000)
return     A <= 500
end
metic[400016] = metic.f_400016

function metic.f_400013()
local A = math.random(1, 1000)
return     A <= 800
end
metic[400013] = metic.f_400013

function metic.f_100007()
local A = metic[100003]()
local     B = metic[360006]() 
return     A < B
end
metic[100007] = metic.f_100007

function metic.f_100008()
local A = metic[100003]()
local     B = metic[360005]()
return     A < B
end
metic[100008] = metic.f_100008

function metic.f_100009()
local A = metic[100003]()
local     B = metic.C.val.holy_att
return     A < B
end
metic[100009] = metic.f_100009

function metic.f_100002()
return 
end
metic[100002] = metic.f_100002

function metic.f_324002()
return 
end
metic[324002] = metic.f_324002

function metic.f_360014()

end
metic[360014] = metic.f_360014

