### day06

1.正则表达式

```html
[a-zA-Z0-9]
1(3|4|5|6|7|8|9)[0-9]{9}
[a-z]{6,} 表示大于等于6
[0-9]{6,8} 表示大于等于6且小于等于8
+  [0-9]+ --->  [0,9]{1,}
*  [0-9]* --->  [0-9]{0,}
?  [0-9]? --->  [0-9]{0}或者[0-9]{1}
   [^0-9] ^表示除了[0-9]之外的所有
.  表示任意字符
\. 表示.
\d [0-9]    [0-9]{6} == \d{6}
\D [^0-9]

qq邮箱：[0-9]{5,}@qq\.com
通用邮箱：[a-zA-Z0-9]{1,}@[a-z0-9]{2,}\.[a-z]{2,}   
```



```html
<body>
<form action="">
    电话:<input type="text" name="phone" id="phone">
       <span id="phoneSpan"></span>
       <br>
       <input type="submit" value="提交" id="btn">
</form>

<script type="text/javascript">
	phone.onblur = function (){
		var regE = /^1(3|4|5|6|7|8|9)[0-9]{9}$/;
		//表示获取id为phone的文本框的值
		var phoneValue = phone.value;
		if(phoneValue == ""){
			phoneSpan.innerHTML="电话号码不能为空";
			phoneSpan.style.backgroundColor = "#ff0000";
		}
		else if(regE.test(phoneValue)){
			phoneSpan.innerHTML="电话号码正确";
			phoneSpan.style.backgroundColor = "#00ff00";
		}else{
			phoneSpan.innerHTML="电话号码格式错误";
			phoneSpan.style.backgroundColor = "#ff0000";
			//submit按钮处理函数返回false不提交
			return false;
		}
	}
</script>
</body>
```



2.验证表单

```html
submit按钮处理函数返回false不提交；返回true或者没有返回值，提交表单
通常情况下，不用submit提交表单，使用其他方式：
location="xxx?name=admin";特点：只能通过url的方式提交数据
ajax提交表单(常用)

var nodeValue = node.value;
表示获取id为phone的文本框的值
var phoneValue = phone.value;
```

