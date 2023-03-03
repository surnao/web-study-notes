### day05

1.设置样式

```html
1)node.style.属性=值
2)先定义样式
.dviColor{}
node.className="dviColor"
3)node.setAttribute("class","dviColor");
```

案例：

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/js1.css">
</head>
<body>
<div>div1</div>
<div>div2</div>
<div>div3</div>
<input type="button" value="按钮1" id="btn1">
<input type="button" value="按钮2" id="btn2">
<input type="button" value="按钮3" id="btn3">
<script type="text/javascript" src="js/js1.js"></script>
</body>
</html>
```



```css
@CHARSET "UTF-8";
	div{
		width: 200px;
		height: 200px;
		margin-left: 20px;
		background-color: red;
		float: left;
	}
	.divColor{
		background-color: green;
	}
```



```js
	btn1.onclick = function (){
		//获取第一个div节点
		var divNode = document.getElementsByTagName("div")[0];
		//给节点设置样式
		divNode.style.backgroundColor = "green";
	}
	btn2.onclick = function (){
		var divNode = document.getElementsByTagName("div")[1];
		divNode.className = "divColor";
	}
	btn3.onclick = function (){
		var divNode = document.getElementsByTagName("div")[2];
		divNode.setAttribute("class","divColor");
	}
```



2.显示和隐藏

```html
.div1{
     /none表示隐藏  block表示显示
     /隐藏时，不占位
	display:none; 
}

.div1{
     /hidden表示隐藏  visible表示显示
     /隐藏时，占位
	visibility:hidden; 
}
```

案例：

```html
<style type="text/css">
	div{
		width: 200px;
		height: 200px;
		margin-left: 20px;
		background-color: red;
		float: left;
	}
	.div1{
		display: none;
	}
	.div2{
		visibility: hidden;
	}
</style>
</head>
<body>
<div>div1</div>
<div>div2</div>
<div>div3</div>
<input type="button" value="按钮1" id="btn1">
<input type="button" value="按钮2" id="btn2">
<script type="text/javascript">
	btn1.onclick = function (){
		var divNode = document.getElementsByTagName("div")[0];
		divNode.setAttribute("class","div1");
	}
	btn2.onclick = function (){
		var divNode = document.getElementsByTagName("div")[1];
		divNode.setAttribute("class","div2")
	} 
</script>
</body>
```



3.创建，添加，删除节点

```
创建元素节点
  document.createElement("节点名");
创建文本节点
  document.createTextNode("文本内容");
添加节点
  父节点.appendChild(子节点);
删除节点
  父节点.removeChild(子节点);
```

案例：

```html
<body>
<div></div>
<input type="button" value="添加节点" id="btn1">
<input type="button" value="删除节点" id="btn2">

<script type="text/javascript">

	btn1.onclick = function (){
		//创建2个p节点
		var p1 = document.createElement("p");
		var p2 = document.createElement("p");
		//创建文本节点
		var t1 = document.createTextNode("段落一");
		var t2 = document.createTextNode("段落二");
		//添加节点
		p1.appendChild(t1);
		p2.appendChild(t2);
		var divNode = document.getElementsByTagName("div")[0];
		divNode.appendChild(p1);
		divNode.appendChild(p2);
	}
	btn2.onclick = function (){
		var divNode = document.getElementsByTagName("div")[0];
		var pNode = document.getElementsByTagName("p")[1];
		divNode.removeChild(pNode);
	}
</script>
</body>
```

练习：

```html
<body>
省份：<select name="province" id="province">
	<option>选择省份</option>
</select>
城市：<select name="city">
	<option>选择城市</option>
</select>
<script type="text/javascript">
	window.onload = function (){
		//1.定义数组，保存省份信息
		var parr = ["陕西省","甘肃省","青海省"];
		//获取省份节点
		var pNode = document.getElementById("province");
		for(i=0;i<parr.length;i++){
			//创建了option节点
			//第一个参数表示显示文本，第二个参数表示values的值
			var optionNode = new Option(parr[i],i);
			//把optionNode添加到pNode
			pNode.appendChild(optionNode);
		}
	}
	province.onchange = function (){		
		var pid = this.value;
		var cityarr = [["西安市","宝鸡市"],["兰州市","庆阳市"],["西宁市"]];
		var cityNode = document.getElementsByName("city")[0];
		//删除option节点
		cityNode.innerHTML = "";
		var optionNode = new Option("选择城市",-1); 
		cityNode.appendChild(optionNode);
			for(j=0;j<cityarr[pid].length;j++){
				var optionNode = new Option(cityarr[pid][j],j);
				cityNode.appendChild(optionNode);
			}
		}		
</script>
</body>
```

