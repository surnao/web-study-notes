# MySQL.2

------

#### 1.MySQL服务器的访问和退出

​    第一种：MySQL的客户端    退出：exit

​    第二种：Windows客户端   

​    mysql -h 主机名 -P 端口号 -u 用户名 -p密码 

​    mysql -u 用户名 -p密码

​    mysql -h localhost -P 3306 -u root -proot

------

#### 2.常用命令

​    **查看所有的数据库**    show databases；

​    **使用数据库**    use 库名；

​    **查看当前库的表**    show tables；

​    **查看其它数据库中的表**    show tables from 库名；

​    **查看当前所在的数据库**    select database();

​    **创建表**    create table 表名(字段名  数据类型，字段名  数据类型  )；

​    **插入数据**    insert into 表名(字段名，字段名） values( 值，值)；

​    **查询表中的数据**    select * from 表名；

​    **修改表中的数据**    update 表名 set 修改的字段名 = 值 where 字段名 = 值；

​                                 update studenttab set stuname = ‘admin123’ where stuid = ‘1’；

​    **删除表中的数据**    delete from 表名 where 字段名 = 值；

​    **查看mysql脚本**    select version()；         mysql -- version & mysql -V   ：windows客户端

​    **显示表结构** ： desc  表名；

------

#### 3.MySQL的语法规范

​    1） 不区分大小写，通常关键字大写，表名和字段名小写

​    2） 通常用；结尾，表示语句结束，也可以使用 \g

​    3） 可以分行写或者缩进

​    4） 注释

​                #  注释内容

​                --  注释内容

​                /* 注释内容 */

------

#### 4.安装客户端软件

------

#### 5.SQL分类

SQL（Structured Query language）: 结构化的查询语言，和数据库产品无关，通用的查询语言
SQL 分类：
DQL（data query language）：数据的查询语言    select 语句
DML(data manipulate language): 数据的操纵语言    INSERT  UPDATE  DELETE
DDL（Data Define language）：数据的定义语言    CREATE alter drop
TCL（Transaction Control Language）：数据的控制语言   COMMIT ROLLBACK

------

