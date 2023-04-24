### 、Day02

1.h5新增的form组件

颜色：#ff8000  rgb  16进制

​           #ffffff：白色   #000000：黑色

```html
<!-- 如果在form标记省略了method的属性，默认是get -->
<form action="" method="get">
<!-- 隐藏表单域：在界面上不显示，但是可以传值 -->
隐藏表单域:<input type="hidden" name="eid" value="100">
  上传文件:<input type="file" name="file"><br>
     颜色:<input type="color" name="color"><br>
     日期:<input type="date" name="date"><br>
     时间:<input type="time" name="time"><br>
  日期时间:<input type="datetime-local" name="datetime-local"><br>
     数值:<input type="number" max="10" min="1" name="number"><br>             <input type="range" name="r"><br>
     邮箱:<input type="email" name="email"><br>
     网址:<input type="url" name="url"><br>
</form>
```

```html
<!--  
placeholder 设置文本框的文本
cheched 设置单选按钮的选中状态
selected 设置下拉列表的选中状态
readonly 表示只读，但是可以提交数据
disabled 表示组件不可使用，适合用在按钮，不适合文本框使用，不能传值
-->
  <form action="">
    <input type="text" name="name" placeholder="输入姓名"><br>
性别 <input type="radio" name="gender" value="男" checked>男 
城市 <select name="city">
       <option>浙江</option>
       <option selected>杭州</option>
    </select> <br>
编号 <input type="text" name="uid" readonly value="100"><br>
编号 <input type="text" name="uid1" disabled value="200"><br>
    <input type="submit" name=提交 disabled>
  </form>
```

2.CSS（cascading style sheets）：层叠样式表

作用：美化界面，使网站风格统一

3.css的语法

```html
<style>p{ color:red;}</style>
选择器：5种
1.html标记选择器：选择器的名称是html中的标记
  p{}  table{}  div{}
2.类选择器：
 <style> .类名{} </style>
  使用：<p class="类名"></p>
3.id选择器：
 <style> #类名{} </style>
  使用：<p id="类名"></p>
4.后代选择器：包含关系
<style type="text/css">div p{color:red;}</style>
5.分组选择器：并列关系
<style type="text/css">div,p{color:green;}</style>
```

4.使用css的三种方式

  4.1使用style在html文件中定义

  4.2使用外部的css文件

```html
<link rel="stylesheet" href="css/c1.css">
```

  4.3内嵌的css

```html
<p style="color:blue">123456789</p>
```

5.和文字相关的css属性

```html
<style type="text/css">
    div{
       font-family: sans-serif;/*字体*/
       font-size: 40px;/*大小*/
       color: green;/*字体颜色*/
       font-style: italic;/*字体风格*/
       font-weight: bold;/*字体加粗*/
       text-align: center;/*水平对齐方式：居中*/
       line-height: 200px;/*垂直对齐方式：居中，和高度height相同*/
    }
</style>
```

```html
<style type="text/css">
  	a{
  		color: #fff; 
  		text-decoration: none; /*文字的线：下划线等*/
  		font-style: normal;
  	}
  	ol li{
  	 	width: 200px;
  	 	height: 50px;
  	 	background-color: blue; 
  		list-style: georgian;  /*设置列表的样式*/
  	}
    /*当鼠标放在a标记上时*/
  	a:HOVER {
		color: red;
		font-size: 50px;/*文字放大*/
	}
</style>
```

6.边框

```html
<style type="text/css">
	img{ 
	    width: 100px;
	    height: 100px;
	    border: 2px solid #ccc;
		border-radius: 50%;/*圆弧*/
	}
</style>
<style type="text/css">
	table{	
		width: 30%;
		border: 1px solid #000;/*边框宽度 边框类型 边框颜色*/
		border-collapse: collapse;/*设置边框线之间的宽度的值*/
		text-align: center;/*文字居中*/
	}
	#tr1{
		background-color: #ccc;/*灰色*/
		vertical-align: top;/*单元格的文字垂直对齐方式*/
	}
```

7.背景

```html
	
<style type="text/css">
    div{
		background-color: rgba(10,10,10,0.2);/*背景颜色、透明度0-1*/
		background-image: url("images/img002.jpg");/*背景图*/
		background-repeat: no-repeat;/*平铺方式*/
		background-position: bottom right;/*对齐方式*/
         background-attachment: fixed;/*背景图是否移动*/
	}
 </style>
```

8.盒子模型

```html
<style type="text/css">
    /*
    *{
      margin: 0px;
      padding: 0px;
    }设置默认的内边距和外边距为0px
    */
  	div{
  		/*margin-top: 50px;margin-left: 50px;*/
  		/*顺时针或上右下左*/
  		/*margin: 10px 20px 30px 40px ;*/
  		/*上(左右)下*/
  		/*margin: 10px 20px 30px;*/
  		/*(上下)(左右)*/
  		/*margin: 10px 20px;*/
  		/*(上下左右)*/
  		margin: 10px;
        padding: 10px;/*padding与margin相同*/
  	}
</style>
```

9.块级元素与行级元素

块级元素：独立一行 ,如<p> <hn> <div>；都可以设置宽高内外边距

行级元素：不能独立一行,如<a> <span> <img><input>；设置宽高无效,<img><input>除外

10.浮动

```html
float：left/right；
```

11.定位

绝对定位     相对定位    视口定位

```html
<style type="text/css">
 	*{
 		margin: 0px;
 		padding: 0px;
 	}
  	#div{
  		width: 200px;
  		height: 200px;
  		background-color: blue;
  		/*position: absolute;绝对定位 
         top: 50px;
  		left: 50px;*/
  		/*position: relative;相对定位
  		top: 50px;
  		left: 50px;*/
         position: fixed;视口定位
  	}
</style>
```

12.高度塌陷

​	父容器有子容器，margin-top失效

​	解决方案：

```html
<style>
#div1{/*父容器*/
	overflow: hidden;
    /*border: 1px solid #ccc;*/
}
#dvi2{/*子容器*/
	margin-top:50px;
}
</style>
```

