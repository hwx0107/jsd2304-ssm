package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

/**
 * JDBC执行DML语句
 * 修改密码功能 UPDATE
 */

public class JDBCDemo3 {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    // 注意更改库名为:tedu ,此项配置直接到文档服务器中复制
                    "jdbc:mysql://localhost:3306/tedu?characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai&rewriteBatchedStatements=true",
                    "root",
                    "root"
            );
            // 快捷键: connection.createStatement().var + 回车Enter
            Statement statement = connection.createStatement();

            // 接收用户输入
            Scanner scanner = new Scanner(System.in);
            System.out.println("修改密码");
            System.out.println("请输入用户名:");
            String username = scanner.nextLine();
            System.out.println("请输入新密码:");
            String password = scanner.nextLine();

            String sql = "UPDATE userinfo SET password='"+password+"' WHERE username='"+username+"'";
            int num = statement.executeUpdate(sql);
            if(num > 0){
                System.out.println("密码修改成功");
            }else{
                System.out.println("密码修改失败");
            }
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }
}







