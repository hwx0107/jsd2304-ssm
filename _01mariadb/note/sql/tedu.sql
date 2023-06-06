
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






