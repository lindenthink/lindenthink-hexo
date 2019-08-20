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
> 设计模式(Design Patterns)是前辈们总结出的一套可以反复使用的理论。它可以提高代码的可重用性，增强系统的可维护性，以及解决一系列复杂的问题。1995年GoF四人合作出版了《设计模式：可复用面向对象软件的基础》一书，共收录了23种设计模式，这本书成为了设计模式领域的“圣经”。本系列文章在结合自己理解的基础上介绍这些设计模式，同时给出Java和TypeScript两种语言的应用示例。

<!-- more -->

{% note info %}
## 6大设计原则
{% endnote %}
《设计模式》一书中首先提出了6大设计原则，接下来的23种设计模式就是基于这些原则总结出的一套方法论。在学习和理解这些原则和设计模式的时候，我们可能会发现设计模式并不是什么高深的技术，在工作的过程中或多或少都已经有所接触或者使用过。
### 单一职责原则
单一职责原则(Single Responsibility Principle,SRP)，原文对它的解释是“There should never be more than one reason for a class to change”即一个对象不应该有多个引起它变化的原因。这句话看起来很简单，但具体应该怎么理解呢？从面向对象角度来说对象由一系列属性和方法组成，引起对象变化也就是通过调用方法改变属性，那么这个原则简单来说就是一个类应当仅包含某一类功能的方法。这样去设计类的确很好，可以提高可读性、降低类的复杂度等。但实际经验告诉我们很少有人会这么做，因为工作过程中会综合考虑工作量以及员工技术水平等因素，往往都会“违背”这一原则。另外，“职责”是一个无法量化的概念，很难依据标准去划分，我们在工作过程中更多的是面向接口编程，应当尽可能保证接口的单一职责和降低类的复杂度。举个例子，我们在遍历集合时经常用到的{% label info@Iterator %}接口，从JDK1.2开始仅包含三个方法，直到JDK1.8才增加了一个新的方法：
```java
public interface Iterator<E> {
    // jdk1.2-jdk1.7
    boolean hasNext();
    E next();
    void remove();

    // jdk1.8
    boolean hasNext();
    E next();
    default void remove() {
        throw new UnsupportedOperationException("remove");
    }
    default void forEachRemaining(Consumer<? super E> action) {
        Objects.requireNonNull(action);
        while (hasNext())
            action.accept(next());
    }
}
```
我们可以看出，一个职责分明、结构清晰的接口可以极大的提升代码的可重用性。
### 里氏替换原则
里氏替换原则(Liskov Substitution Principle,LSP)，这是Liskov于1987年提出关于继承的原则“Inheritance should ensure that any property proved about supertype objects also holds for subtype objects.”即继承必须确保父类所拥有的 在子类中仍然成立，这样父类能出现的地方子类就可以出现。
### 依赖倒置原则
依赖倒置原则(Dependency Inversion Principle,DIP)，它的原始定义是“High level modules should not depend upon low level modules.Both should depend upon abstractions. Abstractions should not depend upon details. Details should depend upon abstractions.”归根结底就是实现应该依赖于抽象，再具体点就是在单一职责种提到的“面向接口编程”。
### 接口隔离原则
接口隔离原则(Interface Segregation Principle,ISP)，它的其中一种定义是“The dependency of one class to another one should depend on the smallest possible interface.”即类间的依赖关系应该建立在最小的接口上，这就要求我们定义出的接口需要保证“原子性”，是不是感觉和“单一职责原则”是相同的？其实不然，单一职责强调的是某一类功能的聚合而接口隔离则需要保证接口“干净”没有多余的方法。比如我们简单定义了如下动物接口，并且有两个实现类：
```java
public interface IAnimal {
  void eat();
  void makeTools();
}

public class People implements IAnimal {
  @Override
  public void eat() {
    System.out.println("I am eating.");
  }

  @Override
  public void makeTools() {
    System.out.println("I can make tools.");
  }
}

public class Ant implements IAnimal {
  @Override
  public void eat() {
    System.out.println("I am eating.");
  }

  @Override
  public void makeTools() {
    // do noting
  }
}
```
所有动物都会吃东西，但只有人和部分动物会制造工具，在很多其他动物的实现类中这个方法是多余的，因此这个接口不满足接口隔离原则，但它满足单一职责原则。为了能够满足接口隔离原则，我们可以将makeTools方法提取到一个单独的接口中，其他类根据需要去实现这两个接口：
```java
public interface IAnimal {
  void eat();
}
public interface IToolsMaker {
  void makeTools();
}
```
### 迪米特法则
迪米特法则(Law of Demeter，LoD)也称为最少知识原则(Least Knowledge Principle，LKP)，意思是类与类之间应减少依赖，它提出的初衷是为了降低类之间的耦合。
### 开闭原则
开闭原则的定义为“Software entities like classes， modules and functions should be open for extension but closed for modifications.”即一个软件实体如类、模块和函数应该对扩展开放，对修改关闭。这个原则要求我们通过扩展来实现变化，而不是修改已有代码。