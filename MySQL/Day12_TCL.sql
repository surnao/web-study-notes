#TCL：Transaction Control Language 事务控制语言  commit rollback
/*
1.事务：
    一个或一组sql语句组成一个执行单元，这个执行单元要么全部执行，要么全部不执行。
2.事务的特性：
ACID
原子性（Atomicity）：原子性是指事务是一个不可分割的工作单位,事务中的操作要么都发生,要么都不发生
一致性（Consistency）：一个事务执行会使数据从一个一致状态切换到另外一个一致状态
隔离性（Isolation）：事务的隔离性是指一个事务的执行不能被其他事务干扰,
                     即一个事务内部的操作及使用的数据对并发的其他事务是隔离的,
                     并发执行的各个事务之间不能互相干扰
持久性（Durability）：持久性是指一个事务一旦被提交，它对数据库中数据的改变就是永久性的,
                      接下来的其他操作和数据库故障不应该对其有任何影响
3.事务的创建
1）隐式事务：事务没有明显的开启和结束的标记
比如insert、update、delete语句

2）显式事务：事务具有明显的开启和结束的标记
前提：必须先设置自动提交功能为禁用
  set autocommit=0;

系统变量autocommit，用来设置事务是否自动提交
autocommit = 1 表示自动提交
autocommit = 0 表示不是自动提交，必须手动执行提交的命令：commit;

步骤1：开启事务
set autocommit=0;
start transaction;可选的
步骤2：编写事务中的sql语句(select insert update delete)
语句1;
语句2;
...

步骤3：结束事务
commit;提交事务(成功)/rollback;回滚事务(失败)

delete支持rollback，truncate不支持rollback

显示提交的autocommit的默认值;
SHOW VARIABLES LIKE 'autocommit';

3）savepoint 节点名;设置保存点
*/


#转账  
USE test;
create TABLE account(
  id INT auto_increment PRIMARY KEY,
  balancel INT,
  name VARCHAR(50)
);
INSERT INTO account (balancel,name) VALUES (1000,'王五');
INSERT INTO account (balancel,name) VALUES (1000,'赵六');

SELECT @@autocommit;
SET autocommit = 0;


#案例1：演示事务的使用步骤

#开启事务
SET autocommit=0;
START TRANSACTION;
#编写一组事务的语句
UPDATE account SET balancel = 1000 WHERE name='王五';
UPDATE account SET balancel = 1000 WHERE name='赵六';
#结束事务
#commit;
ROLLBACK;
SELECT * FROM account;
SHOW VARIABLES LIKE 'autocommit';


#案例2：演示事务对于delete和truncate的处理的区别
SET autocommit=0;
START TRANSACTION;

DELETE FROM account;
ROLLBACK;

TRUNCATE TABLE account;

#savepoint 节点名;设置保存点

#演示savepoint 的使用
SET autocommit=0;
START TRANSACTION;
DELETE FROM account WHERE id=1;
DELETE FROM account WHERE id=2;
SAVEPOINT a;#设置保存点
DELETE FROM account WHERE id=4;
DELETE FROM account WHERE id=5;
ROLLBACK TO a;#回滚到保存点
SELECT * FROM account;

/*
数据库事务的隔离性: 数据库系统必须具有隔离并发运行各个事务的能力,使它们不会相互影响,避免各种并发问题.

脏读: 对于两个事务T1, T2, T1 读取了已经被 T2 更新但还没有被提交的字段. 
      之后, 若T2 回滚, T1读取的内容就是临时且无效的.

不可重复读: 对于两个事务T1, T2,  然后T2 更新了该字段. T1读数据，是没有修改之前的数据,
            提交之后, T1再次读取同一个字段, 值就不同了.

幻读: 对于两个事务T1, T2, T1 从一个表中读取了一个字段, 
      然后T2 在该表中插入了一些新的行.
      之后, 如果T1 再次读取同一个表, 就会多出几行.

隔离级别：一个事务与其他事务隔离的程度称为隔离级别.
          数据库规定了多种事务隔离级别, 
          不同隔离级别对应不同的干扰程度, 
          隔离级别越高, 数据一致性就越好, 但并发性越弱.

事务的隔离级别： 脏读		不可重复读	幻读
read uncommitted：√		      √		     √
read committed：  ×		      √		     √
repeatable read： ×		      ×		     √
serializable	    ×         ×        ×

mysql 中默认第三个隔离级别 repeatable read
oracle中默认第二个隔离级别 read committed

查看隔离级别
select @@tx_isolation;

设置隔离级别
set transaction isolation level 隔离级别;

mysql> set transaction isolation level serializable;
Query OK, 0 rows affected (0.00 sec)
mysql> set autocommit = 0;
Query OK, 0 rows affected (0.00 sec)
mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)
*/
