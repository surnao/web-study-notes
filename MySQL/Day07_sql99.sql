# SQL99标准
/*
  1.内连接：等值，非等值，自连接
  2.外连接：左，右，满外连接（满外连接MySQL不支持）
  3.交叉连接：笛卡尔集
  语法：
  SELECT
		查询列表
	FROM
		表名 别名
	type------连接类型 inner ,LEFT OUTER , RIGHT OUTER 
	JOIN 表名 别名
	ON------连接条件
	WHERE 筛选条件
	GROUP BY
	HAVING
	ORDER BY
  LIMIT
*/
# 内连接  inner 可以省略
# 外连接 
#左外连接：把满足条件的数据查出来，还要把左表中不满足连接条件的查出来
#右外连接：把满足条件的数据查出来，还要把右表中不满足连接条件的查出来
#满外连接：把满足条件的数据查出来，还要把左表和右表中不满足连接条件的查出来
#案例1.查询员工名、部门名  没有奖金的不包括在内
SELECT
	last_name,
	department_name
FROM
	employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE
	e.commission_pct IS NOT NULL;

#2.查询名字中包含e的员工名和工种名（添加筛选）
SELECT
	last_name,
	job_title
FROM
	employees e
INNER JOIN jobs j ON e.job_id = j.job_id
WHERE
	last_name LIKE '%e%';

#3. 查询部门个数>3的城市名和部门个数，（添加分组+筛选）
SELECT
	city,
	COUNT(*)
FROM
	departments d
INNER JOIN locations l ON d.location_id = l.location_id
GROUP BY
	city
HAVING
	COUNT(*) > 3;

#4.查询哪个部门的员工个数>3的部门名和员工个数，并按个数降序（添加排序）
SELECT
	department_name,
	COUNT(*)
FROM
	departments d
INNER JOIN employees e ON d.department_id = e.department_id
GROUP BY
	department_name
HAVING
	COUNT(*) > 3
ORDER BY
	COUNT(*) DESC;

#5.查询员工名、部门名、工种名，并按部门名降序（添加三表连接）
SELECT
	last_name,
	department_name,
	job_title
FROM
	employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN jobs j ON e.job_id = j.job_id
ORDER BY
	department_name DESC;

# 非等值连接  自连接
# 1.查询员工的工资级别
SELECT
	last_name,
	salary,
	grade_level
FROM
	employees e
INNER JOIN job_grades j ON salary BETWEEN j.lowest_sal
AND j.highest_sal;

# 2.查询工资级别的个数>20的个数，并且按工资级别降序
SELECT
	COUNT(*),
	grade_level
FROM
	employees e
INNER JOIN job_grades j ON salary BETWEEN j.lowest_sal
AND j.highest_sal
GROUP BY
	grade_level
HAVING
	COUNT(*) > 20
ORDER BY
	grade_level DESC;

# 3.查询员工的名字、上级的名字
SELECT
	e.last_name 员工名,
	m.last_name 管理者名
FROM
	employees e
INNER JOIN employees m ON e.manager_id = m.employee_id;

# 4.查询姓名中包含字符k的员工的名字、上级的名字
SELECT
	e.last_name 员工名,
	m.last_name 管理者名
FROM
	employees e
INNER JOIN employees m ON e.manager_id = m.employee_id
WHERE
	e.last_name LIKE '%k%';

# 外连接  
#案例1：查询所有员工的员工名，部门名，部门号
#左外连接
USE myemployees;
SELECT
	last_name,
	department_name,
	d.department_id
FROM
	employees e
LEFT OUTER JOIN departments d ON e.department_id = d.department_id; 
#WHERE
# d.department_id IS NULL;
#右外连接
SELECT
	last_name,
	department_name,
	d.department_id
FROM
	departments d
RIGHT OUTER JOIN employees e ON e.department_id = d.department_id;

# 满外连接
USE myemployees;
SELECT
  d.*,e.*
FROM
  employees e,
RIGHT OUTER JOIN departments d ON e.department_id = d.department_id;

# 交叉连接
SELECT
  d.*,e.*
FROM
  employees e,
CROSS JOIN departments d ON e.department_id = d.department_id;

# 练习：
#一、查询编号>3的女神的男朋友信息，如果有则列出详细，如果没有，用null填充
USE girls;
SELECT
  b.id,y.*
FROM
  beauty b
left OUTER JOIN boys y ON b.boyfriend_id = y.id
WHERE
  b.id > 3 ;

#二、查询哪个城市没有部门
USE myemployees;
SELECT
  city,
  department_id
FROM
  locations l
LEFT OUTER JOIN departments d ON l.location_id = d.location_id
WHERE
  d.department_id IS NULL;

#三、查询部门名为SAL或IT的员工信息部门名，部门编号
SELECT
  e.*,department_name
FROM
  employees e
RIGHT OUTER JOIN departments d ON e.department_id = d.department_id
WHERE
  department_name IN ('SAL','IT');


# 执行sql脚本
# homework  student.sql
# 作业：
#一、查询每个专业的学生人数
USE student;

SELECT
	s.majorid,
	COUNT(*)
FROM
	student s
GROUP BY
	majorid;

#二、查询参加考试的学生中，每个学生的平均分、最高分
SELECT
	studentno,
	AVG(score),
	MAX(score)
FROM
	result
GROUP BY
	studentno;

#三、查询姓张的每个学生的最低分大于60的学号、姓名
SELECT
	r.studentno,
	studentname,
	MIN(score)
FROM
	student s
INNER JOIN result r ON s.studentno = r.studentno
WHERE
	studentname LIKE '张%'
GROUP BY
	s.studentno
HAVING
	MIN(score) > 60;

#四、查询每个专业生日在“1988-1-1”后的学生姓名、专业名称
SELECT
	studentname,
	majorname,
  borndate
FROM
	student s
INNER JOIN major m ON s.majorid = m.majorid
WHERE
  DATEDIFF(borndate,'1988-1-1') > 0;

#
#五、查询每个专业的男生人数和女生人数分别是多少
# 方法一
SELECT
  majorid,
	COUNT(CASE WHEN sex = '男' THEN sex END) AS 男,
  COUNT(CASE WHEN sex = '女' THEN sex END) AS 女
FROM
	student
GROUP BY
	majorid;

# 方法二
SELECT
  majorid,sex,COUNT(*)
FROM
  student
GROUP BY
  majorid,sex;

#六、查询专业和张翠山一样的学生的最低分（不做）
#七、查询大于60分的学生的姓名、密码、专业名
SELECT
  studentname,
  loginpwd,
  majorname
FROM
  student s
INNER JOIN result r ON s.studentno = r.studentno
INNER JOIN major m ON m.majorid = s.majorid 
WHERE
  score > 60;

#八、按邮箱位数分组，查询每组的学生个数
SELECT
  LENGTH(email) AS 邮箱位数,
  COUNT(*)
FROM
  student
GROUP BY
  LENGTH(email);

#九、查询学生名、专业名、分数
SELECT
  studentname,
  majorname,
  score
FROM
  student s
LEFT OUTER JOIN result r ON s.studentno = r.studentno
INNER JOIN major m ON m.majorid = s.majorid;

#十、查询哪个专业没有学生，分别用左连接和右连接实现
SELECT
  majorname,studentno
FROM
  student s
LEFT OUTER JOIN major m ON s.majorid = m.majorid
WHERE
  s.studentno IS NULL;

SELECT
  majorname,studentno
FROM
  major m 
RIGHT OUTER JOIN student s ON s.majorid = m.majorid
WHERE
  s.majorid IS NULL;
#十一、查询没有成绩的学生人数
SELECT
  COUNT(*) AS 没有成绩
FROM
  student s
LEFT OUTER JOIN result r ON s.studentno = r.studentno
WHERE
 r.studentno IS NULL;






















  

