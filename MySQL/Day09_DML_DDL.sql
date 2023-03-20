#DML语言
/*
 插入：insert 修改：update  删除：delete
*/
#insert语法：表名，字段，值
# 第一种：
# 语法：insert into 表名(字段名,...) VALUES(值,...)
# 第二种
# 语法：INSERT INTO 表名 SET 字段名=值,...
# 第一种方式支持一次插入多个值，第二种不支持
# 第一种方式支持子查询，第二种不支持

INSERT INTO beauty (
	id,
	NAME,
	phone
)
VALUES
	(
	18,
	'七姑娘',
	'12345678912'
),
	(
	19,
	'七姑娘',
	'12345678912'
);

INSERT INTO beauty (id,NAME,phone)
SELECT 20,'七姑娘','12345678912';

# 插入数据
INSERT INTO beauty
SET id = 17,
 NAME = '九姑娘',
 phone = '12345678913';

#案例1：按照字段的数据类型插入数据
USE girls;

INSERT INTO beauty (
	id,
	NAME,
	sex,
	borndate,
	phone,
	photo,
	boyfriend_id
)
VALUES
	(
		13,
		'张三',
		'女',
		'2000-3-1',
		'12345678910',
		NULL,
		1
	);

# 2关于null值
INSERT INTO beauty (
	id,
	NAME,
	sex,
	borndate,
	phone,
	photo,
	boyfriend_id
)
VALUES
	(
	14,
	'六姑娘',
	NULL,
	NULL,
	'12345678911',
	NULL,
	NULL
);

INSERT INTO beauty (
	id,
	NAME,
	phone
)
VALUES
	(
	15,
	'七姑娘',
	'12345678912'
);

# 3字段的顺序和表顺序无关，值和字段必须一一对应
INSERT INTO beauty (
  phone,
	id,
	NAME
)
VALUES
	(
	'12345678913',
	16,
	'八姑娘'
);
# 4字段的个数要和值的个数相同

#修改：update 
# 语法：UPDATE 表名 SET 字段名=值,... WHERE 筛选条件
# 案例1：修改一个字段值
UPDATE beauty SET phone='123321' WHERE name = '七姑娘';

# 2：修改多个字段值
UPDATE beauty SET sex = '男',phone = '123321' WHERE name = '张三';

# 删除：delete/TRUNCATE
# TRUNCATE删除所有
# 语法：TRUNCATE TABLE 表名
# 语法：DELETE FROM 表名 WHERE 筛选条件

# 案例：删除id大于等于13的记录
DELETE FROM beauty WHERE id >= 13;




#练习：
#1.	运行以下脚本创建表my_employees

USE myemployees;
CREATE TABLE my_employees(
	Id INT(10),
	First_name VARCHAR(10),
	Last_name VARCHAR(10),
	Userid VARCHAR(10),
	Salary DOUBLE(10,2)
);
CREATE TABLE users(
	id INT,
	userid VARCHAR(10),
	department_id INT

);
#2.	显示表my_employees的结构
DESC my_employees;
#3.	向my_employees表中插入下列数据
/*
ID	FIRST_NAME	LAST_NAME	USERID	SALARY
1	patel		Ralph		Rpatel	895
2	Dancs		Betty		Bdancs	860
3	Biri		Ben		Bbiri	1100
4	Newman		Chad		Cnewman	750
5	Ropeburn	Audrey		Aropebur	1550
*/
INSERT INTO my_employees (
	ID,
  FIRST_NAME,
 	LAST_NAME,
	USERID,
	SALARY
)
VALUES
	(
	1,'patel','Ralph','Rpatel',895
),
	(
	2,'Dancs','Betty','Bdancs',	860
),
	(
	3,'Biri','Ben','Bbiri',	1100
),
	(
	4,'Newman','Chad','Cnewman',750
),
	(
	5,'Ropeburn','Audrey','Aropebur',1550
);
				
#4.	 向users表中插入数据
/*
1	Rpatel	    10
2	Bdancs  	10
3	Bbiri   	20
4	Cnewman	30
5	Aropebur	40
*/
INSERT INTO users (
	ID,
  userid,
	department_id
)
VALUES
	(
	1,'Rpatel',10
),
	(
	2,'Bdancs',10
),
	(
	3,'Bbiri',20
),
	(
	4,'Cnewman',30
),
	(
	5,'Aropebur',40
);

#5.将3号员工的last_name修改为“drelxer”
UPDATE my_employees 
SET last_name = 'drelxer'
WHERE
	id = 3;

#6.将所有工资少于900的员工的工资修改为1000
UPDATE my_employees
SET salary = 1000
WHERE salary < 900;

#7.将userid 为Bbiri的user表和my_employees表的记录全部删除
DELETE
FROM
	users
WHERE
	userid = 'Bbiri';
DELETE
FROM
	my_employees
WHERE
	userid = 'Bbiri';

#8.删除所有数据
DELETE FROM my_employees;
DELETE FROM users;
#9.检查所作的修正
SELECT * FROM my_employees;
SELECT * FROM users;
#10.清空表my_employees
TRUNCATE TABLE my_employees;
TRUNCATE TABLE users;



#DDL:数据的定义语言
/*
创建表create  修改表alter  删除表drop
*/
#1.管理数据库的创建和删除
# create database 数据库名；
# drop database 数据库名；
# 通用写法:
CREATE DATABASE IF NOT EXISTS db1;
DROP DATABASE IF EXISTS db1;
#2.管理数据库对象(表，视图，索引等)的创建修改和删除
# 创建表  CREATE TABLE 表名(字段 数据类型 [长度],...)
CREATE TABLE  IF NOT EXISTS stu_tb(
  stuid INT,
  stuname VARCHAR(50),
  email VARCHAR(50)
);
# 3.修改表(修改字段名，字段的数据类型和长度，表名，添加删除)
# 修改字段名:ALTER TABLE 表名 change COLUMN 字段名 新名 数据类型;
ALTER TABLE stu_tb CHANGE COLUMN stuname sname VARCHAR(50);
# 修改数据类型:ALTER TABLE 表名 MODIFY COLUMN 字段名 数据类型;
ALTER TABLE stu_tb MODIFY COLUMN sname VARCHAR(100);
# 添加字段：ALTER TABLE 表名 ADD COLUMN 字段名 数据类型;
ALTER TABLE stu_tb ADD COLUMN phone VARCHAR(11);
# 删除字段：ALTER TABLE 表名 DROP COLUMN 字段名 ;
ALTER TABLE stu_tb DROP COLUMN email ;
# 修改表名：ALTER TABLE 表名 RENAME TO 新表名;
ALTER TABLE stu_tb RENAME TO stu_tbb;
# 4.删除表
# DROP TABLE 表名
DROP TABLE IF EXISTS stu_tbb;
# 5.表的复制
# 只复制表的结构
# 语法：create table 名 LIKE 要复制的表名;
CREATE TABLE copy1 LIKE stu_tb;
# 复制表结构+数据
# 语法：create table 名 SELECT 字段 FROM 要复制的表名;
CREATE TABLE copy2 SELECT * FROM stu_tb;
# 复制表结构+数据（部分）
# 语法：create table 名 SELECT 字段 FROM 要复制的表名 limit size;


#练习：
#1.	创建表dept1
#NAME	NULL?	TYPE
#id		INT(7)
#NAME		VARCHAR(25)
DROP TABLE IF EXISTS dept1;
CREATE TABLE IF NOT EXISTS dept1(
  id INT(7),
	name VARCHAR(25)
);

#2.	将表departments中的数据插入新表dept2中
CREATE TABLE dept2 SELECT * FROM departments;

#3.	创建表emp5
#NAME	NULL?	TYPE
#id		INT(7)
#First_name	VARCHAR (25)
#Last_name	VARCHAR(25)
#Dept_id		INT(7)
DROP TABLE IF EXISTS emp5;
CREATE TABLE IF NOT EXISTS emp5(
  id INT(7),
	First_name VARCHAR(25),
	Last_name VARCHAR(25),
	Dept_id INT(7)
);

#4.	将列Last_name的长度增加到50
ALTER TABLE emp5 MODIFY COLUMN Last_name VARCHAR(50);

#5.	根据表employees创建employees2
CREATE TABLE employees2 SELECT * FROM employees;

#6.	删除表emp5
DROP TABLE IF EXISTS emp5;

#7.	将表employees2重命名为emp5
ALTER TABLE employees2 RENAME TO emp5;

#8.在表dept和emp5中添加新列test_column，并检查所作的操作
ALTER TABLE dept1 ADD COLUMN test_column VARCHAR(11);
ALTER TABLE dept2 ADD COLUMN test_column VARCHAR(11);
ALTER TABLE emp5 ADD COLUMN test_column VARCHAR(11);
DESC dept1;
DESC dept2;
DESC emp5;

#9.直接删除表emp5中的列 department_id
ALTER TABLE emp5 DROP COLUMN department_id;



#1.显示员工的最大工资，工资的平均值  
SELECT
  MAX(salary),
  AVG(salary)
FROM
  employees;  

#2.查询员工表的employee_id,job_id,last_name,按department_id降序，salary升序
SELECT
  employee_id,job_id,last_name
FROM
  employees
ORDER BY
  department_id DESC,
  salary ASC;

#3.查询员工表的job_id中包含a和e的，并且a在e的前面
SELECT
  DISTINCT job_id
FROM
  employees
WHERE
  job_id LIKE '%a%e%';  

#4.已知表student，有id（学号），name，gradeId（班级号）
  #已知表grade，有id（年级号），name（年级名）
  #已知表result，有id，score，studno（学号）
  #要求查询姓名，年级名，成绩
SELECT
  s.name,g.name,r.score
FROM
  student s
INNER JOIN grade g ON g.id = s.gradeId
INNER JOIN result r ON r.studno = s.id;

#5.显示当前日期，以及去前后空格，截取子串的函数
SELECT
	TRIM('  hello  ');

SELECT
	SUBSTR('abcdefg', 6),
	SUBSTR('abcdefg', 1, 6);

SELECT
	NOW();
