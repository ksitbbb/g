1.Consider the following schema for a Library Database:
BOOK(Book_id, Title, Publisher_Name, Pub_Year)
BOOK_AUTHORS(Book_id, Author_Name)
PUBLISHER(Name, Address, Phone)
BOOK_COPIES(Book_id, Branch_id, No-of_Copies)
BOOK_LENDING(Book_id, Branch_id, Card_No, Date_Out, Due_Date)
LIBRARY_BRANCH(Branch_id, Branch_Name, Address)

mysql> create table Publisher(name varchar(35) primary key,address varchar(50),phone integer(10) unique);
Query OK, 0 rows affected (0.00 sec)


mysql> create table Book(
    -> book_id integer(15) primary key,
    -> title varchar(50),
    -> publisher_name varchar(35), foreign key(publisher_name) references Publisher(name),
    -> publisher_year year);
Query OK, 0 rows affected (0.00 sec)

mysql> create table Book_Authors( book_id integer(15) primary key , foreign key (book_id) references Book(book_id) on delete cascade, author_name varchar(30));
Query OK, 0 rows affected (0.01 sec)


mysql> create table Library_Branch(
    -> branch_id integer(10) primary key,
    -> branch_name varchar(25),
    -> address varchar(35));
Query OK, 0 rows affected (0.01 sec)


mysql> create table Book_Copies(
     book_id integer(10) , foreign key(book_id) references Book(book_id) on delete cascade,
     branch_id integer(10) , foreign key (branch_id) references Library_Branch(branch_id),
     no_of_copies integer(10),
     primary key(book_id,branch_id));
Query OK, 0 rows affected (0.01 sec)


mysql> create table Book_Lending(
     book_id integer(10), foreign key(book_id) references Book(book_id) on delete cascade,
     branch_id integer(10) , foreign key(branch_id) references Library_Branch(branch_id),
     card_no varchar(10),
     date_out date,
     due_date date,
     primary key(book_id,branch_id,card_no));

mysql> alter table Publisher modify column phone varchar(20);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into Publisher values
     ('PHI Learning','Bangalore','9234543210'),
     ('Peters', 'Chennai', '9876543245'),
     ('Khanna', 'Mumbai','9841200980'),
     ('S.Chand','Pune','80045320000'),
     ('Wiley','Hyderabad','7654784321');

mysql> select * from Publisher;
+--------------+-----------+-------------+
| name         | address   | phone       |
+--------------+-----------+-------------+
| Khanna       | Mumbai    | 9841200980  |
| Peters       | Chennai   | 9876543245  |
| PHI Learning | Bangalore | 9234543210  |
| S.Chand      | Pune      | 80045320000 |
| Wiley        | Hyderabad | 7654784321  |
+--------------+-----------+-------------+
5 rows in set (0.00 sec)

mysql> insert into Book values
     (100,'Let us C','PHI Learning',2002),
     (101,'Introduction to Database Management Systems','Peters',2004),
     (102,'Computer Networks','Wiley',2010),
     (103,'Software Engineering','Khanna',2005),
     (104,'Internetworking with TCP/IP','S.Chand',2014);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from Book;
+---------+---------------------------------------------+----------------+----------------+
| book_id | title                                       | publisher_name | publisher_year |
+---------+---------------------------------------------+----------------+----------------+
|     100 | Let us C                                    | PHI Learning   |           2002 |
|     101 | Introduction to Database Management Systems | Peters         |           2004 |
|     102 | Computer Networks                           | Wiley          |           2010 |
|     103 | Software Engineering                        | Khanna         |           2005 |
|     104 | Internetworking with TCP/IP                 | S.Chand        |           2014 |
+---------+---------------------------------------------+----------------+----------------+
5 rows in set (0.00 sec)

mysql> insert into Book_Authors values
     (100,'Yashavant Kanetkar'),
     (101,'Atul Kahate'),
     (102,'Larry L Peterson'),
     (103,'Samuel Simons'),
     (104,'Douglas E Comer');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from Book_Authors;
+---------+--------------------+
| book_id | author_name        |
+---------+--------------------+
|     100 | Yashavant Kanetkar |
|     101 | Atul Kahate        |
|     102 | Larry L Peterson   |
|     103 | Samuel Simons      |
|     104 | Douglas E Comer    |
+---------+--------------------+
5 rows in set (0.00 sec)
mysql> insert into Library_Branch values
     (1,'B100','Brookefield'),
     (2,'B101','Marathahalli'),
     (3,'B102','Banaswadi'),
     (4,'B103','BTM'),
     (5,'B104','HSR Layout');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from Library_Branch;
+-----------+-------------+--------------+
| branch_id | branch_name | address      |
+-----------+-------------+--------------+
|         1 | B100        | Brookefield  |
|         2 | B101        | Marathahalli |
|         3 | B102        | Banaswadi    |
|         4 | B103        | BTM          |
|         5 | B104        | HSR Layout   |
+-----------+-------------+--------------+
5 rows in set (0.00 sec)

mysql> insert into Book_Copies values (100,1,10), (100,4,20), (101,2,30), (101,3,6), (102,5,15), (102,3,20), (102,1,30), (103,3,10), (104,2,20), (104,1,10);
Query OK, 13 rows affected (0.01 sec)
Records: 13  Duplicates: 0  Warnings: 0

mysql> select * from Book_Copies;
+---------+-----------+--------------+
| book_id | branch_id | no_of_copies |
+---------+-----------+--------------+
|     100 |         1 |           10 |
|     100 |         4 |           20 |
|     101 |         2 |           30 |
|     101 |         3 |            6 |
|     102 |         1 |           30 |
|     102 |         3 |           20 |
|     102 |         5 |           15 |
|     103 |         3 |           10 |
|     104 |         1 |           10 |
|     104 |         2 |           20 |
+---------+-----------+--------------+
10 rows in set (0.01 sec)

mysql> insert into Book_Lending values (100,1,'A250','2017-07-1','2017-07-20'), (101,3,'C311','2017-07-1','2017-07-20'), (102,5,'S121','2017-07-10','2017-07-29'),(103,3,'A121','2017-07-10','2017-07-29'),(104,2,'B234','2017-07-15','2017-08-03');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0
mysql> insert into Book_Lending values(100,4,'A250','2017-02-01','2017-02-20'),
     (101,2,'A250','2017-02-10','2017-03-01'),
     (104,2,'A250','2017-04-05','2017-04-24'),
     (103,3,'A250','2017-03-02','2017-03-21'),
     (100,1,'B234','2017-04-23','2017-05-12'),
     (101,3,'B234','2017-03-03','2017-03-22'),
     (102,5,'B234','2017-01-01','2017-01-20'),
     (103,3,'B234','2017-04-10','2017-04-29');
Query OK, 8 rows affected (0.04 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from Book_Lending;
+---------+-----------+---------+------------+------------+
| book_id | branch_id | card_no | date_out   | due_date   |
+---------+-----------+---------+------------+------------+
|     100 |         1 | A250    | 2017-07-01 | 2017-07-20 |
|     100 |         1 | B234    | 2017-04-23 | 2017-05-12 |
|     100 |         4 | A250    | 2017-02-01 | 2017-02-20 |
|     101 |         2 | A250    | 2017-02-10 | 2017-03-01 |
|     101 |         3 | B234    | 2017-03-03 | 2017-03-22 |
|     101 |         3 | C311    | 2017-07-01 | 2017-07-20 |
|     102 |         5 | B234    | 2017-01-01 | 2017-01-20 |
|     102 |         5 | S121    | 2017-07-10 | 2017-07-29 |
|     103 |         3 | A121    | 2017-07-10 | 2017-07-29 |
|     103 |         3 | A250    | 2017-03-02 | 2017-03-21 |
|     103 |         3 | B234    | 2017-04-10 | 2017-04-29 |
|     104 |         2 | A250    | 2017-04-05 | 2017-04-24 |
|     104 |         2 | B234    | 2017-07-15 | 2017-08-03 |
+---------+-----------+---------+------------+------------+
13 rows in set (0.00 sec)

---------------------------------------------------------------------------------------------------------------------------------------------
QUERIES
-----------------------------------------------------------------------------------------------------------------------------------------------
Q1.1  Retrieve details of all books in the library – id, title, name of publisher,
authors, number of copies in each branch, etc.

mysql> select a.book_id,a.title,a.publisher_name,b.author_name,c.branch_id,c.no_of_copies from Book a,Book_Authors b,Book_Copies c where a.book_id=b.book_id and b.book_id=c.book_id;
OR
mysql> select a.book_id,a.title,a.publisher_name,b.author_name,c.branch_id,c.no_of_copies from Book a natural join Book_Authors b natural join Book_Copies c ;
+---------+---------------------------------------------+----------------+--------------------+-----------+--------------+
| book_id | title                                       | publisher_name | author_name        | branch_id | no_of_copies |
+---------+---------------------------------------------+----------------+--------------------+-----------+--------------+
|     100 | Let us C                                    | PHI Learning   | Yashavant Kanetkar |         1 |           10 |
|     100 | Let us C                                    | PHI Learning   | Yashavant Kanetkar |         4 |           20 |
|     101 | Introduction to Database Management Systems | Peters         | Atul Kahate        |         2 |           30 |
|     101 | Introduction to Database Management Systems | Peters         | Atul Kahate        |         3 |            6 |
|     102 | Computer Networks                           | Wiley          | Larry L Peterson   |         1 |           30 |
|     102 | Computer Networks                           | Wiley          | Larry L Peterson   |         3 |           20 |
|     102 | Computer Networks                           | Wiley          | Larry L Peterson   |         5 |           15 |
|     103 | Software Engineering                        | Khanna         | Samuel Simons      |         3 |           10 |
|     104 | Internetworking with TCP/IP                 | S.Chand        | Douglas E Comer    |         1 |           10 |
|     104 | Internetworking with TCP/IP                 | S.Chand        | Douglas E Comer    |         2 |           20 |
+---------+---------------------------------------------+----------------+--------------------+-----------+--------------+
10 rows in set (0.00 sec)

2. Get the particulars of borrowers who have borrowed more than 3 books, but
from Jan 2017 to Jun 2017.
mysql> select card_no from Book_Lending where date_out between '2017-01-01' and '2017-06-30' group by  card_no having count(card_no)>3;
+---------+
| card_no |
+---------+
| A250    |
| B234    |
+---------+
2 rows in set (0.00 sec)

Q1.3 Delete a book in BOOK table. Update the contents of other tables to reflect
this data manipulation operation.


mysql> Delete from Book where book_id=104;
Query OK, 1 row affected (0.00 sec)

mysql> select * from Book;
+---------+---------------------------------------------+----------------+----------------+
| book_id | title                                       | publisher_name | publisher_year |
+---------+---------------------------------------------+----------------+----------------+
|     100 | Let us C                                    | PHI Learning   |           2002 |
|     101 | Introduction to Database Management Systems | Peters         |           2004 |
|     102 | Computer Networks                           | Wiley          |           2010 |
|     103 | Software Engineering                        | Khanna         |           2005 |
+---------+---------------------------------------------+----------------+----------------+
4 rows in set (0.00 sec)

mysql> select * from Book_Copies;
+---------+-----------+--------------+
| book_id | branch_id | no_of_copies |
+---------+-----------+--------------+
|     100 |         1 |           10 |
|     100 |         4 |           20 |
|     101 |         2 |           30 |
|     101 |         3 |            6 |
|     102 |         1 |           30 |
|     102 |         3 |           20 |
|     102 |         5 |           15 |
|     103 |         3 |           10 |
|     105 |         1 |           20 |
|     105 |         2 |           30 |
|     105 |         4 |           40 |
+---------+-----------+--------------+
11 rows in set (0.00 sec)

mysql> select * from Book_Lending;
+---------+-----------+---------+------------+------------+
| book_id | branch_id | card_no | date_out   | due_date   |
+---------+-----------+---------+------------+------------+
|     100 |         1 | A250    | 2017-07-01 | 2017-07-20 |
|     100 |         1 | B234    | 2017-04-23 | 2017-05-12 |
|     100 |         4 | A250    | 2017-02-01 | 2017-02-20 |
|     101 |         2 | A250    | 2017-02-10 | 2017-03-01 |
|     101 |         3 | B234    | 2017-03-03 | 2017-03-22 |
|     101 |         3 | C311    | 2017-07-01 | 2017-07-20 |
|     102 |         5 | B234    | 2017-01-01 | 2017-01-20 |
|     102 |         5 | S121    | 2017-07-10 | 2017-07-29 |
|     103 |         3 | A121    | 2017-07-10 | 2017-07-29 |
|     103 |         3 | A250    | 2017-03-02 | 2017-03-21 |
|     103 |         3 | B234    | 2017-04-10 | 2017-04-29 |
+---------+-----------+---------+------------+------------+
11 rows in set (0.01 sec)

Q1.4 Partition the BOOK table based on year of publication. Demonstrate its
working with a simple query.

mysql> alter table Book drop primary key;
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> alter table Book add primary key(book_id,publisher_year);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

Solution

mysql> alter table Book partition by range (publisher_year)  (partition p0 values less than(2005), partition p1 values less than maxvalue);
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT PARTITION_NAME, TABLE_ROWS FROM 
    -> INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME='Book';
+----------------+------------+
| PARTITION_NAME | TABLE_ROWS |
+----------------+------------+
| p0             |          2 |
| p1             |          2 |
+----------------+------------+
2 rows in set (0.01 sec)

mysql> Alter table Book Truncate partition p0;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from Book;
+---------+----------------------+----------------+----------------+
| book_id | title                | publisher_name | publisher_year |
+---------+----------------------+----------------+----------------+
|     102 | Computer Networks    | Wiley          |           2010 |
|     103 | Software Engineering | Khanna         |           2005 |
+---------+----------------------+----------------+----------------+
2 rows in set (0.00 sec)

5. Create a view of all books and its number of copies that are currently
available in the Library.

mysql> create view available_books as select a.book_id , ifnull(a.sum - b.sum,a.sum) from (select book_id,sum(no_of_copies) as sum from Book_Copies group by book_id ) a join (select book_id, count(*) as sum from Book_Lending group by book_id)  b on a.book_id = b.book_id;

mysql> select * from available_books;
+---------+-----------------------------+
| book_id | ifnull(a.sum - b.sum,a.sum) |
+---------+-----------------------------+
|     100 |                          27 |
|     101 |                          33 |
|     102 |                          63 |
|     103 |                           7 |
+---------+-----------------------------+
