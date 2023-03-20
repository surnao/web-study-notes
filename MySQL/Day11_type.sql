#DDL
#一.数据类型
#1.数值类型：整型，小数型
#  整型：tinyint 1字节,smallint 2,int 4,bigint 8
#  案例：
		 USE test;
		 DROP TABLE IF EXISTS tb_int;
     CREATE TABLE tb_int (
       c1 INT,
			 c2 INT(5) ZEROFILL # 5表示显示长度,不够用0占位
     );
     INSERT INTO tb_int (c1,c2) VALUES (123456789,1234);
     INSERT INTO tb_int (c1,c2) VALUES (123456789,123456);

#  小数型：float 4,double 8
#   f1 FLOOR(5,2) 5表示整数和小数的位数和(不能超出位数),2表示小数位数(超出位数就四舍五入)
#   f2 FLOOR      按照具体赋值,自动匹配
#  案例：
    CREATE TABLE tb_float (
			f1 FLOAT(5,2),
			f2 FLOAT
		);
		INSERT INTO tb_float (f1,f2) VALUES (123.456,12.321);
		INSERT INTO tb_float (f1,f2) VALUES (1234.456,12.321);# Err

#2.字符串类型
/*
2.1比较小的字符串：char(定长字符串),varchar(可变长度字符串)
CHAR：
 c1 CHAR(10); 10表示字符串最大的长度
 c2 CHAR  ()可以省略,默认值为1
 c1:'你好',分配10个长度,浪费空间,效率高
VARCHAR：
 v1 VARCHAR(10); 小括号必须要写,10表示字符串最大的长度
 v1:'你好',分配2个长度,节省空间,效率低

2.2比较小的二进制：binary,varbinary
2.3比较大的字符串：text,blob(二进制 图片)
*/

#3.日期类型:
/*
   date time year 
   datetime： 8  1000---9999 不受时区影响
   timestamp：4  1970---2038   受时区影响
*/
CREATE TABLE tb_date (
  d1 datetime,
  d2 TIMESTAMP
);
INSERT INTO tb_date (d1,d2) VALUES (NOW(),NOW());

#4.枚举和集合
# 枚举：只能赋一个值
CREATE TABLE tb_enum(
  e enum('a','b','c')
);
INSERT INTO tb_enum (e) VALUES ('a');
INSERT INTO tb_enum (e) VALUES ('C');
INSERT INTO tb_enum (e) VALUES ('d');# Err 

# 集合：能赋多个值
CREATE TABLE tb_set(
  s set('a','b','c')
);
INSERT INTO tb_set (s) VALUES ('a');
INSERT INTO tb_set (s) VALUES ('a,C');
INSERT INTO tb_set (s) VALUES ('a,d');# Err 

#二.约束：定义字段值的取值范围,保证数据的正确性和准确性
/*
 1.种类：
  1.1：6种
   not null约束：表示字段值必须添，不可以为null，比如：姓名
   /*default：表示给字段设置默认值，比如：年龄*/
   primary key：主键约束，表示记录的唯一性，值不能为空，一般不代表业务，主键至多有一个，主键字段可以有一个，多个
   unique：唯一性约束，字段值可以为空，比如：座位号,可以有多个
   chek：检查约束，salary > 800(MySQL不支持)
   foreign key：外键约束，外键字段是用来关联两张表关系的字段
    有外键的表称为外键表  外键属于的表称为主键表
  1.2：根据约束放的位置可以分为：列级约束，表级约束   create table t(
     id int PRIMARY KEY,---列级约束
     email varchar(50),
     UNIQUE(email) --- 表级约束
   )
 2.添加约束
   添加约束的时机：创建表，修改表
  2.1添加约束-创建表-通用写法
  CREATE TABLE emp(
   empid INT PRIMARY KEY,
   ename VARCHAR(50) NOT NULL UNIQUE,
   age INT DEFAULT 23,
   seat INT UNIQUE,
   deptid INT,
   CONSTRAINT fk_emp_dept FOREIGN KEY (deptid) REFERENCES dept(deptid)
  );
  2.2添加约束-修改表-写法
   添加主键约束
   ALTER TABLE 表名 ADD PRIMARY KEY(字段名);
   添加不为空约束
   ALTER TABLE 表名 MODIFY 字段名 数据类型 NOT NULL;
   添加默认值
   ALTER TABLE 表名 MODIFY 字段名 数据类型 DEFAULT 默认值;
   添加唯一性约束
   ALTER TABLE 表名 ADD CONSTRAINT 约束名 UNIQUE (字段名);
   添加外键约束
   ALTER TABLE 表名 ADD CONSTRAINT 约束名 FOREIGN KEY (外键名)
   REFERENCES 主键表名(外键名);
 3.删除约束
    删除主键约束
		ALTER TABLE 表名 DROP PRIMARY KEY;
	  删除不为空约束
		ALTER TABLE 表名 MODIFY COLUMN 字段名 数据类型 NULL;
	  删除默认值
		ALTER TABLE 表名 MODIFY COLUMN 字段名 数据类型;
	  删除唯一性约束
		ALTER TABLE 表名 DROP INDEX 约束名;
	  删除外键约束
		ALTER TABLE 表名 DROP FOREIGN 约束名;
 4.主键自动增长：auto_increment
*/
DROP TABLE emp ;
DROP TABLE dept ;
# 主键表
CREATE TABLE dept(
  deptid INT PRIMARY KEY,
  deptname VARCHAR(50)
);
# 创建表，添加约束---列级约束
CREATE TABLE emp(
  empid INT PRIMARY KEY,
  ename VARCHAR(50) NOT NULL,
  age INT DEFAULT 23,
  seat INT UNIQUE,
  deptid INT REFERENCES dept(deptid)# mysql 不支持此种方式定义外键
);
# 显示主键，外键，唯一性约束，可以使用以下语句来实现
SHOW INDEX FROM  emp;

# 创建表，添加约束---表级约束
CREATE TABLE emp(
  empid INT,
  ename VARCHAR(50) NOT NULL UNIQUE,
  age INT DEFAULT 23,
  seat INT,
  deptid INT,
  PRIMARY KEY (empid),
  CONSTRAINT uq_seat UNIQUE (seat),
  CONSTRAINT fk_emp_dept FOREIGN KEY (deptid) REFERENCES dept(deptid)
);

#添加约束-修改表
CREATE TABLE emp(
  empid INT,
  ename VARCHAR(50),
  age INT ,
  seat INT,
  deptid INT
);
# 添加主键约束
ALTER TABLE emp ADD PRIMARY KEY(empid);
# 添加不为空约束
ALTER TABLE emp MODIFY ename VARCHAR(50) NOT NULL;
# 添加默认值
ALTER TABLE emp MODIFY age INT DEFAULT 23;
# 添加唯一性约束
ALTER TABLE emp ADD CONSTRAINT unique_seat UNIQUE (seat);
# 添加外键约束
ALTER TABLE emp ADD CONSTRAINT fk_emp FOREIGN KEY (deptid) REFERENCES dept(deptid);

#删除约束
#删除主键约束
ALTER TABLE emp DROP PRIMARY KEY;
#删除不为空约束
ALTER TABLE emp MODIFY COLUMN ename VARCHAR(50) NULL;
#删除默认值
ALTER TABLE emp MODIFY COLUMN age INT;
#删除唯一性约束
ALTER TABLE emp DROP INDEX unique_seat;
#删除外键约束
ALTER TABLE emp DROP FOREIGN key fk_emp;

# 主键自动增长：auto_increment
CREATE TABLE tb_test(
  id INT auto_increment PRIMARY KEY,
  tname VARCHAR(50)
);
INSERT INTO tb_test (tname) VALUES ('alen');

#练习：
#1. 向表emp2的id列中添加PRIMARY KEY约束（my_emp_id_pk）
ALTER TABLE emp2 ADD CONSTRAINT my_emp_id_pk PRIMARY KEY(id);
#2.	向表dept2的id列中添加PRIMARY KEY约束（my_dept_id_pk）
ALTER TABLE dept2 ADD CONSTRAINT my_dept_id_pk PRIMARY KEY(id);
#3.	向表emp2中添加列dept_id,并在其中定义FOREIGN KEY约束,与之相关联的列是dept2表中的id列。
ALTER TABLE emp2 ADD COLUMN dept_id INT; 
ALTER TABLE emp2 ADD CONSTRAINT fk_emp2 FOREIGN KEY (dept_id) REFERENCES dept2(id);
