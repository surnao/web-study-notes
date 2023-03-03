### day03

1.javascript:

  基于对象，由浏览器解析执行的脚本语言

  网景公司

2.变量：弱变量类型定义，不用数据类型声明，可以直接使用

案例：

```html
<script type="text/javascript">
	x=6;
	y=3.4;
	str="hello";
	b=true;
	alert(x+","+y+","+str+","+b); //提示框
</script>
```

变量的数据类型由值决定

声明变量的关键字  var

var x = true；var str；str="hello";

3.数据类型：基本数据类型    复合数据类型

基本数据类型

​    number：包括整型和浮点型

​    string：字符串

​    boolean：布尔类型

​    undefined：未定义的数据类型

​    null：null值类型

复合数据类型

​	数组，函数等

获取变量的数据类型：typeof(x) 返回x变量的数据类型

4.运算符

​	算术运算符：+  -  *  /  %

​	比较运算符：>    <   >=   <=   ==   !=

​	逻辑运算符： &&  ||  ！

​	三目运算符：A ？a:b

​	赋值运算符：+=    -=   *=   /=    %=

案例：

```html
<script type="text/javascript">
	//测试运算符
	alert(4/3);
	alert(3>4);
	alert(6>5 && 1>0);
	alert(1>2?1:2);
	var x = 3;
	x += 2;
	alert(x);
	var y = 1;
	var result = y++;
	alert("y="+y);
	alert("result="+result);// 1
</script>
```

5.语句

​	if else     switch   

​    for   while    do...while

​    break    continue

```html
<script type="text/javascript">
	var age = 21;
	//在if后()中，非零表示真(true)  null,"",零表示假(false)
	if(){
		alert("可以考驾照");
	}else{
		alert("不可以考驾照");
	}
	var num = 1;
	switch(num){
	case 1:
		alert("1");
		break;
	case 2:
		alert("2")
		break;
	}
</script>
```

```html
<script type="text/javascript">
	//测试循环
	//求和
	//求偶数的和
	result = 0;
	result2 = 0;
	for(i=1;i<=10;i++){
		result += i;
		if(i%2 == 0){
			 result2 += i;
		}
	}
	alert(result);
	alert(result2);
</script>
```

```html
<script type="text/javascript">
	//求偶数的和
	result = 0;
	for(i=1;i<=10;i++){		
		if(i%2!=0)continue;
		result += i;
	}
	alert(result);
</script>
```

6.函数

​	function   函数名 (参数列表){

​		函数体;

}

```html
<script type="text/javascript">
	//无返回值，无参
	function fun1(){
		var x = 9;
		alert(x*2);
	}
	//调用函数
	fun1();
    
    //无返回值，有参
    //参数列表不能写var
    function fun2(a,b){
        alert(a+b);
    }
    //调用函数
	fun2(1,2);
    
    //有返回值，无参
    function fun3(){
        return "hello";
    }
    //调用函数
    //alert(fun3());
    var str = fun3();
	alert(str);
    
    //有返回值，有参
    function fun4(a,b){
        return a+b;
    }
    //调用函数
    //alert(fun4(1,2));
    var str = fun4(1,2);
	alert(str);
</script>
```

7.数组

​	no.1:

​	下标：从0开始，到length-1结束

​	var arr = new Array();

​	使用数组：alert(arr[i]);

​	使用循环遍历数组元素

```html
<script type="text/javascript">	
	//定义函数fun1(arr),返回数组元素的和
	//定义函数fun2(arr),返回数组元素中最大的数
	function fun1(arr){
		result = 0;
		for(i=0;i<arr.length;i++){
			result += arr[i];
		}
		return result;
	}
	function fun2(arr){
		result = arr[0];
		for(i=0;i<arr.length;i++){
			if(result < arr[i]){
				result = arr[i]
			}
		}
		return result;
	}
    
    var arr = new Array();
		arr[0] = 1;
		arr[1] = 2;
		arr[2] = 3;
    alert(fun1(arr));
    alert(fun2(arr));
</script>
```

no.2

var arr =naw Array(1,2,3,4,5);

no.3

var arr = [11,22,13,34];

arr.sort();给数组排序，从小到大

```html
<script type="text/javascript">	
	function fun(){
		var arr = [1,5,6,3,4,9,7];
		arr.sort();
		for(i=0;i<arr.length;i++){
			alert(arr[i]);
		}
	}
</script>
```

no.4

var arr = [[1,2,3],[4,5,6],[7,8,9]];

```html
<script type="text/javascript">	
	function fun(){
		//求对角线的和
		arr = [[1,2,3],[4,5,6],[7,8,9]];
		result = 0;
		for(i=0;i<arr.length;i++){
			for(j=0;j<arr[i].length;j++){
				if(i==j || i+j==arr.length-1){
					result += arr[i][j];
				}				
			}
		}
		alert(result);
	}
	fun();
</script>
```

8.内置对象

​	字符串对象

​	数学对象

​    Date：vdate = new Date();

```html
<script type="text/javascript">
	function fun1(){
		var str = "hello";
		var c = str.charAt(0);//索引对应的字符
		alert(c);
		var index = str.indexOf("e");	//索引值
		alert(index);
	}
	fun1();
	function fun2(){
		n1 = Math.max(1,2);
		alert(n1);
		alert(Math.min(1,2));
		alert(Math.round(4.7));//四舍五入
		alert(Math.random());  //随机数
		alert(Math.floor(4.7));//小于等于的最大整数
		alert(Math.ceil(4.7)); //大于等于的最小整数
	}
</script>
```

