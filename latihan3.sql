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




select k.kode_karyawan,nama_lengkap,l.street_address||' ,'||l.city AS "Alamat Rumah"
       ,l.street_address||' ,'||l.city AS "Alamat Domisil",d.department_name,j.job_title
from 
       karyawan_tdi k 
       join locations l on (k.alamat_rumah=l.location_id)
       join jobs j on (k.jabatan=job_id)
       join departments d on (k.bagian=department_id)
       where k.alamat_rumah=l.location_id 
       and l.location_id=alamat_domisili






insert into  karyawan_tdi values(2,'Dimas Maryanto',6232,6230,'IT_PROG',60);
insert into karyawan_tdi values(3,'Hari Sapto',6233,6233,'IT_PROG',60);
insert into karyawan_tdi values(4,'Hari Sapto Adi',6220,6220,'IT_PROG',60);
insert into karyawan_tdi values(5,'Arip Permana',6233,6233,'AD_PRES',90);
insert into karyawan_tdi values(6,'Zera',6233,6233,'HR_REP',10);


select k.kode_karyawan,nama_lengkap,l.street_address||' ,'||l.city AS "Alamat Rumah"
       ,l.street_address||' ,'||l.city AS "Alamat Domisil",d.department_name,j.job_title
from 
       karyawan_tdi k 
       inner join locations l on (k.alamat_rumah=l.location_id)
       inner join jobs j on (k.jabatan=job_id)
       inner join departments d on (k.bagian=department_id)
       where k.alamat_rumah=l.location_id 
       and l.location_id=alamat_domisili
       and j.job_id=k.jabatan
       and d.department_id=k.bagian

select
      k.nama_lengkap,e.first_name||' '||e.last_name as "Nama",
      j.job_title,l.street_address||' ,'||l.city AS "cocat",
      d.department_name
from 
      karyawan_tdi k join jobs j on (k.jabatan=j.job_id)
      join locations l on (k.alamat_rumah=l.location_id)
      join employees e on (j.job_id=e.job_id)
      join departments d on (e.department_id=e.department_id)
      where e.job_id='IT_PROG'




       