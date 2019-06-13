---
title: 常用CSS代码片段
date: 2019-06-11 23:42:49
tags: 
    - CSS
categories:
    - 编程
    - 前端
    - CSS
---
> 主要记录了一些常用的样式代码片段和实现效果，将持续进行收集和更新。

<!-- more -->

## 外层盒阴影
> 盒阴影在网页中比较常用，能够很好的组织和区分各个模块。

* 代码
```CSS
.outer-shadow {
    -webkit-box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, 0.52);
    -moz-box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, 0.52);
     box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, 0.52);
}
```
* 效果
![外层盒阴影](https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/css-snippt/%E5%A4%96%E5%B1%82%E7%9B%92%E9%98%B4%E5%BD%B1.png)

## 透明
> 在一些地方经常需要用到透明字体，比如输入框的占位符等，下面给出了适应于不同浏览器的实现。

* 代码
```CSS
.transparent {
    filter: alpha(opacity=50);
    -moz-opacity: 0.5;
    -khtml-opacity: 0.5;
     opacity: 0.5;
}
```
* 效果
![透明](https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/css-snippt/transparent.png)
