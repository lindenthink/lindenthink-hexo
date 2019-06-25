title: JDK版本历史
tags: Java
categories:
  - 编程
  - 后端
  - Java
date: 2019-06-24 22:39:17
---
> 记录了JDK的发展历史以及各版本的主要特性，将持续进行收集和更新。

<!-- more -->
# {% note info %} JDK1.0 
{% endnote %}

## 简介
1996年1月23日，JDK1.0发布，这是Java语言的第一个正式版本。

## 新特性
* Java虚拟机
* Applet
* AWT

# {% note info %}JDK1.1
{% endnote %}

## 简介
1997年2月19日发布。

## 新特性
* JAR文件格式
* JDBC
* JavaBeans
* RMI
* 内部类
* 反射

# {% note info %} JDK1.2
{% endnote %}

## 简介
1998年12月4日发布，工程代号Playground(竞技场)，这是一个里程碑式的版本，它将Java技术体系分为3个方向，就是我们熟知的面向桌面应用开发的J2SE(Java 2 Platform, Standard Edition)、面向企业级开发的J2EE(Java 2 Platform, Enterprise Edition)和J2ME(Java 2 Platform, Micro Edition)。

## 新特性
* EJB
* Java Plug-in
* Java IDL
* Swing
* 内置了JIT(Just In Time)编译器
* 增加strictfp关键字
* Collections集合类


# {% note info %}JDK1.3
{% endnote %}

## 简介
2000年5月8日发布，工程代号Kestrel(美洲红隼)，从这个版本开始Sun大约每隔两年发布一个以动物命名JDK的主版本，期间发布的修正版本以昆虫命名。如修正版本1.3.1工程代号为Ladybird(瓢虫)。

## 新特性
* JNDI
* 数学运算和Timer API
* 改进JAVA 2D，新增大量API
* 新增JavaSound类库

# {% note info %}JDK1.4
{% endnote %}

## 简介
2002年2月13日发布，工程代号Merlin(灰背隼)。于此同时，微软的.NET Framework也在此时发布，它在技术实现和目标客户上都与Java有很多相近之处。

## 新特性
* NIO
* 正则表达式
* 异常链
* 日志类
* XML解析器和XLST转换器

# {% note info %}JDK5
{% endnote %}

## 简介
2004年9月30日发布，工程代号Tiger(老虎)。从1.5.0开始调整命名(也可以说是出现命名分支)，产品概念上是“5.0”，对于大部分开发者来说习惯了“1.”的叫法，所以“1.5.0”(或1.5)依然被延续下来(参见：[Version 1.5.0 or 5.0?](https://docs.oracle.com/javase/1.5.0/docs/relnotes/version-5.0.html))，这个版本在语法上作了很大的改进。

## 新特性
* 改进Java的内存模型(Java Memory Modal，JMM)
* 提供java.util.concurrent并发包
* 自动拆装箱
* 泛型
* 动态注解
* 枚举
* 可变长参数
* 遍历循环(foreach循环)


# {% note info %}JDK6
{% endnote %}

## 简介
2006年12月11日发布，工程代号Mustang(野马)。结束了J2EE、J2SE和J2ME的命名方式，启用Java SE6、Java EE 6和Java ME 6的命名方式。 ![JDK1.6架构图](https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/jdk-versions/JDK1.6%E6%9E%B6%E6%9E%84%E5%9B%BE.png)

## 新特性
* 动态语言支持(通过内置Mozillaa JavaScript Rhino引擎实现)
* 提供编译API
* 微型HTTP服务器API
* 改进了锁与同步、垃圾收集和类加载等


# {% note info %}JDK7
{% endnote %}

## 简介
2009年2月19日发布，工程代号Dolphin(海豚)。同年4月20日，Oracle正式收购Sun公司, JDK开始开源(OpenJDK)，这注定是一个多事之秋，最开始规划的很多内容包括Lambda表达式等都延迟到了JDK1.8才实现；这也是Java的一次机遇，Oracle收购Sun公司后，取得了三大虚拟机中的其中两个：JRockit(BEA公司)和HotSpot(Sun公司，另外一个为IBM的J9)，宣布把这两个优秀的虚拟机互相取长补短，因此在随后的一个版本中虚拟机技术将会产生巨大的变化。 ![JDK1.7架构图](https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/jdk-versions/JDK1.7%E6%9E%B6%E6%9E%84%E5%9B%BE.png)


## 新特性
* 提供新的G1收集器
* 升级类加载架构
* Try-With-Resources

# {% note info %}JDK8
{% endnote %}

## 简介
2014年3月18日发布，时隔五年，这是Oracle收购Sun后发布的第一个版本，也是比较重要的一个版本。完整新特性参考：[What's New in JDK 8](https://www.oracle.com/technetwork/java/javase/8-whats-new-2157071.html)

## 新特性
* Lambda表达式
* Stream API
* Date Time API 
* 标准Base64编码/解码
* 接口默认方法
* 移除持久代(PermGen)
* 新的Nashorn javascript引擎 

# {% note info %}JDK9
{% endnote %}

## 简介
 2017年9月22日发布，不久之前Oracle宣布将Java的发布周期改为每六个月一次，也就是之后每年的3月份和9月份都会发布一个新的版本。完整特性参考：[What’s New in Oracle JDK 9](https://docs.oracle.com/javase/9/whatsnew/toc.htm)

## 新特性
* 模块化(Modularity)
* REPL(Read-eval-print-loop，交互式解析器)工具JShell
* 轻量级Json Api
* 提供了消息发布订阅框架
* 私有接口方法

# {% note info %}JDK10
{% endnote %}

## 简介
2018年3月20日发布，完整特性参见：[Java Language Updates](https://docs.oracle.com/javase/10/language/toc.htm)

## 新特性
* 局部变量类型推断
```JAVA
var x = new ArrayList<String>();
```
* 垃圾收集器接口。
* 向G1引入并行Full GC
* 在备用内存设备上分配堆内存。允许 HotSpot 虚拟机在备用内存设备上分配 Java 对象堆
* 基于Java的JIT编译器（试验版本） 

# {% note info %}JDK11
{% endnote %}

## 简介
2018年09月26日发布，这是自1.8版本以后又一个长期维护的版本(LTS，每三年发布一次)。

## 新特性

# {% note info %}JDK12
{% endnote %}

## 简介

## 新特性