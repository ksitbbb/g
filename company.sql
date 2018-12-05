Q5
Consider the schema for Company Database:
EMPLOYEE(SSN, Name, Address, Sex, Salary, SuperSSN, DNo)
DEPARTMENT(DNo, DName, MgrSSN, MgrStartDate)
DLOCATION(DNo,DLoc)
PROJECT(PNo, PName, PLocation, DNo)
WORKS_ON(SSN, PNo, Hours)

mysql> create table department (dno integer(3) primary key, dname varchar(15), mgrstartdate date);
Query OK, 0 rows affected (0.08 sec)

mysql> create table employee (ssn integer(4) primary key, name varchar(15), address varchar(30), sex varchar(1), salary float(15), superssn integer(4), foreign key(superssn) references employee(ssn), dno integer(3), foreign key(dno) references department(dno));
Query OK, 0 rows affected (0.08 sec)

mysql> alter table department add column mgrssn integer(4) ;
mysql> alter table department add  foreign key(mgrssn) references employee(ssn);
Query OK, 0 rows affected (0.34 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>  create table dlocation (dno integer(3),  foreign key  (dno) references department(dno), dloc varchar(15), primary key(dno,dloc));
Query OK, 0 rows affected (0.27 sec)

mysql> create table project(pno integer(2) primary key, pname varchar(15), plocation varchar(15), dno integer(3), foreign key(dno) references department(dno));
Query OK, 0 rows affected (0.22 sec)

mysql> create table works_on (ssn integer(4), foreign key(ssn) references employee(ssn), pno integer(2), foreign key(pno) references project(pno), hours integer(5), primary key(ssn,pno));
Query OK, 0 rows affected (0.13 sec)

mysql> insert into department (dno,dname,mgrstartdate) values (1,'Accounts','2017-02-12'),(2,'Finance','2017-02-10'),(3,'HR','2017-03-23'),(4,'Admin','2015-05-12'),(5,'Payroll','2012-02-12'),(6,'House keeping','2013-02-12'),(7,'Training','2014-02-12'),(8,'PF','2010-02-12');
Query OK, 8 rows affected (0.04 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from department;
+-----+---------------+--------------+--------+
| dno | dname         | mgrstartdate | mgrssn |
+-----+---------------+--------------+--------+
|   1 | Accounts      | 2017-02-12   |   NULL |
|   2 | Finance       | 2017-02-10   |   NULL |
|   3 | HR            | 2017-03-23   |   NULL |
|   4 | Admin         | 2015-05-12   |   NULL |
|   5 | Payroll       | 2012-02-12   |   NULL |
|   6 | House keeping | 2013-02-12   |   NULL |
|   7 | Training      | 2014-02-12   |   NULL |
|   8 | PF            | 2010-02-12   |   NULL |
+-----+---------------+--------------+--------+
8 rows in set (0.00 sec)


mysql> insert into employee values (888665555,'Jacob Scott','Whitefield','M',65000,null,1),(333445555,'Tim','Jayanagar','M',35000,888665555,1),(123456789,'Jil','Brookefield','F',85000,null,5),(453453453,'Josh Scott','AECS layout','M',45000,123456789,5),(222222200,'Jim','Jayanagar','M',92000,null,7),(222222201,'Kate','BTM','F',60000,222222200,7),(222222202,'Joseph','ECity','M',50000,222222200,7),(222222203,'Jay','ECity','M',45000,222222200,7),(333333300,'Claire','Marathahalli','F',79000,null,6),(333333310,'Jack','Marathahalli','M',45000,333333300,6);
Query OK, 10 rows affected (0.05 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+-----------+-------------+--------------+------+--------+-----------+------+
| ssn       | name        | address      | sex  | salary | superssn  | dno  |
+-----------+-------------+--------------+------+--------+-----------+------+
| 123456789 | Jil         | Brookefield  | F    |  85000 |      NULL |    5 |
| 222222200 | Jim         | Jayanagar    | M    |  92000 |      NULL |    7 |
| 222222201 | Kate        | BTM          | F    |  60000 | 222222200 |    7 |
| 222222202 | Joseph      | ECity        | M    |  50000 | 222222200 |    7 |
| 222222203 | Jay         | ECity        | M    |  45000 | 222222200 |    7 |
| 333333300 | Claire      | Marathahalli | F    |  79000 |      NULL |    6 |
| 333333310 | Jack        | Marathahalli | M    |  45000 | 333333300 |    6 |
| 333445555 | Tim         | Jayanagar    | M    |  35000 | 888665555 |    1 |
| 453453453 | Josh Scott  | AECS layout  | M    |  45000 | 123456789 |    5 |
| 888665555 | Jacob Scott | Whitefield   | M    |  65000 |      NULL |    1 |
+-----------+-------------+--------------+------+--------+-----------+------+
10 rows in set (0.00 sec)

mysql> update department set mgrssn=888665555 where dno=1;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update department set mgrssn=888664343 where dno=2;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update department set mgrssn=768665555 where dno=3;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update department set mgrssn=8886655123 where dno=4;
Query OK, 1 row affected, 1 warning (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 1

mysql> update department set mgrssn=123456789 where dno=5;
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update department set mgrssn=333333300 where dno=6;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update department set mgrssn=222222200 where dno=7;
Query OK, 1 row affected (0.09 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update department set mgrssn=222222212 where dno=8;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from department;
+-----+---------------+--------------+------------+
| dno | dname         | mgrstartdate | mgrssn     |
+-----+---------------+--------------+------------+
|   1 | Accounts      | 2017-02-12   |  888665555 |
|   2 | Finance       | 2017-02-10   |  888664343 |
|   3 | HR            | 2017-03-23   |  768665555 |
|   4 | Admin         | 2015-05-12   | 2147483647 |
|   5 | Payroll       | 2012-02-12   |  123456789 |
|   6 | House keeping | 2013-02-12   |  333333300 |
|   7 | Training      | 2014-02-12   |  222222200 |
|   8 | PF            | 2010-02-12   |  222222212 |
+-----+---------------+--------------+------------+
8 rows in set (0.00 sec)
mysql> insert into dlocation values (1,'Mumbai'),(1,'Bangalore'),(1,'Pune'),(2,'Mumbai'),(3,'Chennai'),(4,'Mumbai'),(5,'Guwahati'),(6,'Mumbai'),(7,'Delhi'),(8,'Mumbai'),(8,'Pune');
Query OK, 11 rows affected (0.05 sec)
Records: 11  Duplicates: 0  Warnings: 0

mysql> select * from dlocation;
+-----+-----------+
| dno | dloc      |
+-----+-----------+
|   1 | Bangalore |
|   1 | Mumbai    |
|   1 | Pune      |
|   2 | Mumbai    |
|   3 | Chennai   |
|   4 | Mumbai    |
|   5 | Guwahati  |
|   6 | Mumbai    |
|   7 | Delhi     |
|   8 | Mumbai    |
|   8 | Pune      |
+-----+-----------+
11 rows in set (0.00 sec)

mysql> insert into project values (10,'iot','Mumbai',1),(11,'adhoc','Pune',1),(12,'mobile','Bangalore',5),(13,'finacle','Chennai',7),(14,'android','Pune',4),(15,'java','Mumbai',5),(16,'dot net','Pune',5),(17,'c#','Mumbai',6);
Query OK, 8 rows affected (0.07 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from project;
+-----+---------+-----------+------+
| pno | pname   | plocation | dno  |
+-----+---------+-----------+------+
|  10 | iot     | Mumbai    |    1 |
|  11 | adhoc   | Pune      |    1 |
|  12 | mobile  | Bangalore |    5 |
|  13 | finacle | Chennai   |    7 |
|  14 | android | Pune      |    4 |
|  15 | java    | Mumbai    |    5 |
|  16 | dot net | Pune      |    5 |
|  17 | c#      | Mumbai    |    6 |
+-----+---------+-----------+------+
8 rows in set (0.00 sec)

mysql> insert into works_on values (123456789,15,45),(453453453,16,40),(888665555,11,45),(333445555,10,45),(888665555,10,40),(22222201,13,45),(333333300,17,45),(333333310,17,45);
Query OK, 8 rows affected (0.05 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> update works_on set ssn=222222200 where pno=13;
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from works_on;
+-----------+-----+-------+
| ssn       | pno | hours |
+-----------+-----+-------+
| 123456789 |  15 |    45 |
| 222222200 |  13 |    45 |
| 333333300 |  17 |    45 |
| 333333310 |  17 |    45 |
| 333445555 |  10 |    45 |
| 453453453 |  16 |    40 |
| 888665555 |  10 |    40 |
| 888665555 |  11 |    45 |
+-----------+-----+-------+
8 rows in set (0.00 sec)


---------------------------------------------------------------------------------------------------------------------------------------------
QUERIES
-----------------------------------------------------------------------------------------------------------------------------------------------



Q5.1. Make a list of all project numbers for projects that involve an employee
whose last name is ‘Scott’, either as a worker or as a manager of the
department that controls the project.

mysql> (SELECT DISTINCT pno FROM project, department, employee WHERE project.dno = department.dno AND department.mgrssn = employee.ssn AND employee.name like '%Scott') UNION (SELECT DISTINCT works_on.pno FROM project, works_on, employee WHERE project.pno = works_on.pno AND employee.ssn = works_on.ssn AND employee.name like '%Scott');
+-----+
| pno |
+-----+
|  10 |
|  11 |
|  16 |
+-----+
3 rows in set (0.01 sec)


Q5.2. Show the resulting salaries if every employee working on the ‘IoT’ project is
given a 10 percent raise.


mysql> alter table employee modify salary decimal(15,4);
Query OK, 10 rows affected (0.34 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select name, 1.1*salary from employee, works_on,project where employee.ssn=works_on.ssn and project.pname='iot' and works_on.pno=project.pno;
+-------------+-------------+
| name        | 1.1*salary  |
+-------------+-------------+
| Tim         | 38500.00000 |
| Jacob Scott | 71500.00000 |
+-------------+-------------+
2 rows in set (0.00 sec)

Q5.3. Find the sum of the salaries of all employees of the ‘Accounts’ department, as
well as the maximum salary, the minimum salary, and the average salary in
this department

mysql> select sum(salary), max(salary),min(salary),avg(salary) from employee e,department d where e.dno=d.dno and d.dname='Accounts';
+-------------+-------------+-------------+----------------+
| sum(salary) | max(salary) | min(salary) | avg(salary)    |
+-------------+-------------+-------------+----------------+
| 100000.0000 |  65000.0000 |  35000.0000 | 50000.00000000 |
+-------------+-------------+-------------+----------------+
1 row in set (0.03 sec)


Q5.5 For each department that has more than five employees, retrieve the
department number and the number of its employees who are making more
than Rs. 6,00,000.



mysql> update employee set dno=7 where dno=1;
Query OK, 2 rows affected (0.03 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from employee;
+-----------+-------------+--------------+------+------------+-----------+------+
| ssn       | name        | address      | sex  | salary     | superssn  | dno  |
+-----------+-------------+--------------+------+------------+-----------+------+
| 123456789 | Jil         | Brookefield  | F    | 85000.0000 |      NULL |    5 |
| 222222200 | Jim         | Jayanagar    | M    | 92000.0000 |      NULL |    7 |
| 222222201 | Kate        | BTM          | F    | 60000.0000 | 222222200 |    7 |
| 222222202 | Joseph      | ECity        | M    | 50000.0000 | 222222200 |    7 |
| 222222203 | Jay         | ECity        | M    | 45000.0000 | 222222200 |    7 |
| 333333300 | Claire      | Marathahalli | F    | 79000.0000 |      NULL |    6 |
| 333333310 | Jack        | Marathahalli | M    | 45000.0000 | 333333300 |    6 |
| 333445555 | Tim         | Jayanagar    | M    | 35000.0000 | 888665555 |    7 |
| 453453453 | Josh Scott  | AECS layout  | M    | 45000.0000 | 123456789 |    5 |
| 888665555 | Jacob Scott | Whitefield   | M    | 65000.0000 |      NULL |    7 |
+-----------+-------------+--------------+------+------------+-----------+------+

mysql> update employee set salary =600001 where ssn=888665555;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee set salary =600750 where ssn=222222200;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0


mysql> select * from employee;
+-----------+-------------+--------------+------+-------------+-----------+------+
| ssn       | name        | address      | sex  | salary      | superssn  | dno  |
+-----------+-------------+--------------+------+-------------+-----------+------+
| 123456789 | Jil         | Brookefield  | F    |  85000.0000 |      NULL |    5 |
| 222222200 | Jim         | Jayanagar    | M    | 600750.0000 |      NULL |    7 |
| 222222201 | Kate        | BTM          | F    |  60000.0000 | 222222200 |    7 |
| 222222202 | Joseph      | ECity        | M    |  50000.0000 | 222222200 |    7 |
| 222222203 | Jay         | ECity        | M    |  45000.0000 | 222222200 |    7 |
| 333333300 | Claire      | Marathahalli | F    |  79000.0000 |      NULL |    6 |
| 333333310 | Jack        | Marathahalli | M    |  45000.0000 | 333333300 |    6 |
| 333445555 | Tim         | Jayanagar    | M    |  35000.0000 | 888665555 |    7 |
| 453453453 | Josh Scott  | AECS layout  | M    |  45000.0000 | 123456789 |    5 |
| 888665555 | Jacob Scott | Whitefield   | M    | 600001.0000 |      NULL |    7 |
+-----------+-------------+--------------+------+-------------+-----------+------+
10 rows in set (0.00 sec)





mysql> select dno, count(*) from employee where salary>600000 and dno in(select dno from employee group by dno having count(*)>5) group by dno;
+------+----------+
| dno  | count(*) |
+------+----------+
|    7 |        2 |
+------+----------+
1 row in set (0.00 sec)
