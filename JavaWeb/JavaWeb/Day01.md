### Day01

HTML,CSS,JS,JQUERY
WEB组件：
Jsp前台网页，Servle后台处理

##### c/s b/s

1.Html(Hyper text markup language)：超文本的标记语言，由浏览器解析执行

2.html文件的扩展名*.html或*.htm

3.html文件的语法格式

```html
<!-- html注释 -->
<!DOCTYPE html>  ----表示h5的规范语法
<html>           ----文件的开始标记
  <head>         ----文件的头标标记
    <meta charset="UTF-8">  ----设置html的编码格式
    <title>Insert title here</title>  --设置文件的标题
  </head>
  <body>         ----文本内容-显示内容
		Hello!
  </body>
</html>          ----文件的结束标记
```

4.标记名不区分大小写

​    通常由开始和结束两部分组成</html></html>

​    也有个别的标记不需要结束<meta>

5.常用的标记

```html
<br>换行标签  <p></p>段落标签  <h1>标题</h1>  <h2>标题</h2>  <h3>标题</h3>
<h4>标题</h4>  <h5>标题</h5>  <h6>标题</h6>默认加粗且换行
<img src="图片名称" width="px" height="px" title="提示"> 插入图片
<a href="链接到的资源文件">载体(图片，文字)</a> 超链接
锚点的定义：<a id="锚点的名字"></a>
使用锚点：<a href="#锚点的名字"></a>
列表：有序列表，无序列表，自定义列表
<h3>有序列表</h3>
<ol>
	<li>入场</li>
	<li>讲话 </li>
</ol>
<h3>无序列表</h3>
<ul>
	<li>吃饭</li>
	<li>睡觉</li>
</ul>
<h3>自定义列表</h3>
<dl>
	<dt>标题1</dt>
	<dd>说明</dd>
	<dt>标题2</dt>
	<dd>说明</dd>
</dl>
表格：
<table border="边框线">
    <tr align="left/center/right">行
    <th>特点：加粗居中
    <td align="left/center/right">普通文本
不规则的表格：rowspan跨行 colspan跨列
<div> 布局
<span> 提示文本
```

表单 form

```html
<!-- 
  action表示表单提交的目的地/处理程序的名称 
  method表示表单的提交方式:get/post
  input type="text\password\radio\checkbox\submit\reset"
  select  textarea
-->
  <form action="index.html" method="get">
     姓名:<input type="text" name="name"><br>
     密码:<input type="password" name="pw"><br>
     性别:<input type="radio" name="gender" value="男">男
       <input type="radio" name="gender" value="女">女<br>
     爱好:<input type="checkbox" name="like" value="画">画
       <input type="checkbox" name="like" value="琴">琴
       <input type="checkbox" name="like" value="书">书
       <input type="checkbox" name="like" value="棋">棋<br>
     省份:<select name="city">
         <option>请选择省份</option>
         <option value="1101">甘肃省</option>
         <option>陕西省</option>
         <option>山西省</option>
       </select><br>
     建议:<br>
       <textarea rows="11" cols="22"></textarea><br>  --文本框
       <input type="submit" value="提交"> --提交按钮
       <input type="reset" value="重置">  --重置按钮
  </form>
```

