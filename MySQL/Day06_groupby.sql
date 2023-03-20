# 多行函数（分组，聚合，统计）
# SUM()
# AVG() 平均
# MAX()
# MIN()
# COUNT() 计数
# 分组函数都是忽略空值

# 分组查询
# 1.格式
/* 
  SELECT
    列表
  FROM
    表
  [WHERE]
  GROUP BY
    字段列表
  [HAVING]
  [ORDER BY]
*/
# 2.查询列表
# 查询列表中没有被分组函数包含的字段，最好出现再 group by 后边
# 3.筛选语句 
#    where：在分组之前进行数据的筛选 
#    HAVING：在分组之后筛选数据，包含分组函数
# 4.可以按一个字段进行分组，也可以按多个字段进行分组
# 5.可以使用 order by 进行排序


SELECT
	SUM(salary),
	AVG(salary),
	MIN(salary),
	MAX(salary),
	COUNT(*)
FROM
  employees;

SELECT
  department_id,
  AVG(salary)
FROM
  employees
GROUP BY
  department_id;

# 查询每个工种的员工平均工资
SELECT
  job_id,
  AVG(salary)
FROM
  employees
GROUP BY
  job_id;

# 查询每个位置的部门个数
SELECT
  location_id,
  COUNT(*)
FROM
  departments
GROUP BY
  location_id;

# 查询邮箱中包含a字符的每个部门的最高工资 
SELECT
  department_id,
  MAX(salary)
FROM
  employees
WHERE
  email LIKE '%a%'
GROUP BY
  department_id;

# 查询有奖金的每个领导手下员工的平均工资
SELECT
  manager_id,
  AVG(salary)
FROM
  employees
WHERE
  commission_pct IS NOT NULL
GROUP BY
  manager_id;

# 查询那个部门的员工个数>5
SELECT
  department_id,
  COUNT(*)
FROM
  employees
GROUP BY
  department_id
HAVING
  COUNT(*) > 5;

# 每个工种有奖金的员工的最高工资 >12000的工种编号和最高工资
SELECT
  job_id,
  max(salary)
FROM
  employees
WHERE
  commission_pct IS NOT NULL
GROUP BY
  job_id
HAVING
  max(salary) > 12000;

# 领导编号大于102的每个领导手下的最低工资大于5000的领导编号和最低工资
SELECT
  manager_id,
  MIN(salary)
FROM
  employees
WHERE
  manager_id > 102
GROUP BY
  manager_id
HAVING
  MIN(salary) > 5000;

# 每个工种有奖金的员工的最高工资 >6000的工种编号和最高工资,按最高工资升序
SELECT
  job_id,
  MAX(salary)
FROM
  employees
WHERE
  commission_pct IS NOT NULL
GROUP BY
  job_id
HAVING
  MAX(salary) > 6000
ORDER BY
  MAX(salary) ASC;

# 查询每个工种每个部门的最低工资，按最低工资降序
SELECT
  job_id,
  department_id,
  MIN(salary)
FROM
  employees
GROUP BY
  job_id,
  department_id
ORDER BY
  MIN(salary) DESC;

# 练习

# 1.查询各job_id的员工工资最大值，最小值，平均值，总和，按job_id升序
SELECT
  job_id,
  MAX(salary),
  MIN(salary),
  AVG(salary),
  SUM(salary)
FROM
  employees
GROUP BY
  job_id
ORDER BY
  job_id ASC;

# 2.查询员工最高工资和最低工资的差距（differnce）
SELECT
  MAX(salary) - MIN(salary) AS differnce
FROM
  employees;

# 3.查询各个管理者手下员工的最低工资，其中最低工资不低于6000，没有管理者的员工不计算
SELECT
  manager_id,
  MIN(salary)
FROM
  employees
WHERE
  manager_id IS NOT NULL
GROUP BY
  manager_id
HAVING
  MIN(salary) >= 6000;

# 4.查询所有部门编号，员工数量和平均工资，按平均工资降序
SELECT
  department_id,
  COUNT(*),
  AVG(salary)
FROM
  employees
GROUP BY
  department_id
ORDER BY
  AVG(salary) DESC;

# 5.查询各个job_id的员工人数
SELECT
  job_id,
  COUNT(*)
FROM
  employees
GROUP BY
  job_id;

