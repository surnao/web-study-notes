### day09

```html
1.修改
  1）做片段 header.jsp;不包含html，head，body
  2）包含片段代码
    <jsp:include page="header.jsp" ></jsp:include>
  3）回显登录用户的信息
	在session设置user对象
	value="{user.uname}"
	value="{user.phone}"
	value="{user.email}"
	radio单选按钮，checked属性
   4）修改个人信息
	在personpage.jsp发生异步请求
	$("#").click(function (){});
	#.onclick=function (){
	#ajax({
		url:"",
		data:"",
		type:"",
		dataType:"",
		successs.function(ovj){
		}
	});
}
	服务器：
		获取表单数据
		数据库交互
		定义状态码和信息，响应到客户端
2.修改密码
	修改password为jsp
	完成旧密码失去焦点验证
	旧密码是，则显示正确，反之，则不正确
	旧密码的提交
	password.jsp导入jq框架
	password.js发送异步请求
	定义PassWordServlet
	完成密码修改
```

