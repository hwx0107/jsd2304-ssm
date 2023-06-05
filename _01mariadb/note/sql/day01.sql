SHOW DATABASES;
-- 创建库
CREATE DATABASE mydb;
CREATE DATABASE mydb1 CHARSET = UTF8;
CREATE DATABASE mydb2 CHARSET = GBK;

SHOW CREATE DATABASE mydb2;

USE mydb;
USE mydb1;

DROP DATABASE mydb;
DROP DATABASE mydb1;
DROP DATABASE mydb2;

CREATE DATABASE studb;
USE studb;
CREATE TABLE stuinfo
(
    name CHAR(20),
    age  INT
);
SHOW TABLES;

-- 查看表结构
DESC stuinfo;
-- 查看创建表的语句
SHOW CREATE TABLE stuinfo;
-- 删除表
DROP TABLE stuinfo;
-- 查看当前库中所有表
SHOW TABLES;


CREATE DATABASE mydb3 CHARSET = UTF8;
USE mydb3;
CREATE TABLE t_hero
(
    name CHAR(20),
    age  INT
);
RENAME TABLE t_hero TO hero;
SHOW CREATE TABLE hero;
DESC hero;
DROP TABLE hero;
DROP DATABASE mydb3;

-- 格式化: Ctrl + Alt + l
USE studb;
CREATE TABLE hero
(
    name VARCHAR(32),
    age  INT(3)
);
-- 末尾添加gender字段
ALTER TABLE hero ADD gender CHAR(1);
-- 添加到第一个字段id
ALTER TABLE hero ADD id INT FIRST;
-- 指定位置添加字段
ALTER TABLE hero ADD pwd CHAR(32) AFTER name;

-- 删除字段drop
ALTER TABLE hero DROP pwd;

-- 修改字段数据类型modify
ALTER TABLE hero MODIFY name CHAR(20);
-- 替换字段change
ALTER TABLE hero CHANGE gender nickname CHAR(20);

DESC hero;

-- 课上练习
CREATE DATABASE mydb4 CHARSET=UTF8;
USE mydb4;
CREATE TABLE teacher(name CHAR(20));
ALTER TABLE teacher ADD age INT;
ALTER TABLE teacher ADD id INT FIRST;
ALTER TABLE teacher ADD salary INT AFTER name;
ALTER TABLE teacher DROP age;
RENAME TABLE teacher TO t;
DROP TABLE t;
DROP DATABASE mydb4;


CREATE DATABASE mydb;
USE mydb;
CREATE TABLE person(
                       name CHAR(20) DEFAULT '无名氏',
                       age INT DEFAULT 0
);
-- 全列插入
INSERT INTO person VALUES ('聂风', 25);
INSERT INTO person VALUES ('步惊云', 25),('秦霜', 28),('雄霸', 52);

-- 选择指定字段插入
INSERT INTO person(name,age) VALUES ('梦', 23);
INSERT INTO person(age,name) VALUES (22, '楚楚');
INSERT INTO person(name) VALUES ('孔慈');
INSERT INTO person(name) VALUES ('断浪'),('无名');

-- 默认值测试
INSERT INTO person(name) VALUES ('第二梦');
INSERT INTO person(age) VALUES (40);

SELECT * FROM person;

DESC person;

DROP TABLE person;
SHOW TABLES;