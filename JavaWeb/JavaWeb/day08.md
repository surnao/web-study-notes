### day08

```html
1.获取表单数据
request是一个集合，封装了表单的数据
	//name表示文本框的名字
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
2.响应界面的方法
response响应对象，响应界面，数据
	//响应界面ok.html
	response.sendRedirect("ok.html"); 
	//判断相等
	name.equals("admin");
3.处理post请求的中文乱码
	//设置编码格式
	request.setCharacterEncoding("utf-8");
4.Jsp-----java server page Java的服务器页，在html代码中嵌入Java代码
    jsp显示数据需要两步（传值到页面）：
    1）在servlet中设置变量
	  HttpSession session = request.getSession();
 	  session.setAttribute("admin",admin);
 	2）在jsp页面中获取到变量的数据
	  ${admin.name}
5.商城的用户名唯一性验证
	状态码：0表示错误  
	状态码表示的信息：用户名不可以使用
 	状态码：1表示正确  
	状态码表示的信息：用户名可以使用
6.登录名
先把HTML改成JSP
loginSERVLET中设置user对象
在indexJSP获取对象
```

案例：

```java
	@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//request 请求对象，是一个集合，封装了表单的数据；
	//response响应对象，响应界面，数据，封装页面数据；   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置编码格式
		request.setCharacterEncoding("utf-8");
		//获取表单数据的值
		//name表示文本框的名字
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		//测试：
		System.out.println(name +","+ pw);
		//和数据库进行交互
		String sql = "select * from t_admin where name=? and pw=?";
		Admin admin = JDBCUtil.getSingleResult(sql, Admin.class, new Object[]{name,pw});
		if(admin != null){
			//响应成功界面ok.html
			response.sendRedirect("ok.html");
		}else{
			response.sendRedirect("error.html");
		}
	}
}
```

