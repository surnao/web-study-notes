# MySQL.4

------

###  ORDER BY排序
  **语法** :
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

------

### 函数

 把能完成某一个功能的多条语句，封装到函数中，对外提供一个函数名，进行访问

 特点：封装实现细节，重用

 分类：字符串函数，数学函数，日期函数，控制函数（单行函数） / （多行函数）

**字符串函数**

1.LENGTH(str)：获取字符串长度(字节数)的函数 

2.CONCAT(str1,str2,...)字符串链接

3.大写 UPPER(str) 小写 LOWER(str)

4.查询用户名last_name(转换为大写),first_name(转化为小写)，然后链接起来，别名：姓名

5.SUBSTR(str FROM pos FOR len):截取字串

6.INSTR(str,substr)：获取字串的索引值,从1开始 没有返回0

7.TRIM([remstr FROM] str):去掉前后空格,中间去不掉

8.REPLACE(str,from_str,to_str)：替换



**数学函数**

 1.四舍五入函数round()

 2.CEIL(X)返回大于等于参数的最小整数值,FLOOR(X)返回小于等于参数的最大整数值

 3.TRUNCATE(X,D) 截断函数（保留D位小数）

 4.MOD 取余（+-与10有关）



 **日期函数**

1.NOW() 获取系统时间，包含日期和时间
2.CURDATE() 获取系统时间，只包含日期
3.CURTIME() 获取系统时间，只包含时间
4.YEAR(date)MONTH(date) DAY(date)

​         

转换函数 

1.STR_TO_DATE(str,format)

 %Y 2021 年

 %y 21

 %m 03 月

 %c 3

 %d 1 日

 %H 24小时计时法

 %h 12小时计时法

 %i 分钟

 %s 秒

2.把日期类型转换成字符串类型 DATE_FORMAT(date,format)

3.其他函数 DATABASE() VERSION()

**控制函数**

1. IF(expr1,expr2,expr3)

**CASE 语句**

1.  

   CASE 字段

​      WHEN 值 THEN 表达式

​       ......

​    ELSE 值

​     END

\2. CASE

  WHEN 条件1 THEN 值

  ......

  ELSE

 END

 