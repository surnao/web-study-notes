# select 查询
/*
    语法：
				SELECT 
						显示列表
				FROM
						表名
			显示列表：可以字段，常量，表达式，函数
			FROM不是必须有的，当显示列表中没有表中字段的时候，省略from
*/
# 案例
# 1.查询一个字段的值
USE myemployees;
SELECT
  salary
FROM
  employees;
# 2.查询多个字段
SELECT
  last_name,
  salary
FROM
  employees;
# 3.常量
SELECT
  100;
# 4.表达式
SELECT
  100+200;
SELECT
  salary +100
FROM
  employees;
# 5.函数
SELECT
  VERSION();
# 6.起别名
/*
  使用as关键字，as可以省略
  如果别名中包含了特殊符号，使用""或''
*/
# 显示员工的姓名和年薪
SELECT
  last_name,
  salary * 12 年薪
FROM
  employees;
SELECT
  last_name,
  salary * 12 "out put"
FROM
  employees;
# 7.去重
SELECT
  DISTINCT department_id
FROM
  employees;
# 8.+
/*
  运算符，没有连接符的功能
  如果是字符串，先字符串转换成 数值，然后计算
  如果不能转换成数值，转换成0，然后计算
  NULL做加法，返回null
*/
SELECT
  1 + 2;
SELECT
  '123' + 1;
SELECT
  NULL + 1;
# 显示员工的奖金
SELECT
  last_name,
  salary * IFNULL(commission_pct,0)
FROM
  employees;
# IFNULL(expr1,expr2)
/*
  如果第一个表达式的值为空则返回第二个表达式的值，否则返回第一个表达式的值
*/
SELECT
  IFNULL(commission_pct,0)
FROM
  employees;

# 9.concat(str1,str2,...)函数
# 把last_name和first_name链接在一起，字段别名 姓名
SELECT
  CONCAT(last_name,'_',first_name) as 姓名
FROM
  employees;




# 练习
# 1.查询employees表，last_name,jib_id,salary别名sal
SELECT
  last_name,
  job_id,
  salary as sal
FROM
  employees;
# 2.员工编号，姓名，年薪
SELECT
  employee_id,
  CONCAT(last_name,'_',first_name) as 姓名,
  salary * 12 * (1+IFNULL(commission_pct,0)) as 年薪
FROM 
  employees;
# 3.显示departments表结构，查询全部数据
DESC departments;
SELECT
  *
FROM
  departments; 
# 4. 显示employees表所有job_id(不重复)
SELECT
  DISTINCT job_id
FROM
  employees;
# 5.显示employees所有列，用逗号链接，列标题用out_put
SELECT
  CONCAT(employee_id,',',first_name,',',last_name,',',email,',',phone_number,',',job_id,',',
  salary,',',IFNULL(commission_pct,0),',',IFNULL(manager_id,0),',',department_id,',',hiredate) as OUT_PUT
FROM
  employees;








