# 多表连接查询
/*
  1.按年代分类
     SQL92标准（内连接查询）oracl都支持
     SQL99标准
	2.按功能分类
		 内连接查询
				等值连接查询
				非等值连接查询
				自连接查询
		 外连接查询
				左外连接查询
				右外连接查询
				满（全）外连接查询
		 交叉查询
*/

# SQL92语法（内连接查询）
# 内连接查询：在多表连接中，把满足条件的数据查出来，表的交集
# 笛卡尔集：m*n  产生原因：没有连接条件  避免：添加有效的连接条件
# 等值连接查询
/* 
  SELECT
    列表（多个表中字段）
  FROM
    表1，表2...
	WHERE
		连接条件(至少n-1个有效的连接条件)
  AND(OR) 
		筛选条件
	[GROUP BY]
	[HAVING]
	[ORDER BY]
*/


# 查询女神名和对应的男神名
USE girls;
SELECT
  name,
  boyName
FROM
  beauty,
  boys
WHERE
  boyfriend_id = boys.id;

#2、为表起别名
/*
  提高语句的简洁度
  区分多个重名的字段
  如果为表起了别名，则查询的字段就不能使用以前的表名
*/
#查询员工名、工种号、工种名
SELECT
  last_name,
  e.job_id,
  job_title
FROM
  employees AS e,
  jobs AS j
WHERE
  e.job_id = j.job_id;

#3、两个表的顺序是否可以调换
#查询员工名、工种号、工种名
SELECT
  last_name,
  e.job_id,
  job_title
FROM
  jobs AS j,
  employees AS e 
WHERE
  e.job_id = j.job_id;

#4、可以加筛选
#案例1：查询有奖金的员工名、部门名
SELECT
  last_name,
  department_name,
  commission_pct
FROM
  employees e,
  departments d
WHERE
  e.department_id = d.department_id
AND
  commission_pct IS NOT NULL;

#案例2：查询城市名中第二个字符为o的部门名和城市名
SELECT
  department_name,
  city
FROM
  departments d,
  locations l
WHERE
  d.location_id = l.location_id
AND
  city LIKE '_o%';

#5、可以加分组
#案例1：查询每个城市的部门个数
SELECT
  city,
  COUNT(*)
FROM
  departments d,
  locations l
WHERE
  d.location_id = l.location_id
GROUP BY
  city;

#案例2：查询有奖金的每个部门的部门名和部门的领导编号和该部门的最低工资
SELECT
  department_name,
  d.manager_id,
  MIN(salary)
FROM
  employees e,
  departments d
WHERE
  e.department_id = d.department_id
AND
  commission_pct IS NOT NULL
GROUP BY
  department_name,
  d.manager_id;

#6、可以加排序
# 查询每个工种的工种名和员工的个数，按员工个数降序
SELECT
  job_title,
  COUNT(*)
FROM
  jobs j,
  employees e
WHERE
  j.job_id = e.job_id
GROUP BY
  job_title
ORDER BY
  COUNT(*) DESC;

#7、可以实现三表连接？
#案例：查询员工名、部门名和所在的城市（city第一个字符是s，按部门名排序)
SELECT
  last_name,
  department_name,
  city
FROM
  employees e,
  departments d,
  locations l
WHERE
  e.department_id = d.department_id
AND 
  d.location_id = l.location_id
AND
  city LIKE 's%'
ORDER BY
  department_name;

#2、非等值连接
#案例1：查询员工的工资和工资级别
SELECT
  salary,
  grade_level,
  g.lowest_sal,
  g.highest_sal
FROM
  employees e,
  job_grades g
WHERE
  salary BETWEEN g.lowest_sal AND g.highest_sal;

#3、自连接
#案例：查询 员工号 员工名和上级的编号和名称
SELECT
  e.employee_id,
  e.last_name,
  m.employee_id,
  m.last_name
FROM
  employees e,
  employees m
WHERE
  e.manager_id = m.employee_id;


# 练习：
#1.显示所有员工的姓名，部门号和部门名称
SELECT
  last_name,
  d.department_id,
  department_name
FROM
  employees e,
  departments d
WHERE
  e.department_id = d.department_id;

#2.查询90号部门员工的job_id和90号部门的location_id
SELECT
  e.job_id,
  d.location_id
FROM
  employees e,
  departments d
WHERE
  e.department_id = d.department_id
AND
  d.department_id = 90;

#3.	选择所有有奖金的员工的last_name , department_name , location_id , city
SELECT
  last_name,
  department_name,
  d.location_id,
  city
FROM
  employees e,
  departments d,
  locations l
WHERE
  e.department_id = d.department_id
AND
  d.location_id = l.location_id
AND
  commission_pct is not NULL;

#4.选择city在Toronto工作的员工的last_name , job_id , department_id , department_name 
SELECT
  last_name , job_id , e.department_id , department_name 
FROM
  employees e,departments d,locations l
WHERE
  e.department_id = d.department_id
AND
  d.location_id = l.location_id
AND
  city = 'Toronto';


#5.查询每个工种、每个部门的部门名、工种名和最低工资
SELECT
  department_name,job_title,MIN(salary)
FROM
  employees e,departments d,jobs j
WHERE
  d.department_id = e.department_id
AND
  e.job_id = j.job_id
GROUP BY
  job_title,department_name;