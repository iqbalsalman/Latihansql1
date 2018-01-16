--1
insert into countries values('ID','Indonesia',3)

--2
insert into locations values(6232,'cinunuk','40526','Kab. Bandung','Ja5a Barat','ID');
insert into locations values(6231,'Ujung Berung','40521','Kab. Bandung','Jawa Barat','ID');	
insert into locations values(6233,'Margahayu Raya','40625','Kab. Bandung','Jawa Barat','ID');
insert into locations values(6230,'Blok M','40620','Jakarta Selatan','DKI Jakarta','ID');
insert into locations values(6220,'Slipi','40521','Jakarta Utara','DKI Jakarta','ID');


--3
update employees set commission_pct='0.10'
where job_id='IT_PROG' and employee_id(104)


--4
	create table karyawan_tdi(
     kode_karyawan INTEGER  PRIMARY KEY NOT NULL,
     nama_lengkap varchar(50) not null,
     alamat_rumah INTEGER not null,  
     alamat_domisil INTEGER not null,
     jabatan varchar(10) not null,
     bagian  INTEGER not null
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


--5

insert into  karyawan_tdi values(2,'Dimas Maryanto',6232,6230,'IT_PROG',60);
insert into karyawan_tdi values(3,'Hari Sapto',6233,6233,'IT_PROG',60);
insert into karyawan_tdi values(4,'Hari Sapto Adi',6220,6220,'IT_PROG',60);
insert into karyawan_tdi values(5,'Arip Permana',6233,6233,'AD_PRES',90);
insert into karyawan_tdi values(6,'Zera',6233,6233,'HR_REP',10);

--6

select k.kode_karyawan,nama_lengkap,l.street_address||' ,'||l.city AS "Alamat Rumah"
       ,l.street_address||' ,'||l.city AS "Alamat Domisil",d.department_name,j.job_title
from 
       karyawan_tdi k 
       inner join locations l on (k.alamat_rumah=l.location_id)
       inner join jobs j on (k.jabatan=job_id)
       inner join departments d on (k.bagian=department_id)

--7

select k.nama_lengkap,l.street_address||' ,'||l.city as alamat_lengkap
       ,d.department_name,j.job_title
from 
       karyawan_tdi k 
       inner join locations l on (k.alamat_rumah=l.location_id)
       inner join jobs j on (k.jabatan=job_id)
       inner join departments d on (k.bagian=department_id)
       where k.jabatan='IT_PROG' 
       union all
       select e.first_name||' '|| e.last_name nama_lengkap,l.street_address||' ,'||l.city as alamat_lengkap
       ,d.department_name,j.job_title
      
from 
       employees e 
       inner join jobs j on (j.job_id=e.job_id) 
       inner join departments d on (e.department_id=d.department_id)
       inner join locations l on (d.location_id=l.location_id)
       where j.job_id='IT_PROG'
       order by alamat_lengkap desc




       