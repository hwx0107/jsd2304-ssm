-- 作业
CREATE DATABASE day2db CHARSET = UTF8;
USE day2db;
CREATE TABLE t_hero
(
    name CHAR(20)
) CHARSET = UTF8;
RENAME TABLE t_hero TO hero;
ALTER TABLE hero
    ADD money INT;
ALTER TABLE hero
    ADD id INT FIRST;
ALTER TABLE hero
    ADD age INT AFTER name;
INSERT INTO hero(id, name, age, money)
VALUES (1, '李白', 50, 6888),
       (2, '赵云', 30, 13888),
       (3, '刘备', 25, 6888);
UPDATE hero
SET age=52
WHERE name = '刘备';
UPDATE hero
SET money=5000
WHERE age <= 50;
DELETE
FROM hero
WHERE money = 5000;
SELECT *
FROM hero;
DROP TABLE hero;
DROP DATABASE day2db;
SHOW DATABASES;

CREATE DATABASE day02db CHARSET = UTF8;
USE day02db;
-- 数据类型：浮点型
CREATE TABLE person
(
    id     INT,
    name   VARCHAR(20),
    salary DOUBLE(7, 2)
) CHARSET = UTF8;
-- 合理范围内，数据插入成功
INSERT INTO person(id, name, salary)
VALUES (1, 'Tom', 12345.67);
-- 小数位会进行四舍五入
INSERT INTO person(id, name, salary)
VALUES (2, 'Jack', 12345.678);
-- 超出范围，插入失败:Out of range
INSERT INTO person(id, name, salary)
VALUES (3, 'Jerry', 123456.78);
-- 小数位四舍五入后超出范围，插入失败:Out of range
INSERT INTO person(id, name, salary)
VALUES (4, 'Lucy', 99999.996);
SELECT *
FROM person;


-- 字符类型:定长CHAR 和 变长VARCHAR
CREATE TABLE person1
(
    id   INT,
    name CHAR(3)
) CHARSET = UTF8;
INSERT INTO person1(id, name)
VALUES (1, '张天爱');
INSERT INTO person1(id, name)
VALUES (2, '迪丽热巴');

-- 日期时间类型
CREATE TABLE userinfo
(
    id           INT,
    username     VARCHAR(20),
    password     CHAR(32),
    mobile       CHAR(11),
    balance      DOUBLE(8, 2),
    created_time DATETIME
) CHARSET = UTF8;
DESC userinfo;
INSERT INTO userinfo(id, username, password, mobile, balance, created_time)
VALUES (1, 'Mike', '123456', '13166668888', 50000.00, '2023-06-06 10:29:30');

INSERT INTO userinfo(id, username, password, mobile, balance, created_time)
VALUES (1, 'Mike', '123456', '13166668888', 50000.00, '20230606102930');

-- 1.将id为1的数据的密码改为：654321，余额改为8710.16元
UPDATE userinfo
SET password='654321',
    balance=8710.16
WHERE id = 1;
-- 2.在userinfo表的 id，username，password三个字段中插入1条数据，内容自定义
INSERT INTO userinfo(id, username, password)
VALUES (4, 'zhao', '871016');
-- 3.删除userinfo表中id大于100的记录（如果没有也没关系，写出语句）
DELETE
FROM userinfo
WHERE id > 100;

-- 修改数据类型:TIMESTAMP
# 1.修改created_time数据类型为：TIMESTAMP
# 2.查询数据表确认
# 3.再重新插入一条数据(id,username,password),查询确认
ALTER TABLE userinfo
    MODIFY created_time TIMESTAMP;

SELECT *
FROM userinfo;


-- 约束
DROP TABLE userinfo;
CREATE TABLE userinfo
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    username     VARCHAR(20) NOT NULL UNIQUE,
    password     CHAR(32) NOT NULL,
    mobile       CHAR(11) NOT NULL UNIQUE,
    balance      DOUBLE(8, 2) NOT NULL DEFAULT 0.00,
    created_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) CHARSET = UTF8;
DESC userinfo;
-- 主键+自增长
-- 未给id字段赋值，会自动赋值并保持自增长
INSERT INTO userinfo(username, password)
VALUES ('lili', '123456'),('zhao', '123456');
-- 指定id字段时，可以通过NULL进行占位
INSERT INTO userinfo(id,username,password) VALUES (NULL,'ying','123456');
-- 此条语句仅仅是为了测试
DELETE FROM userinfo WHERE id>=3;
-- 查询表中数据
SELECT * FROM userinfo;

-- 非空约束 NOT NULL
-- 报错:password字段不允许为NULL，而且没有设置默认值Default
INSERT INTO userinfo(id,username) VALUES (NULL,'赵丽颖');
-- 正确:因为balance和created_time虽然设置了非空NULL，但是也设置了默认值
INSERT INTO userinfo(id,username,password) VALUES (NULL,'赵丽颖','123456');

-- 唯一约束UNIQUE
INSERT INTO userinfo(username,password) VALUES (NULL, '123456');
SELECT * FROM userinfo;


-- 创建部门表
CREATE TABLE dept
(
    id    int PRIMARY KEY auto_increment,
    dname VARCHAR(50) not null
);

INSERT INTO dept
VALUES (1, '技术部'),
       (2, '销售部'),
       (3, '市场部'),
       (4, '行政部'),
       (5, '财务部'),
       (6, '总裁办公室');

-- 创建员工表
CREATE TABLE emp
(
    id      int PRIMARY KEY AUTO_INCREMENT,
    name    varchar(32) NOT NULL,
    age     tinyint,
    salary  double(8, 2),
    dept_id int,
    CONSTRAINT dept_fk FOREIGN KEY (dept_id)
        REFERENCES dept(id)
);
INSERT INTO emp
VALUES (1, 'Lily', 29, 20000, 2),
       (2, 'Tom', 27, 16000, 1),
       (3, 'Joy', 30, 28000, 1),
       (4, 'Emma', 24, 8000, 4),
       (5, 'Abby', 28, 17000, 3),
       (6, 'Jame', 32, 22000, 3);








