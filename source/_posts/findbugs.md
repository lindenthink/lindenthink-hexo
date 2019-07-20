---
title: 在IDEA中使用FindBugs
date: 2019-07-20 10:57:33
tags:
    - 工具
    - Java
    - FindBugs
categories:
    - 工具
---

![](http://findbugs.sourceforge.net/umdFindbugs.png)
> FindBugs用来静态分析和查找Java代码中存在的Bugs，它的运行需要依赖1.7或更高版本的JRE(或JDK)，但是它可以分析从1.0到1.8各个版本的JDK编译出的程序。本文介绍了如何在IDEA中使用FindBugs，同时详细列出了FindBugs分析结果中可能出现的Bug类型。


<!-- more -->
{% note info %}
## IDEA中安装使用
{% endnote %}
### 安装
* 在IDEL中{% label info@ctrl+alt+s %}打开设置面板，找到"Plugins"选项；
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
* 根据Bug类型分组，这也是默认的分组
* 根据类分组
* 根据包分组
* 根据Bug严重级别分组，工作中推荐使用的，可以相应优先处理严重级别较高的Bug。

#### 严重级别
* Of Concren - 建议, 如果遵循能更好的完善代码
* Troubling - 不好的, 可能会引发不良后果
* Scary - 严重问题, 在某种情况下一定会出现问题
* Scariest - 非常严重, 已经影响到当前程序功能

### Bug类型
详细介绍请参考[FindBugs Bug Descriptions](http://findbugs.sourceforge.net/bugDescriptions.html)
