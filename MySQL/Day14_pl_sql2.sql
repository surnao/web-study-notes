/*
   参数列表：参数模式，参数名，参数类型
   参数模式：IN(默认) 表示输入参数
             OUT 表示输出参数
             INOUT 表示既可以作为输入参数又可以作为输出参数
*/
#out参数使用
#定义p_emp3，通过输入员工编号，返回员工姓名
delimiter $
CREATE PROCEDURE p_emp3(in pempid INT,OUT pname VARCHAR(25))
BEGIN
  SELECT 
    last_name INTO pname
  FROM
    employees
	WHERE
		employee_id = pempid;
END $
CALL p_emp3(100,@name);
SELECT @name;

#练习：定义p_emp4，通过输入员工编号，返回员工姓名和工资
delimiter $
CREATE PROCEDURE p_emp4(in pempid INT,OUT pname varchar(25),OUT psalary DOUBLE)
BEGIN
  SELECT
    last_name,salary INTO pname,psalary
  FROM
    employees
	WHERE	
		employee_id = pempid;
END $
CALL p_emp4(100,@name,@salary);
SELECT @name,@salary;

#inout
#定义p_emp5，输入两个变量，返回两个变量的两倍
delimiter $
CREATE PROCEDURE p_emp5 (INOUT a INT,INOUT b int)
BEGIN
  SET a=a*2;
  SET b=b*2;
END $
SET @a = 2;
SET @b = 3;
CALL p_emp5(@a,@b);
SELECT @a,@b;

#练习：定义p_emp6，输入员工编号，返回年薪
delimiter $
CREATE PROCEDURE p_emp6(in pempid INT ,OUT psalary DOUBLE)
BEGIN
  SELECT
		salary * (1+IFNULL(commission_pct,0)) * 12 INTO psalary
  FROM
		employees
	WHERE
		employee_id = pempid;
END $
CALL p_emp6(100,@salary);
SELECT @salary;

#定义p_emp7,输入月工资，返回年息
delimiter $
CREATE PROCEDURE p_emp7(INOUT psalary INT)
BEGIN
  SET psalary = psalary *12;
END $
SET @a = 2000;
CALL p_emp7(@a);
SELECT @a;

