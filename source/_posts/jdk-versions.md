title: JDK版本历史
tags: Java
categories:
  - 编程
  - 后端
  - Java
date: 2019-06-24 22:39:17
---
![](https://docs.oracle.com/en/java/javase/12/sp_common/shared-images/1-java.png)
> 记录了JDK的发展历史以及各版本的主要特性，从1.7版本开始会结合示例进行说明和讲解，本文将持续进行收集和更新。

<!-- more -->
{% note info %}
## JDK1.0
{% endnote %}

### 简介
1996年1月23日发布，这是Java语言的第一个正式版本。

### 新特性
* Java虚拟机
* Applet
* AWT

{% note info %}
## JDK1.1
{% endnote %}

### 简介
1997年2月19日发布。

### 新特性
* JAR文件格式
* JDBC
* JavaBeans
* RMI
* 内部类
* 反射

{% note info %}
## JDK1.2
{% endnote %}

### 简介
1998年12月4日发布，工程代号Playground(竞技场)，这是一个里程碑式的版本，它将Java技术体系分为3个方向，就是我们熟知的面向桌面应用开发的J2SE(Java 2 Platform, Standard Edition)、面向企业级开发的J2EE(Java 2 Platform, Enterprise Edition)和面向移动端开发的J2ME(Java 2 Platform, Micro Edition)。

### 新特性
* EJB
* Java Plug-in
* Java IDL
* Swing
* 内置了JIT(Just In Time)编译器
* 增加strictfp关键字
* Collections集合类

{% note info %}
## JDK1.3
{% endnote %}

### 简介
2000年5月8日发布，工程代号Kestrel(美洲红隼)，从这个版本开始Sun大约每隔两年发布一个以动物命名JDK的主版本，期间发布的修正版本以昆虫命名。如修正版本1.3.1工程代号为Ladybird(瓢虫)。

### 新特性
* JNDI
* 数学运算和Timer API
* 改进JAVA 2D，新增大量API
* 新增JavaSound类库

{% note info %}
## JDK1.4
{% endnote %}

### 简介
2002年2月13日发布，工程代号Merlin(灰背隼)。与此同时，微软的.NET Framework也在此时发布，它在技术实现和目标客户上都与Java有很多相近之处。

### 新特性
* NIO
* 正则表达式
* 异常链
* 日志类
* XML解析器和XLST转换器

{% note info %}
## JDK5
{% endnote %}

### 简介
2004年9月30日发布，工程代号Tiger(老虎)。从1.5.0开始调整命名(也可以说是出现命名分支)，产品概念上是“5.0”，对于大部分开发者来说习惯了“1.”的叫法，所以“1.5.0”(或1.5)依然被延续下来(参见：[Version 1.5.0 or 5.0?](https://docs.oracle.com/javase/1.5.0/docs/relnotes/version-5.0.html))，这个版本在语法上作了很大的改进。

### 新特性
* 改进Java的内存模型(Java Memory Modal，JMM)
* 提供java.util.concurrent并发包
* 自动拆装箱
* 泛型
* 动态注解
* 枚举
* 可变长参数
* 遍历循环(foreach循环)

{% note info %}
## JDK6
{% endnote %}

### 简介
2006年12月11日发布，工程代号Mustang(野马)。结束了J2EE、J2SE和J2ME的命名方式，启用Java SE6、Java EE 6和Java ME 6的命名方式。 ![JDK1.6架构图](https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/jdk-versions/JDK1.6%E6%9E%B6%E6%9E%84%E5%9B%BE.png)

### 新特性
* 动态语言支持(通过内置Mozilla JavaScript Rhino引擎实现)
* 提供编译API
* 微型HTTP服务器API
* 改进了锁与同步、垃圾收集和类加载等

{% note info %}
## JDK7
{% endnote %}

### 简介
2009年2月19日发布，工程代号Dolphin(海豚)。同年4月20日，Oracle正式收购Sun公司, JDK开始开源(OpenJDK)，这注定是一个多事之秋，最开始规划的很多内容包括Lambda表达式等都延迟到了JDK1.8才实现；这也是Java的一次机遇，Oracle收购Sun公司后，取得了三大虚拟机中的其中两个：JRockit(BEA公司)和HotSpot(Sun公司，另外一个为IBM的J9)，宣布把这两个优秀的虚拟机互相取长补短，因此在随后的一个版本中虚拟机技术将会产生巨大的变化。 ![JDK1.7架构图](https://lindenthink.oss-cn-beijing.aliyuncs.com/picture/jdk-versions/JDK1.7%E6%9E%B6%E6%9E%84%E5%9B%BE.png)


### 新特性
* 提供新的G1收集器
从JDK1.3开始，HotSpot团队一直努力朝着高效收集、减少停顿(STW: Stop The World)的方向努力，贡献了从串行到并行再到CMS(Concurrent Mark-Sweep Collector)乃至最新的G1在内的一系列优秀的垃圾收集器。G1(Garbage First)最大的特点是引入分区的思想，弱化了分代的概念，合理利用垃圾收集各个周期的资源，解决了其他收集器甚至CMS的众多缺陷。
&nbsp;
JDK默认垃圾回收器查看方法：
```
java -XX:+PrintCommandLineFlags -version
```
* Try-With-Resources
操作的类只要是实现了`AutoCloseable`接口就可以在try语句块退出的时候自动调用close方法关闭流资源。
```java
try ( InputStream is  = new FileInputStream("source.txt");
      OutputStream os = new FileOutputStream("target.txt")
) {
    // ...
}
// 代码块执行结束时JVM自动关闭流
```
* `switch`支持字符串判断条件
```java
String str = "xxx";
switch (str){
  case "xxx":
  //...
  break;
}
```
* 泛型推导
```java
List<String> list = new ArrayList<>();
```
* 捕获多个异常
Java7以前在一个方法抛出多个异常时，只能一个个的catch，这样代码会有多个catch,显得很不友好，现在只需一个catch语句，多个异常类型用"|"隔开。
```java
try {
  result = field.get(obj);
} catch (IllegalArgumentException | IllegalAccessException e) {
  e.printStackTrace();
}

```
* 数字中可添加分隔符
Java7中支持在数字中间增加'\_'作为分隔符，分隔长int以及long（也支持double,float），显示更直观，如（12\_123\_456）。
下划线只能在数字中间，编译时编译器自动删除数字中的下划线。
```java
int intOne = 1_000_000;
long longOne = 1_000_000;
double doubleOne = 1_000_000;
float floatOne = 1_000_000;
```
* 增加二进制表示
Java7前支持十进制（123）、八进制（0123）、十六进制（0X12AB）
```java
int binary = 0b0001_1001;
System.out.println("binary is :"+binary);
// binary is :25
```

{% note info %}
## JDK8
{% endnote %}

### 简介
2014年3月18日发布，时隔五年，这是Oracle收购Sun后发布的第一个版本，也是比较重要的一个版本。完整新特性参考：[What's New in JDK 8](https://www.oracle.com/technetwork/java/javase/8-whats-new-2157071.html)

### 新特性
#### 接口默认方法
```java
interface Formula {
    double calculate(int a);

    default double sqrt(int a) {
        return Math.sqrt(a);
    }
}
```
#### Lambda表达式
Lambda表达式为我们创建匿名对象提供了更简洁的语法：
```java
Collections.sort(names, (a, b) -> b.compareTo(a));
```
#### 函数式接口
“函数式接口”是指仅仅只包含一个**抽象方法**的接口，每一个该类型的lambda表达式都会被匹配到这个抽象方法。为了确保接口达到这个要求可以给接口添加`@FunctionalInterface`注解，编译器如果发现标注了这个注解的接口有多于一个抽象方法的时候会报错：
```java
@FunctionalInterface
interface Converter<F, T> {
    T convert(F from);
}
Converter<String, Integer> converter = (from) -> Integer.valueOf(from);
Integer converted = converter.convert("123");
System.out.println(converted);    // 123
```
 JDK 1.8 API包含了很多内建的函数式接口，在老Java中常用到的比如Comparator或者Runnable接口，这些接口都增加了@FunctionalInterface注解以便能用在lambda上，接下来我们看看这些接口：
* Predicate接口
 Predicate 接口只有一个参数，返回boolean类型。该接口包含多种默认方法来将Predicate组合成其他复杂的逻辑（比如：与，或，非）：
 ```java
Predicate<String> predicate = (s) -> s.length() > 0;

predicate.test("foo");              // true
predicate.negate().test("foo");     // false

Predicate<Boolean> nonNull = Objects::nonNull;
Predicate<Boolean> isNull = Objects::isNull;

Predicate<String> isEmpty = String::isEmpty;
Predicate<String> isNotEmpty = isEmpty.negate();
 ```
* Function接口
 Function接口有一个参数并且返回一个结果，并附带了一些可以和其他函数组合的默认方法（compose, andThen）：
 ```java
Function<String, Integer> toInteger = Integer::valueOf;
Function<String, String> backToString = toInteger.andThen(String::valueOf);

backToString.apply("123");     // "123"
 ```
* Supplier接口
 Supplier接口返回一个任意范型的值，和Function接口不同的是该接口没有任何参数
 ```java
Supplier<Person> personSupplier = Person::new;
personSupplier.get();   // new Person
 ```
* Consumer接口
 Consumer接口表示执行在单个参数上的操作。
 ```java
Consumer<Person> greeter = (p) -> System.out.println("Hello, " + p.firstName);
greeter.accept(new Person("Luke", "Skywalker"));
 ```
* Comparator接口
 Comparator是老Java中的经典接口，Java 8在此之上添加了多种默认方法：
 ```java
Comparator<Person> comparator = (p1, p2) -> p1.firstName.compareTo(p2.firstName);

Person p1 = new Person("John", "Doe");
Person p2 = new Person("Alice", "Wonderland");

comparator.compare(p1, p2);             // > 0
comparator.reversed().compare(p1, p2);  // < 0
 ```
* Optional接口
 Optional不是函数是接口，这是个用来防止NullPointerException异常的辅助类型，这是下一届中将要用到的重要概念，现在先简单的看看这个接口能干什么：
 Optional被定义为一个简单的容器，其值可能是null或者不是null。在Java 8之前一般某个函数应该返回非空对象但是偶尔却可能返回了null，而在Java 8中，不推荐你返回null而是返回Optional。
 ```java
Optional<String> optional = Optional.of("bam");

optional.isPresent();           // true
optional.get();                 // "bam"
optional.orElse("fallback");    // "bam"

optional.ifPresent((s) -> System.out.println(s.charAt(0)));     // "b"
 ```
* Stream接口
 java.util.Stream 表示能应用在一组元素上一次执行的操作序列。Stream 操作分为中间操作或者最终操作两种，最终操作返回一特定类型的计算结果，而中间操作返回Stream本身，这样你就可以将多个操作依次串起来。Stream 的创建需要指定一个数据源，比如 java.util.Collection的子类，List或者Set， Map不支持。Stream的操作可以串行执行或者并行执行。
 首先看看Stream是怎么用，首先创建实例代码的用到的数据List：
 ```java
 List<String> stringCollection = new ArrayList<>();
 stringCollection.add("ddd2");
 stringCollection.add("aaa2");
 stringCollection.add("bbb1");
 stringCollection.add("aaa1");
 stringCollection.add("bbb3");
 stringCollection.add("ccc");
 stringCollection.add("bbb2");
 stringCollection.add("ddd1");
 ```
 Java 8扩展了集合类，可以通过 Collection.stream() 或者 Collection.parallelStream() 来创建一个Stream。下面几节将详细解释常用的Stream操作：
 * Filter 过滤
 过滤通过一个predicate接口来过滤并只保留符合条件的元素，该操作属于中间操作，所以我们可以在过滤后的结果来应用其他Stream操作（比如forEach）。forEach需要一个函数来对过滤后的元素依次执行。forEach是一个最终操作，所以我们不能在forEach之后来执行其他Stream操作。
 ```java
 stringCollection
    .stream()
    .filter((s) -> s.startsWith("a"))
    .forEach(System.out::println);

// "aaa2", "aaa1"
 ```
 * Sort排序
 排序是一个中间操作，返回的是排序好后的Stream。如果你不指定一个自定义的Comparator则会使用默认排序。
 ```java
 stringCollection
    .stream()
    .sorted()
    .filter((s) -> s.startsWith("a"))
    .forEach(System.out::println);

// "aaa1", "aaa2"
 ```
	需要注意的是，排序只创建了一个排列好后的Stream，而不会影响原有的数据源，排序之后原数据stringCollection是不会被修改的。
	 ```java
	 System.out.println(stringCollection);
	// ddd2, aaa2, bbb1, aaa1, bbb3, ccc, bbb2, ddd1
	 ```
 * Map映射
 中间操作map会将元素根据指定的Function接口来依次将元素转成另外的对象，下面的示例展示了将字符串转换为大写字符串。你也可以通过map来将对象转换成其他类型，map返回的Stream类型是根据你map传递进去的函数的返回值决定的。
 ```java
 stringCollection
    .stream()
    .map(String::toUpperCase)
    .sorted((a, b) -> b.compareTo(a))
    .forEach(System.out::println);

// "DDD2", "DDD1", "CCC", "BBB3", "BBB2", "AAA2", "AAA1"
 ```
 * Match匹配
 Stream提供了多种匹配操作，允许检测指定的Predicate是否匹配整个Stream。所有的匹配操作都是最终操作，并返回一个boolean类型的值。
 ```java
 boolean anyStartsWithA = 
    stringCollection
        .stream()
        .anyMatch((s) -> s.startsWith("a"));

System.out.println(anyStartsWithA);      // true

boolean allStartsWithA = 
    stringCollection
        .stream()
        .allMatch((s) -> s.startsWith("a"));

System.out.println(allStartsWithA);      // false

boolean noneStartsWithZ = 
    stringCollection
        .stream()
        .noneMatch((s) -> s.startsWith("z"));

System.out.println(noneStartsWithZ);      // true
 ```
 * Count计数
 计数是一个最终操作，返回Stream中元素的个数，返回值类型是long。
 ```java
 long startsWithB = 
    stringCollection
        .stream()
        .filter((s) -> s.startsWith("b"))
        .count();

System.out.println(startsWithB);    // 3
 ```
 * Reduce规约
 这是一个最终操作，允许通过指定的函数来讲stream中的多个元素规约为一个元素，规越后的结果是通过Optional接口表示的：
 ```java
 Optional<String> reduced =
    stringCollection
        .stream()
        .sorted()
        .reduce((s1, s2) -> s1 + "#" + s2);

reduced.ifPresent(System.out::println);
// "aaa1#aaa2#bbb1#bbb2#bbb3#ccc#ddd1#ddd2"
 ```
 * 并行Streams
 前面提到过Stream有串行和并行两种，串行Stream上的操作是在一个线程中依次完成，而并行Stream则是在多个线程上同时执行。
 下面的例子展示了是如何通过并行Stream来提升性能：
 首先我们创建一个没有重复元素的大表
 ```java
 int max = 1000000;
List<String> values = new ArrayList<>(max);
for (int i = 0; i < max; i++) {
    UUID uuid = UUID.randomUUID();
    values.add(uuid.toString());
}
 ```
 	然后我们计算一下排序这个Stream要耗时多久
 	串行排序：
 ```java
long t0 = System.nanoTime();

long count = values.stream().sorted().count();
System.out.println(count);

long t1 = System.nanoTime();

long millis = TimeUnit.NANOSECONDS.toMillis(t1 - t0);
System.out.println(String.format("sequential sort took: %d ms", millis));
// 串行耗时: 899 ms
```
	并行排序：
```java
long t0 = System.nanoTime();

long count = values.parallelStream().sorted().count();
System.out.println(count);

long t1 = System.nanoTime();

long millis = TimeUnit.NANOSECONDS.toMillis(t1 - t0);
System.out.println(String.format("parallel sort took: %d ms", millis));
// 并行排序耗时: 472 ms
```
	上面两个代码几乎是一样的，但是并行版的快了50%之多，唯一需要做的改动就是将stream()改为parallelStream()。
 * Map
前面提到过，Map类型不支持stream，不过Map提供了一些新的有用的方法来处理一些日常任务。
```java
Map<Integer, String> map = new HashMap<>();

for (int i = 0; i < 10; i++) {
    map.putIfAbsent(i, "val" + i);
}

map.forEach((id, val) -> System.out.println(val));
```
	以上代码很容易理解， putIfAbsent 不需要我们做额外的存在性检查，而forEach则接收一个Consumer接口来对map里的每一个键值对进行操作。
	下面的例子展示了map上的其他有用的函数：
```java
map.computeIfPresent(3, (num, val) -> val + num);
map.get(3);             // val33

map.computeIfPresent(9, (num, val) -> null);
map.containsKey(9);     // false

map.computeIfAbsent(23, num -> "val" + num);
map.containsKey(23);    // true

map.computeIfAbsent(3, num -> "bam");
map.get(3);             // val33
```
	接下来展示如何在Map里删除一个键值全都匹配的项
```java
map.remove(3, "val3");
map.get(3);             // val33

map.remove(3, "val33");
map.get(3);             // null
```
	另外一个有用的方法
```java
map.getOrDefault(42, "not found");  // not found
```
	对Map的元素做合并也变得很容易了：
```java
map.merge(9, "val9", (value, newValue) -> value.concat(newValue));
map.get(9);             // val9

map.merge(9, "concat", (value, newValue) -> value.concat(newValue));
map.get(9);          
```
	Merge做的事情是如果键名不存在则插入，否则则对原键对应的值做合并操作并重新插入到map中。

#### 方法与构造函数引用
上面的`Converter`还可以通过静态方法引用来实现：
```java
Converter<String, Integer> converter = Integer::valueOf;
Integer converted = converter.convert("123");
System.out.println(converted);   // 123
```
 接下来看看构造函数是如何使用::关键字来引用的，首先我们定义一个包含多个构造函数的简单类：
 ```java
class Person {
    String firstName;
    String lastName;

    Person() {}

    Person(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }
}
 ```
 接下来我们指定一个用来创建Person对象的对象工厂接口：
 ```java
 interface PersonFactory<P extends Person> {
    P create(String firstName, String lastName);
}
 ```
 这里我们使用构造函数引用来将他们关联起来，而不是实现一个完整的工厂：
 ```java
PersonFactory<Person> personFactory = Person::new;
Person person = personFactory.create("Peter", "Parker");
 ```
 我们只需要使用 Person::new 来获取Person类构造函数的引用，Java编译器会自动根据PersonFactory.create方法的签名来选择合适的构造函数。

#### Date Time API 
Java 8 在包java.time下包含了一组全新的时间日期API。新的日期API和开源的Joda-Time库差不多，但又不完全一样：
```java
LocalDate today = LocalDate.now();
LocalDate tomorrow = today.plus(1, ChronoUnit.DAYS);
LocalDate yesterday = tomorrow.minusDays(2);

LocalDate independenceDay = LocalDate.of(2014, Month.JULY, 4);
DayOfWeek dayOfWeek = independenceDay.getDayOfWeek();

System.out.println(dayOfWeek);    // FRIDAY
```
#### 标准Base64编码/解码

#### 移除持久代(PermGen)

{% note info %}
## JDK9
{% endnote %}

### 简介
 2017年9月22日发布，不久之前Oracle宣布将Java的发布周期改为每六个月一次，也就是之后每年的3月份和9月份都会发布一个新的版本。完整特性参考：[What’s New in Oracle JDK 9](https://docs.oracle.com/javase/9/whatsnew/toc.htm)

### 新特性
* 模块化(Modularity)
* REPL(Read-eval-print-loop，交互式解析器)工具JShell
* 轻量级Json Api
* 提供了消息发布订阅框架
* 私有接口方法

{% note info %}
## JDK10
{% endnote %}

### 简介
2018年3月20日发布，完整特性参见：[Java Language Updates](https://docs.oracle.com/javase/10/language/toc.htm)

### 新特性
* 局部变量类型推断
```JAVA
var x = new ArrayList<String>();
```
* 垃圾收集器接口
* 向G1引入并行Full GC
* 在备用内存设备上分配堆内存。允许 HotSpot 虚拟机在备用内存设备上分配 Java 对象堆
* 基于Java的JIT编译器（试验版本） 

{% note info %}
## JDK11
{% endnote %}

### 简介
2018年9月26日发布，这是自1.8版本以后又一个LTS(Long-Term-Support，长期支持，每三年发布一次)版本，完整特性参考[What's New in JDK 11](https://www.oracle.com/technetwork/java/javase/11-relnote-issues-5012449.html#NewFeature)。

### 新特性
* ZGC(Z Garbage Collector，实验性)，可扩展低延迟
* Epsilon无操作垃圾回收器（Epsilon 垃圾回收器，又被称为"No-Op"回收器） 
* HTTP Client
* 移除了很多包和模块，比如JavaFX、JMC等

{% note info %}
## JDK12
{% endnote %}

### 简介
2019年3月20日发布，完整特性参考[What's New in JDK 12](https://www.oracle.com/technetwork/java/javase/12-relnote-issues-5211422.html#NewFeature)

### 新特性
* JVM常量API
* Switch表达式

{% note info %}
## JDK13
{% endnote %}

### 简介
2019年9月17日发布，完整特性参考[What's New in JDK 13](https://www.oracle.com/technetwork/java/javase/13-relnote-issues-5460548.html#NewFeature)
### 新特性
* core-libs/java.nio
 * 增加方法`FileSystems.newFileSystem(Path, Map<String, ?>)`
 * 新的`java.nio.ByteBuffer`批量获取/放置方法无需考虑缓冲区位置即可传输字节 
* core-libs/java.util:i18n
 * 支持Unicode 12.1
* hotspot/gc
 * JEP 351中的ZGC不提交未使用的内存
 * 增加标记启用ZGC下标记`-XXSoftMaxHeapSize`
 * ZGC最大管理堆大小从4TB增加到16TB
* 

{% note info %}
## JDK14
{% endnote %}
### 简介
2020年3月19日发布，完整特性参考[What's New in JDK 14](https://www.oracle.com/technetwork/java/javase/14-relnote-issues-5809570.html#NewFeature)

---
参考资料：
* https://www.oracle.com/technetwork/java/javase/overview/index.html
* https://blog.csdn.net/fenglllle/article/details/81975222
* https://blog.csdn.net/u014209205/article/details/79718689
* https://www.jianshu.com/p/0bf8fe0f153b