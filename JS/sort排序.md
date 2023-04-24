# sort排序

##### 定义及用法

sort()  方法用于对数组的元素进行排序，并返回数组。排序顺序可以是按字母或数字，也可以是升序（向上）或降序（向下）。默认排序顺序是根据字符串UniCode码。

语法：Array.sort(sortBy);

参数sortBy可选，用来规定排序的顺序，但必须是函数。

###### 例1

在数组中的值为`number`​类型时，结果并不是和正常排序一样，而是字符编码的出现顺序排列的。

```js
var arr = [2, 6, 8, 8, 2, 10]
console.log(arr.sort())  //[ 10, 2, 2, 6, 8, 8 ]
```

如要得到想要的结果，不管是升序还是降序，就需要提供比较函数了。该函数比较两个值的大小，然后返回一个用于说明这两个值的相对顺序的数字。

比较函数应该具有两个参数 a 和 b，其返回值如下：

* 若 a 小于 b，即 a - b 小于零，则返回一个小于零的值，数组将按照升序排列。
* 若 a 等于 b，则返回零。
* 若 a 大于 b, 即 a - b 大于零，则返回一个大于零的值，数组将按照降序排列。

###### 例2  **升序排列**

```js
var arr = [2, 6, 8, 8, 2, 10]
    arr.sort((a, b) => {
	return a - b
    })
console.log(arr)//[2, 2, 6, 8, 8, 10]
```

###### 例3 降序排列

```js
var arr = [2, 6, 8, 8, 2, 10]
    arr.sort((a, b) => {
	return b - a
    })
console.log(arr)//[ 10, 8, 8, 6, 2, 2 ]
```

追根究底，a指什么？b指什么？内部用怎样的方法实现的排序？

首先改变数组，看一下a指的到底是什么

```js
var arr = [6, 8, 2, 10, 1]
    arr.sort((a, b) => {
    console.log("a:" + a)
    return 1
})
console.log(arr)
//a:8
//a:2
//a:10
//a:1
//[6, 8, 2, 10, 1]
```

很容易看出a的范围是`[arr[1],arr[arr.length-1]]`​.另外能看出当函数返回一个正值时，数组并没有发生变化（0也是）

接下来再看一下b指的是什么

```js
var arr = [6, 8, 2, 10, 1]
    arr.sort((a, b) => {
    console.log("b:" + b)
    return -1
})
console.log(arr)
//b:6
//b:8
//b:2
//b:10
//[1, 10, 2, 8, 6]
```

b的范围`[arr[0],arr[arr.length-2]`​，另外在这里还获得一个使数组反序的方法（另外一个是数组的`reverse()`​方法）

a和b的范围就这样被简单的确定了，但在真正排序的时候就不是这样简单了

```js
var arr = [6, 8, 2, 10, 1]
    arr.sort((a, b) => {
    console.log("b:" + b)
    console.log("a:" + a)
    console.log("------")
    return a - b
})
console.log(arr)
//b:6
//a:8
//------
//b:8
//a:2
//------
//b:8
//a:2
//------
//b:6
//a:2
//------
//b:6
//a:10
//------
//b:8
//a:10
//------
//b:8
//a:1
//------
//b:6
//a:1
//------
//b:2
//a:1
//------
//[1, 2, 6, 8, 10]
```

先把数据整理一下

```js
//[6, 8, 2, 10, 1]
[{ b: 6, a: 8 }],
[{ b: 8, a: 2 }, { b: 8, a: 2 }, { b: 6, a: 2 }],
[{ b: 6, a: 10 }, { b: 8, a: 10 }],
[{ b: 8, a: 1 }, { b: 6, a: 1 }, { b: 2, a: 1 }],
```

通过测试以及研究源码[v8源码sort部分](https://github.com/v8/v8/blob/98d735069d0937f367852ed968a33210ceb527c2/src/js/array.js#L709)可得出结论，如果要排序的元素个数是 `n`​的时候，会有以下几种情况：

1. 当 `n<=10`​时，采用插入排序；
2. 当`n>10`​时，采用三路快速排序；
3. 当`10<n<=1000`​时，采用中位数作为哨兵元素；
4. 当`n>1000`​，每隔`200~215`​个元素挑出一个元素，放到一个新数组中，然后对它排序，找到中间位置的数，以此作为中位数。

##### **按照数组对象的某个属性排序**

###### 例4

现在有一组对象，包含"id，value"等属性，实现按照value对这些对象进行排序。

```js
var arr = [
   { id: '1', value: 100 },
   { id: '2', value: 120 },
   { id: '3', value: 80 },
   { id: '4', value: 90 },
   { id: '5', value: 130 }
]
arr.sort(function sortBy(a, b) {
   return a.value - b.value;
})
console.log(arr)
//{id: '3', value: 80}
//{id: '4', value: 90}
//{id: '1', value: 100}
//{id: '2', value: 120}
//{id: '5', value: 130}
```

假如现在不规定按照哪一个属性排序，比如除了value属性，还有其他的属性

```js
var arr = [
   { id: '1', value: 100 },
   { id: '2', value: 120 },
   { id: '3', value: 80 },
   { id: '4', value: 90 },
   { id: '5', value: 130 }
]
function sortBy(props) {
    return function(a,b) {
        return a[props] - b[props];
    }
}
arr.sort(sortBy("value"));
console.log(arr)
//{id: '3', value: 80}
//{id: '4', value: 90}
//{id: '1', value: 100}
//{id: '2', value: 120}
//{id: '5', value: 130}
```

假如value相等的情况下，是否可以按照其他属性的大小排序输出

```js
var arr = [
   { id: '1', value: 100 },
   { id: '2', value: 120 },
   { id: '4', value: 80 },
   { id: '3', value: 80 },
   { id: '5', value: 130 }
]
function sortBy(val1,val2) {
    return function(a,b) {
        if(a.val1== b.val1) return a.val2- b.val2;
        return a.val1- b.val1;
    }
}
arr.sort(sortBy("value","id"));
//{id: '3', value: 80}
//{id: '4', value: 80}
//{id: '1', value: 100}
//{id: '2', value: 120}
//{id: '5', value: 130}
```

如此，即可实现，甚至可以使用argments来获取更多的参数，用以传入更多的字段作为判断条件。

##### 总结

1. ​`sort()`​方法没有参数时，按照字符的Unicode进行排序（把数组里面当成字符串处理）
2. 通过给`sort()`​的参数返回一个负值可以实现数组`reverse()`​效果
3. ​`sort()`​ 参数返回 `a - b`​时，数组是升序，返回`-(a - b)`​ 即`b - a`​时，数组是降序

‍
