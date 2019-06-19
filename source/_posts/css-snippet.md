title: 常用CSS代码片段
tags:
  - CSS
categories:
  - 编程
  - 前端
  - CSS
date: 2019-06-11 23:42:49
---
> 主要记录了一些常用的样式代码片段和实现效果，将持续进行收集和更新。

<!-- more -->

## 外层盒阴影
> 盒阴影在网页中比较常用，能够很好的组织和区分各个模块。以下利用{% label info@CSS3 %}的box-shadown实现，具体参数含义参考[box-shadown参数说明](http://www.w3school.com.cn/cssref/pr_box-shadow.asp)

* 代码
```CSS
.outer-shadow {
    -webkit-box-shadow: 2px 2px 10px 2px rgba(0, 0, 0, 0.52);
    -moz-box-shadow: 2px 2px 10px 2px rgba(0, 0, 0, 0.52);
     box-shadow: 2px 2px 10px 2px rgba(0, 0, 0, 0.52);
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

## 列表纸质效果
* 代码
```CSS
        ul.box {
            position: relative;
            z-index: 1;
            /* prevent shadows falling behind containers with backgrounds */
            overflow: hidden;
            list-style: none;
            margin: 0;
            padding: 0;
        }
        
        ul.box li {
            position: relative;
            float: left;
            width: 250px;
            height: 150px;
            padding: 0;
            border: 1px solid #efefef;
            margin: 0 30px 30px 0;
            background: #fff;
            -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27), 0 0 40px rgba(0, 0, 0, 0.06) inset;
            -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27), 0 0 40px rgba(0, 0, 0, 0.06) inset;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.27), 0 0 40px rgba(0, 0, 0, 0.06) inset;
        }
        
        ul.box li:before,
        ul.box li:after {
            content: '';
            z-index: -1;
            position: absolute;
            left: 10px;
            bottom: 10px;
            width: 70%;
            max-width: 300px;
            /* avoid rotation causing ugly appearance at large container widths */
            max-height: 100px;
            height: 55%;
            -webkit-box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            -moz-box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            -webkit-transform: skew(-15deg) rotate(-6deg);
            -moz-transform: skew(-15deg) rotate(-6deg);
            -ms-transform: skew(-15deg) rotate(-6deg);
            -o-transform: skew(-15deg) rotate(-6deg);
            transform: skew(-15deg) rotate(-6deg);
        }
        
        ul.box li:after {
            left: auto;
            right: 10px;
            -webkit-transform: skew(15deg) rotate(6deg);
            -moz-transform: skew(15deg) rotate(6deg);
            -ms-transform: skew(15deg) rotate(6deg);
            -o-transform: skew(15deg) rotate(6deg);
            transform: skew(15deg) rotate(6deg);
        }
```
* 效果
![列表纸质效果](https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/css-snippt/%E5%88%97%E8%A1%A8%E7%BA%B8%E8%B4%A8%E6%95%88%E6%9E%9C.png)

## 缝合效果
* 代码
```CSS
        p {
            position: relative;
            z-index: 1;
            padding: 10px;
            margin: 10px;
            font-size: 21px;
            line-height: 1.3em;
            color: #fff;
            background: lightblue;
            -webkit-box-shadow: 0 0 0 4px lightblue, 2px 1px 4px 4px rgba(10, 10, 0, .5);
            -moz-box-shadow: 0 0 0 4px lightblue, 2px 1px 4px 4px rgba(10, 10, 0, .5);
            box-shadow: 0 0 0 4px lightblue, 2px 1px 6px 4px rgba(10, 10, 0, .5);
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
        }
        
        p:before {
            content: "";
            position: absolute;
            z-index: -1;
            top: 3px;
            bottom: 3px;
            left: 3px;
            right: 3px;
            border: 2px dashed #fff;
        }
        
        p a {
            color: #fff;
            text-decoration: none;
        }
        
        p a:hover,
        p a:focus,
        p a:active {
            text-decoration: underline;
        }
```
* 效果
![缝合效果](https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/css-snippt/%E7%BC%9D%E5%90%88%E6%95%88%E6%9E%9C.png)