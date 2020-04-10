---
title: 初探Drone
type: original
date: 2020-03-30 09:04:13
tags: 
    - Drone
    - Jenkins
categories:
    - 运维
    - CI/CD
---
![](https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/first-exploration-of-drone/logo.svg)
> Drone是一个现代化的持续集成和持续交付平台，使繁忙的团队能够自动化他们的构建、测试和发布工作流。

<!-- more -->

上面是官方对Drone的定义，和我们在工作过程中用的Jenkins一样，这是一款开源的CI/CD软件。不过Drone是基于Docker的，这一点也许是它的一大优势，它的所有编译和测试流程都在Docker容器中执行，与Jenkins相比它安装方便配置简单，此外也很容易集成到我们应用中。

在大概了解一番后，我想着试用下看看，于是在网上搜了下，不过发现资料不是很多，而且比较坑的是搜到的文章中部署使用方法和官网描述的不太一致，这一点在具体过程中再细说。没有办法，只能完全参考官网的教程了，以下是具体的过程：
{% note info %}
## 环境准备
{% endnote %}
我用的是阿里云的ECS，装有CentOS7系统，并且已经安装了Docker。

{% note info %}
## 服务安装
{% endnote %}
Drone支持集成很多代码托管平台，包括GitHub、GitLab、Gitea等，以下以GitHub为例：
### 第一步：准备
#### 创建一个GitHub的OAuth认证应用
这一步主要是为了获取客户端ID和客户端秘钥，Drone服务在启动时候需要指定这两个参数，后续才有权限从GitHub拉取代码等一系列操作：
![创建OAuth认证](https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/first-exploration-of-drone/github_application_create.png)

![创建OAuth认证成功](https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/first-exploration-of-drone/github_application_created.png)
#### 创建一个可共享秘钥
通过`openssl`命令创建(这一步感觉可以省略，后面会设置Drone服务为"http"方式)：
```
$ openssl rand -hex 16
bea26a2221fd8090ea38720fc445eca6
```
### 第二步：下载镜像
我们上面说到了Drone是基于Docker的，Drone服务也是如此：
```bash
docker pull drone/drone
```
官网上指定了版本"1"，这里我们默认使用"latest"。

### 第三步：配置
* DRONE_GITHUB_CLIENT_ID，第一步中获取到的客户端ID
* DRONE_GITHUB_CLIENT_SECRET，第一步中获取到的客户端秘钥
* DRONE_RPC_SECRET，第一步中openssl命令创建的共享秘钥
* DRONE_SERVER_HOST，Drone服务所在主机域名或者公网IP
* DRONE_SERVER_PROTO，Drone服务协议，可选"http"和"https"

### 第四步：启动服务
以下是完整的Drone服务运行参数：
```bash
  docker pull drone/drone
  docker run \
  --volume=/var/lib/drone:/data \
  --env=DRONE_GITHUB_CLIENT_ID=XXX \
  --env=DRONE_GITHUB_CLIENT_SECRET=XXX \
  --env=DRONE_RPC_SECRET=bea26a2221fd8090ea38720fc445eca6 \
  --env=DRONE_SERVER_HOST=47.104.243.84:9001 \
  --env=DRONE_SERVER_PROTO=http \
  --publish=9001:80 \
  --publish=443:443 \
  --restart=always \
  --detach=true \
  --name=drone \
  drone/drone
```
映射端口根据实际需要进行调整，执行完该命令后，Drone服务已经运行起来了，我们可以在浏览器中打开`http://47.104.243.84:9001`，会出现GitHub授权登陆界面：
![GitHub授权登陆](https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/first-exploration-of-drone/GitHub%E6%8E%88%E6%9D%83%E7%99%BB%E9%99%86.png)
用GitHub授权成功后，可以进入到服务管理页面。
![登陆成功页面](https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/first-exploration-of-drone/%E7%99%BB%E9%99%86%E6%88%90%E5%8A%9F.png)

{% note info %}
## 执行器安装
{% endnote %}
服务启动成功之后我就迫不及待的去GitHub上建了个用来测试的项目"drone-demo"，不用具体的实现就放一个README.md就可以了，并且按照官网文档在项目根目录增加了一个配置文件`.drone.yml`：
```yml
kind: pipeline
type: exec
name: default
platform:
  os: linux
  arch: 386
steps:
- name: build
  commands:
  - pwd
  - ls -la
trigger:
  branch:
  - master
```
回到服务管理页面点击"SYNC"，发现"drone-demo"已经在列表中了，我们在列表中点击对应的"ACTIVATE"链接激活该项目，这样才会触发Drone的构建操作。随便更改drone-demo中的代码然后提交上传，再回到管理页面发现已经触发了构建但问题是一直卡在那里不动了：
![构建卡住](https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/first-exploration-of-drone/%E6%9E%84%E5%BB%BA%E5%8D%A1%E4%BD%8F.png)
在网上搜了下，发现基本上都说需要安装`drone-agent`，而且使用docker-compose一次性安装服务和代理，看起来挺靠谱的，但问题是官网上没有代理的相关描述！不管怎么样，我们还是能看出来是缺少了什么导致的，再回到官网细看才发现还需要安装执行器"Runner"，而执行器分为以下几种：
* Docker Runner，在相关的docker容器中执行构建步骤，比如我们可以根据需要在不同版本的node容器中执行构建
* Kubernetes Runner
* Exec Runner，这个执行器比较特殊，本次就是使用的这个执行器，其他的几个执行器都是可以通过docker容器形式提供服务，这个是以原生的服务提供，具体安装过程和参数配置这里不细说了，官网上已经很详细了，可以参考[官网：在Linux安装Exec执行器](https://docs.drone.io/runner/exec/installation/linux/)
* SSH Runner
* Digital Ocean Runner
安装并成功启动exec执行器之后，我们发现原先的构建已经成功了：
![构建成功](https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/first-exploration-of-drone/%E6%9E%84%E5%BB%BA%E6%88%90%E5%8A%9F.png)
过程也还算顺利，比当初我在使用Jenkins的时候容易多了。如果安装其他的执行器的话可以使用docker-compose，这样服务和执行器可以一起安装比较方便，这里提供一个docker-compose的配置文件以供参考(只包含Drone服务，根据需要自行添加执行器的相关配置)：
```yml
version: '3'
services:
  drone-server:
    image: drone/drone
    ports:
    - 9001:80
    container_name: drone
    volumes:
    - /var/lib/drone:/data
    restart: always
    environment:
    - DRONE_GITHUB_CLIENT_ID=XXX
    - DRONE_GITHUB_CLIENT_SECRET=XXX
    - DRONE_RPC_SECRET=cf51230bedda724d772507cb7140596f
    - DRONE_SERVER_HOST=47.104.243.84:9001
    - DRONE_SERVER_PROTO=http
```
{% note info %}
## 后记
{% endnote %}

我现在还只是停留在试用阶段，Drone的很多功能还有待进一步探索，有兴趣的朋友也可以自己试用一下。

---
参考资料：
* https://docs.drone.io/
* https://www.cntofu.com/book/139/cases/ci/drone.md
