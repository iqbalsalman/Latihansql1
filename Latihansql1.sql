 select *from employees 
  order by email desc 


  SELECT *FROM EMPLOYEES WHERE SALARY>3200 AND SALARY>12000 

  SELECT *FROM EMPLOYEES WHERE EMPLOYEE_ID IN (103,115,196,187,102,100)
  SELECT *FROM EMPLOYEES WHERE  first_NAME LIKE 'A%'

  SELECT *FROM EMPLOYEES WHERE  last_NAME LIKE '_u%'

  select distinct department_id from employees

 select first_name||' '||last_name as "Nama Lengkap",
department_id as "Kode Jabatan" from employees
where manager_id=100

select last_name as "Nama Belakang", salary as "Gaji Perbulan", department_id as "Kode Jabatan" from employees
where salary not in (salary*commission_pct)


select * from employees where job_id not in ('IT_PROG','SH_CLERK')

select * from employees where job_id not in ('IT_PROG','SH_CLERK')