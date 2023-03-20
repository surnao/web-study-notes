#函数
/*
 1.存储过程与函数的区别：
   函数必须有返回值return；
   函数只能返回一个变量，存储过程可以返回多个；
 2.函数的定义格式
   delimiter $
   CREATE FUNCTION 函数名(参数列表) RETURNS 数据类型
   BEGIN
     RETURN 值
   END $
   参数列表：变量 数据类型
*/
#案例：定义函数f_fun1，返回员工表员工的数量
delimiter $
CREATE FUNCTION f_fun1 () RETURNS INT
BEGIN
  DECLARE count INT;
  SELECT 
    COUNT(*) INTO count
  FROM
    employees;
  RETURN count;
END $
SET @a = f_fun1();
SELECT @a;

#定义函数f_fun2,输入员工编号，返回工资
delimiter $
CREATE FUNCTION f_fun2(pempid INT) RETURNS DOUBLE
BEGIN
  DECLARE sal DOUBLE;
  SELECT  salary INTO sal
  FROM employees
  WHERE employee_id = pempid;
  RETURN sal;
END $
SELECT f_fun2(100);

#定义函数f_fun3,输入两个整数，返回和
delimiter $
CREATE FUNCTION f_fun3(a INT,b INT) RETURNS INT
BEGIN
  DECLARE sum INT;
  SET sum = a + b;
  RETURN sum;
END $
SELECT f_fun3(1,2);

#练习：
# 创建存储过程，实现输入用户名和密码，插入到admin表
USE girls;
delimiter $
CREATE PROCEDURE p_adm1(pusername VARCHAR(10),ppwd VARCHAR(10))
BEGIN
  INSERT INTO admin(username,password) VALUES (pusername,ppwd);
END $
CALL p_adm1('alen','1122');
SELECT * FROM admin;

# 创建存储过程，实现输入女神的编号，返回女神名称和电话
delimiter $
CREATE PROCEDURE p_adm2(pid INT,OUT pname VARCHAR(50),OUT pphone VARCHAR(11))
BEGIN
  SELECT name,phone INTO pname,pphone
  FROM beauty
  WHERE id = pid;
END
CALL p_adm2(1,@name,@phone);
SELECT @name,@phone;

# 创建存储过程或函数，实现输入一个日期，格式化xxxx年xx月xx日并返回
delimiter $
CREATE PROCEDURE p_adm3(pdate datetime,OUT strDate VARCHAR(20))
BEGIN
  SELECT DATE_FORMAT(pdate,'%Y年%m月%d日') INTO strDate;
END $
CALL p_adm3(NOW(),@str);
SELECT @str;

# 创建存储过程或函数，根据传入的条目和起始索引，查询employees表的记录
USE employees;
delimiter $
CREATE PROCEDURE p_adm4(pindex INT,psize INT)
BEGIN
  SELECT *
  FROM employees
  LIMIT pindex,psize;
END $
CALL p_adm4(0,10);
