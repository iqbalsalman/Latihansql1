insert into countries values('ID','Indonesia',3)

insert into locations values(6232,'cinunuk','40526','Kab. Bandung','Ja5a Barat','ID');
insert into locations values(6231,'Ujung Berung','40521','Kab. Bandung','Jawa Barat','ID');	
insert into locations values(6233,'Margahayu Raya','40625','Kab. Bandung','Jawa Barat','ID');
insert into locations values(6230,'Blok M','40620','Jakarta Selatan','DKI Jakarta','ID');
insert into locations values(6220,'Slipi','40521','Jakarta Utara','DKI Jakarta','ID');


update employees set commission_pct='0.10'
where job_id='IT_PROG'



	create table karyawan_tdi(
     kode_karyawan INTEGER  PRIMARY KEY NOT NULL,
     nama_lengkap varchar(50),
     alamat_rumah INTEGER,
     alamat_domisil INTEGER,
     jabatan varchar(10),
     bagian  INTEGER
		);



ALTER table locations add  alamat_rumah INTEGER
ALTER table locations add  alamat_domisili INTEGER
ALTER table jobs      add  jabatan_varchar(10) 
ALTER table departments add  bagian INTEGER

ALTER TABLE karyawan_tdi
ADD CONSTRAINT fk_Karyawan_tdi_location_id FOREIGN KEY (alamat_rumah)
REFERENCES locations (location_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE karyawan_tdi
ADD CONSTRAINT fk_Karyawan_tdi_alamat_domisili FOREIGN KEY (alamat_domisili)
REFERENCES locations (location_id) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE karyawan_tdi
ADD CONSTRAINT fk_Karyawan_tdi_jabatan FOREIGN KEY (jabatan)
REFERENCES jobs(job_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE karyawan_tdi
ADD CONSTRAINT fk_Karyawan_tdi_bagian FOREIGN KEY (bagian)
REFERENCES departments(department_id) ON UPDATE CASCADE ON DELETE CASCADE;






insert into  karyawan_tdi values(2,'Dimas Maryanto',6232,6230,'IT_PROG',60);
insert into karyawan_tdi values(3,'Hari Sapto',6233,6233,'IT_PROG',60);
insert into karyawan_tdi values(4,'Hari Sapto Adi',6220,6220,'IT_PROG',60);
insert into karyawan_tdi values(5,'Arip Permana',6233,6233,'AD_PRES',90);
insert into karyawan_tdi values(6,'Zera',6233,6233,'HR_REP',10);
