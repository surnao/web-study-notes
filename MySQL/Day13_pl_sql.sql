# PL/SQL存储过程
/*
 1.变量：定义赋值使用
  系统变量
  自定义变量：
    用户变量：相当于Java中成员变量
    局部变量：在begin end块中使用
  用户变量：不用指定数据类型
   set @a=1;
   set @b=2;
   set @sum=@a+@b;
   select @sum;
  局部变量：
   DECLARE a datatype DEFAULT 1;
   SET a = 10;
   SELECT a;
 2.存储过程的定义格式
   CREATE PROCEDURE 过程名(参数列表)
   BEGIN
   END
   参数列表：参数模式，参数名，参数类型
   参数模式：IN(默认) 表示输入参数
             OUT 表示输出参数
             INOUT 表示既可以作为输入参数又可以作为输出参数
   调用函数：call 函数名;
   赋值：into  set
*/
SET @a = 1;
SET @b = 2;
SET @sum = @a + @b;
SELECT @sum;

DECLARE a INT DEFAULT 1;
DECLARE b INT DEFAULT 2;
SET a = 10;
DECLARE sum INT;
SET sum = a + b;
SELECT sum;

#案例1：定义一个存储过程p_emp，在employees表中插入数据
delimiter $
CREATE PROCEDURE p_emp()
BEGIN
INSERT INTO employees (last_name,salary) VALUES('admin',20000);
END $

CALL p_emp();


#案例：定义存储过程p_emp2,模拟注册
delimiter $


CREATE PROCEDURE p_emp2 (
	IN plast_name VARCHAR (25),
	IN psalary DOUBLE
)
BEGIN
	INSERT INTO employees (last_name, salary)
VALUES
	(plast_name, psalary) ;
END $
CALL p_emp2('张三',10000);

#案例：定义存储过程getSalary,根据传入的姓名，显示工资
delimiter $
CREATE PROCEDURE getSalary (pname VARCHAR(50))
BEGIN
  DECLARE v_salary DOUBLE DEFAULT 0;

  SELECT salary INTO v_salary
  FROM employees
  WHERE last_name = pname;

  SELECT v_salary;
END $
CALL getSalary('Chen');

#练习：
#1定义一个存储过程p_sum，传入a和b完成求和，显示和
delimiter $
CREATE PROCEDURE p_sum(pa INT,pb INT)
BEGIN
  DECLARE v_sum INT;
  SELECT v_sum  =  pa + pb;
  SELECT v_sum ;
END $
CALL p_sum(1,2);


#2定义一个存储过程login,传入用户名和密码，如果存在则显示登录成功，否则显示登录失败。模拟登录
USE girls;
delimiter $
CREATE PROCEDURE login(pusername VARCHAR(10),ppassword VARCHAR(10))
BEGIN
  DECLARE v_login INT;
  SELECT
    COUNT(*) INTO v_login
  FROM
    admin
  WHERE 
    username = pusername 
  AND
    password = ppassword;
  SELECT IF(v_login > 0,'登录成功','登录失败');
END $

CALL login('john','8888');