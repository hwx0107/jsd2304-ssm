-- 联合查询作业 ----------------
-- 1. 教语文的老师所带班级各多少学生?
-- 范传奇 1年级1班 52
-- 范传奇 1年级2班 35
-- 王克晶 2年级1班 30
SELECT t.name,c.name, COUNT(*) number
FROM teacher t, subject su, class c, student s
WHERE t.subject_id=su.id
  AND c.teacher_id=t.id
  AND s.class_id=c.id
  AND su.name='语文'
GROUP BY t.name,c.name;

-- 2. 每门课的老师所带班级各多少学生?
-- 语文 范传奇 1年级1班 30
-- 语文 王克晶 1年级2班 25
-- 数学 刘国斌 1年级3班 35
SELECT su.name,t.name,c.name,COUNT(*) number
FROM subject su,teacher t, class c, student s
WHERE t.subject_id=su.id
  AND c.teacher_id=t.id
  AND s.class_id=c.id
GROUP BY su.name,t.name,c.name;

-- 3. 来自上海的学生的班主任都有谁?
SELECT DISTINCT t.name
FROM location l, student s, class c, teacher t
WHERE s.location_id=l.id
  AND s.class_id=c.id
  AND c.teacher_id=t.id
  AND l.name='上海';

-- 4. 来自南京的学生共多少人
SELECT COUNT(*) number
FROM location l, student s
WHERE s.location_id=l.id
  AND l.name='南京';

-- 5. 来自武汉的男同学和女同学分别多少人?
SELECT s.gender,COUNT(*) number
FROM location l, student s
WHERE s.location_id=l.id
  AND l.name='武汉'
GROUP BY s.gender;

-- 6. 每个城市的学生各多少人
SELECT l.name, COUNT(*) number
FROM location l, student s
WHERE s.location_id=l.id
GROUP BY l.name;

-- 7. 高于平均工资的老师所带的班级分别多少学生?
SELECT t.name,c.name,COUNT(*) number
FROM student s, class c, teacher t
WHERE s.class_id=c.id
  AND c.teacher_id=t.id
  AND t.salary>(SELECT AVG(salary) FROM teacher)
GROUP BY t.name,c.name;

-- 8. 每个老师班里各多少来自郑州的学生?
SELECT t.name,c.name,COUNT(*) number
FROM student s, class c, teacher t, location l
WHERE s.class_id=c.id
  AND c.teacher_id=t.id
  AND s.location_id=l.id
  AND l.name='郑州'
GROUP BY t.name,c.name;

-- 多对多关系查询作业 -------------------
-- 1. 查看1年级1班所有同学的语文成绩是多少?
SELECT c.name,s.name,tss.score
FROM class c, student s, t_stu_subject_score tss, subject su
WHERE s.class_id=c.id
  AND tss.stu_id=s.id
  AND tss.subject_id=su.id
  AND c.name='1年级1班'
  AND su.name='语文';

-- 2. 统计1年级1班数学成绩的平均值?
SELECT AVG(tss.score) avg_score
FROM class c, student s, t_stu_subject_score tss, subject su
WHERE s.class_id=c.id
  AND tss.stu_id=s.id
  AND tss.subject_id=su.id
  AND c.name='1年级1班'
  AND su.name='数学';

-- 3. 统计6年级的英语成绩的平均值?
SELECT AVG(tss.score) avg_score
FROM class c, student s, t_stu_subject_score tss, subject su
WHERE s.class_id=c.id
  AND tss.stu_id=s.id
  AND tss.subject_id=su.id
  AND c.name LIKE '6年级%'
  AND su.name='英语';

-- 4. 查看"刘苍松"所带班级的英语平均分?
SELECT AVG(tss.score) avg_score
FROM class c, student s, t_stu_subject_score tss, subject su, teacher t
WHERE s.class_id=c.id
  AND tss.stu_id=s.id
  AND tss.subject_id=su.id
  AND c.teacher_id=t.id
  AND t.name='刘苍松'
  AND su.name='英语';

-- 5. 查看工资最高的老师所带班级的各科成绩的平均分，最高分和最低分分别是多少?
SELECT t.name,c.name,su.name,AVG(tss.score),MAX(tss.score),MIN(tss.score)
FROM class c, student s, t_stu_subject_score tss, subject su, teacher t
WHERE s.class_id=c.id
  AND tss.stu_id=s.id
  AND tss.subject_id=su.id
  AND c.teacher_id=t.id
  AND t.salary=(SELECT MAX(salary) FROM teacher)
GROUP BY t.name,c.name,su.name;

-- 6. 查看每位大队长的5门成绩平均分是多少？
SELECT s.name,s.job,AVG(tss.score) avg_score
FROM student s, t_stu_subject_score tss, subject su
WHERE tss.stu_id=s.id
  AND tss.subject_id=su.id
  AND s.job='大队长'
GROUP BY s.name,s.job;

-- 作业结束 -----------------------------------------------

-- 内连接查询 ------------------
-- 查看1年级1班的学生信息?列出学生名字,年龄,所在班级
-- 关联查询写法
SELECT s.name,s.age,c.name
FROM class c, student s
WHERE s.class_id=c.id
  AND c.name='1年级1班';
-- 查看1年级1班的学生信息?列出学生名字,年龄,所在班级
-- 内连接查询写法
SELECT s.name,s.age,c.name
FROM class c
         JOIN student s ON c.id = s.class_id
WHERE c.name='1年级1班';






