CREATE TABLE Deliveror
(
  did INT NOT NULL,
  PRIMARY KEY (did)
);

CREATE TABLE Drone
(
  is_functional INT NOT NULL,
  did INT NOT NULL,
  PRIMARY KEY (did),
  FOREIGN KEY (did) REFERENCES Deliveror(did)
);

CREATE TABLE Repairman
(
  Wid INT NOT NULL,
  PRIMARY KEY (Wid),
  FOREIGN KEY (Wid) REFERENCES Worker(Wid)
);

CREATE TABLE checkup
(
  check_date DATE NOT NULL,
  with_repair INT NOT NULL,
  Wid INT NOT NULL,
  did INT NOT NULL,
  PRIMARY KEY (check_date, Wid, did),
  FOREIGN KEY (Wid) REFERENCES Repairman(Wid),
  FOREIGN KEY (did) REFERENCES Drone(did)
);



--1
alter table Deliveryboy
add did int;
--2
update Deliveryboy
set did = rownum;
commit;
--3
alter table Deliveryboy
add constraint db_fk_did foreign key(did) references deliveror(did);
--4
alter table Deliveryboy
add constraint db_unik_did unique(did);

--1
alter table delivery_order
add did int;
--2
update delivery_order do
set did = (select did from delivery_boy db where db.wid = do.wid);
--3
alter table delivery_order
drop column wid;
--4
alter table delivery_order
add constraint do_fk_did foreign key(did) references deliveror(did);



