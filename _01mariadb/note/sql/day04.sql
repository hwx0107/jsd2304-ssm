-- 作业 -------------------------------
CREATE DATABASE day03db CHARSET=UTF8;
USE day03db;
CREATE TABLE sanguo(
                       id INT PRIMARY KEY AUTO_INCREMENT,
                       name VARCHAR(30) NOT NULL,
                       gender CHAR(1) NOT NULL,
                       country CHAR(1) NOT NULL,
                       attack INT NOT NULL,
                       defense INT NOT NULL
)CHARSET=UTF8;
INSERT INTO sanguo
VALUES (1, '曹操', '男', '魏', 256, 63),
       (2, '张辽', '男', '魏', 328, 69),
       (3, '甄姬', '女', '魏', 168, 34),
       (4, '夏侯渊', '男', '魏', 366, 83),
       (5, '刘备', '男', '蜀', 220, 59),
       (6, '诸葛亮', '男', '蜀', 170, 54),
       (7, '赵云', '男', '蜀', 377, 66),
       (8, '张飞', '男', '蜀', 370, 80),
       (9, '孙尚香', '女', '蜀', 249, 62),
       (10, '大乔', '女', '吴', 190, 44),
       (11, '小乔', '女', '吴', 188, 39),
       (12, '周瑜', '男', '吴', 303, 60),
       (13, '吕蒙', '男', '吴', 330, 71);
SELECT * FROM sanguo;

-- 1. 查找所有蜀国人信息，按照攻击力排名
SELECT * FROM sanguo
WHERE country='蜀'
ORDER BY attack DESC;

-- 2. 查找攻击力超过200的魏国英雄名字和攻击力并显示为姓名， 攻击力
SELECT name,attack FROM sanguo
WHERE attack>200 AND country='魏';

-- 3. 所有英雄按照攻击力降序排序，如果相同则按照防御升序排序
SELECT * FROM sanguo
ORDER BY attack DESC,defense ASC;

-- 4. 查找名字为3字的
SELECT name FROM sanguo
WHERE name LIKE '___';

-- 5. 找到魏国防御力排名2-3名的英雄
SELECT name,defense,country FROM sanguo
WHERE country='魏'
ORDER BY defense DESC
    LIMIT 1,2;

-- 6. 查找攻击力比魏国最高攻击力的人还要高的蜀国英雄
SELECT name,country,attack FROM sanguo
WHERE country='蜀' AND attack>(SELECT MAX(attack) FROM sanguo
                              WHERE country='魏');

-- 7. 找出表中的最大攻击力的值？
SELECT MAX(attack) max_att FROM sanguo;

-- 8. 表中共有多少个英雄？
SELECT COUNT(id) FROM sanguo;

-- 9. 蜀国英雄中攻击值大于200的英雄的数量
SELECT COUNT(id) number FROM sanguo
WHERE country='蜀' AND attack>200;

-- 10. 计算每个国家的平均攻击力
SELECT country,AVG(attack) avg_att FROM sanguo
GROUP BY country;

-- 11. 统计每个国家男性英雄和女性英雄的平均攻击力
SELECT country,gender,AVG(attack) avg_att FROM sanguo
GROUP BY country,gender;

-- 12. 所有国家的男英雄中 英雄数量最多的前2名的 国家名称及英雄数量
SELECT country,COUNT(id) number FROM sanguo
WHERE gender='男'
GROUP BY country
ORDER BY number DESC
    LIMIT 0,2;

-- 13. 统计平均攻击力大于250的国家的英雄数量,根据数量排序,取前2名
SELECT country,AVG(attack) avg_att, COUNT(id) number FROM sanguo
GROUP BY country
HAVING avg_att>250
ORDER BY number DESC
    LIMIT 0,2;


-- 14.统计表中都有哪些国家
SELECT DISTINCT country FROM sanguo;

-- 15.统计表中有几个国家
SELECT COUNT(DISTINCT country) number FROM sanguo;

USE tedu;
-- DISTINCT 去重 --------------------------------------
-- 1.查看老师的职称都有哪些?
SELECT DISTINCT title FROM teacher;
-- 2.查看学生都有哪些职位?
SELECT DISTINCT job FROM student;
-- 3.查看各年龄段的学生都有哪些职位?
SELECT DISTINCT age,job FROM student;

-- 子查询 ------------------------------
-- 单行单列子查询
-- 1.查看比范传奇工资高的老师都有谁?
SELECT name,salary FROM teacher
WHERE salary>(SELECT salary FROM teacher WHERE name='范传奇');
-- 2.查看哪些老师的工资是高于平均工资的?
SELECT name,salary FROM teacher
WHERE salary>(SELECT AVG(salary) FROM teacher);
-- 3.查看和'李费水'在同一个班的学生都有谁?
SELECT name,class_id FROM student
WHERE class_id=(SELECT class_id FROM student WHERE name='李费水');
-- 4.查看工资最高的老师的工资和奖金是多少?
SELECT name,salary,comm
FROM teacher
WHERE salary=(SELECT MAX(salary) FROM teacher);

-- 查看比教科目2和科目4老师工资都高的老师都有谁? -- 单行单列练习
SELECT name,salary
FROM teacher
WHERE salary>(SELECT MAX(salary) FROM teacher WHERE subject_id IN (2,4));

-- 多行单列子查询
-- 1.查看与"祝雷"和"李费水"在同一个班的学生都有谁?
SELECT name,class_id
FROM student
WHERE class_id IN (SELECT class_id FROM student WHERE name IN ('祝雷','李费水'));

-- 多行多列子查询: 可以把查询的结果集当做一张表来创建
-- 创建一张表,该表中记录了每个科目老师的工资情况,要求展示:最高,最低,总和和平均工资以及该科目id
CREATE TABLE sal AS
SELECT subject_id,MAX(salary) masa,MIN(salary) misa,SUM(salary) susa,AVG(salary) avsa
FROM teacher
GROUP BY subject_id;

SHOW TABLES;
SELECT * FROM sal;
DROP TABLE sal;

-- 关联查询
CREATE TABLE a(
                  aid INT,
                  aname VARCHAR(20)
);
INSERT INTO a VALUES (1,'聂风'),(2,'步惊云'),(3,'星矢');

CREATE TABLE b
(
    bid   INT,
    bname VARCHAR(20)
);
INSERT INTO b VALUES (1,'雅典娜'),(2,'水冰月');

SELECT * FROM a;
SELECT * FROM b;
SELECT * FROM a,b;
SELECT aa.aid,aa.aname,bb.bid,bb.bname FROM a aa,b bb;

-- 查看每个老师以及其负责课程科目名?
SELECT t.name,s.name
FROM teacher t, subject s
WHERE t.subject_id=s.id;