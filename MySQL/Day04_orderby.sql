# ORDER BY排序
/*
  语法
    SELECT
      查询列表
    FROM
      表名
    [WHERE ]
    ORDER BY
      排序的列表 升序或降序、
  1.升序 ASC    降序 DESC
  2.默认的排序规则是升序
  3.排序的列表：
      字段（一个字段排序，也可以按多个字段排序）
      表达式
			别名
      函数
	4.order by 是select子句中的最后一个子句（limit除外）
*/
# 案例1.查询员工的姓名，工资并按工资降序排列
SELECT
	last_name,
	salary
FROM
	employees
ORDER BY
	salary DESC;

# 2.查询员工的姓名，部门号，工资，按工资进行升序排列
# 部门号大于90
SELECT
	last_name,
	department_id,
	salary
FROM
	employees
WHERE
	department_id > 90
ORDER BY
	salary ASC;

# 3.查询员工的姓名，工资，年薪，按年薪降序排列
SELECT
	last_name,
	salary,
	salary * 12 * (1 + IFNULL(commission_pct, 0))
FROM
	employees
ORDER BY
	salary * 12 * (1 + IFNULL(commission_pct, 0)) DESC;

# 4.按别名排序
SELECT
	last_name,
	salary,
	salary * 12 * (1 + IFNULL(commission_pct, 0)) AS 年薪
FROM
	employees
ORDER BY
	年薪 DESC;

# 5.查询员工姓名，工资，员工编号，先按照工资进行降序排列，再按照员工编号升序排列
SELECT
	last_name,
	salary,
	employee_id
FROM
	employees
ORDER BY
	salary DESC,
	employee_id ASC;

# 6.按函数排序
# 查询员工姓名和姓名的字节数并按姓名长度排序
SELECT
  last_name,
  LENGTH(last_name)
FROM
  employees
ORDER BY
  LENGTH(last_name);

# 练习
# 1.查询员工姓名，部门编号，年薪，按照年薪降序排列，按姓名升序排列
SELECT
  last_name,
  department_id,
  salary * 12 * (1 + IFNULL(commission_pct,0))
FROM
  employees
ORDER BY
  salary * 12 * (1 + IFNULL(commission_pct,0)) DESC,
  last_name ASC;

# 2.选择工资不在8000-17000之间员工的姓名，工资，按工资降序排列
SELECT
  last_name,
  salary
FROM
  employees
WHERE
  salary NOT BETWEEN 8000 AND 17000
ORDER BY
  salary DESC;

# 3.查询邮箱中包含e的员工信息并先按邮箱字节数降序，再按部门号升序排列
SELECT
  *,
  LENGTH(email)
FROM
  employees
WHERE
  email LIKE '%e%'
ORDER BY
  LENGTH(email) DESC,
  department_id ASC;
 