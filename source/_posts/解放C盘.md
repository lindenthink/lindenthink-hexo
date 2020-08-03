---
title: 解放C盘
type: original
date: 2020-07-24 09:19:17
tags:
categories:
---
 > C盘一般都是作为系统盘来使用，相对空间会小一些。由于大多软件默认都是安装到这个磁盘，而且我们平时使用的应用依赖的配置或者缓存文件也同样存到这个磁盘中，所以它的空间很容易被占满。

 <!-- more -->

相信大多数人早已意识到这个问题，所以在安装软件的时候都会把默认安装路径调整为其他磁盘，这样能在一定程度上缓解C盘的压力，但这只是其中的一个方面，这里分享一些供大家参考：

{% note info %}
## 系统方面
{% endnote %}
定期清理一些不需要的安装包，自动下载的文件以及清空回收站的内容。这里推荐大家用Win10系统自带的__存储感知__功能，它可以在空间不足的时候自动释放还可以通过这个功能更新内容的保存位置。设置方法：`win+s`打开搜索栏->输入"设置"并打开对话框->点击"系统"->点击"存储"->开启存储感知，还可以按照需要点击"配置存储感知或立即运行"细化配置。
![存储感知](https://lexiangla.com/assets/ff1121f8b2c211eaa98e0a58ac135530 "存储感知")
![存储感知详细配置](https://lexiangla.com/assets/523e7d8ab2c311ea9e370a58ac133b31 "存储感知详细配置")

{% note info %}
## 软件方面
{% endnote %}
我平时隔段时间会用360安全卫士清理磁盘，它可以清理常见应用产生的缓存、注册表中无效内容等。但我们经常使用的一些工具如果没有调整过配置那下载的依赖包或产生的缓存文件默认都存到了C盘，日积月累下会占用大量的系统盘空间，所以很有必要去调整相应的配置以减少C盘的存储压力。

首先创建一个应用数据公共存放文件夹：`E:\ProgramData`，接下来通过配置把应用下载的依赖或者缓存都指向这个路径下：
![应用数据存放路径](https://lexiangla.com/assets/95c88220b46d11ea8ba00a58ac136de7 "应用数据存放路径")

下面是我对一些自己常用工具的具体配置方式：
### Maven
__Maven__是Java的包管理和安装工具，它默认的本地仓库路径为${user.home}/.m2/repository，在windows中会存到C盘下，本地仓库会占用很大一部分空间。

可以在用户配置文件中更改本地仓库路径，该文件位于`C:\Users\{username}\.m2\settings.xml`下，没有的话从Maven目录下复制一个，打开Idea的maven配置也可以发现默认会从这个路径下读取用户配置，所以可以在其中增加如下配置：
```xml
<localRepository>E:\ProgramData\maven\repository</localRepository>
```
这样设置之后maven下载的依赖包就会保存到E盘指定目录中了。

### NPM
__NPM__是node的包管理工具，默认缓存和依赖包存储路径都在C盘下(可以使用`npm config ls`命令查看当前路径)，通过以下两条命令可以调整npm依赖包的缓存以及包存储路径：
```
npm config set cache "E:\ProgramData\npm\npm-cache"
npm config set prefix "E:\ProgramData\npm\npm_global"
```
接下来再执行`npm install -g xxx`命令，下载的依赖包就会默认存到E盘指定路径下了。如果不想重新下载一遍已有的依赖，可以把已下载依赖复制到新路径下，不过不要忘记在环境变量中调整相应路径，否则全局依赖包提供的一些命令将无法正常使用。

### PIP
__pip__是Python包安装和管理工具，从3.4版本之后为Python的默认组件，不过这次需要调整源文件中的内容。

首先通过命令`python -m site`查看默认安装路径：
![查看Python包安装路径](https://lexiangla.com/assets/6304fe1ab2d611ea859a0a58ac133c25 "查看Python包安装路径")
这里的__USER_BASE__和__USER_SITE__其实就是默认的启用Python通过pip自动下载的脚本和依赖安装包的基础路径。

接下来使用命令`python -m site -help`查看安装目录配置文件路径：
![查看Python包安装目录配置文件](https://lexiangla.com/assets/1c75d7b6b2d711eaa8210a58ac13574b "查看Python包安装目录配置文件")
经过上面两步之后，我们找到了需要修改的文件__site.py__所在的位置，查看这个文件可以找到以下需要修改的两个常量：
```
# for distutils.commands.install
# These values are initialized by the getuserbase() and getusersitepackages()
# functions, through the main() function when Python starts.
USER_SITE = None
USER_BASE = None
```
从注释中我们能看出，这两个常量是用来设置工具包或者命令安装路径的，在Python启动的时候会进行初始化，可以修改如下(安装程序会自动帮我们创建文件夹)：
```python
# for distutils.commands.install
# These values are initialized by the getuserbase() and getusersitepackages()
# functions, through the main() function when Python starts.
USER_SITE = 'E:\ProgramData\python\Python36\site-packages'
USER_BASE = 'E:\ProgramData\python'
```
这样设置之后，我们执行类似`pip install --user xxx`命令就会安装依赖到指定的路径。需要注意的是这里的参数`--user`指定当前用户才可用，如果不加该参数为全局可用而且仍会默认安装到Python所在路径下，实际使用的时候出于安全考虑推荐大家增加这个参数。

### Docker Desktop
__Docker Desktop__依赖Win10的WSL可以方便的在windows中安装和使用docker，安装之后我尝试过设置镜像下载目录为其他磁盘，不过参考网上尝试了多次都没生效还经常搞得应用无法启动只能暂且放弃，有知道方法的朋友可以指点一下！


---
参考资料：
* https://www.cnblogs.com/wuyicode/p/11404897.html
* https://blog.csdn.net/ZCShouCSDN/article/details/84990674
* https://docs.docker.com/engine/reference/commandline/dockerd/#options-per-storage-driver