package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 在 tedu库 下创建表userinfo (id、username、password、nickname、age)
 */

public class JDBCDemo1 {
    public static void main(String[] args) {
        /*
            1.加载驱动
            2.创建数据库连接对象:DriverManger
            3.创建执行SQL语句的对象:Statement
            4.执行SQL语句(CREATE TABLE ...)
            5.获得SQL语句执行结果[有必要的话]
            6.关闭连接
         */
        try {
            // 1.加载驱动,Alt+Enter处理异常 try/catch
            Class.forName("com.mysql.cj.jdbc.Driver");
            // 2.创建数据库连接对象,Alt+Enter处理异常 Add ...
            Connection connection = DriverManager.getConnection(
                    // 注意更改库名为:tedu ,此项配置直接到文档服务器中复制
                    "jdbc:mysql://localhost:3306/tedu?characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai&rewriteBatchedStatements=true",
                    "root",
                    "root"
            );
            System.out.println("数据库连接成功");
            Statement statement = connection.createStatement();
            String sql = "CREATE TABLE userinfo( " +
                    " id INT PRIMARY KEY AUTO_INCREMENT, " +
                    " username VARCHAR(30), " +
                    " password VARCHAR(30), " +
                    " nickname VARCHAR(30), " +
                    " age INT " +
                    ")";
            /*
                执行SQL语句的方法:
                DDL语句: execute(sql)  返回值: boolean
                DML语句: executeUpdate(sql)
                DQL语句: executeQuery(sql)
             */
            statement.execute(sql);
            // 关闭连接
            connection.close();
            System.out.println("表创建成功");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
