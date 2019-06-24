title: JDK版本历史
tags: Java
categories:
  - 编程
  - 后端
  - Java
date: 2019-06-24 22:39:17
---
> 主要介绍了JDK的发展历史以及各版本特性，从1.6版本之后部分技术附有示例代码。

<!-- more -->
# JDK1.0
## 简介
1996年1月23日，JDK1.0发布，这是Java语言的第一个正式版本。

## 代表技术
* Java虚拟机
* Applet
* AWT

# JDK1.1
## 简介
1997年2月19日发布。

## 代表技术
* JAR文件格式
* JDBC
* JavaBeans
* RMI
* 语法/API：
    * 内部类
    * 反射

# JDK1.2
## 简介
1998年12月4日发布，工程代号Playground(竞技场)，这是一个里程碑式的版本，它将Java技术体系分为3个方向，就是我们熟知的面向桌面应用开发的J2SE(Java 2 Platform, Standard Edition)、面向企业级开发的J2EE(Java 2 Platform, Enterprise Edition)和J2ME(Java 2 Platform, Micro Edition)。

## 代表技术
* EJB
* Java Plug-in
* Java IDL
* Swing
* 内置了JIT(Just In Time)编译器

##语法特性
* 增加strictfp关键字
* Collections集合类


# JDK1.3
## 简介
2000年5月8日发布，工程代号Kestrel(美洲红隼)，从这个版本开始Sun大约每隔两年发布一个以动物命名JDK的主版本，期间发布的修正版本以昆虫命名。如修正版本1.3.1工程代号为Ladybird(瓢虫)。

## 代表技术
* JNDI

## 语法特性
* 数学运算和Timer API
* 改进JAVA 2D，新增大量API
* 新增JavaSound类库

# JDK1.4
## 简介
2002年2月13日发布，工程代号Merlin(灰背隼)。于此同时，微软的.NET Framework也在此时发布，它在技术实现和目标客户上都与Java有很多相近之处。
## 代表技术

## 语法特性
* NIO
* 正则表达式
* 异常链
* 日志类
* XML解析器和XLST转换器

# JDK1.5
## 简介
2004年9月30日发布，工程代号Tiger(老虎)。从1.5.0开始调整命名(也可以说是出现命名分支)，产品概念上是“5.0”，对于大部分开发者来说习惯了“1.”的叫法，所以“1.5.0”(或1.5)依然被延续下来(参见：[Version 1.5.0 or 5.0?](https://docs.oracle.com/javase/1.5.0/docs/relnotes/version-5.0.html))，这个版本在语法上作了很大的改进。

## 代表技术
* 改进Java的内存模型(Java Memory Modal，JMM)
* 提供java.util.concurrent并发包

## 语法特性
* 自动拆装箱
* 泛型
* 动态注解
* 枚举
* 可变长参数
* 遍历循环(foreach循环)


# JDK1.6
## 简介
2006年12月11日发布，工程代号Mustang(野马)。结束了J2EE、J2SE和J2ME的命名方式，启用Java SE6、Java EE 6和Java ME 6的命名方式。

## 代表技术
* 动态语言支持(通过内置Mozillaa JavaScript Rhino引擎实现)

## 语法特性
* 提供编译API
* 微型HTTP服务器API
* 改进了锁与同步、垃圾收集和类加载等

# JDK1.7
## 简介
2009年2月19日发布，工程代号Dolphin(海豚)。同年4月20日，Oracle正式收购Sun公司。多事之秋，最开始规划的很多内容，包括Lambda表达式等延迟到了JDK1.8才实现。

## 代表技术
* 提供新的G1收集器
* 升级类加载架构

## 语法特性

# JDK1.8
## 简介
Oracle收购Sun公司后，取得了三大虚拟机中的其中两个：JRocckit(BEA公司)和HotSpot(Sun公司，另外一个为IBM的J9)，宣布把这两个优秀的虚拟机互相取长补短，因此在JDK1.8种虚拟机技术产生了巨大的变化。

## 代表技术

## 语法特性

# JDK1.9
## 简介

## 代表技术

## 语法特性

# JDK1.10
## 简介

## 代表技术

## 语法特性

# JDK1.11
## 简介
这是自1.8版本以后又一个长期维护的版本。

## 代表技术

## 语法特性

# JDK1.12
## 简介

## 代表技术

## 语法特性