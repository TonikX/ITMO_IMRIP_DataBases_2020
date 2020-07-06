{\rtf1\ansi\ansicpg1251\cocoartf2511
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww15440\viewh14360\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #\'97 1) \uc0\u1057 \u1087 \u1080 \u1089 \u1086 \u1082  \u1074 \u1077 \u1076 \u1086 \u1084 \u1086 \u1089 \u1090 \u1077 \u1081  \u1079 \u1072  \u1079 \u1072 \u1076 \u1072 \u1085 \u1085 \u1099 \u1081  \u1087 \u1088 \u1086 \u1084 \u1077 \u1078 \u1091 \u1090 \u1086 \u1082  \u1076 \u1072 \u1090  \u1089  \u1089 \u1086 \u1088 \u1090 \u1080 \u1088 \u1086 \u1074 \u1082 \u1086 \u1081  \u1087 \u1086  \u1074 \u1086 \u1076 \u1080 \u1090 \u1077 \u1083 \u1102 \
select v.num, to_char(v.created_at, 'dd.mm.YYYY') as dates, s.fio from "Vedomost" as v \
left join "Sotrudnik_id" as s on v.zapravshik_id = s.id\
where v.created_at between '2020-05-19' and '2020-05-25'\
order by s.fio;\
\
#\'97 2) \uc0\u1056 \u1072 \u1089 \u1093 \u1086 \u1076  \u1090 \u1086 \u1087 \u1083 \u1080 \u1074 \u1072  \u1087 \u1086  \u1074 \u1086 \u1076 \u1080 \u1090 \u1077 \u1083 \u1103 \u1084  \u1089  \u1086 \u1073 \u1097 \u1080 \u1084  \u1087 \u1088 \u1086 \u1073 \u1077 \u1075 \u1086  \u1073 \u1086 \u1083 \u1077 \u1077  100\
select s.fio, sum(z.gsm_l) as total_l, round( CAST(sum(z.gsm_l * p.price) as numeric),2) || ' \uc0\u1088 \u1091 \u1073 .' as total_money, sum(pl.obshiy_probeg) as obshiy_probeg\
from "Zapisi" as z\
left join "Sotrudnik_id" as s on z.voditeli_id = s.id\
left join "GSM" as g on z.gsm_id = g.id\
left join "Price" as p on p.gsm_id = g.id\
left join "Putevoy_list" as pl on pl.id = z.putevoy_list_id\
group by fio\
having sum(pl.obshiy_probeg) > 100;\
\
#\'97 3) \uc0\u1055 \u1091 \u1090 \u1077 \u1074 \u1099 \u1077  \u1083 \u1080 \u1089 \u1090 \u1099 , \u1091  \u1082 \u1086 \u1090 \u1086 \u1088 \u1099 \u1093  \u1072 \u1076 \u1088 \u1077 \u1089  \u1072 \u1074 \u1090 \u1086 \u1073 \u1072 \u1079 \u1099  \u1095 \u1077 \u1090 \u1085 \u1099 \u1081 , \u1089  \u1079 \u1072 \u1076 \u1072 \u1085 \u1085 \u1099 \u1084  \u1086 \u1090 \u1087 \u1088 \u1072 \u1074 \u1080 \u1090 \u1077 \u1083 \u1077 \u1084 \
select * from "Putevoy_list"\
where id in (select putevoy_list_id from "Zapisi" as z\
             inner join "Avto" as a on a.id = z.avto_id\
             inner join "Avtobaza" as ab on a.avtobaza_id = ab.id\
             where cast(right(avtobaza_adress, 1) as int) % 2 = 0\
            )\
and gruzootpr_name ~* '(\uc0\u1072 ).*(\u1085 ).*(\u1084 \u1072 \u1081 )';\
\
#\'97 4) \uc0\u1042 \u1088 \u1077 \u1084 \u1103  \u1089  \u1087 \u1086 \u1089 \u1083 \u1077 \u1076 \u1085 \u1077 \u1081  \u1087 \u1086 \u1077 \u1079 \u1076 \u1082 \u1080  \u1087 \u1086  \u1074 \u1086 \u1076 \u1080 \u1090 \u1077 \u1103 \u1084 \
select fio, max(age(created_at)) from "Vedomost" as v\
join "Zapisi" as z on z.vedomost_id = v.id\
join "Sotrudnik_id" as s on s.id = z.voditeli_id\
group by fio;\
\
#\'97 5) \uc0\u1057 \u1074 \u1077 \u1076 \u1077 \u1085 \u1080 \u1103  \u1087 \u1086  \u1079 \u1072 \u1087 \u1080 \u1089 \u1103 \u1084  \u1074 \u1077 \u1076 \u1086 \u1084 \u1086 \u1089 \u1090 \u1077 \u1081  \u1086  \u1089 \u1088 \u1072 \u1074 \u1085 \u1080 \u1090 \u1077 \u1083 \u1100 \u1085 \u1086 \u1081  \u1089 \u1090 \u1086 \u1080 \u1084 \u1086 \u1089 \u1090 \u1080  \u1090 \u1086 \u1087 \u1083 \u1080 \u1074 \u1072  \u1074  \u1089 \u1088 \u1072 \u1074 \u1085 \u1077 \u1085 \u1080 \u1080  \u1089 \u1086  \u1089 \u1088 \u1077 \u1076 \u1085 \u1077 \u1077 \u1081  \u1094 \u1077 \u1085 \u1086 \u1081  \u1085 \u1072  \u1076 \u1072 \u1085 \u1085 \u1099 \u1081  \u1074 \u1080 \u1076  \u1090 \u1086 \u1087 \u1083 \u1080 \u1074 \u1072 \
select a.*, b.price, case\
when price > (select avg(price) from "GSM" as gg\
join "Price" as pp on gg.id = pp.GSM_id where a.gsm_name = gg.gsm_name) then 'high price'\
else 'low price' end as price_curse\
from (select v.num, v.created_at, gsm_name, max(date_) date_ from "Zapisi" as z\
join "Vedomost" as v on z.Vedomost_id = v.id\
join "GSM" as g on z.gsm_id = g.id\
inner join "Price" as p on (p.GSM_id = g.id and p.date_ <= v.created_at)\
group by v.num, v.created_at, gsm_name) as a\
join (select * from "GSM" as g\
join "Price" as p on g.id = p.GSM_id) as b\
on a.gsm_name = b.gsm_name and a.date_ = b.date_;\
\
#\'97 6) \uc0\u1054 \u1073 \u1097 \u1080 \u1081  \u1087 \u1088 \u1086 \u1073 \u1077 \u1075  \u1087 \u1086  \u1082 \u1072 \u1078 \u1076 \u1086 \u1084 \u1091  \u1072 \u1074 \u1090 \u1086 \u1084 \u1086 \u1073 \u1080 \u1083 \u1102 , \u1089 \u1086 \u1076 \u1077 \u1088 \u1078 \u1072 \u1097 \u1077 \u1084 \u1091  \u1094 \u1080 \u1092 \u1088 \u1091  9 \u1074  \u1085 \u1086 \u1084 \u1077 \u1088 \u1077 \
select sum(Obshiy_probeg), marka, gosnomer from "Putevoy_list" as pl\
join "Zapisi" as z on pl.id = z.Putevoy_list_id\
join "Avto" as a on z.Avto_id = a.id\
where gosnomer like '%9%'\
group by marka, gosnomer;\
\
#\'97 7) \uc0\u1042 \u1099 \u1074 \u1086 \u1076  \u1074 \u1089 \u1077 \u1093  \u1089 \u1086 \u1090 \u1088 \u1091 \u1076 \u1085 \u1080 \u1082 \u1086 \u1074 , \u1074 \u1099 \u1087 \u1086 \u1083 \u1085 \u1103 \u1074 \u1096 \u1080 \u1093  \u1079 \u1072 \u1087 \u1088 \u1072 \u1074 \u1082 \u1091  \u1074  \u1079 \u1072 \u1076 \u1072 \u1085 \u1085 \u1099 \u1093  \u1087 \u1077 \u1088 \u1080 \u1086 \u1076 \
select id, fio, dolzhnost from "Sotrudnik_id" as s\
where s.id = ANY (select Zapravshik_id from "Vedomost"\
where created_at between '2020-05-20' and '2020-05-25');\
\
#\'97 8) \uc0\u1048 \u1085 \u1092 \u1086 \u1088 \u1084 \u1072 \u1094 \u1080 \u1103  \u1086  \u1076 \u1086 \u1089 \u1090 \u1091 \u1087 \u1085 \u1099 \u1093  \u1075 \u1072 \u1088 \u1072 \u1078 \u1072 \u1093  \u1076 \u1083 \u1103  \u1084 \u1072 \u1096 \u1080 \u1085 \
select avtobaza_name, marka, gosnomer, garazh_adress from "Avtobaza" as ab\
join "Avto" as a on ab.id = a.Avtobaza_id\
join "Garazh" as g on g.Avtobaza_id = ab.id\
order by gosnomer;\
\
#\'97 9) \uc0\u1054 \u1073 \u1097 \u1080 \u1081  \u1086 \u1089 \u1090 \u1072 \u1090 \u1086 \u1082  \u1090 \u1086 \u1087 \u1083 \u1080 \u1074 \u1072  \u1087 \u1086  \u1072 \u1074 \u1090 \u1086 \u1073 \u1072 \u1079 \u1077 \
select avtobaza_name, gsm_name, sum(gsm_l) as l, sum(gsm_kg) as kg from "Avtobaza" as ab\
join "Garazh" as g on g.Avtobaza_id = ab.id\
inner join "Ostatki" as o on o.Garazh_id = g.id\
join "GSM" as gsm on gsm.id = o.gsm_id\
group by avtobaza_name, gsm_name;\
\
#\'97 10) \uc0\u1047 \u1072 \u1087 \u1080 \u1089 \u1080  \u1091 \u1087 \u1088 \u1072 \u1074 \u1083 \u1077 \u1085 \u1080 \u1103  \u1072 \u1074 \u1090 \u1086 \u1084 \u1086 \u1073 \u1080 \u1083 \u1103 \u1084 \u1080  \u1087 \u1086  \u1074 \u1086 \u1076 \u1080 \u1090 \u1077 \u1083 \u1103 \u1084 \
select FIO, Dolzhnost, created_at, marka, gosnomer from "Sotrudnik_id" as s\
join "Zapisi" as z on z.Voditeli_id = s.id\
join "Vedomost" as v on v.id = z.Vedomost_id\
join "Avto" as a  on a.id = z.Avto_id\
order by FIO, created_at;}