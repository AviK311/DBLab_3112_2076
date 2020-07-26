import xml.etree.ElementTree as ET
import random


insert_str = """insert into TGOLDSHM.ORDER_PRODUCT (AMOUNT, PID, OID)
values ({amount}, {pid}, {oid});

"""

oid_root = ET.parse('oid.xml').getroot()
oid_list = [child[0].text for child in oid_root]

pid_root = ET.parse('pid.xml').getroot()
pid_list = [child[0].text for child in pid_root]

amount_dist = [1]*10 + [2]*3 + [3]*2 + [4]*1

f = open("insert_order_product.sql",'w')

used = set()


for oid in oid_list:
    pid = random.choice(pid_list)
    f.write(insert_str.format(oid=oid,
                              amount= random.choice(amount_dist),
                              pid= pid))
    used.add((oid, pid))

f.write("--From here is duplicates\n\n") 

for _ in range(len(oid_list)):
    pid, oid = list(used)[0]
    while (oid, pid) in used:
        pid = random.choice(pid_list)
        oid = random.choice(oid_list)
    f.write(insert_str.format(oid=oid,
                              amount= random.choice(amount_dist),
                              pid= pid))
    used.add((oid, pid))

f.close()

