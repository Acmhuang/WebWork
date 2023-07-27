package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.User;

@WebServlet("/user.do")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action) {

		// 登录请求处理
		case "login":
			this.login(request, response);
			break;
			
		// 注册请求处理
		case "register":
			this.register(request, response);
			break;
		
		// 跳转到登录页面请求处理
		case "gotologin":
			request.getRequestDispatcher("index.jsp").forward(request, response);
			break;
		
		// 跳转到修改密码页面请求处理
		case "showUpdate":
			request.getRequestDispatcher("/WEB-INF/jsp/updatePwd.jsp").forward(request, response);
			break;

		// 修改密码请求处理
		case "updatePwd":
			this.updatePwd(request, response);
			break;

		// 登出请求处理
		case "logout":
			// 从session中移除用户
			request.getSession().removeAttribute("user");
			request.setAttribute("state", 7);
			request.getRequestDispatcher("/WEB-INF/jsp/success.jsp").forward(request, response);
			break;
		default:
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// 处理登录请求
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserDao dao = new UserDao();

		// 从数据库中查找相应的用户
		User user = dao.select(username, password);

		// 如果找到该用户，则将其存储进session中，跳转到index.jsp页面
		if (user != null) {
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(request, response);
		} else {
			// 如果用户名或密码错误，则设置相应的状态码，并跳转回index.jsp页面
			request.setAttribute("state", 1);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	// 处理注册请求
	private void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rePwd = request.getParameter("rePwd");
		String name = request.getParameter("name");
		User user = new User(username, password, name);
		if (password.equals(rePwd)) {
			UserDao dao = new UserDao();

			// 将用户信息插入到数据库中
			if (dao.insert(user) > 0) {
				request.setAttribute("state", 4);
				request.getRequestDispatcher("/WEB-INF/jsp/success.jsp").forward(request, response);
			}
		} else {
			// 如果两次输入的密码不一致，则设置相应的状态码，并跳转回register.jsp页面
			request.setAttribute("state", 2);
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
	}

	// 处理修改密码请求
	private void updatePwd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String password = request.getParameter("password");
		String rePwd = request.getParameter("rePwd");

		if (password.equals(rePwd)) {
			UserDao dao = new UserDao();

			// 更新数据库中该用户的密码
			String username = ((User) request.getSession().getAttribute("user")).getUsername();
			dao.updatePwd(username, password);

			// 设置状态码并跳转到success.jsp页面
			request.setAttribute("state", 5);
			request.getRequestDispatcher("/WEB-INF/jsp/success.jsp").forward(request, response);
		} else {
			// 如果两次输入的密码不一致，则设置相应的状态码，并跳转回updatePwd.jsp页面
			request.setAttribute("state", 2);
			request.getRequestDispatcher("/WEB-INF/jsp/updatePwd.jsp").forward(request, response);
		}
	}
}
