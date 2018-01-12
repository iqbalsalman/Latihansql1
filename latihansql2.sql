
-- Latihan2


SELECT e.employee_id AS "Kode Karyawan",e.first_name||' '||e.last_name AS "Nama Lengkap"
, d.department_name "Nama Department", 
salary "Gaji Bulanan",
  CASE  WHEN
        e.commission_pct IS NULL
           THEN  'Tidak Memiliki komisi'
        ELSE
        to_char(e.commission_pct+e.salary,'999,99.0')
           END AS KOMISI,
         to_char(e.commission_pct+e.salary+e.salary,'999,99.0') AS "Gajih di Terima" 

   from
    employees
    e join departments d on
    (e.department_id=d.department_id)
    where e.commission_pct is not Null or e.commission_pct is null
   group by e.first_name,e.last_name,d.department_name,e.salary,commission_pct,e.employee_id
   order by e.salary asc


select e.employees_id AS "Kode Karyawan", 
	   e.first_name||' '||e.last_name AS nama_karyawan,
	   d.department_name AS "Nama Bagian",
	     case when 
	       e.manager_id is null then 
	       THEN 'Saya tidak punya manager'
	       else e.first_name||' '||e.last_name end manager_name ,
	       j.job_title AS "Nama Jabatan" 
 from 
      employees
	  e left join jobs j on (j.job_id=e.job_id)
	  right join departments d (e.department_id=d.department_id) 
      order by e.first_name||' '||e.last_name,
      e.first_name||' '||e.last_name desc


select e.employee_id AS "Kode Karyawan", 
	   e.first_name||' '||e.last_name AS nama_karyawan,
	   d.department_name AS "Nama Bagian",
	     case when 
	       e.manager_id is null 
	       THEN 'Saya tidak punya manager'
	       else e.first_name||' '||e.last_name end manager_name ,
	       j.job_title AS "Nama Jabatan" 
 from 
      employees
	  e inner join jobs j on (j.job_id=e.job_id)
	  inner join departments d on (e.department_id=d.department_id)
	  group by  e.first_name||' '||e.last_name,e.employee_id,
          d.department_name,j.job_title 
      order by e.first_name||' '||e.last_name,
      e.first_name||' '||e.last_name desc

select 
      d.department_id dep_id,
      d.department_name department_name,
      e.salary as "Total gaji"
  from 
      employees e
      join departments d on (e.department_id=d.department_id)
      group by d.department_id,d.department_name,e.salary
      having max(e.salary)>= max(salary)
      order by d.department_id desc,
       max(e.salary) desc 


 select 
       select salary*12 as Gaji setahun
       ,count(employee_id) as "Jumlah Karyawan"
       from employees
       group by count(employee_id)
       having max(e.salary)>= max(salary)
       order by salary desc, max(e.salary) desc 

 select 
	  salary*12 as "Gaji setahun"
	  ,count(employee_id) as "Jumlah Karyawan"
  from 
      employees
	  group by salary
	  having max(salary)>= min(salary)
	  order by salary desc, max(salary) desc 


  select * from 
           employees e
           join departments d 
           on (e.department_id=d.department_id)
           where e.job_id='IT_PROG'
           group by e.employee_id,d.department_id
           order by e.salary desc, max(e.salary) desc 


  select * from 
           employees e
           join departments d 
           on (e.department_id=d.department_id)
           where e.job_id='IT_PROG' 
           order by e.employee_id,d.department_id desc