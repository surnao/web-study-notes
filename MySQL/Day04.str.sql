# 函数
/*
  类似与Java中的方法
  把能完成某一个功能的多条语句，封装到函数中，对外提供一个函数名，进行访问
  特点：封装实现细节，重用
  分类：字符串函数，数学函数，日期函数，控制函数（单行函数） /  （多行函数）
*/
# 字符串函数
# 1.LENGTH(str)：获取字符串长度(字节数)的函数
SELECT
	LENGTH('Hello');

SELECT
	LENGTH('你好');

# 2.CONCAT(str1,str2,...)字符串链接
SELECT
	CONCAT('111', 'abc');

# 3.大写 UPPER(str)  小写 LOWER(str)
SELECT
	UPPER('abc'),
	LOWER('DEF');

# 4.查询用户名last_name(转换为大写),first_name(转化为小写)，然后链接起来，别名：姓名
SELECT
	last_name,
	first_name,
	CONCAT(
		UPPER(last_name),
		'_',
		LOWER(first_name)
	) AS 姓名
FROM
	employees;

# 5.SUBSTR(str FROM pos FOR len):截取字串
SELECT
	SUBSTR('老鼠爱大米', 4);  //从索引4开始截取到末尾

# 索引从1开始
SELECT
	SUBSTR('老鼠爱大米', 1, 2);  //从索引1开始截取2个字符

# 2表示截取的长度
# 4.查询用户名last_name(转换为大写),first_name(转化为小写)，然后链接起来，别名：姓名
# 显示last_name的第一个字母，转换成小写
SELECT
	last_name,
	first_name,
	CONCAT(
		UPPER(last_name),
		'_',
		LOWER(first_name)
	) AS 姓名,
	SUBSTR(LOWER(last_name), 1, 1)
FROM
	employees;

# INSTR(str,substr)：获取字串的索引值,从1开始  没有返回0
SELECT
	INSTR('hello', 'o');

# LPAD(str,len,padstr)左边填充为len-length（str）个padstr
SELECT
	LPAD('100', 10, '*');

# RPAD(str,len,padstr)
SELECT
	RPAD('100', 10, '*');

# TRIM([remstr FROM] str):去掉前后空格,中间去不掉
SELECT
	LENGTH(TRIM('  a a a   '));

SELECT
	LENGTH(TRIM('a' FROM 'aad a daaaa'));

# REPLACE(str,from_str,to_str)：替换
SELECT
	REPLACE (
		'老鼠爱大米',
		'大米',
		'小米'
	);

# 作业
/* 
  1.电商系统
  2.分析：那些模块组成
  3.概念模型：E-R图
  4.实体不能少于四个
*/
# 数学函数
# 四舍五入函数round()
SELECT
	ROUND(- 1.53);

# CEIL(X)返回大于等于参数的最小整数值,FLOOR(X)返回小于等于参数的最大整数值
SELECT
	CEIL(12.456);

SELECT
	FLOOR(12.456);

# TRUNCATE(X,D) 截断函数（保留D位小数）
SELECT
	TRUNCATE (12.987, 2);

# MOD 取余（+-与10有关）
SELECT
	MOD (10, 3);

# 日期函数
# NOW()  获取系统时间，包含日期和时间
SELECT
	NOW() # CURDATE() 获取系统时间，只包含日期
	SELECT
		CURDATE() # CURTIME() 获取系统时间，只包含时间
		SELECT
			CURTIME() # YEAR(date)
			# MONTH(date)
			# DAY(date)
			SELECT
				last_name,
				YEAR (hiredate),
				MONTH (hiredate),
				DAY (hiredate)
			FROM
				employees
			ORDER BY
				MONTH (hiredate) DESC;

# 转换函数 STR_TO_DATE(str,format)
/*
  %Y  2021 年
  %y  21
  %m  03 月
  %c  3
  %d  1 日
  %H  24小时计时法
  %h  12小时计时法
  %i  分钟
  %s  秒
*/
SELECT
	STR_TO_DATE('2021年3月1日','%Y年%c月%d日');


SELECT
	STR_TO_DATE('3月1日 2021年','%c月%d日 %Y年');

SELECT
  last_name
FROM
  employees
WHERE
  hiredate = STR_TO_DATE('4月3日 1992年','%c月%d日 %Y年');

# 把日期类型转换成字符串类型 DATE_FORMAT(date,format)
SELECT
  DATE_FORMAT(NOW(),'%Y年%m月%d日 %H:%i:%s');

# 显示last_name,入职日期（%Y年%m月%d日）
SELECT
  last_name,
  DATE_FORMAT(hiredate,'%Y年%m月%d日')
FROM
  employees;

# 其他函数 DATABASE() VERSION()
# USER()
SELECT
  USER ();

# 控制函数
# IF(expr1,expr2,expr3)
SELECT
  IF(10>3,'大','小');

# 显示员工姓名，奖金，如果commission_pct不为空显示有奖金否则显示没有奖金（备注）
SELECT
  last_name,
  commission_pct,
  IF(commission_pct is NOT null,'有奖金','无奖金') AS 备注
FROM
  employees;

# CASE 语句
# 1
/*
  CASE 字段
    WHEN 值 THEN 表达式
    ......
    ELSE 值
  END
*/

SELECT
  last_name,
  salary,
  department_id,
  CASE  department_id
    WHEN 90 THEN salary * 1.1
    WHEN 100 THEN salary * 1.2
    WHEN 110 THEN salary * 1.3
    ELSE salary
  END AS 年终奖
FROM
  employees;

# CASE 语句
# 2
/*
  CASE
    WHEN 条件1 THEN 值
    ......
    ELSE 值
  END
*/

SELECT
  last_name,
  salary,
  CASE
    WHEN salary > 20000 THEN 'A'
    WHEN salary > 10000 THEN 'B'
    WHEN salary > 8000 THEN 'C'
    ELSE 'D'
  END AS 工资等级
FROM
  employees;


# 练习
# 1.显示系统时间
SELECT
  NOW();

# 2.查询员工号，姓名，工资，以及工资提高%20后的结果（new salary）
SELECT
  employee_id,
  last_name,
  salary,
  salary * 1.2 AS 'new salary'
FROM
  employees;

# 3.将员工姓名按首字母排列，并写出姓名长度（length）
SELECT
  last_name,
  LENGTH(last_name) AS length
FROM
  employees
ORDER BY
  last_name ASC;

# 4.查询，产生以下结果（dream salary）
# <last_name> earns <salary> monthly but wants <salary*3>
# k_ing earns 24000 monthly but wants 72000
SELECT
  CONCAT(last_name,' earns ',TRUNCATE(salary,0),' monthly but wants ',TRUNCATE(salary * 3,0)) AS 'dream salary'
FROM
  employees;









