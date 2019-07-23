---
title: 每天一个设计模式-前言
date: 2019-07-22 22:50:03
tags:
 - Java
 - TypeScript
 - 设计模式
categories:
 - 编程
 - 设计模式
---
<img src="https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/daily-design-pattern/%E8%AE%BE%E8%AE%A1%E6%A8%A1%E5%BC%8F%E5%9C%A3%E7%BB%8F.jpg" width="25%" height="25%">
> 设计模式(Design Patterns),是前辈们总结出的一套可以反复使用的理论。它可以提高代码的可重用性，增强系统的可维护性，以及解决一系列复杂的问题。1995年GoF四人合作出版了《设计模式：可复用面向对象软件的基础》一书，共收录了23种设计模式，这本书成为了设计模式领域的“圣经”。本文在介绍这些设计模式的基础上，给出Java和TypeScript两种语言的应用示例。

<!-- more -->

{% note info %}
## 6大设计原则
{% endnote %}
“圣经”中首先提出了6大设计原则，接下来的23种设计模式就是基于这些原则总结出的一套方法论。在学习和理解这些原则和设计模式的时候，我们可能会发现设计模式并不是什么高深的技术，在工作的过程中或多或少都会有所接触或者使用过。
### 单一职责原则
### 里氏替换原则
### 依赖倒置原则
### 接口隔离原则
### 迪米特法则
### 开闭原则

{% note info %}
## 23种设计模式
{% endnote %}
### 单例模式
{% tabs First unique name %}
<!-- tab Java -->
{% code JAVA %}
/** 启用状态：启用 */
public static final String INUSE_TRUE = "true";
/** 启用状态：启用 */
public static final String INUSE_TRUE = "true";
/** 启用状态：启用 */
{% endcode %}
<!-- endtab -->

<!-- tab TypeScript -->
{% code %}
let channel = 'aliPay';
{% endcode %}
<!-- endtab -->
{% endtabs %}
### 工厂方法模式
### 抽象工厂模式
### 模板方法模式
### 建造者模式
### 代理模式
### 原型模式
### 中介者模式
### 命令模式
### 责任链模式
### 装饰模式
### 策略模式
### 适配器模式
### 迭代器模式
### 组合模式
### 观察者模式
### 门面模式
### 备忘录模式
### 访问者模式
### 状态模式
### 解释器模式
### 享元模式
### 桥梁模式 