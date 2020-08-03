---
title: 在IDEA中使用FindBugs
date: 2019-07-20 10:57:33
tags:
    - 工具
    - Java
    - FindBugs
categories:
    - 工具
    - IDE
---

![](https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/findbugs/logo.png)
> FindBugs用来静态分析和查找Java代码中存在的Bugs，它的运行需要依赖1.7或更高版本的JRE(或JDK)，但是它可以分析从1.0到1.8各个版本的JDK编译出的程序，是一个基于字节码的工具。本文简单介绍了如何在IDEA中使用FindBugs，并对FindBugs的相关概念作出说明。


<!-- more -->
{% note info %}
## IDEA中安装使用
{% endnote %}
### 安装
* 在IDEA中{% label info@ctrl+alt+s %}打开设置面板，找到"Plugins"选项；
* 然后选择"Browse repositories..."在搜索框中输入"findbugs"查找插件，结果列表中选择"FindBugs-IDEA"并安装；
<img src="https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/findbugs/%E5%AE%89%E8%A3%85%E6%8F%92%E4%BB%B6.png"  width="25%" height="25%">
* 安装完成后重启IDEA方可生效。

### 使用
* 重启后，可以在下列截图中看到最下方工具栏中多出了"FindBugs-IDEA"一项，同时右键选项中也多出了"FindBugs"选项。截图分成了4列，其中第一列中是FindBugs工具栏，可以选择分析范围和分析结果分组；第二列是分析结果列，在该列中选择一个分析出来的Bug后，第三列和第四列会相应展示这个Bug出现的位置以及Bug的详细说明。
<img src="https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/findbugs/FindBugs%E5%88%86%E6%9E%90%E7%BB%93%E6%9E%9C.png"  width="25%" height="25%">

### 说明
#### 分析范围
* 当前文件
* 当前类(对于含内部类的文件，可以选择只分析光标所在类)
* 当前包
* 当前模块
* 当前工程
* 指定范围
* 所有修改的文件(需要结合VCS)
* changelist中的类(需要结合VCS)

#### 结果分组
* 根据Bug分类分组，这也是默认的分组
* 根据类分组
* 根据包分组
* 根据Bug严重级别分组，工作中推荐使用的，可以相应优先处理严重级别较高的Bug。

#### 严重级别
* Of Concren - 建议, 如果遵循能更好的完善代码
* Troubling - 不好的, 可能会引发不良后果
* Scary - 严重问题, 在某种情况下一定会出现问题
* Scariest - 非常严重, 已经影响到当前程序功能

{% note info %}
## Bug类型及示例
{% endnote %}
FindBugs定义了很多详细的Bug类型，这里针对每个大类仅列出一些比较常见的类型，完整列表请参考官网[FindBugs Bug Descriptions](http://findbugs.sourceforge.net/bugDescriptions.html)。

* Bad practice - 不好的习惯(仔细看下来有些Bug会导致程序错误，因此也需要谨慎对待)
 * 比较字符串时使用"=="或"!="
 * 不可变类成员变量没有声明为"final"
* Correctness - 正确性
 * 方法参数顺序颠倒，比如<code>Preconditions.checkNotNull("message", message)</code>
 * 字符串格式化时缺少参数，比如<code>formatter.format("%s %s", "a")</code>
* Experimental - 实验性的
 * 没有使用try-finally进行关闭IO流
* Internationalization - 国际化(在支持多语言时需要关注)
 * 字符和字节数组转换时没有指定字符集
* Malicious code vulnerability - 恶意代码漏洞
 * 成员变量在一些情况下应声明为"final"但没有
* Multithreaded correctness - 多线程正确性
 * 多线程情况下可能存在[双重检查锁](http://www.cs.umd.edu/~pugh/java/memoryModel/DoubleCheckedLocking.html)的情况(单例模式下需注意)
 * 使用静态的日期格式化相关对象，如：SimpleDateFormat
* Performance - 性能
 * 在循环体重使用"+"号连接字符串，我们知道平时字符串变量使用"+"连接时编译器会进行优化为一个StringBuilder对象进行字符串拼接，但在循环体中会创建多个StringBuilder对象，大大增加了时间和空间的开销
 * 对于没有引用父对象的子类没有定义为"static"，很好理解，这种做法会无意义的增加父对象的大小，并且父对象会持有无效的引用
 * 定义了从未被使用的成员变量
* Security - 安全
 * 硬编码或者使用空的数据库密码
 * 动态SQL语句没有使用"prepared statement"
* Dodgy code - 可疑代码
 * 冗余的空值检查
 * Swich语句块缺少Default语句
 * 在可能导致空指针异常的地方没有进行非空检查

{% note info %}
## 后记
{% endnote %}
在IDEA中使用FindBugs是如此简单，但起到的作用真的太大了。在平时的工作中，由于各种因素程序中难免会存在不规范甚至错误的地方，有些错误只是一直没有暴露出来而已，等到真正暴露的时候已经为时已晚。所以我们应该尽可能的去避免这种情况的发生，FindBugs就是一个很好的选择。当然，我们不能完全依赖于工具，还应当做好代码审查以及测试等工作，工具只是一种补充手段。