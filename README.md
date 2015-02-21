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
