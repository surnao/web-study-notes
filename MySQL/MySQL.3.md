# MySQL.3

------

####  1.select 查询
**语法**：
 			SELECT 
    					显示列表
    		 FROM
    					表名
    		显示列表：可以字段，常量，表达式，函数
    	    FROM不是必须有的，当显示列表中没有表中字段的时候，省略from

**起别名**：使用as关键字，as可以省略；如果别名中包含了特殊符号，使用""或''    	

**去重** ：DISTINCT

**+** ： 

  运算符，没有连接符的功能
  如果是字符串，先字符串转换成 数值，然后计算
  如果不能转换成数值，转换成0，然后计算
  NULL做加法，返回null

 **IFNULL(expr1,expr2)** ：如果第一个表达式的值为空则返回第二个表达式的值，否则返回第一个表达式的值

 **concat(str1,str2,...)函数** ：链接

------

#### 2.过滤语句where

  **语法** ：
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

**like 模糊查询** ：
  通配符：% 表示任意个字符
					_ 表示一个字符
                    \ 默认转义字符
          ESCAPE  自定义转义字符

**安全等于 <=>** ： 既可以判断null又可以判断数据 