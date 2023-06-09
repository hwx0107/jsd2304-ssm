package jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 执行DQL语句: SELECT
 */
public class JDBCDemo5 {
    public static void main(String[] args) {
        try (Connection connection = DBUtil.getConnection();){
            /*
                tedu.teacher表：老师的id、name、salary、title
                SELECT id,name,salary,title FROM teacher;
             */
            Statement statement = connection.createStatement();
            String sql = "SELECT id,name,salary,title FROM teacher";
            ResultSet rs = statement.executeQuery(sql);
            /*
                resultSet重要方法
                rs.next(): 返回值boolean
                让结果集向下移动一行,返回值为 true | false
             */
            while (rs.next()){
                // 根据索引值获取数据
                /**
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int salary = rs.getInt(3);
                String title = rs.getString(4);
                 */

                int id = rs.getInt("id");
                String name = rs.getString("name");
                int salary = rs.getInt("salary");
                String title = rs.getString("title");
                System.out.println("" + id + "," + name + "," + salary + "," + title);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
