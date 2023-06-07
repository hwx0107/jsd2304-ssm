
SELECT id,name,title FROM teacher;
SELECT name FROM teacher;
SELECT * FROM teacher;
DESC teacher;

-- 查看"一级讲师"的信息，列出:名字，职位，工资，年龄
SELECT name,title,salary,age FROM teacher WHERE title='一级讲师';

SELECT name,comm,title
FROM teacher
WHERE name!='刘苍松';

SELECT name,age,gender,job FROM student
WHERE job='大队长';

SELECT name,title,salary,comm
FROM teacher
WHERE age>=30;

-- 查找年龄为偶数的老师信息
SELECT * FROM teacher WHERE age%2=0;
-- 查看年薪高于60000的老师都有谁?
SELECT name FROM teacher WHERE salary*12 + comm > 60000;

-- 查看7岁的"大队长"都有谁?列出这些学生的名字,年龄,性别和职位
SELECT name,age,gender,job FROM student
WHERE age=7 AND job='大队长';
-- 查看班级编号小于6的所有中队长都有谁?列明名字，年龄，性别，班级编号(class_id)，职位
SELECT name,age,gender,class_id FROM student
WHERE class_id<6 AND job='中队长';
-- 查看所有一级讲师和三级讲师的名字，职称，工资?
SELECT name,title,salary FROM teacher
WHERE title='一级讲师' OR title='三级讲师';

-- day02作业：书籍信息表
CREATE DATABASE exercisedb CHARSET=UTF8;
USE exercisedb;
CREATE TABLE books(
                      id INT PRIMARY KEY AUTO_INCREMENT,
                      bname VARCHAR(50) NOT NULL,
                      author VARCHAR(30) NOT NULL DEFAULT '佚名',
                      press VARCHAR(128),
                      price DOUBLE(7,2) NOT NULL DEFAULT 0.00,
    comment TEXT
)CHARSET=UTF8;
INSERT INTO books(bname,author,press,price,comment)
VALUES
('边城','沈从文','机械工业出版社',36,'小城故事多'),
('骆驼祥子','老舍','机械工业出版社',43,'你是祥子么？'),
('茶馆','老舍','中国文学出版社',55,'老北京'),
('呐喊','鲁迅','人民教育出版社',71,'最后的声音'),
('朝花夕拾','鲁迅','中国文学出版社',53,'好时光'),
('围城','钱钟书','中国文学出版社',44,'你心中的围城是什么');

INSERT INTO books(bname,author,press,price)
VALUES
('林家铺子','茅盾','机械工业出版社',51),
('子夜','茅盾','人民教育出版社',47);

SELECT * FROM books;
DESC books;

# 1. 查找30多元的图书
SELECT id,bname,price FROM books WHERE price>30;
# 2. 查找人民教育出版社出版的图书　
SELECT id,bname,press FROM books WHERE press='人民教育出版社';
# 3. 查找老舍写的，中国文学出版社出版的图书　
SELECT id,bname,author,press FROM books
WHERE author='老舍' AND press='中国文学出版社';
# 4. 查找价格超过60元的图书，只看书名和价格
SELECT bname,price FROM books WHERE price>60;
# 5. 查找鲁迅写的或者茅盾写的图书
SELECT bname,author FROM books WHERE author='鲁迅' OR author='茅盾';
# 6. 将呐喊的价格修改为45元
UPDATE books SET price=45 WHERE bname='呐喊';
# 7. 增加一个字段出版时间，类型为 date ，放在价格字段price后面
ALTER TABLE books ADD pub_time DATE AFTER price;
DESC books;
# 8. 修改所有老舍的作品出版时间为 2018-10-01
UPDATE books SET pub_time='2018-10-01' WHERE author='老舍';
# 9. 修改所有中国文学出版社出版的但是不是老舍的作品出版时间为 2020-01-01
UPDATE books SET pub_time='2020-01-01'
WHERE press='中国文学出版社' AND author!='老舍';
# 10. 所有鲁迅的图书价格增加5元
UPDATE books SET price=price+5 WHERE author='鲁迅';
# 11. 删除所有价格超过70元或者不到40元的图书
DELETE FROM books WHERE price>70 OR price<40;

-- 基础查询：逻辑运算符 -----------------------------
-- 查看班级编号在6(含)以下的所有大队长和中队长的名字，年龄，性别，班级编号和职位
USE tedu;
SELECT name,age,gender,class_id,job FROM student
WHERE class_id<=6 AND (job='大队长' OR job='中队长');

-- BETWEEN AND
-- 1.查看工资在2000到5000之间的老师的名字,性别,年龄,工资
SELECT name,gender,age,salary FROM teacher
WHERE salary BETWEEN 2000 AND 5000;
-- 2.查看年龄 除了 8到10岁的学生的名字，性别，年龄
SELECT name,gender,age FROM student
WHERE age NOT BETWEEN 8 AND 10;
-- 3.查看所有在3-5层的班级都有哪些？列出班级名称和所在楼层
SELECT name,floor FROM class
WHERE floor BETWEEN 3 AND 5;
-- 4.查看年龄在20到35之间的男老师都有谁？列出名字，性别，年龄，职称
SELECT name,gender,age,title FROM teacher
WHERE age BETWEEN 20 AND 35 AND gender='男';

-- IN 和 NOT IN ------------------------------------------
-- 查看所有大队长，中队长和小队长的名字，性别，年龄和职位?
SELECT name,gender,age,job FROM student
WHERE job IN ('大队长','中队长','小队长');
-- 查看id编号为1 3 5的老师的 编号，职称，工资
SELECT id,title,salary FROM teacher
WHERE id IN (1,3,5);
-- 查看除一级讲师和二级讲师之外的所有老师的名字，职称，工资
SELECT name,title,salary FROM teacher
WHERE title NOT IN ('一级讲师','二级讲师');
-- 查看除大队长，中队长，小队长的其他学生的名字，职位，性别，年龄
SELECT name,job,gender,age FROM student
WHERE job NOT IN ('大队长','中队长','小队长');


-- 课堂练习
-- 1. 查看负责课程编号(subject_id)为1的男老师都有谁?
SELECT name,subject_id,gender FROM teacher
WHERE subject_id=1 AND gender='男';
-- 2. 查看工资高于5000的女老师都有谁?
SELECT name,salary,gender FROM teacher
WHERE salary>5000 AND gender='女';
-- 3. 查看工资高于5000的男老师或所有女老师的工资？
SELECT name,gender,salary FROM teacher
WHERE (salary>5000 AND gender='男') OR gender='女';
-- 4. 查看所有9岁学生的学习委员和语文课代表都是谁?
SELECT name,job,age FROM student
WHERE age=9 AND job IN('学习委员','语文课代表');
-- 5. 查看工资在6000到10000之间的老师以及具体工资?
SELECT name,salary FROM teacher
WHERE salary BETWEEN 6000 AND 10000;
-- 6. 查看工资在4000到8000以外的老师及具体工资?
SELECT name,salary FROM teacher
WHERE salary NOT BETWEEN 4000 AND 8000;
# 7. 查看一级讲师和二级讲师的奖金(comm)是多少?
SELECT name,comm,title FROM teacher
WHERE title IN('一级讲师','二级讲师');
-- 8. 查看除老板和总监的其他老师的工资和奖金是多少?
SELECT name,salary,comm,title FROM teacher
WHERE title NOT IN ('老板','总监');
# 9. 查看'3年级2班'和'5年级3班'在那层楼?
SELECT name,floor FROM class
WHERE name IN ('3年级2班','5年级3班');





