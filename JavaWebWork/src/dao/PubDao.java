package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Pub; // 导入 model 包下的 Pub 类

public class PubDao {
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

	// 查询所有数据的方法
	public List<Pub> selectAll() {
		List<Pub> list = new ArrayList<Pub>(); // 创建包含 Pub 对象的集合
		this.getConnection(); // 获取数据库连接
		try {
			String sql = "select * from pubs"; // 设置 SQL 语句
			PreparedStatement ps = conn.prepareStatement(sql); // 创建 PreparedStatement 对象
			ResultSet rs = ps.executeQuery(); // 执行 SQL 语句，获取结果集
			Pub pub = null; // 声明 Pub 对象
			while (rs.next()) { // 遍历结果集
				pub = new Pub();
				pub.setId(rs.getInt("id")); // 为 pub 对象设置 id 属性
				pub.setName(rs.getString("name")); // 为 pub 对象设置 name 属性
				list.add(pub); // 将 pub 对象加入到集合中
			}
		} catch (Exception e) { // 捕获异常
			e.printStackTrace(); // 打印异常堆栈信息
		}
		this.close(); // 关闭数据库连接
		return list; // 返回包含 Pub 对象的集合
	}

	// 添加数据的方法
	public int add(String name) {
		int result = 0; // 定义变量，保存方法执行结果
		this.getConnection(); // 获取数据库连接
		try {
			String sql = "insert into pubs(name) values(?)"; // 设置 SQL 语句
			PreparedStatement ps = conn.prepareStatement(sql); // 创建 PreparedStatement 对象
			ps.setString(1, name); // 设置 SQL 语句中的参数
			result = ps.executeUpdate(); // 执行更新操作，获取更新的行数
		} catch (Exception e) { // 捕获异常
			e.printStackTrace(); // 打印异常堆栈信息
		}
		this.close(); // 关闭数据库连接
		return result; // 返回更新的行数
	}

	// 根据 id 删除数据的方法
	public int deleteById(int id) {
		int result = 0; // 定义变量，保存方法执行结果
		this.getConnection(); // 获取数据库连接
		try {
			String sql = "delete from pubs where id=?"; // 设置 SQL 语句
			PreparedStatement ps = conn.prepareStatement(sql); // 创建 PreparedStatement 对象
			ps.setInt(1, id); // 设置 SQL 语句中的参数
			result = ps.executeUpdate(); // 执行更新操作，获取更新的行数
		} catch (SQLException e) { // 捕获 SQL 异常
			e.printStackTrace(); // 打印异常堆栈信息
		}

		this.close(); // 关闭数据库连接
		return result; // 返回更新的行数
	}
}
