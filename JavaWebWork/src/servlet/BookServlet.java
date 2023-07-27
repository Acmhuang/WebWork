package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.BookDao;
import dao.PubDao;
import model.Book;
import model.Pub;
import model.User;

@WebServlet("/book.do")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    
        // 从 session 中获取用户信息
		User user = (User) request.getSession().getAttribute("user");

        // 如果用户为空，则重定向到 index.jsp 页面
		if (user == null) {
			response.sendRedirect("index.jsp");
			return;
		}

        // 获取 type 参数
		String type = request.getParameter("type");

        // 如果 type 参数不为空或为 ""，则执行代码块
		if ("".equals(type) || type != null) {
			switch (type) {
            
                // 如果 type 为 "gotoadd"，则跳转到 add.jsp 页面
			case "gotoadd":
				PubDao pubDao = new PubDao();
				List<Pub> pubList = pubDao.selectAll();
				request.setAttribute("pubList", pubList);
				request.getRequestDispatcher("/WEB-INF/jsp/add.jsp").forward(request, response);
				break;
                
                // 如果 type 为 "gotoindex"，则跳转到 index.jsp 页面
			case "gotoindex":
				request.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(request, response);
				break;
                
                // 默认情况下什么也不做
			default:
				break;
			}
			return;
		}

        // 获取 action 参数
		String action = request.getParameter("action");

        // 如果 action 为空或为 ""，则将其设置为 "query"
		if ("".equals(action) || action == null) {
			action = "query";
		}
		switch (action) {
        
            // 如果 action 为 "query"，则执行 query() 方法
		case "query":
			this.query(request, response);
			break;
            
            // 如果 action 为 "add"，则执行 add() 方法
		case "add":
			this.add(request, response);
			break;
            
            // 如果 action 为 "deletebyid"，则执行 deleteById() 方法
		case "deletebyid":
			this.deleteById(request, response);
			break;
            
            // 如果 action 为 "delete"，则执行 delete() 方法
		case "delete":
			this.delete(request, response);
			break;
            
            // 如果 action 为 "querybyid"，则执行 queryById() 方法
		case "querybyid":
			this.queryById(request, response);
			break;
            
            // 如果 action 为 "update"，则执行 update() 方法
		case "update":
			this.update(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

    // 查询图书的方法
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 获取图书名称参数
		String bookName = request.getParameter("bookname");
		BookDao dao = new BookDao();
        
        // 调用 select() 方法查询图书列表
		List<Book> list = dao.select(bookName);
		request.getSession().setAttribute("bookName", bookName);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/jsp/show.jsp").forward(request, response);
	}

    // 添加图书的方法
	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 获取图书名称、作者、出版社、价格等参数
		String bookName = request.getParameter("bookName");
		String author = request.getParameter("author");
		String pub = request.getParameter("pub");
		double price = 0;
		String priceParam = request.getParameter("price");
		if (priceParam != null) {
			price = Double.parseDouble(priceParam);
		}
        
        // 创建 Book 对象，并设置其各个属性值
		Book book = new Book();
		book.setBookName(bookName);
		book.setAuthor(author);
		book.setPub(pub);
		book.setPrice(price);
		BookDao dao = new BookDao();
		if (dao.insert(book) > 0) { // 如果插入成功，则跳转到 success.jsp 页面
			request.setAttribute("state", 3);
			request.getRequestDispatcher("/WEB-INF/jsp/success.jsp").forward(request, response);
		} else { // 如果插入失败，则跳转到 failure.jsp 页面
			request.getRequestDispatcher("/WEB-INF/jsp/failure.jsp").forward(request, response);
		}
	}

    // 根据 ID 删除图书的方法
	private void deleteById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookDao dao = new BookDao();

		String idParam = request.getParameter("id");
		int id = 0;
		if (idParam != null) {
			id = Integer.parseInt(idParam);
		}
        
        // 根据 ID 删除图书
		dao.deleteById(id);

		String bookname = (String) request.getSession().getAttribute("bookName");
		response.sendRedirect("book.do?bookname=" + bookname);
	}

    // 批量删除图书的方法
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDao dao = new BookDao();
		String[] ids = request.getParameterValues("ids");    
		// 根据 ID 数组删除图书
		dao.delete(ids);
		String bookname = (String) request.getSession().getAttribute("bookName");
		response.sendRedirect("book.do?bookname=" + bookname);
	}

	// 根据 ID 查询图书的方法
	private void queryById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idParam = request.getParameter("id");
		int id = 0;
		if (idParam != null) {
			id = Integer.parseInt(idParam);
		}
		BookDao dao = new BookDao();
	    
	    // 根据 ID 查询图书，并将其设置为 request 的属性值
		Book book = dao.selectById(id);
		request.setAttribute("book", book);
		PubDao pubDao = new PubDao();
		List<Pub> pubList = pubDao.selectAll();
		request.setAttribute("pubList", pubList);
		request.getRequestDispatcher("/WEB-INF/jsp/update.jsp").forward(request, response);
	}

	// 修改图书信息的方法
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    // 获取图书名称、作者、出版社、价格等参数
		String bookName = request.getParameter("bookName");
		String author = request.getParameter("author");
		String pub = request.getParameter("pub");
		double price = 0;
		String priceParam = request.getParameter("price");
		if (priceParam != null) {
			price = Double.parseDouble(priceParam);
		}
		String idParam = request.getParameter("id");
		int id = 0;
		if (idParam != null) {
			id = Integer.parseInt(idParam);
		}
	    
	    // 创建新的 Book 对象，并设置其各个属性值
		Book book = new Book(id, bookName, author, pub, price);
		BookDao dao = new BookDao();
	    
	    // 根据 ID 更新图书信息
		dao.update(book);
		String bookname = java.net.URLEncoder.encode((String) request.getSession().getAttribute("bookName"),"UTF-8");
		response.sendRedirect("book.do?bookname=" + bookname);
	}
}