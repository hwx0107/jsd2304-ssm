package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 执行DML语句: executeUpdate(sql)方法
 * 注册功能: 在userinfo表中插入一条表记录
 */

public class JDBCDemo2 {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    // 注意更改库名为:tedu ,此项配置直接到文档服务器中复制
                    "jdbc:mysql://localhost:3306/tedu?characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai&rewriteBatchedStatements=true",
                    "root",
                    "root"
            );
            Statement statement = connection.createStatement();
            String sql = "INSERT INTO userinfo (username,password,nickname,age) VALUES('赵丽颖','871016','花千骨',36)";
            // executeUpdate(sql)返回值:受影响的数据条数(整数 0 或 非0)
            int num = statement.executeUpdate(sql);
            if(num>0){
                System.out.println("注册成功");
            }else{
                System.out.println("注册失败");
            }
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }
}







