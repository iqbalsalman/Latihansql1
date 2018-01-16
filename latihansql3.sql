CREATE OR REPLACE FUNCTION hitung_angka2(p1 INT, p2 INT, p3 INT)
   RETURNS NUMERIC

   as $$
     BEGIN
        RETURN p1+p2+p3;

        end; $$ 
        language 'plpgsql';



 CREATE OR REPLACE FUNCTION GET_Employees1(paramenter varchar(225), paramen varchar(225))
       RETURNS table (
        first_name varchar(20),
        last_name varchar(20)

       	)
      as $$
        BEGIN
            return QUERY
             SELECT e.first_name,e.last_name from employees 
             where e.first_name like paramenter and e.last_name like paramen;
             end; $$
            language 'plpgsql';


      CREATE OR REPLACE FUNCTION GET_Employees2(x varchar(225),y INT)
             RETURNS table (
       	     FullName varchar(225),
             salary NUMERIC
            )

      as $$
        BEGIN
        if x='Lebih_kecil' then
         return QUERY
             SELECT (e.first_name||' '||e.last_name):: varchar(225) as salman,e.salary  from employees e
             where e.salary<y;
        elseif x='Lebih_besar' then
         return QUERY
        SELECT (e.first_name||' '||e.last_name):: varchar(225) as salman,e.salary  from employees e
             where e.salary>y;
        elseif x='sama_dengan' then
         return QUERY
            SELECT (e.first_name||' '||e.last_name):: varchar(225) as salman,e.salary  from employees e
            where e.salary=y;
            end if;
             end; $$
            language 'plpgsql';


   CREATE OR REPLACE FUNCTION GET_Employees3(x varchar(225),y INT, s Integer[])
             RETURNS table (
       	     FullName varchar(225),
             salary NUMERIC,
             employee_id Integer
            )

         as $$

               BEGIN

        case x
		        when 'Lebih_kecil' then

		         return QUERY

		        SELECT (e.first_name||' '||e.last_name):: varchar(225) as salman,
		                e.salary,e.employee_id 
		        from    
		                employees e
		                where e.salary<y and e.employee_id=s;

		        when 'Lebih_besar' then

		        return QUERY

		        SELECT (e.first_name||' '||e.last_name):: varchar(225) as salman,
		                e.salary,e.employee_id  
		        from   
		                employees e
		                where e.salary>y and e.employee_id=s;

		        when 'sama_dengan' then

		         return QUERY

		            SELECT (e.first_name||' '||e.last_name):: varchar(225) as salman,
		                    e.salary, e.employee_id  
		            from 
		                    employees e
		                    where e.salary=y and e.employee_id=s;

		            end case;

		            end; $$

		            language 'plpgsql';


  CREATE OR REPLACE FUNCTION GET_Employees4(x varchar(225),y INT, s int[])
             RETURNS table (
       	     FullName varchar(225),
             salary NUMERIC,
             employee_id Integer
            )

         as $$

               BEGIN

        case x
		        when 'Lebih_kecil' then

		         return QUERY

		        SELECT (e.first_name||' '||e.last_name):: varchar(225) as salman,
		                e.salary,e.employee_id 
		        from    
		                employees e
		                where e.salary<y and e.employee_id=ANY(s);

		        when 'Lebih_besar' then

		        return QUERY

		        SELECT (e.first_name||' '||e.last_name):: varchar(225) as salman,
		                e.salary,e.employee_id  
		        from   
		                employees e
		                where e.salary>y and e.employee_id=ANY(s);

		        when 'sama_dengan' then

		         return QUERY

		            SELECT (e.first_name||' '||e.last_name):: varchar(225) as salman,
		                    e.salary, e.employee_id  
		            from 
		                    employees e
		                    where e.salary=y and e.employee_id=AN(s);

		            end case;

		            end; $$
		            language 'plpgsql';



  CREATE OR REPLACE FUNCTION hitung_angka3(sama varchar(225), p2 INT, p3 INT)
   RETURNS NUMERIC

   as $$
     BEGIN
      case sama
      when 'Tambah' then
      RETURN p2+p3;
      when 'Kurang' then
      RETURN p2-p3;
      when 'Kali' then
      RETURN p2*p3;
      when 'Bagi' then
      RETURN p2/p3;
      end case;

        end; $$ 
        language 'plpgsql';

 CREATE OR REPLACE FUNCTION hitung_angka4(sama varchar(225), p2 int[])
   RETURNS NUMERIC

   as $$
           DECLARE R INT;
     BEGIN
      case sama
      when 'Tambah' then
      R=0;
      for i IN 1.. array_upper(p2,1) loop
      R= R+p2[i];
      end loop;
      return R;
      when 'Kurang' then
      R=0;
      for i IN 1.. array_upper(p2,1) loop
      R= R-p2[i];
      end loop;
      return R;
      when 'Kali' then
      R=0;
      for i IN 1.. array_upper(p2,1) loop
      R= R*p2[i];
      end loop;
      return R;
      when 'Bagi' then
      R=0;
      for i IN 1.. array_upper(p2,1) loop
      R= R/p2[i];
      end loop;
      return R;
      end case;

        end; $$ 
        language 'plpgsql';









    
 