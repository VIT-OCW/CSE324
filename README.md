# CSE324 Cycle Sheet
Database Systems Lab
###Aim: To study Data Definition and Data Manipulation commands.

Consider the following schema:

Table Name: Employee

|Attribute         |Data Type    |
|:----------------:|:-----------:|
|First Name        |VARCHAR2(15) |
|Mid Name          |CHAR(2)      |
|Last Name         |VARCHAR2(15) |
|SSN Number        |CHAR(9)      |
|Birthday          |DATE         |
|Address           |VARCHAR2(50) |
|Sex               |CHAR(1)      |
|Salary            |NUMBER (7)   |
|Supervisor SSN    |CHAR(9)      |
|Department Number |NUMBER (5)   |

Table Name: Department

|Attribute| Data Type|
|:-----------:|:-----------------:|
|Department| Name Varchar2(15)|
|Department| Number Number(5)|
|ManagerSSN| CHAR(9)|
|ManageStartDate| DATE|

Table Name: Project

|Attribute| Data Type|
|:-------------:|:------------:|
|Project Name| VARCHAR2(15)|
|Project Number| NUMBER(5)|
|Project Location| VARCHAR2(15)|
|Department Number| NUMBER(5)|

Table name: Employee

|FName|Middle name|LName|SSN|BDate|Address|Sex|Salary|SuperSSN|DepNo|
|:------:|:-:|:-------:|:-------:|:--------:|:-----------------------------:|:-:|:---:|:--------:|:-:|
|Doug    | E|  Gilbert| 554433221| 09-JUN-60| 11 S 59 E, Salt Lake City, UT |M |80000 |NULL      |3|
|Frankin | T|  Wong   | 333445555| 08-DEC-45| 638 Voss, Houston, TX         |M |40000 |554433221 |5|
|Jennifer| S|  Wallace| 987654321| 20-JUN-31| 291 Berry, Bellaire, TX       |F |43000 |554433221 |4|
|Johny   | B|  Smith  | 123456789| 09-JAN-55| 731 Fondren, Houston, TX      |M |30000 |333445555 |5|
|Ramesh  | K|  Narayan| 666884444| 15-SEP-52| 975 Fire Oak, Humble, TX      |M |38000 |333445555 |5|
|Joyce   | A|  English| 453453453| 31-JUL-62| 5631 Rice, Houston, TX        |F |25000 |333445555 |5|
|James   | E|  Borg   | 888665555| 10-NOV-27| 450 Stone, Houston, TX        |M |55000 |543216789 |1|
|Alicia  | J|  Zelaya | 999887777| 19-JUL-58| 3321 Castle, Spring, TX       |F |25000 |987654321 |4|
|Ahmad   | V|  Jabbar | 987987987| 29-MAR-59| 980, Dallas, Houston, TX      |M |25000 |987654321 |4|
|Joyce   |NULL|  PAN    | 543216789| 07-FEB-78| 35 S 18 E, Salt Lake City, UT |F |70000 |NULL      |2|


Data for Department:

|DName|DepNo|MgrSSN|MgrStartDate|
|:------------:|:-:|:-------:|:--------:|
|Manufacture   | 1| 888665555| 19-JUN-71|
|Administration| 2| 543216789| 04-JAN-99|
|Headquarter   | 3| 554433221| 22-SEP-55|
|Finance       | 4| 987654321| 01-JAN-85|
|Research      | 5| 333445555| 22-MAY-78|


Data for Project:

|PName| PNumber| Plocation| DepNo|
|:-------:|:----:|:---------:|:----:|
|ProjectA| 3388| Houston| 1|
|ProjectB| 1945| Salt Lake City| 3|
|ProjectC| 6688| Houston| 5|
|ProjectD| 2423| Bellaire| 4|
|ProjectE| 7745| Sugarland| 5|
|ProjectF| 1566| Salt Lake City| 3|
|ProjectG| 1234| New York| 2|
|ProjectH| 3467| Stafford| 4|
|ProjectI| 4345| Chicago| 1|
|ProjectJ| 2212| San Francisco| 2| 


Exercise-I: (outcome: b,i, c and k)

1. Insert the data given above in employee, department and project tables. –b,i
2. Retrieve all the employees’ information for a particular department number - k
3. Get Employee name along with his SSN and Supervisor SSN. - k
4. Retrieve the employee names whose bdate is ’29-MAR-1959’. - k
5. Get salaries of the employees without duplications. - k
6. Retrieve the MgrSSN, MgrStartDate of the manager of ‘Research’ department. - k
7. Change the department number of an employee having fname as ‘Joyce’ to 3 – b,i
8. Alter Table department add column ContactNo of NUMBER data type and insert
   values into this column only. – b,i
9. Change table department by modifying the size of field ContactNo. – b,i
10. Modify the field name ContactNo of departments table to MobileNo. – b,i
11. Change name of Table Department to DEPT. - c
12. Alter Table department by removing column MobileNo. – b,i
13. Create a table COPYOFDEPT as a copy of the table DEPT. - c
14. Remove the rows from COPYOF DEPT table with department number as 5. – b,i
15. Remove COPYOF DEPT table. - c

##Exercise 2

//Table for Employee:

|Attribute| Data Type| Constraint|
|:-------:|:--------:|:----------:|
|First Name| Varchar (15) |Not Null|
|Mid Name| Char(2)|
|Last Name| Varchar (15) |Not Null|
|SSN Number| Char (9) |Primary Key|
|Birthday| Date| |
|Address| Varchar (50)| |
|Sex| Char(1)| Sex In (M,F,m,f)|
|Salary| Number (7) |Default 800|
|Supervisor SSN| Char (9)| Foreign Key Employee (SSN) on delete set null|
|Department number| Number(5)| Foreign key to department number of department table on delete cascade|

//Table for Department

|Attribute| Data type |Constraint|
|:--------:|:---------:|:----------:|
|Department Name| Varchar(15) |Not Null|
|Department number| Number(5) |Primary key|
|Manager SSN| Char (9) |Foreign key-Employee (SSN) on delete set null|
|Manage start date| Date| |

Table Name : Dept_locations

|Attribute| Data type| Constraint|
|:---------:|:--------:|:--------:|
|Department Number| Number(5)| Department (dep no) on delete cascade|
|Department Location| Varchar (15)| |

Table Name: Project

|Attribute| Data type |Constraint|
|:----------:|:------------:|:----------:|
|Project Name| Varchar2(15)| Not Null|
|Project number| Number(5)| Primary key|
|Project Location| Varchar2(50)| |
|Department Number| Number(5) |Foreign Key –Department (depno ) on delete set null|

Table Name: Works_On


###The combination of Employee SSN and Project Number must be a Primary Key

|Attribute| Data type |Constraint|
|:------:|:--------:|:-------:|
|Employee SSN |Char (9) |Foreign Key Employee (SSN) on delete cascade|
|Project number |INT(5) |Foreign Key project ( Pnumber ) on delete cascade|
|Hours |Decimal (3,1) |Not null|

Name: Dependent

###The combination of Employee SSN and Dependent Name must be a Primary Key.

|Attribute| Datatype |Constraint|
|:------:|:--------:|:-------:|
|Employee| Char (9)| Foreign Key- Employee (SSN) on delete cascade|
|Dependent Name| Varchar(15)| |
|Sex |Char(1) |Check Sex in (M,F,m,f)|
|Birthday| Date| |
|Relationship| Varchar(8)| |


Data for table - Dept_Locations

|Dep No| D Location|
|:----:|:------:|
|1| Houston|
|1| Chicago|
|2| New York|
|2| San Francisco|
|3| Salt Lake City|
|4| Stafford|
|4| Bellaire|
|5| Sugarland|
|5| Houston|

Data for Table - Works_On


|ESSN| Pno| Hours|
|:-----:|:-------:|:-----:|
|123456789| 3388| 32.5|
|123456789| 1945| 7.5|
|666884444| 3388| 40.0|
|453453453| 7745| 20.0|
|453453453| 2212| 20.0|
|333445555| 7745| 10.0|
|333445555| 6688| 10.0|
|333445555| 4345| 35.0|
|333445555| 2212| 28.5|
|999887777| 2212| 11.5|
|543216789| 2212| 17.0|
|554433221| 1945| 21.5|

Data for Table - Dependent


|ESSN| Dependent_name| Sex| Bdate |Relationship|
|:------:|:--------:|:-----------:|:--------:|:-------:|
|333445555| Alice| F| 05-Apr-76 |Daughter|
|333445555| Theodore| M| 25-Oct-73 |Son|
|333445555| Joy| F| 03-May-48 |Spouse|
|987654321| Abner| M| 29-Feb-32 |Spouse|
|123456789| Alice| F| 31-Dec-78 |Daughter|
|123456789| Elizabeth| F| 05-may-57 |Spouse|

Execute the following Queries on the Db to note the violations integrity constraints by any of the following operations

1. Insert ('Robert', 'F', 'Scott', '987987987 ', '21-JUN-42', '2365 Newcastle Rd, Bellaire, TX',
M, 58000, '888665555', 1 ) into EMPLOYEE.
2. Insert ('Ramez', 'F', 'Scott', ' ', '21-JUN-42', '2365 Newcastle Rd, Bellaire, TX', M, 58000, '888665555', 1 ) into EMPLOYEE.
3. Insert ( '677678989', null, '40.0' ) into WORKS_ON.
4. Insert ( '453453453', 'John', M, '12-DEC-60', 'SPOUSE' ) into DEPENDENT
5. Insert ( '343453453', 'Varun',’’, '12-DEC-60', 'SON' ) into DEPENDENT
6. Delete WORKS_ON tuples with ESSN= '333445555'.
7. Modify MGRSSN and MGRSTARTDATE of the DEPARTMENT tuple with DNUMBER=5 to '123456789' and '01-OCT-88', respectively.

Alter the tables to

1. Enforce Foreign Keys using Alter command [if not done earlier].
2. Remove foreign key defined on SuperSSN and enforce it again using Alter table command.
3. Make name of Project as Unique and sex of employee as not null.
4. Make salary of employee to accept real values.

Exercise: III (outcome: e)

Operators and Functions

Aim: To understand different operators and types of functions in SQL

Execute the following queries based on the schema specified in exercise 1

1. Find the female employee names having salary greater than Rs.25000.
2. Find the employee names whose salary falls in the range of 30000 and 70000.
3. Find all the employees who have no supervisor.
4. Display the bdate of all employees in the format ‘DDthMonthYYYY’.
5. Get the employee names whose bdate not later than 1978.
6. Retrieve the employee names whose first name start with ‘J’ and have 5 characters in total.
7. Find the employee details whose middle initial is null.
8. Get the male employee details whose address contains sub string ‘Houston’.
9. Display the department names that ends with ‘e’.
10. Display the names of all the employees having supervisor with any of the following SSN 554433221, 333445555.
11. Display all the department names in upper case and lower case.
12. Display the first four characters and last four characters of the department names using substring function.
13. Display the substring of the address (starting from 5th position to 11 th position) of all employees.
14. Display the Mgrstartdate on adding two months to it.
15. Display the age of all the employees rounded to two digits.
16. Find the last day and next day of the month in which each manager has joined.
17. Print a substring ‘aman’ from the string ‘Ramana’.
18. Replace the string ‘na’ from ‘Ramana’ by ‘sri’.
19. Print the length of all the department names.
20. Print the system date in the format 25 th May 2014.
21. Display the date after 8 months from current date.
22. Display the next occurrence of Friday in this month.23. Display the project location padded with **** on left side.
24. Remove the word ‘Project’ from the project name and display it.
25. Select the SSN of the employee whose dependent name is either Michael or Abner.

Exercise: IV (outcome: e)

Group Functions

1. How many different departments are there in the ‘employee’ table
2. For each department display the least and highest employee salaries along with department name.
3. Print the number of projects on which each employee is working on.
4. Retrieve total number of hours spent on projects by each employee.
5. Count the number of employees over 30 age.
6. Display the department name which contains more than 3 employees.
7. Calculate the average salary of employees by department and age.
8. Count the number of dependents for each employee.
9. List out the employees based on their seniority.
10. List out the employees who works in ‘manufacture’ department group by first name

Exercise: V (outcome: k )

Sub Query and View

Aim: to understand the concept of Sub queries and logical tables in oracle
1. Display the employee who is getting highest salary in the department Research.
2. Find the employees who earn the same salary as the minimum salary for each department.
3. Retrieve the employees whose salary is greater than average salary of department 2.
4. List out the employee that has got maximum number of dependents.
5. Find out the project name having least number of employees working on it.
6. Find minimum average salary for each department.
7. Create a view to display the employee details who is working in either Finance or IT department.
8. Create a logical table to store male employee details ranging salary between 20000 and 30000.
9. Create a logical table to store employee number who works on maximum number of projects.
 
Exercise: VI (outcome: k)

Joins

Aim: To understand how to relate and access data from multiple tables.

###Consider the schema given in exercise 2, and execute the following queries

1. Display the names of all employees in department 5 who work more than 10 hours per week on ProductX project.
2. List the names of all employees who have a dependent with the same first name as themselves.
3. Find the names of all the employees who are directly supervised by ‘Franklin Wong’.
4. Retrieve the names of all who do not work on any project.
5. Find the names and addresses of all employees who work on at least one project located in Houston but whose department has no location in Houston.
6. Display the names of all managers who have no dependents.
7. List the employee’s names and the department names if they happen to manage a department.
8. For each department retrieve project number, and project name.
9. For each project, list the project name and the total hours per week (by all employees) spent on that project.
10. Get the names of the employees who have 2 or more dependents.Mini Project (Start after CAT-I) (outcome: m)

Choose a Mini Project and apply the data base concepts as given below.

1. Draw ER Diagram
2. ER-to -Relational Mapping
3. Table Creation
4. Establish the relationship between relevant tables
5. Apply Normalization (if necessary)
6. Create GUI
7. Establish Connection between front end and back end as Oracle (Choose any front end tool like VB,VC++, .NET ,Java etc.,)
8. Prepare Project Report
9. Demonstration & Presentation(PPT)

Sample Projects:

1. Library Management System
2. Airline Reservation System
3. Hospital Management System
4. Proctor Management System
5. Inventory Management System
