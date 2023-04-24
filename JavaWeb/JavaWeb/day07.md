### day07

```html
1.jQuery：
    javascript的框架
    为什么使用：提高开发效率
2.使用框架
    表单，获取文本框的值
    1)获取当前组件的节点
    var nameNode = id/node;
    var nameNode = $("#id");
    2)获取文本框的值
    var nameValue = nameNode.value;
    var nameValue = nameNode.val();
    
    $(".class").html("<b>hello</b>");解析标签
    $(".class").text("hello");
    $("div p")
    3)使用框架
    导入框架:xxx.js
    语法:$("") $(".className") $("#idName") $("div p")  $("div,p,table")
3.显示和隐藏
4.获取节点的相关方法：
	parents(param);获取当前节点的指定父节点
	parent();获取当前节点的唯一父节点
	siblings();获取除了当前节点的其他所有兄弟节点
	next();获取当前节点的下一个节点
	find(node);获取当前节点下的指定node节点
5.安装服务器
6.servlet:(web组件)
  1.运行在服务器端，用Java来编写的web组件
  2.获取到前台提供的数据(主要表单数据)
  3.调用和数据库交互的代码
  4.根据返回值决定跳转(响应)到哪个界面
7.编写servlet
  规则：
  1）extends HttpServlet
  2)处理方法 doGet doPost
8.servlet访问
  1.可以直接访问(url访问) --> get
  2.使用表单访问
    <form action="HelloServlet"  method="post"></form> -->post
    其他的访问方式都是get
  3.使用超链接访问
    <a href="HelloServlet"></a> --> get
9.url格式：http://localhost:8080/web10/HelloServlet
```



```html
显示和隐藏
<body>
<div></div>
<input type="button" value="显示" id="btn1">
<input type="button" value="隐藏" id="btn2">
<input type="button" value="显示隐藏" id="btn3">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
    //jq处理事件，特点：节点.函数(function(){})
    //node.click(function(){});
    //node.blur(function(){});
    //node.focus(function(){});
    //node.change(function(){});
	$("#btn1").click(function (){
		//$("div").show();
		$("div").slideDown();
	});
	$("#btn2").click(function (){
		//$("div").hide();
		$("div").slideUp();
	});
	$("#btn3").click(function (){
		$("div").slideToggle();
	});
</script>
</body>
```







​    