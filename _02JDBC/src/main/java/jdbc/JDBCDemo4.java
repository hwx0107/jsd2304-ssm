package jdbc;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

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
            // 接收用户输入
            Scanner scanner = new Scanner(System.in);
            System.out.println("请输入用户名:");
            String username = scanner.nextLine();
            // 执行SQL语句
            String sql = "DELETE FROM userinfo WHERE username='"+username+"'";
            int num = statement.executeUpdate(sql);
            if(num > 0){
                System.out.println("删除用户成功");
            }else{
                System.out.println("删除用户失败");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
