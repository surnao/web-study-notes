# 子查询
/*
  在select语句或者其子句中出现select语句，把select语句叫子查询
 
  子查询和主查询  

  按select出现的位置：
    select 字段1...(select)
    from (select)
    where和having(select)

  按子查询和主查询的执行顺序：
		标准子查询：先执行子查询，把子查询的结果用于主查询
		相关子查询：先执行主查询，把主查询的结果用于子查询
*/
#一、where或having后面
/*
  子查询放到小括号里面
  子查询放到等号的右边
  如果子查询返回一行，通常使用单行运算符 > = < <= >= != <>
  如果子查询返回多行，通常使用 in 
*/
#案例1：谁的工资比 Abel 高?
SELECT
	*
FROM
	employees
WHERE
	salary > (
		SELECT
			salary
		FROM
			employees
		WHERE
			last_name = 'Abel'
	);

#案例2：返回job_id与141号员工相同，salary比143号员工多的员工 姓名，job_id 和工资
SELECT
	last_name,
	job_id,
	salary
FROM
	employees
WHERE
	job_id = (
		SELECT
			job_id
		FROM
			employees
		WHERE
			employee_id = 141
	)
AND salary > (
	SELECT
		salary
	FROM
		employees
	WHERE
		employee_id = 143
);

#案例3：查询员工编号最小并且工资最高的员工信息（子查询返回多个列）
SELECT
	*
FROM
	employees
WHERE
	employee_id = (
		SELECT
			MIN(employee_id)
		FROM
			employees
	)
AND salary = (
	SELECT
		MAX(salary)
	FROM
		employees
);

#案例4：返回公司工资最少的员工的last_name,job_id和salary（子查询中包含分组函数）
SELECT
	last_name,
	job_id,
	salary
FROM
	employees
WHERE
	salary = (
		SELECT
			MIN(salary)
		FROM
			employees
	);

#案例5：查询最低工资大于50号部门最低工资的部门id和其最低工资（having子句使用子查询）
SELECT
	department_id,
	MIN(salary)
FROM
	employees
GROUP BY
	department_id
HAVING
	MIN(salary) > (
		SELECT
			MIN(salary)
		FROM
			employees
		WHERE
			department_id = 50
	);

#非法使用标准子查询（子查询返回多行）
# 案例1.查询和20部门员工工资相同其他部门员工的信息（salary,last_name,department_id）
SELECT
	salary,
	last_name,
	department_id
FROM
	employees
WHERE
	salary IN (
		SELECT
			salary
		FROM
			employees
		WHERE
			department_id = 20
	)
AND department_id != 20;

#案例2：查询有员工的部门名
SELECT
	department_name
FROM
	departments
WHERE
	department_id IN (
		SELECT DISTINCT
			department_id
		FROM
			employees
	);

# from后面
/*
  FROM执行的select子句，可以把结果当成一个表使用
  给子查询的结果（表）起别名
*/
#案例：查询每个部门的平均工资的工资等级
SELECT
	grade_level,
	t1.*
FROM
	(
		SELECT
			department_id,
			AVG(salary) AS a
		FROM
			employees
		GROUP BY
			department_id
	) AS t1
INNER JOIN job_grades j ON t1.a BETWEEN lowest_sal
AND highest_sal;

#二、select后面
#案例：查询每个部门的员工个数
SELECT
	d.*, (
		SELECT
			COUNT(*)
		FROM
			employees
		WHERE
			department_id = d.department_id
	)
FROM
	departments d;

#练习
#1.	查询和Zlotkey相同部门的员工姓名和工资
SELECT
  department_id,
  last_name,
	salary
FROM
  employees
WHERE
  department_id = (
		SELECT
			department_id
		FROM
			employees
		WHERE
			last_name = 'Zlotkey'
  )
AND last_name != 'Zlotkey';

#2.查询工资比公司平均工资高的员工的员工号，姓名和工资
SELECT
  employee_id,
	last_name,
	salary
FROM
  employees
WHERE
	salary > (
		SELECT
			AVG(salary)
		FROM
			employees
  );

#3.查询各部门中工资比本部门平均工资高的员工的员工号, 姓名和工资
SELECT
  employee_id,
  last_name,
	salary,
  t1.a,
  e.department_id
FROM(
  SELECT
		department_id,
		AVG(salary) AS a
	FROM
		employees
	GROUP BY
    department_id
) AS t1
INNER JOIN employees e ON e.department_id = t1.department_id
WHERE
  salary > t1.a;
	

#4.查询和姓名中包含字母u的员工在相同部门的员工的员工号和姓名
SELECT
  department_id,
  last_name,
	employee_id
FROM
  employees
WHERE
  department_id IN (
		SELECT
			DISTINCT department_id
		FROM
			employees
		WHERE
			last_name LIKE '%u%'
  );
  
#5.查询管理者是King的员工姓名和工资
SELECT
  last_name,
	salary,
	manager_id
FROM
  employees
WHERE
  manager_id IN (
    SELECT 
      employee_id
		FROM
			employees
		WHERE
			last_name = 'K_ing'
  );

#6.查询工资最高的员工的姓名，要求first_name和last_name显示为一列，列名为 姓.名
SELECT
  CONCAT(last_name,'_',first_name) as "姓.名"
FROM
  employees
WHERE
  salary = (
		SELECT
			MAX(salary)
		FROM
			employees
  );
  


#分页查询
/*  
  SELECT		查询列表			7	
	FROM	表名 别名			1
	type------连接类型  
	JOIN 表名 别名			2
	ON------连接条件			3
	WHERE 筛选条件			4
	GROUP BY			5
	HAVING				6
	ORDER BY			8
  LIMIT	[OFFSET]  size			9
 OFFSET:表中数据的索引，从0开始
 size：一页显示几条数据
 (page - 1) * size = OFFSET
*/

#案例1：查询前五条员工信息
SELECT
	*
FROM
	employees
LIMIT 5;

SELECT
	*
FROM
	employees
LIMIT 0,
 5;

#案例2：查询第11条——第25条
SELECT
  *
FROM
  employees
LIMIT 11,15;

#案例3：有奖金的员工信息，并且工资较高的前10名显示出来
SELECT
	*
FROM
	employees
WHERE
	commission_pct IS NOT NULL
ORDER BY
	salary DESC
LIMIT 10;

# 联合查询--UNION
/*
  把多个查询结果合并为一个结果
  通常在多张没有联系的表中使用
  保证列的顺序一致
  保证多个查询语句的列数相同
*/
# 查询员工部门号大于90或者邮箱包含字母‘u’的员工信息
SELECT
	department_id,
	email
FROM
	employees
WHERE
	department_id > 90
OR email LIKE '%u%';

SELECT department_id,email
FROM   employees
WHERE  department_id > 90
UNION
SELECT department_id,email
FROM   employees
WHERE  email LIKE '%u%';

#子查询的经典案例（作业）
# 1. 查询工资最低的员工信息: last_name, salary
SELECT
	last_name,
	salary
FROM
	employees
WHERE
	salary = (
    		SELECT
			MIN(salary)
		FROM
			employees
  );

# 2. 查询平均工资最低的部门信息
SELECT
	d.*
FROM
  departments d
WHERE
  department_id = 
	(
		SELECT
			department_id		
		FROM
			employees
		GROUP BY
			department_id
		ORDER BY 
			AVG(salary) 
		LIMIT 1
	)
;

# 3. 查询平均工资最低的部门信息和该部门的平均工资 
SELECT
	d.*,AVG(salary)
FROM
  departments d
INNER JOIN employees e ON e.department_id = d.department_id
WHERE
  d.department_id = 
	(
		SELECT
			department_id		
		FROM
			employees
		GROUP BY
			department_id
		ORDER BY 
			AVG(salary) 
		LIMIT 1
	)
;
# 4. 查询平均工资最高的 job 信息
SELECT
	j.*
FROM
	jobs j
WHERE
	job_id = (
		SELECT
			job_id
		FROM
			employees
		GROUP BY
			job_id
		ORDER BY
			AVG(salary) DESC
		LIMIT 1
	);

# 5. 查询平均工资高于公司平均工资的部门有哪些?
SELECT
	department_id
FROM
	employees
GROUP BY
	department_id
HAVING
	AVG(salary) > (
		SELECT
			AVG(salary)
		FROM
			employees
	);

# 6. 各个部门中 最高工资中最低的那个部门的 最低工资是多少
SELECT
  MIN(salary)
FROM
  employees
WHERE
  department_id = (
		SELECT
			department_id
		FROM
			employees
		GROUP BY
			department_id
		ORDER BY
			MAX(salary)
		LIMIT 1
	);

# 7. 查询平均工资最高的部门的 manager 的详细信息:
# last_name, department_id, email, salary
SELECT
	last_name,
	department_id,
	email,
	salary
FROM
	employees
WHERE
	employee_id = (
		SELECT
			manager_id
		FROM
			departments
		WHERE
			department_id = (
				SELECT
					department_id
				FROM
					employees
				GROUP BY
					department_id
				ORDER BY
					AVG(salary) DESC
				LIMIT 1
			)
	);