/**
 * @desc: 查看当前mysql所存在数据库 show databases;
 * eg:
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| framework          |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)
 */
show databases;


/**
 * @desc：创建数据库  CREATE DATABASE database_name;
 * eg:
mysql> CREATE DATABASE test_db;
Query OK, 1 row affected (0.00 sec)
 */

CREATE DATABASE test_db CHARACTER SET utf8;

/**
 * @desc：查看数据库定义
 * eg:
mysql> show create database test_db;
+----------+--------------------------------------------------------------------+
| Database | Create Database                                                    |
+----------+--------------------------------------------------------------------+
| test_db  | CREATE DATABASE `test_db` !40100 DEFAULT CHARACTER SET latin1  |
+----------+--------------------------------------------------------------------+
1 row in set (0.00 sec)
 */
SHOW CREATE DATABASE test_db;



/**
 * @desc：删除数据库 DROP DATABASE test_db;
eg:
mysql> DROP DATABASE test_db;
Query OK, 0 rows affected (0.00 sec)
 */
DROP DATABASE test_db;


/**
 * @desc: 查看数据库存储引擎  SHOW ENGINES; 
 *
 * @important: 存储引擎的选择
 *   1. 需要提供提交、回滚和崩溃恢复能力的事务安全(ACID兼容)能力，并要求实现并发控制，选择 InnoDB；
 *   2. 如果数据表主要用来插入和查询记录，选择MyISAM引擎能提高较高的处理效率；
 *   3. 如果只是临时存储数据，数据量不大，并且不需要较高的数据安全性。MEmory引擎是不错的选择，存放查询的中间结果；
 *   4. 如果只有INSERT和SELECT操作，可以选择Archive引擎，Archive存储引擎支持高并发的插入操作，但是本身并不是事务安全的。Archive存储引擎非常适合存储归档数据，如记录日志信息；
eg:
mysql> SHOW ENGINES;
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
| Engine             | Support | Comment                                                        | Transactions | XA   | Savepoints |
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
| InnoDB             | DEFAULT | Supports transactions, row-level locking, and foreign keys     | YES          | YES  | YES        |
| MRG_MYISAM         | YES     | Collection of identical MyISAM tables                          | NO           | NO   | NO         |
| MEMORY             | YES     | Hash based, stored in memory, useful for temporary tables      | NO           | NO   | NO         |
| BLACKHOLE          | YES     | /dev/null storage engine (anything you write to it disappears) | NO           | NO   | NO         |
| MyISAM             | YES     | MyISAM storage engine                                          | NO           | NO   | NO         |
| CSV                | YES     | CSV storage engine                                             | NO           | NO   | NO         |
| ARCHIVE            | YES     | Archive storage engine                                         | NO           | NO   | NO         |
| PERFORMANCE_SCHEMA | YES     | Performance Schema                                             | NO           | NO   | NO         |
| FEDERATED          | NO      | Federated MySQL storage engine                                 | NULL         | NULL | NULL       |
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
9 rows in set (0.00 sec)
 */
SHOW ENGINES;