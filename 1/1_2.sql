/**
 * @desc：选择创建表  use test_db; 
 */
USE test_db;

/**
 * @desc 删除表 DROP TABLE [IF EXISTS] 表1,表2,...;
 *
 * @important 注意删除表一定要谨慎，删除后很难恢复，最好提前备份
 */
DROP TABLE IF EXISTS `tb_emp1`;

/**
 * @desc: 创建数据表，主键约束 primary key 或者 primary key (字段1,字段2)
 *    设置表的属性值自动增加  字段名 数据类型 AUTO_INCREMENT
 * 
 */
CREATE TABLE `tb_emp1`
(
	`id` int(11) AUTO_INCREMENT,
	`name` varchar(25) COMMENT '姓名',
	`deptId` int(11),
	`salary` float,
	primary key(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '测试表1';


/**
 * @desc 外键约束  CONSTRAINT <外键名> FOREIGN KEY(字段名1,字段名2...) REFERENCES <主表名>(主键1)
 */
CREATE TABLE `tb_dept1`
(
	`id` int(11) primary key AUTO_INCREMENT,
	`name` varchar(25) NOT NULL
);
CREATE TABLE `tb_emp1`
(
	`id` int(11) AUTO_INCREMENT,
	`name` varchar(25) COMMENT '姓名',
	`deptId` int(11),
	`salary` float,
	primary key(`id`),
	CONSTRAINT `fk_emp_dept1` FOREIGN KEY(`deptId`) REFERENCES `tb_dept1`(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '测试表1';


/**
 * @desc 非空约束  字段名 数据类型 NOT NULL
 */
CREATE TABLE `tb_emp1`
(
	`id` int(11) AUTO_INCREMENT,
	`name` varchar(25) NOT NULL COMMENT '姓名',
	`deptId` int(11),
	`salary` float,
	primary key(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '测试表1';


/**
 * @desc 唯一性约束  字段名 数据类型 UNIQUE
 */
CREATE TABLE `tb_emp1`
(
	`id` int(11) AUTO_INCREMENT,
	`name` varchar(25) NOT NULL COMMENT '姓名',
	`deptId` int(11),
	`salary` float,
	`wxID` varchar(50),
	primary key(`id`),
	CONSTRAINT STH UNIQUE(`wxID`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '测试表1';

/**
 * @desc 默认约束  字段名 数据类型 DEFAULT 默认值
 */
CREATE TABLE `tb_emp1`
(
	`id` int(11) AUTO_INCREMENT,
	`name` varchar(25) NOT NULL COMMENT '姓名',
	`deptId` int(11) DEFAULT 11,
	`salary` float,
	`wxID` varchar(50),
	primary key(`id`),
	CONSTRAINT STH UNIQUE(`wxID`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT '测试表1';





/**
 * =======查看数据表结构========
 */

/**
 * @desc 查看表的基本结构  DESC 表名
 * eg:
mysql> DESC tb_emp1;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| id     | int(11)     | NO   | PRI | NULL    | auto_increment |
| name   | varchar(25) | YES  |     | NULL    |                |
| deptId | int(11)     | YES  |     | NULL    |                |
| salary | float       | YES  |     | NULL    |                |
+--------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)
 */
DESC tb_emp1;


/**
 * @desc 查看表的详细结构  SHOW CREATE TABLE <表名>;
 * eg:
mysql> show create table tb_emp1;
+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table                                                                                                                                                                                                                                                   |
+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| tb_emp1 | CREATE TABLE `tb_emp1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL COMMENT '姓名',
  `deptId` int(11) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试表1' |
+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)
 */
SHOW CREATE TABLE tb_emp1;




/**
 * =======修改数据表========
 */

/**
 * @desc 修改表名  ALTER TABLE <旧表名> RENAME [TO] <新表名>;
 */

ALTER TABLE `tb_emp1` RENAME `tb_emp2`;


/**
 * @desc 修改字段的数据类型  ALTER TABLE <表名> MODIFY <字段名> <数据类型>
 */
ALTER TABLE `tb_emp2` MODIFY `name` varchar(30);

/**
 * @desc 修改字段名  ALTER TABLE <表名> CHANGE <旧字段名> <新字段名> <新数据类型>;
 */
ALTER TABLE `tb_emp2` CHANGE `salary` `location` varchar(30);

/**
 * @desc 添加字段  ALTER TABLE <表名> ADD <新字段名> <数据类型> [约束条件] [FIRST | AFTER 已经存在字段名] 
 */

ALTER TABLE `tb_emp2` ADD `wxID` varchar(50) NOT NULL;


/**
 * @desc 删除字段 ALTER TABLE <表名> DROP <字段名>;
 */
ALTER TABLE `tb_emp2` DROP `wxID`;

/**
 * @desc 修改字段的排列位置  ALTER TABLE <表名> MODIFY <字段1> <数据类型> FIRST|AFTER <字段2>;
 */
ALTER TABLE `tb_emp2` MODIFY `location` varchar(30) FIRST;

ALTER TABLE `tb_emp2` MODIFY `location` varchar(30) AFTER `deptId`;

/**
 * @desc 更改表的存储引擎  ALTER TABLE <表名> ENGINE=<更改后的存储引擎>;
 */

ALTER TABLE `tb_emp2` ENGINE=MyISAM;


/**
 * @desc 删除表的外键约束 ALTER TABLE <表名> DROP FOREIGN KEY <外键约束名>;
 */
ALTER TABLE `tb_emp1` DROP FOREIGN KEY `fk_emp_dept1`;


/**
 * @desc 添加外键约束 ALTER TABLE <表名> ADD CONSTRAINT <外键名字> FOREIGN KEY(字段1) REFERENCES <主表名>(主键字段)
 */

ALTER TABLE `tb_emp1` add CONSTRAINT `fk_emp_dept1` FOREIGN KEY(`deptId`) REFERENCES `tb_dept1`(`id`);




/*******==========小结==========***********/

/**
 * 1. 表删除操作一定要谨慎，删除操作一定要备份；
 *
 * 2. 不是每个表都要有一个主键；
 *    多个表连接操作会需要用到主键。有些表不需要主键。
 *    
 * 3. 不是每个表都可以任意选择存储引擎；
 *    注意：外键约束不能跨引擎使用。
 *
 */
