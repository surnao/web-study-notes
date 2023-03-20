#视图：
/*
1.什么是视图：
 虚拟的表，保存了基于表的逻辑关系

2.定义视图：
 CREATE VIEW 视图名 AS SELECT语句

3.使用视图：和表相同

4.为什么定义视图：
 1.简化多表连接查询的复杂度
 2.屏蔽字段

5.修改视图：
 1.CREATE OR REPLACE VIEW 视图名 AS SELECT....
 2.ALTER VIEW 视图名 AS SELECT ....
6.删除视图：
 DROP VIEW v1,v2,v3...

7.视图的dml（不建议）
  视图的dml操作，实际是对表的dml操作
8.那些视图不可以修改（dml）
  1）视图中包含distinct,having,group by分组函数，union,union all
  2）常量视图
  3）select后边包含select
  4）通过不可以修改的视图创建出来的视图
*/

CREATE VIEW v_view1
AS
SELECT last_name,salary,department_name
FROM employees e
INNER JOIN departments d ON d.department_id = e.department_id;

SELECT * FROM v_view1;
SELECT last_name,department_name
FROM v_view1;

CREATE VIEW v_emp
AS
SELECT employee_id,last_name,job_id,e.department_id,department_name,email,phone_number
FROM employees e
INNER JOIN departments d ON d.department_id = e.department_id;

#案例1：定义视图last_name,department_name,job_title
CREATE VIEW v_emp01 AS SELECT
	last_name,
	department_name,
	job_title
FROM
	employees e
INNER JOIN departments d ON d.department_id = e.department_id
INNER JOIN jobs j ON j.job_id = e.job_id;

#案例2：定义视图department_id,avg(salary),平均工资等级
CREATE VIEW v_emp02 AS SELECT
	department_id,
	AVG(salary) AS a
FROM
	employees
GROUP BY
	department_id;

CREATE VIEW v_emp03 AS SELECT
	t.*, grade_level
FROM
	v_emp02 AS t
INNER JOIN job_grades ON t.a BETWEEN lowest_sal
AND highest_sal;

# 修改视图
CREATE OR REPLACE VIEW v_emp AS SELECT
  *
FROM departments;

ALTER VIEW v_emp AS SELECT * FROM employees;

# 删除视图
DROP VIEW v_emp,v_emp01,v_emp02,v_emp03,v_view1;

#视图的dml
CREATE VIEW v_emp AS SELECT last_name,email FROM employees;

INSERT INTO v_emp (last_name,email) VALUES ('aaa','aaa@tedu.cn');
UPDATE v_emp SET email = '123@qq.com' WHERE last_name = 'aaa';
DELETE FROM v_emp WHERE last_name = 'aaa';

#
CREATE OR REPLACE VIEW v1 AS SELECT department_id,MAX(salary) m
FROM employees
GROUP BY department_id;
INSERT INTO v1 (department_id,m) VALUES (100,26000);#Err

CREATE VIEW v2 AS SELECT 'hello' c;
INSERT INTO v2 (c) VALUES ('abc');#Err

CREATE VIEW v3 AS SELECT (SELECT MAX(salary)FROM employees);

CREATE VIEW v4 AS SELECT * FROM v3;


#练习
#1.创建视图emp_v1,要求查询电话号码以‘011’开头的员工姓名和工资，邮箱
CREATE OR REPLACE VIEW emp_v1 
AS
SELECT
  last_name,salary,email
FROM
  employees
WHERE
  phone_number LIKE '011%';

#2.创建视图emp_v2,要求查询部门的最高工资高于12000的部门的信息

CREATE OR REPLACE VIEW emp_v2
AS
SELECT
  department_id
FROM
  employees e
GROUP BY
  department_id
HAVING
  MAX(salary)>12000;  
