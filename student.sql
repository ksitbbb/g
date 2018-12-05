Q4
Consider the schema for College Database:
STUDENT(USN, SName, Address, Phone, Gender)
SEMSEC(SSID, Sem, Sec)
CLASS(USN, SSID)
SUBJECT(Subcode, Title, Sem, Credits)
IAMARKS(USN, Subcode, SSID, Test1, Test2, Test3, FinalIA)


mysql> create table student(usn integer primary key, sname varchar(100), address varchar(255),phone varchar(11),gender varchar(2));
Query OK, 0 rows affected (0.00 sec)

mysql> create table semsec(ssid integer primary key,sem integer, sec varchar(10));
Query OK, 0 rows affected (0.01 sec)

mysql> create table class (usn varchar(11) primary key,ssid integer, foreign key(ssid) references semsec(ssid),foreign key(usn) references student(usn) );
Query OK, 0 rows affected (0.01 sec)

mysql> create table subject (subcode varchar(30) primary key, title varchar(50), sem integer,credits integer);
Query OK, 0 rows affected (0.00 sec)


mysql> create table iamarks(usn varchar(11),subcode varchar(30),ssid integer, test1 float(5),test2 float(5),test3 float(3),finalia float(5),primary key(usn,subcode,ssid) ,foreign key(usn) references student(usn), foreign key(subcode) references subject(subcode), foreign key(ssid) references semsec(ssid));
Query OK, 0 rows affected (0.01 sec)

mysql> alter table student modify usn varchar(25);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from student;
Empty set (0.00 sec)

mysql> insert into student values('1BI14CS100','Alex','Bangalore','9823411232','M'), ('1BI14CS101','Anu','Bangalore','9453411232','F'), ('1BI14CS102','Arnashree','Bangalore','9823400032','F'), ('1BI14CS103','Barghav','Chennai','9007411232','M'), ('1BI14CS104','Dony','Delhi','982134232','M'), ('1BI15CS100','Dev','Bihar','9826661232','M'), ('1BI15CS101','Aby','Bangalore','9823433332','M');
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> select * from student;
+------------+-----------+-----------+------------+--------+
| usn        | sname     | address   | phone      | gender |
+------------+-----------+-----------+------------+--------+
| 1BI14CS100 | Alex      | Bangalore | 9823411232 | M      |
| 1BI14CS101 | Anu       | Bangalore | 9453411232 | F      |
| 1BI14CS102 | Arnashree | Bangalore | 9823400032 | F      |
| 1BI14CS103 | Barghav   | Chennai   | 9007411232 | M      |
| 1BI14CS104 | Dony      | Delhi     | 982134232  | M      |
| 1BI15CS100 | Dev       | Bihar     | 9826661232 | M      |
| 1BI15CS101 | Aby       | Bangalore | 9823433332 | M      |
+------------+-----------+-----------+------------+--------+
7 rows in set (0.00 sec)

mysql> insert into semsec values(101,2,'A'),(102,4,'B'),(103,4,'C'),(104,8,'A'),(105,2,'B'),(106,8,'B'),(107,8,'C');
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> select * from semsec;
+------+------+------+
| ssid | sem  | sec  |
+------+------+------+
|  101 |    2 | A    |
|  102 |    4 | B    |
|  103 |    4 | C    |
|  104 |    8 | A    |
|  105 |    2 | B    |
|  106 |    8 | B    |
|  107 |    8 | C    |
+------+------+------+
7 rows in set (0.00 sec)

mysql> insert into class values ('1BI14CS100',101),('1BI14CS101',101),('1BI14CS102',103),('1BI14CS103',104),('1BI14CS104',106), ('1BI15CS100',107),('1BI15CS101',107);
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> select * from class;
+------------+------+
| usn        | ssid |
+------------+------+
| 1BI14CS100 |  101 |
| 1BI14CS101 |  101 |
| 1BI14CS102 |  103 |
| 1BI14CS103 |  104 |
| 1BI14CS104 |  106 |
| 1BI15CS100 |  107 |
| 1BI15CS101 |  107 |
+------------+------+
7 rows in set (0.00 sec)

mysql> insert into subject values ('15cs42','SE',4,6),('15cs41','ST',4,4),('13cs82','SA',8,2),('13cs81','OAMD',8,6),('16cs22','OS',2,8),('14cs62','SS',6,4);
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from subject;
+---------+-------+------+---------+
| subcode | title | sem  | credits |
+---------+-------+------+---------+
| 13cs81  | OAMD  |    8 |       6 |
| 13cs82  | SA    |    8 |       2 |
| 14cs62  | SS    |    6 |       4 |
| 15cs41  | ST    |    4 |       4 |
| 15cs42  | SE    |    4 |       6 |
| 16cs22  | OS    |    2 |       8 |
+---------+-------+------+---------+
6 rows in set (0.00 sec)



mysql> insert into iamarks(usn,subcode,ssid,test1,test2,test3) values ('1BI14CS100','16cs22',101,10,10,10),('1BI14CS101','16cs22',101,12,15,18),('1BI14CS102','15cs41',103,3,4,7), ('1BI14CS102','15cs42',103,11,13,10),('1BI14CS103','13cs81',104,5,7,11),('1BI14CS103','13cs82',104,11,12,15), ('1BI14CS104','13cs81',106,13,12,11),('1BI14CS104','13cs82',106,10,18,15), ('1BI15CS100','13cs81',107,16,17,18),('1BI15CS100','13cs82',107,11,12,13), ('1BI15CS101','13cs81',107,17,14,18),('1BI15CS101','13cs82',107,19,20,20);Query OK, 12 rows affected (0.01 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> select * from iamarks;
+------------+---------+------+-------+-------+-------+---------+
| usn        | subcode | ssid | test1 | test2 | test3 | finalia |
+------------+---------+------+-------+-------+-------+---------+
| 1BI14CS100 | 16cs22  |  101 |    10 |    10 |    10 |    NULL |
| 1BI14CS101 | 16cs22  |  101 |    12 |    15 |    18 |    NULL |
| 1BI14CS102 | 15cs41  |  103 |     3 |     4 |     7 |    NULL |
| 1BI14CS102 | 15cs42  |  103 |    11 |    13 |    10 |    NULL |
| 1BI14CS103 | 13cs81  |  104 |     5 |     7 |    11 |    NULL |
| 1BI14CS103 | 13cs82  |  104 |    11 |    12 |    15 |    NULL |
| 1BI14CS104 | 13cs81  |  106 |    13 |    12 |    11 |    NULL |
| 1BI14CS104 | 13cs82  |  106 |    10 |    18 |    15 |    NULL |
| 1BI15CS100 | 13cs81  |  107 |    16 |    17 |    18 |    NULL |
| 1BI15CS100 | 13cs82  |  107 |    11 |    12 |    13 |    NULL |
| 1BI15CS101 | 13cs81  |  107 |    17 |    14 |    18 |    NULL |
| 1BI15CS101 | 13cs82  |  107 |    19 |    20 |    20 |    NULL |
+------------+---------+------+-------+-------+-------+---------+
12 rows in set (0.00 sec)

---------------------------------------------------------------------------------------------------------------------------------------------
QUERIES
-----------------------------------------------------------------------------------------------------------------------------------------------

Q 4.1  List all the student details studying in fourth semester ‘C’ section.

mysql> select * from student where usn in(select usn from class join semsec on class.ssid=semsec.ssid and semsec.sem=4 and semsec.sec='C');
+------------+-----------+-----------+------------+--------+
| usn        | sname     | address   | phone      | gender |
+------------+-----------+-----------+------------+--------+
| 1BI14CS102 | Arnashree | Bangalore | 9823400032 | F      |
+------------+-----------+-----------+------------+--------+
1 row in set (0.00 sec)

Q 4.2. Compute the total number of male and female students in each semester and in each section.

mysql> select sem,sec,gender,count(gender) from student natural join class natural join semsec group by sem,sec,gender;
+------+------+--------+---------------+
| sem  | sec  | gender | count(gender) |
+------+------+--------+---------------+
|    2 | A    | F      |             1 |
|    2 | A    | M      |             1 |
|    4 | C    | F      |             1 |
|    8 | A    | M      |             1 |
|    8 | B    | M      |             1 |
|    8 | C    | M      |             2 |
+------+------+--------+---------------+
6 rows in set (0.00 sec)

Q4.3. Create a view of Test1 marks of student USN ‘1BI15CS101’ in all subjects.

mysql> create view test1_1BI15CS101 as select usn,subcode,test1 from iamarks where usn='1BI15CS101';
Query OK, 0 rows affected (0.01 sec)

mysql> select * from test1_1BI15CS101;
+------------+---------+-------+
| usn        | subcode | test1 |
+------------+---------+-------+
| 1BI15CS101 | 13cs81  |    17 |
| 1BI15CS101 | 13cs82  |    19 |
+------------+---------+-------+
2 rows in set (0.00 sec)

Q4.4. Calculate the FinalIA (average of best two test marks) and update the
corresponding table for all students.

mysql> update iamarks set finalia=(test1+test2+test3-least(test1,test2,test3))/2;

Query OK, 12 rows affected (0.00 sec)
Rows matched: 12  Changed: 12  Warnings: 0
 
mysql> select * from iamarks;
+------------+---------+------+-------+-------+-------+---------+
| usn        | subcode | ssid | test1 | test2 | test3 | finalia |
+------------+---------+------+-------+-------+-------+---------+
| 1BI14CS100 | 16cs22  |  101 |    10 |    10 |    10 |      10 |
| 1BI14CS101 | 16cs22  |  101 |    12 |    15 |    18 |    16.5 |
| 1BI14CS102 | 15cs41  |  103 |     3 |     4 |     7 |     5.5 |
| 1BI14CS102 | 15cs42  |  103 |    11 |    13 |    10 |      12 |
| 1BI14CS103 | 13cs81  |  104 |     5 |     7 |    11 |       9 |
| 1BI14CS103 | 13cs82  |  104 |    11 |    12 |    15 |    13.5 |
| 1BI14CS104 | 13cs81  |  106 |    13 |    12 |    11 |    12.5 |
| 1BI14CS104 | 13cs82  |  106 |    10 |    18 |    15 |    16.5 |
| 1BI15CS100 | 13cs81  |  107 |    16 |    17 |    18 |    17.5 |
| 1BI15CS100 | 13cs82  |  107 |    11 |    12 |    13 |    12.5 |
| 1BI15CS101 | 13cs81  |  107 |    17 |    14 |    18 |    17.5 |
| 1BI15CS101 | 13cs82  |  107 |    19 |    20 |    20 |      20 |
+------------+---------+------+-------+-------+-------+---------+
12 rows in set (0.00 sec)

Q4.5. Categorize students based on the following criterion:
If FinalIA = 17 to 20 then CAT = ‘Outstanding’
If FinalIA = 12 to 16 then CAT = ‘Average’
If FinalIA< 12 then CAT = ‘Weak’
Give these details only for 8 th semester A, B, and C section students.

mysql> select usn,subcode,'OUTSTANDING' as CAT from iamarks where finalia>=17 and ssid in (select class.ssid from class,semsec where semsec.sem=8 and (semsec.sec='A' OR semsec.sec='B' OR semsec.sec='C') and semsec.ssid=class.ssid) 
    -> union
    -> select usn,subcode,'AVERAGE' as CAT from iamarks where finalia<=16 and finalia>=12 and ssid in (select class.ssid from class,semsec where semsec.sem=8 and (semsec.sec='A' OR semsec.sec='B' OR semsec.sec='C') and semsec.ssid=class.ssid)
    -> union
    -> select usn,subcode,'WEAK' as CAT from iamarks where finalia<12 and ssid in (select class.ssid from class,semsec where semsec.sem=8 and (semsec.sec='A' OR semsec.sec='B' OR semsec.sec='C') and semsec.ssid=class.ssid);
+------------+---------+-------------+
| usn        | subcode | CAT         |
+------------+---------+-------------+
| 1BI15CS100 | 13cs81  | OUTSTANDING |
| 1BI15CS101 | 13cs81  | OUTSTANDING |
| 1BI15CS101 | 13cs82  | OUTSTANDING |
| 1BI14CS103 | 13cs82  | AVERAGE     |
| 1BI14CS104 | 13cs81  | AVERAGE     |
| 1BI15CS100 | 13cs82  | AVERAGE     |
| 1BI14CS103 | 13cs81  | WEAK        |
+------------+---------+-------------+
7 rows in set (0.00 sec)



