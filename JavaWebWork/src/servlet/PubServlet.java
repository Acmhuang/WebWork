package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PubDao;
import model.Pub;

@WebServlet("/pub.do")
public class PubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PubServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("".equals(action) || action == null) {
			action = "query";
		}

		// 根据参数action分别调用不同的方法进行处理
		switch (action) {
		case "query":
			this.query(request, response);
			break;
		case "add":
			this.add(request, response);
			break;
		case "deletebyid":
			this.deleteById(request, response);
			break;
		default:
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// 处理添加Pub的请求
	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		PubDao dao = new PubDao();

		// 调用PubDao的add方法将Pub对象添加到数据库
		dao.add(name);

		// 设置状态码并跳转到success.jsp页面
		request.setAttribute("state", 6);
		request.getRequestDispatcher("/WEB-INF/jsp/success.jsp").forward(request, response);
	}

	// 处理查询所有Pub的请求
	protected void query(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PubDao dao = new PubDao();

		// 获取所有Pub对象，并将它们添加到request对象中以传递给JSP页面
		List<Pub> list = dao.selectAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/jsp/pubadd.jsp").forward(request, response);
	}

	// 处理根据ID删除Pub的请求
	private void deleteById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PubDao dao = new PubDao();
		String idParam = request.getParameter("id");
		int id = 0;
		if (idParam != null) {
			id = Integer.parseInt(idParam);
		}

		// 调用PubDao的deleteById方法删除相应ID的Pub对象
		dao.deleteById(id);

		// 重定向到pub.do页面
		response.sendRedirect("pub.do");
	}
}
