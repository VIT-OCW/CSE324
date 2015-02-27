/*														
Basic instructions
----------------------
1)Never forget to start PL/SQL with
		SQL> set serveroutput on;
		
2)To drop a Function type
		SQL>Drop Function <Function_Name>;
		
3)To drop a Procedure type
		SQL>Drop Procedure <Procedure_Name>;
		
4)If You get an error like this
		"Warning:Procedure created with compilation errors."
  Try this to see the error in your code  
		SQL> show errors procedure <procedure_name>;
*/														

//1.
SQL> set serveroutput on
SQL> declare
  2  n number:=100;
  3  begin
  4  while(n>0) loop
  5  if mod(n,2)=0 then
  6  dbms_output.put_line(n);
  7  end if;
  8  dbms_output.new_line;
  9  n := n-1;
 10  end loop;
 11  end;
 12  /

//2.
SQL> declare
  2  n number;
  3  temp number;
  4  rev number:=0;
  5  rem number;
  6  begin
  7  n:=&n;
  8  temp:=n;
  9  while(temp>0) loop
 10  rem:=mod(temp,10);
 11  rev:=rev*10 + rem;
 12  temp:=trunc(temp/10);
 13  end loop;
 14  if n=rev then
 15  dbms_output.put_line('The given number '||n||' is a palindrome');
 16  else
 17  dbms_output.put_line('The given number '||n||' is not a palindrome');
 18  end if;
 19  end;
 20  /

//3.
SQL> create function dept_details return number is
  2  avg_sal number;
  3  max_sal number;
  4  min_sal number;
  5  dept_name department.department_name%type;
  6  dnum department.department_number%type;
  7  begin
  8  select department_number into dnum from department where department_name='&dept_name';
  9  select avg(salary),max(salary),min(salary) into avg_sal,max_sal,min_sal from employee where department_number = dnum;
 10  dbms_output.put_line('Average salary:'||avg_sal);
 11  dbms_output.put_line('Max salary:'||max_sal);
 12  dbms_output.put_line('Min salary:'||min_sal);
 13  return 1;
 14  end;
 15  /


SQL> declare
  2  flag number;
  3  begin
  4  flag:=dept_details;
  5  end;
  6  /


//4.
SQL> create function facto(x number) return number is
  2  fact number:=1;
  3  begin
  4  if x=0 then
  5  fact:=1;
  6  else
  7  for i in 1..x loop
  8  fact := fact * i;
  9  end loop;
 10  end if;
 11  return fact;
 12  end;
 13  /


SQL> declare
  2  n number;
  3  result number;
  4  begin
  5  n :=&n;
  6  result:=facto(n);
  7  dbms_output.put_line('Factorial of '||n||' is '||result);
  8  end;
  9  /


//5.
SQL>  create procedure details(fname in employee.first_name%type,lname in employee.last_name%type) is
  2   dnum department.department_number%type;
  3   dname department.department_name%type;
  4   begin
  5   select department_name,department_number into dname,dnum from employee natural join department where first_name=fname and last_name=lname;
  6   dbms_output.put_line('Details of department of employee:'||fname||' '||lname);
  7   dbms_output.put_line('Department Name:'||dname);
  8   dbms_output.put_line('Department Number:'||dnum);
  9   end details;
 10   /



SQL> execute details('Doug','Gilbert');
