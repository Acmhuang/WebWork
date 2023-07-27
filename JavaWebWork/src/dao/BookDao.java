package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Book;

public class BookDao {
    private Connection conn;// 声明一个数据库连接对象

    // 获取数据库连接的方法
    private void getConnection() {
        try {
            // 加载 JDBC 驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/test?characterEncoding=utf8";
            // 获取数据库连接
            conn = DriverManager.getConnection(url, "root", "zaq7575955");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 关闭数据库连接的方法
    private void close() {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 根据书名模糊查询图书的方法，返回符合条件的图书列表
    public List<Book> select(String bookName) {
        List<Book> list = new ArrayList<Book>(); // 创建一个图书列表
        this.getConnection(); // 获取数据库连接
        try {
            String sql = "SELECT * FROM books WHERE bookname LIKE ?"; // SQL 语句，查询图书
            PreparedStatement ps = conn.prepareStatement(sql); // 创建 PreparedStatement 对象
            ps.setString(1, "%" + bookName + "%"); // 填充 SQL 语句中的占位符
            ResultSet rs = ps.executeQuery(); // 执行 SQL 查询语句

            Book book = null;
            while (rs.next()) {
                book = new Book(); // 创建一个新的图书对象
                book.setId(rs.getInt("id")); // 设置图书 id
                book.setBookName(rs.getString("bookname")); // 设置图书名称
                book.setAuthor(rs.getString("author")); // 设置图书作者
                book.setPub(rs.getString("pub")); // 设置图书出版社
                book.setPrice(rs.getDouble("price")); // 设置图书价格
                list.add(book); // 将图书添加到列表中
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.close(); // 关闭数据库连接
        return list; // 返回查询到的图书列表
    }

    // 根据图书 id 查询图书的方法，返回该图书对象
    public Book selectById(int id) {
        this.getConnection(); // 获取数据库连接
        Book book = new Book(); // 创建一个图书对象
        try {
            String sql = "SELECT * FROM books WHERE id = ?"; // SQL 语句，查询图书
            PreparedStatement ps = conn.prepareStatement(sql); // 创建 PreparedStatement 对象
            ps.setInt(1, id); // 填充 SQL 语句中的占位符
            ResultSet rs = ps.executeQuery(); // 执行 SQL 查询语句
            if (rs.next()) {
                book.setId(rs.getInt("id")); // 设置图书 id
                book.setBookName(rs.getString("bookname")); // 设置图书名称
                book.setAuthor(rs.getString("author")); // 设置图书作者
                book.setPub(rs.getString("pub")); // 设置图书出版社
                book.setPrice(rs.getDouble("price")); // 设置图书价格
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.close(); // 关闭数据库连接
        return book; // 返回查询到的图书对象
    }

    // 插入图书的方法，返回插入的图书数量
    public int insert(Book book) {
        int result = 0; // 记录插入的图书数量
        this.getConnection(); // 获取数据库连接
        try {
            String sql = "INSERT INTO books(bookname,author,pub,price) VALUES(?,?,?,?)"; // SQL 语句，插入图书
            PreparedStatement ps = conn.prepareStatement(sql); // 创建 PreparedStatement 对象
            ps.setString(1, book.getBookName()); // 填充 SQL 语句中的占位符
            ps.setString(2, book.getAuthor()); // 填充 SQL 语句中的占位符
            ps.setString(3, book.getPub()); // 填充 SQL 语句中的占位符
            ps.setDouble(4, book.getPrice()); // 填充 SQL 语句中的占位符
            result = ps.executeUpdate(); // 执行 SQL 插入语句，并返回插入的数量
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.close(); // 关闭数据库连接
        return result; // 返回插入的图书数量
    }

    // 根据图书 id 删除图书的方法，返回删除的图书数量
    public int deleteById(int id) {
        int result = 0; // 记录删除的图书数量
        this.getConnection(); // 获取数据库连接
        try {
            String sql = "DELETE FROM books WHERE id=?"; // SQL 语句，删除某个 id 的图书
            PreparedStatement ps = conn.prepareStatement(sql); // 创建 PreparedStatement 对象
            ps.setInt(1, id); // 填充 SQL 语句中的占位符
            result = ps.executeUpdate(); // 执行 SQL 删除语句，并返回删除的数量
        } catch (SQLException e) {
            e.printStackTrace();
        }
        this.close(); // 关闭数据库连接
        return result; // 返回删除的图书数量
    }

    // 更新图书的方法，返回更新的图书数量
    public int update(Book book) {
        int result = 0; // 记录更新的图书数量
        this.getConnection(); // 获取数据库连接
        try {
            String sql = "UPDATE books SET bookname=?,author=?,pub=?,price=? WHERE id=?"; // SQL 语句，更新图书
            PreparedStatement ps = conn.prepareStatement(sql); // 创建 PreparedStatement 对象
            ps.setString(1, book.getBookName()); // 填充 SQL 语句中的占位符
            ps.setString(2, book.getAuthor()); // 填充 SQL 语句中的占位符
            ps.setString(3, book.getPub()); // 填充 SQL 语句中的占位符
            ps.setDouble(4, book.getPrice()); // 填充 SQL 语句中的占位符
            ps.setInt(5, book.getId()); // 填充 SQL 语句中的占位符
            result = ps.executeUpdate(); // 执行 SQL 更新语句，并返回更新的数量
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.close(); // 关闭数据库连接
        return result; // 返回更新的图书数量
    }

    // 批量删除图书的方法，返回删除的图书数量
    public int delete(String[] ids) {
        int result = 0; // 记录删除的图书数量
        this.getConnection(); // 获取数据库连接
        try {
            // 将传入的 id 数组拼接成 SQL 语句中的 IN 子句
            String str = "";
            for (String i : ids) {
                str = str + i + ",";
            }
            str = str.substring(0, str.length() - 1); // 去掉最后一个逗号
            String sql = "DELETE FROM books WHERE id IN(" + str + ")"; // SQL 语句，删除 id 在数组中的图书
            PreparedStatement ps = conn.prepareStatement(sql); // 创建 PreparedStatement 对象
            result = ps.executeUpdate(); // 执行 SQL 删除语句，并返回删除的数量
        } catch (SQLException e) {
            e.printStackTrace();
        }
        this.close(); // 关闭数据库连接
        return result; // 返回删除的图书数量
    }
}
