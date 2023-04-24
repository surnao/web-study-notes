### day04

1.事件

```html
事件源：             按钮     文本框     select等；
事件句柄：事件类型  onclick    onblur    onchange
事件处理函数：function  fun1(){    处理按钮被点击的处理代码  }
<input  type ="button"  value ="按钮"  onclick="fun1();">
<input  type ="text"    onblur=>
<select onchange=></select>
```

```html
<script type="text/javascript">
	function fun1(){
		alert("加载网页");
	}
	function fun2(){
		alert("按钮点击");
	}
	function fun3(){
		alert("姓名已存在");
	}
	function fun4(value){
		alert("选择的省份编号："+value);
	}
</script>
</head>
<body onload="fun1()">
    <input type="button" value="按钮"  onclick="fun2()">
    <input type="text"  name="name" onblur="fun3()">
    <select name="province" onchange="fun4(this.value)">
    	<option value="1100">北京</option>
    </select>
</body>
```

```html
<script type="text/javascript">
	function fun1(event){
		//获取到img标记
        //event表示事件对象
		imgNode = event.target;
		//使用img标记通过src改变图片的名字
		imgNode.src = "images/c1.png"
	}
	function fun2(){
		imgNode = event.target
		imgNode.src="images/c2.png"
	}
</script>
</head>
<body>
<img src="images/c2.png" onmouseover="fun1(event)" 
                         onmouseout="fun2(event)" >
</body>
```

2.DHTML

  BOM

```html
BOM：(Browser Object Model)浏览器对象模型
窗口对象：alert();1个确认按钮  confirm();2个按钮  setlnterval(fun,毫秒数);
		location:定义位置
浏览器对象
历史对象
屏幕对象等
```

```html
<script type="text/javascript">
	function fun1(){
		if(confirm("确认要删除吗？")){
			//删除
		}
	}
</script>
</head>
<body>
<table>
	<tr>
	  <td>张三</td>
	  <td><input type="button" value="删除" onclick="fun1()"></td>
	</tr>
</table>
</body>
```

```html
<style type="text/css">
	div{
		width: 300px;
		height: 300px;
	}
</style>
<script type="text/javascript">
	index = 0;
	function fun(){
		//定义数组，装用于轮播图片
		var imgArr = ["images/h1.png","images/h2.png","images/h3.png","images/h4.png"];
		//循环
		setInterval(function (){
			//获取img标记
			nodes = document.getElementsByTagName("img");
			//设置src的值
			nodes[0].src = imgArr[index++];
			if(index >= 4){
				index = 0;
			}
		},1000);
	}
</script>
</head>
<body onload="fun()">
<div>
	<img src="images/h1.png">
</div>
</body>
```

```html
<script type="text/javascript">
	function fun(){
		//定义位置
		location="js4.html"
	}
</script>
</head>
<body>
<input type="button" value="按钮" onclick="fun()">
</body>
```

 DOM
```html
DOM：(Document Object Model)文档对象模型
节点：元素节点  属性节点  文本节点
      <div     id="">     div     </div>
1）获取元素节点的方法-4种
1.1通过标记名来获取元素节点
  nodes1 = getElementsByTagName("div");返回数组 nodes
  <div></div>
1.2通过类名来获取元素节点
  nodes2 = getElementsByClassName("div1");返回数组 nodes
    nodes2[0]----div
    nodes2[1]----p
  <div class="div1"></div><p  class="div1"></p>
1.3通过name名来获取元素节点
  nodes3 = getElementsByName("ch");返回数组 nodes
    nodes3[0] = a
    nodes3[1] = b
  <input type="checkbox" name="ch">a
  <input type="checkbox" name="ch">b
1.4通过id名来获取元素节点
  node = getElementById("div2");返回一个节点
  <div id="div2"></div>
```

```html
<script type="text/javascript">
	function fun(){
		//获取div节点
		nodes = document.getElementsByTagName("div");
		//通过方法或属性添加文本
		//.innerHTML给节点设置文本内容
		nodes[0].innerHTML = "显示文字";
	}
</script>
</head>
<body>
<input type="button" value="显示文字" onclick="fun()">
<div></div>
</body>
```

```html

```

```html

```

```htnl

```

