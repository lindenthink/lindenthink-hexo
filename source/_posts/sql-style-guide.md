---
title: SQL风格指南
type: translate
date: 2019-08-18 23:22:19
tags:
    - SQL
categories:
    - 数据库
    - SQL
---
> 您好!我是Matt Mazur，是一名数据分析师，曾在多家初创公司工作，帮助他们利用数据发展业务。本指南试图记录我对格式化SQL的偏好，以期对其他人有所帮助。如果您或您的团队还没有SQL样式指南，那么这可能是一个很好的起点，您可以根据自己的喜好采用和更新。

<!-- more -->
另外，我是一个[意见偏激者](https://medium.com/@ameet/strong-opinions-weakly-held-a-framework-for-thinking-6530d417e364)，所以如果您不同意任何一点，[给我一个便条](https://mattmazur.com/contact/)，我很乐意去探讨。

如果您对这个主题感兴趣，您可能同样会对我的[Matt on Analytics](http://eepurl.com/dITJS9)新闻稿件和我写的关于分析学和数据分析的[博客](https://mattmazur.com/category/analytics/)感兴趣。

{% note info %}
## 示例
{% endnote %}
下面是一个非常重要的查询，让您能够了解这个风格指南在实践中是什么样子的：
```sql
with hubspot_interest as (

    select
        email,
        timestamp_millis(property_beacon_interest) as expressed_interest_at
    from hubspot.contact
    where property_beacon_interest is not null

), 

support_interest as (

    select 
        email,
        created_at as expressed_interest_at
    from helpscout.conversation
    inner join helpscout.conversation_tag on conversation.id = conversation_tag.conversation_id
    where tag = 'beacon-interest'

), 

combined_interest as (

    select * from hubspot_interest
    union all
    select * from support_interest

),

final as (

    select 
        email,
        min(expressed_interest_at) as expressed_interest_at
    from combined_interest
    group by email

)

select * from final
```

{% note info %}
## 准则
{% endnote %}
### 使用小写SQL
它和大写的SQL一样可读，您不必一直按住SHIFT键。
```sql
-- Good
select * from users

-- Bad
SELECT * FROM users

-- Bad
Select * From users
```
### 单行查询与多行查询
当你进行以下查询时才可以将所有SQL放到同一行：
* 所有列（*）或选择1或2列
* 而且在您的查询中没有额外的复杂性
```sql
-- Good
select * from users

-- Good
select id from users

-- Good
select id, email from users

-- Good
select count(*) from users
```
原因很简单，当所有东西都在一条线上时，仍然很容易阅读。但是，一旦您开始添加更多的列或更复杂的列，如果它位于多行上，则更容易阅读：
```sql
-- Good
select
    id,
    email,
    created_at
from users

-- Good
select *
from users
where email = 'example@domain.com'
```
对于具有1列或2列的查询，可以将列放在同一行上。对于3+列，将每个列名称放在自己的行上，包括第一项：
```sql
-- Good
select id, email
from users
where email like '%@gmail.com'

-- Good
select user_id, count(*) as total_charges
from charges
group by user_id

-- Good
select
    id,
    email,
    created_at
from users

-- Bad
select id, email, created_at
from users

-- Bad
select id,
    email
from users
```

### 所有内容左对齐
```sql
-- Good
select id, email
from users
where email like '%@gmail.com'

-- Bad
select id, email
  from users
 where email like '%@gmail.com'
```

### 使用单引号
一些SQL方言（如BigQuery）支持使用双引号，但对于大多数方言来说，双引号最终会引用列名。因此，最好使用单引号：
```sql
-- Good
select *
from users
where email = 'example@domain.com'

-- Bad
select *
from users
where email = "example@domain.com"
```

### 使用{% label info@!= %}而不是{% label info@<> %}
只是因为{% label info@!= %}读起来像“不等于”，这更接近于我们怎么大声说出来。
```sql
-- Good
select count(*) as paying_users_count
from users
where plan_name != 'free'
```

### 逗号应在行尾
```sql
-- Good
select
    id,
    email
from users

-- Bad
select
    id
    , email
from users
```

### 缩进Where条件
当只有一个Where条件时，请将其与{% label info@where %}保持在同一行：
```sql
select email
from users
where id = 1234
```
如果存在多个条件，则将每个级别缩进到比{% label info@where %}更深的一个级别。将逻辑运算符放在前一个条件的末尾：
```sql
select id, email
from users
where 
    created_at >= '2019-03-01' and 
    vertical = 'work'
```

### 避免括号内有空格
```sql
-- Good
select *
from users
where id in (1, 2)

-- Bad
select *
from users
where id in ( 1, 2 )
```

### 将{% label info@in %}查询值的长列表分隔为多个缩进行
```sql
-- Good
select *
from users
where email in (
    'user-1@example.com',
    'user-2@example.com',
    'user-3@example.com',
    'user-4@example.com'
)
```

### 表名应该是蛇形连接复数形式
```sql
-- Good
select
    id,
    email,
    timestamp_trunc(created_at, month) as signup_month
from users

-- Bad
select
    id,
    email,
    timestamp_trunc(created_at, month) as SignupMonth
from users
```

### 列名约定
* 布尔型字段应以{% label info@is_ %}，{% label info@has_ %}或{% label info@does_ %}开头，如：is_customer, has_unsubscribed等。
* 日期型字段应以{% label info@_date %}结尾，如：report_date。
* 日期时间型字段应以{% label info@_at %}结尾，如：created_at, posted_at等。

### 列顺序约定
首先放置主键，接着是外键，然后放置所有其他列。如果表中有任何系统列(created_at, updated_at, is_deleted等)，则放到最后。
```sql
-- Good
select
    id,
    name,
    created_at
from users

-- Bad
select
    created_at,
    name,
    id,
from users
```

### 内连接中包含{% label info@inner %}
最好是显式的，以便连接类型清晰明了：
```sql
-- Good
select
    email,
    sum(amount) as total_revenue
from users
inner join charges on users.id = charges.user_id

-- Bad
select
    email,
    sum(amount) as total_revenue
from users
join charges on users.id = charges.user_id
```

### 对于联接条件，将首先引用的表放在紧邻{% label info@on %}之后
这样做可以更容易地确定连接是否会导致结果分散：
```sql
-- Good
select
    ...
from users
left join charges on users.id = charges.user_id
-- primary_key = foreign_key --> one-to-many --> fanout
  
select
    ...
from charges
left join users on charges.user_id = users.id
-- foreign_key = primary_key --> many-to-one --> no fanout

-- Bad
select
    ...
from users
left join charges on charges.user_id = users.id
```

### 单个联接条件应与{% label info@join %}在同一行上
```sql
-- Good
select
    email,
    sum(amount) as total_revenue
from users
inner join charges on users.id = charges.user_id
group by email

-- Bad
select
    email,
    sum(amount) as total_revenue
from users
inner join charges
on users.id = charges.user_id
group by email
```
当有多个连接条件时，将每个条件放置在各自的缩进行上：
```sql
-- Good
select
    email,
    sum(amount) as total_revenue
from users
inner join charges on 
    users.id = charges.user_id and
    refunded = false
group by email
```

### 避免表别名
```sql
-- Good
select
    email,
    sum(amount) as total_revenue
from users
inner join charges on users.id = charges.user_id

-- Bad
select
    email,
    sum(amount) as total_revenue
from users u
inner join charges c on u.id = c.user_id
```
唯一的例外是，当您需要多次联接到一个表上并需要区分它们时。

### 如非必须不要包含表名
```sql
-- Good
select
    id,
    name
from companies

-- Bad
select
    companies.id,
    companies.name
from companies
```

### 总是重命名聚合和函数包装的参数
```sql
-- Good
select count(*) as total_users
from users

-- Bad
select count(*)
from users

-- Good
select timestamp_millis(property_beacon_interest) as expressed_interest_at
from hubspot.contact
where property_beacon_interest is not null

-- Bad
select timestamp_millis(property_beacon_interest)
from hubspot.contact
where property_beacon_interest is not null
```

### 确保布尔条件是显示的
```sql
-- Good
select * from customers where is_cancelled = true
select * from customers where is_cancelled = false

-- Bad
select * from customers where is_cancelled
select * from customers where not is_cancelled
```

### 使用{% label info@as %}定义列别名
```sql
-- Good
select
    id,
    email,
    timestamp_trunc(created_at, month) as signup_month
from users

-- Bad
select
    id,
    email,
    timestamp_trunc(created_at, month) signup_month
from users
```

### 用列名而不是序号做分组
```sql
-- Good
select user_id, count(*) as total_charges
from charges
group by user_id

-- Bad
select
    user_id,
    count(*) as total_charges
from charges
group by 1
```

### 使用列别名
```sql
-- Good
select
  timestamp_trunc(com_created_at, year) as signup_year,
  count(*) as total_companies
from companies
group by signup_year

-- Bad
select
  timestamp_trunc(com_created_at, year) as signup_year,
  count(*) as total_companies
from companies
group by timestamp_trunc(com_created_at, year)
```
### 分组列应置于最前
```sql
-- Good
select
  timestamp_trunc(com_created_at, year) as signup_year,
  count(*) as total_companies
from companies
group by signup_year

-- Bad
select
  count(*) as total_companies,
  timestamp_trunc(com_created_at, year) as signup_year
from mysql_helpscout.helpscout_companies
group by signup_year
```

### 对齐case/when语句
每个{% label info@when %}都应该在自己的行上（{% label info@case %}所在行没有任何内容），并且应该缩进比{% label info@case %}行深一层。{% label info@then %}可以和{% label info@when %}在同一行上或者在下一行，这样做只是为了保持一致。
```sql
-- Good
select
    case
        when event_name = 'viewed_homepage' then 'Homepage'
        when event_name = 'viewed_editor' then 'Editor'
    end as page_name
from events

-- Good too
select
    case
        when event_name = 'viewed_homepage'
            then 'Homepage'
        when event_name = 'viewed_editor'
            then 'Editor'
    end as page_name
from events

-- Bad 
select
    case when event_name = 'viewed_homepage' then 'Homepage'
        when event_name = 'viewed_editor' then 'Editor'
    end as page_name
from events
```

### 使用通CTEs而非子查询
避免子查询，CTE（通用表表达式）将使您的查询更容易阅读和解释。
使用CTE时，请用新行填充查询。
如果使用任何CTE，请始终在末尾使用名为final的CTE，并选择`* from final`。这样，您就可以快速检查查询中用于调试结果的其他CTE的输出。
关闭CTE括号应使用与WITH和CTE名称相同的缩进级别。
```sql
-- Good
with ordered_details as (

    select
        user_id,
        name,
        row_number() over (partition by user_id order by date_updated desc) as details_rank
    from billingdaddy.billing_stored_details

),

final as (

    select user_id, name
    from ordered_details
    where details_rank = 1

)

select * from final

-- Bad
select user_id, name
from (
    select
        user_id,
        name,
        row_number() over (partition by user_id order by date_updated desc) as details_rank
    from billingdaddy.billing_stored_details
) ranked
where details_rank = 1
```

### 使用有意义的CTE名称
```sql
-- Good
with ordered_details as (

-- Bad
with d1 as (
```

### 窗口函数
您可以将其全部保留在自己的行中，也可以根据其长度将其拆分为多个：
```sql
-- Good
select
    user_id,
    name,
    row_number() over (partition by user_id order by date_updated desc) as details_rank
from billingdaddy.billing_stored_details

-- Good
select
    user_id,
    name,
    row_number() over (
        partition by user_id
        order by date_updated desc
    ) as details_rank
from billingdaddy.billing_stored_details
```

{% note info %}
## 感谢
{% endnote %}
本风格指南灵感来源于：
* [Fishtown Analytics' dbt Style Guide](https://github.com/fishtown-analytics/corp/blob/master/dbt_coding_conventions.md#sql-style-guide)
* [KickStarter's SQL Style Guide](https://gist.github.com/fredbenenson/7bb92718e19138c20591)
* [GitLab's SQL Style Guide](https://about.gitlab.com/handbook/business-ops/data-team/sql-style-guide/)

向Peter Butler、Dan Wyman、Simon Ouderkirk、Alex Cano、Adam Stone、Brian Kim和Claire Carroll提供关于本指南的反馈意见表示感谢。

---
* 本文译自https://github.com/mattm/sql-style-guide#guidelines