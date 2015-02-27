/* Author: Reetika Roy */
//1.
SQL> Declare
  2  emp_fname employee.first_name%type;
  3  emp_lname employee.last_name%type;
  4  cursor emp_super is select first_name,last_name from employee where supervisor_ssn is null;
  5  begin
  6  open emp_super;
  7  loop
  8  fetch emp_super into emp_fname,emp_lname;
  9  exit when emp_super%notfound;
 10  dbms_output.put_line(emp_fname||' ' ||emp_lname);
 11  end loop;
 12  close emp_super;
 13  end;
 14  /

//2.
SQL> Declare
  2  emp_fname employee.first_name%type;
  3  emp_lname employee.last_name%type;
  4  cursor emp_super is select first_name,last_name from employee join department on ssn_number=manager_ssn;
  5  begin
  6  open emp_super;
  7  loop
  8  fetch emp_super into emp_fname,emp_lname;
  9  exit when emp_super%notfound;
 10  dbms_output.put_line(emp_fname||' ' ||emp_lname);
 11  end loop;
 12  close emp_super;
 13  end;
 14  /