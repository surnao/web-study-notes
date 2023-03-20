# 过滤语句 WHERE
/*
  语法：
   SELECT
      显示列表
   FROM
      表名
   WHERE
      条件
  运算符：
    1.比较运算符 > >= < <= = != <>
    2.逻辑运算符：and OR NOT
    3.其他运算符：like  
									between AND
									in
									is null    is not null 
*/
# 1.查询工资大于12000的员工信息
SELECT
	last_name,
	salary
FROM
	employees
WHERE
	salary > 12000;

# 2.查询不是90号部门的员工
SELECT
	last_name,
	department_id
FROM
	employees
WHERE
	department_id <> 90;

# 3.查询工资10000到20000之间的员工
SELECT
	last_name,
	salary
FROM
	employees
WHERE
	salary >= 10000
AND salary <= 20000;

# 4.查询不在90到110部门的员工或者工资大于20000的员工
SELECT
	last_name,
	department_id,
	salary
FROM
	employees
WHERE
	NOT (
		department_id >= 90
		AND department_id <= 110
	)
OR salary > 20000;

# 5.like 模糊查询
/*
  通配符：% 表示任意个字符
	_ 表示一个字符
          \ 默认转义字符
          ESCAPE  自定义转义字符
*/
# 查询last_name中包含a的员工信息
SELECT
	last_name
FROM
	employees
WHERE
	last_name LIKE '%a%';

# 查询last_name中第二个字符是a的员工信息
SELECT
	last_name
FROM
	employees
WHERE
	last_name LIKE '_a%';

# 查询last_name中第二个字符是_的员工信息
SELECT
	last_name
FROM
	employees
WHERE
	last_name LIKE '_$_%' ESCAPE '$';

# salary >= 10000 and salary <= 20000;
# salary BETWEEN 10000 AND 20000;
SELECT
	last_name,
	salary
FROM
	employees
WHERE
	salary BETWEEN 10000
AND 20000;

# in 
# department_id = 20 OR department_id = 90 OR department_id = 100;
# department_id in (20,90,100);
SELECT
	last_name,
	department_id
FROM
	employees
WHERE
	department_id IN (20, 90, 100);

# is null    is not null 
# 实现和null进行比较
# 显示没有奖金的员工
SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct IS NULL;

# 显示有奖金的员工
SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct IS NOT NULL;

# 安全等于 <=>
# 既可以判断null又可以判断数据 
# 显示没有奖金的员工
SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct <=> NULL;

# 练习
# 1  工号为176的员工
SELECT
	last_name,
	salary * 12*(1+IFNULL(commission_pct,0)),
	department_id
FROM
	employees
WHERE
	employee_id = 176;

# 2  工资不在5000到12000的员工
SELECT
	salary,
	last_name
FROM
	employees
WHERE
	salary NOT BETWEEN 5000
AND 12000;

# 3 部门在20或者50的员工
SELECT
	last_name,
	department_id
FROM
	employees
WHERE
	department_id IN (20, 50);

# 4  没有管理者员工信息
SELECT
	job_id,
	last_name
FROM
	employees
WHERE
	manager_id is null;

# 5 有奖金员工信息
SELECT
	last_name,
	salary,
	commission_pct
FROM
	employees
WHERE
	commission_pct IS NOT NULL;

# 6 姓名第三个字母为a
SELECT
	*
FROM
	employees
WHERE
	last_name LIKE '__a%';

# 7 姓名含有a和e
SELECT
	last_name
FROM
	employees
WHERE
	last_name LIKE '%a%'AND last_name LIKE '%e%';

# 8 姓名以e结尾
SELECT
	last_name
FROM
	employees
WHERE
	last_name LIKE '%e';

# 9 部门号在80-100之间
SELECT
	department_id last_name,
	job_id
FROM
	employees
WHERE
	department_id BETWEEN 80
AND 100;

# 10 manger_id 是 100，101，110
SELECT
	manager_id,
	last_name,
	job_id
FROM
	employees
WHERE
	manager_id IN (100, 101, 110);