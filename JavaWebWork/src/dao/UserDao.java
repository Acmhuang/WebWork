package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;

public class UserDao {
	private Connection conn;// 声明一个数据库连接对象

    // 获取数据库连接的方法
	private void getConnection() { 
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 加载 MySQL 驱动程序
			String url = "jdbc:mysql://localhost:3306/test?characterEncoding=utf8"; // 设置数据库的 URL
			conn = DriverManager.getConnection(url, "root", "zaq7575955"); // 获取数据库连接
		} catch (Exception e) { // 捕获异常
			e.printStackTrace(); // 打印异常堆栈信息
		}
	}

	// 关闭数据库连接的方法
	private void close() {
		try {
			if (conn != null) { // 判断 Connection 对象是否非空
				conn.close(); // 关闭数据库连接
			}
		} catch (SQLException e) { // 捕获 SQL 异常
			e.printStackTrace(); // 打印异常堆栈信息
		}
	}

	// 添加用户的方法
	public int insert(User user) {
		int result = 0; // 定义变量，保存方法执行结果
		this.getConnection(); // 获取数据库连接
		try {
			String sql = "insert into users(username,password,name) values(?,?,?)"; // 设置 SQL 语句
			PreparedStatement ps = conn.prepareStatement(sql); // 创建 PreparedStatement 对象
			ps.setString(1, user.getUsername()); // 设置 SQL 语句中的参数
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getName());
			result = ps.executeUpdate(); // 执行更新操作，获取更新的行数
		} catch (Exception e) { // 捕获异常
			e.printStackTrace(); // 打印异常堆栈信息
		}
		this.close(); // 关闭数据库连接
		return result; // 返回更新的行数
	}

	// 根据用户名和密码查询用户的方法
	public User select(String username, String password) {
		this.getConnection(); // 获取数据库连接
		User user = null; // 声明 User 对象
		try {
			String sql = "select * from users where username = ? and password = ?"; // 设置 SQL 语句
			PreparedStatement ps = conn.prepareStatement(sql); // 创建 PreparedStatement 对象
			ps.setString(1, username); // 设置 SQL 语句中的参数
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery(); // 执行 SQL 语句，获取结果集
			if (rs.next()) { // 判断结果集是否非空
				user = new User(); // 创建 User 对象
				user.setUsername(rs.getString("username")); // 为 User 对象设置 username 属性
				user.setName(rs.getString("name")); // 为 User 对象设置 name 属性
			}
		} catch (Exception e) { // 捕获异常
			e.printStackTrace(); // 打印异常堆栈信息
		}
		this.close(); // 关闭数据库连接
		return user; // 返回 User 对象
	}

	// 更新用户密码的方法
	public void updatePwd(String username, String password) {
		this.getConnection(); // 获取数据库连接
		try {
			String sql = "update users set password=? where username=?"; // 设置 SQL 语句
			PreparedStatement ps = conn.prepareStatement(sql); // 创建 PreparedStatement 对象
			ps.setString(1, password); // 设置 SQL 语句中的参数
			ps.setString(2, username);
			ps.executeUpdate(); // 执行更新操作
		} catch (Exception e) { // 捕获异常
			e.printStackTrace(); // 打印异常堆栈信息
		}
		this.close(); // 关闭数据库连接
	}
}
