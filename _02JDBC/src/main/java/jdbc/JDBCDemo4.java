package jdbc;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 执行DML: DELETE语句
 * 删除指定用户: 用户输入用户名,将该用户删除(userinfo表)
 * DELETE FROM userinfo WHERE username='?'
 */
public class JDBCDemo4 {
    public static void main(String[] args) {
        // try(){} 自动关闭特性
        try (Connection connection = DBUtil.getConnection();){
            Statement statement = connection.createStatement();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
