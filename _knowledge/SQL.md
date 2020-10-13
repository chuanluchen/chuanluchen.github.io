---
layout: project
title: '数据库与MySQL'
date: 01 June 2020
screenshot: /assets/img/projects/code/SQL.jpg
---

[TOC]


## Easy
### 175 Combine Two Tables 
**LEFT JOIN**
~~~sql
select P.FirstName, P.LastName, A.city, A.State 
from Person as P Left join Address as A 
on p.PersonId = A.PersonId
~~~

### 176. Second Highest Salary
**先查询出最高的工资，然后查询身高小于该值的最高工资**
~~~sql
Select Max(Salary) as SecondHighestSalary 
from Employee 
where Salary < (select MAX(Salary) from Employee)
~~~

### 181. Employees Earning More Than Their Managers
**表的内部比较：自连接根据两个条件inner join**
**1. manager id = id 2. 工资大于manager salary**
~~~sql
select a.Name as Employee 
from Employee a inner join Employee b
on a.ManagerId = b.Id
and a.Salary > b.Salary
~~~

### 182. Duplicate Emails
**找重复字段，group by, + having count > 1**
~~~sql
select Email 
from Person
group by Email
having count(Email) > 1
~~~

### 183. Customers Who Never Order
**用NOT IN找不在Order中的id**
~~~sql
Select Name as Customers
from Customers
where Id NOT IN (
    select distinct CustomerId from Orders
)
~~~

### 184. Department Highest Salary
**Delete +表的内部比较（自连接)**
~~~sql
Delete p1
from Person p1, Person p2
where p1.Email = p2.Email and p1.Id >  p2.Id
~~~

### 197. Rising Temperature
**表的内部比较(自连接) + 使用DATEDIFF**
~~~sql
select a.id
from Weather a, Weather b
where DATEDIFF(a.recordDate,b.recordDate) = 1 and a.Temperature> b.Temperature
~~~

### 511. Game Play Analysis I
**Group by**
~~~sql
Select player_id, MIN(event_date) as first_login
from Activity
group by player_id
~~~

### 512. Game Play Analysis II
**先用自查询第一次登陆的时间，再提取其他的列**
~~~sql
select player_id,device_id
from Activity
where (player_id,event_date) in
(
    select player_id,min(event_date) 
    from Activity
    group by player_id
)
~~~

### 577. Employee Bonus
**要保留null: 注意left join, 并且判断 is null**
~~~sql
select e.name, b.bonus 
from Employee e
Left join Bonus b
on e.empId = b.empId
where b.bonus is null or b.bonus < 1000
~~~

### 584. Find Customer Referee
**要保留null: 判断 is null**
~~~sql
select name from customer
where referee_id is null or referee_id <> 2
~~~

### 586. Customer Placing the Largest Number of Orders
**group by + order + 取第一个**
~~~sql
select customer_number
from orders
group by customer_number
order by count(order_number) desc
limit 1
~~~

### 595. Big Countries
~~~sql
select name, population, area
from World
where area > 3000000 or population > 25000000
~~~

### 596. Classes More Than 5 Students
**注意排除duplicate**
~~~sql
select class 
from courses
group by class
having count(distinct student)>=5
~~~

### 597. Friend Requests I: Overall Acceptance Rate
**多重考虑：distinct, count,if null**
~~~sql
select round(
    IFNULL(count(distinct r.requester_id, r.accepter_id) 
           / count(distinct f.sender_id, f.send_to_id)
           , 0), 2) as accept_rate
from friend_request f, request_accepted r
~~~
### 603. Consecutive Available Seats
**自连接**
~~~sql
select distinct a.seat_id 
from cinema a, cinema b
where a.free = '1' and b.free = '1'
and ((a.seat_id = b.seat_id + 1) or (a.seat_id = b.seat_id - 1) )
~~~

### 607. Sales Person
**先找RED做过的交易，用NOT IN取其它**
~~~sql
select name 
from salesperson 
where sales_id not in (
    select o.sales_id 
    from orders o join company c on o.com_id = c.com_id
    where c.name = 'RED'
)
~~~

### 610. Triangle Judgement
**用if判断产生新的列：if(expression, 'Yes','No')**
~~~sql
select T.*, 
if (T.x + T.y > z and T.y + T.z >  T.x and T.x + T.z  > T.y, 'Yes', 'No') as triangle
from triangle as T
~~~

### 613. Shortest Distance in a Line
**自连接，找差的绝对值的最小值**
~~~sql
select min(abs(a.x - b.x)) as shortest
from point as a join point as b
where a.x != b.x
~~~

### 619. Biggest Single Number
**子查询：先找出现一次的数；再找最大**
**注意子查询需要alias**
~~~sql
select max(num) as num
from
(select num from my_numbers
group by num
having count(*) = 1) as T
~~~

### 620. Not Boring Movies
**注意降序**
~~~sql
select * 
from cinema
where id % 2 != 0 and description != 'boring'
order by rating desc
~~~

### 627. Swap Salary
~~~sql
update salary
set sex = if(sex = 'm', 'f','m')
~~~

### 1050. Actors and Directors Who Cooperated At Least Three Times
~~~sql
select actor_id, director_id
from ActorDirector
group by actor_id, director_id
having count(timestamp) >=3
~~~

### 1068. Product Sales Analysis I
~~~sql
select product_name, year, price
from Sales s
join Product p on s.product_id = p.product_id
~~~

### 1069. Product Sales Analysis II
~~~sql
select product_id, sum(quantity) as total_quantity
from Sales
group by product_id
~~~

### 1075. Project Employees I
~~~sql
select P.project_id, round(sum(E.experience_years )/ count(E.employee_id),2) as average_years
from Employee E join Project P on E.employee_id = P.employee_id
group by P.project_id
~~~

### 1076. Project Employees II
**注意:可能有多个project有最大employee count**
**先找到最大count, 再做筛选**
~~~sql
select project_id from Project
group by project_id
having count(employee_id) = 
(select count(employee_id)
from Project
group by project_id
order by count(employee_id) desc
limit 1)
~~~

### 1082. Sales Analysis I
**先找到最高sales, 再做筛选**
~~~sql
select seller_id 
from Sales
group by seller_id
having sum(price) = (
select sum(price) as total_price
from Sales
group by seller_id
order by total_price desc
limit 1
)
~~~

### 1083. Sales Analysis II
**group by 之后用sum(if xx, 1, 0)筛选品牌**
~~~sql
select buyer_id
from Sales s left join Product p on s.product_id = p.product_id
group by buyer_id
having sum(if(p.product_name='S8', 1, 0)) > 0 
and sum(if(p.product_name = 'iPhone', 1, 0)) = 0
~~~

### 1084. Sales Analysis III
**group by 之后用sum(if xx, 1, 0)筛选日期**
**注意日期加引号**
~~~sql
select p.product_id, p.product_name
from Sales s join Product p on s.product_id = p.product_id
group by s.product_id
having sum(if(sale_date > '2019-03-31', 1, 0)) = 0 
and sum(if(sale_date < '2019-01-01', 1, 0)) = 0
~~~

### 1113. Reported Posts
**先筛选日期， report**
**日期function:DATE_SUB('2019-07-05', INTERVAL 1 DAY)**
~~~sql
select extra as report_reason, count(distinct post_id) as report_count
from Actions
where action_date = DATE_SUB('2019-07-05', INTERVAL 1 DAY) and action='report'
group by extra
~~~

### 1141. User Activity for the Past 30 Days I
**先筛选日期**
**日期function:DATEDIFF(a, b) -> 求a-b**
~~~sql
select activity_date as day, count(distinct user_id) as active_users
from Activity
where DATEDIFF('2019-07-27',activity_date) < 30
group by activity_date
~~~

### 1142. User Activity for the Past 30 Days II
**先筛选日期**
**日期function:DATEDIFF(a, b) -> 求a-b**
**需要使用ifnull避免选不出来**
~~~sql
select ifnull(round(count(distinct session_id)/count(distinct user_id),2),0) as average_sessions_per_user
from activity
where datediff("2019-07-27",activity_date)<30
~~~

### 1148. Article Views I
~~~sql
select distinct viewer_id as id
from Views
where author_id = viewer_id
order by viewer_id
~~~

### 1173. Immediate Food Delivery I
**在sum中做逻辑判断**
~~~sql
select round(
    sum(order_date=customer_pref_delivery_date) /
    count(*)
    ,4)*100
as immediate_percentage
from Delivery
~~~


### 1179. Reformat Department Table
**用case when then做判断，创造多列**
~~~sql
SELECT id,
SUM(CASE month WHEN 'Jan' THEN revenue END) Jan_Revenue,
SUM(CASE month WHEN 'Feb' THEN revenue END) Feb_Revenue,
SUM(CASE month WHEN 'Mar' THEN revenue END) Mar_Revenue,
SUM(CASE month WHEN 'Apr' THEN revenue END) Apr_Revenue,
SUM(CASE month WHEN 'May' THEN revenue END) May_Revenue,
SUM(CASE month WHEN 'Jun' THEN revenue END) Jun_Revenue,
SUM(CASE month WHEN 'Jul' THEN revenue END) Jul_Revenue,
SUM(CASE month WHEN 'Aug' THEN revenue END) Aug_Revenue,
SUM(CASE month WHEN 'Sep' THEN revenue END) Sep_Revenue,
SUM(CASE month WHEN 'Oct' THEN revenue END) Oct_Revenue,
SUM(CASE month WHEN 'Nov' THEN revenue END) Nov_Revenue,
SUM(CASE month WHEN 'Dec' THEN revenue END) Dec_Revenue
FROM Department
GROUP BY id
~~~

### 1211. Queries Quality and Percentage
**if逻辑判断**
~~~sql
select query_name, round(avg(rating/position),2) as quality, 
round(sum(if(rating < 3, 1, 0))/count(rating) *100, 2) as poor_query_percentage
from Queries
group by query_name
~~~

### 1241. Number of Comments per Post
**自连接，需要保留Null行使用left/ right join**
~~~sql
select post_id, count(distinct s.sub_id) as number_of_comments
from Submissions s
right join (
    select distinct(sub_id) as post_id
    from Submissions
    where parent_id is null
) as p
on p.post_id = s.parent_id
group by p.post_id
~~~

### 1241. Number of Comments per Post
**以多重条件Join**
~~~sql
select p.product_id, round(sum(p.price * u.units)/ sum(u.units),2) as average_price 
from Prices p join UnitsSold u
on p.product_id = u.product_id 
and u.purchase_date >=p.start_date 
and u.purchase_date <= p.end_date
group by p.product_id
~~~

### 1280. Students and Examinations
**使用cross join得到笛卡尔积**
**注意只有e.subject_name才会出现null值**
~~~sql
select s.student_id, s.student_name, c.subject_name, ifnull(count(e.subject_name),0) as attended_exams
from Students s cross join Subjects c 
left join Examinations e on s.student_id = e.student_id and c.subject_name= e.subject_name
group by s.student_id, c.subject_name
order by s.student_id, c.subject_name
~~~


### 1294. Weather Type in Each Country
**case when**
**注意使用month(date)提取月份**
~~~sql
select country_name, 
case 
    when avg(weather_state)>= 25 then 'Hot'
    when avg(weather_state)<= 15 then 'Cold'
    else 'Warm'
    end as weather_type
from Countries c join Weather w
on c.country_id = w.country_id
where month(day) = 11
group by c.country_id
~~~

### 1303. Find the Team Size
**left join**
**子查询作为表进行join**
~~~sql
select a.employee_id, b.team_size
from Employee a
left join 
(select team_id, count(employee_id) as team_size 
 from Employee group by team_id) as b
on a.team_id = b.team_id
~~~

### 1322. Ads Performance
**sum()中使用=逻辑判断**
**ifnull()**
~~~sql
select ad_id, 
ifnull(round(sum(action='Clicked')/(sum(action='Clicked') + sum(action='Viewed')) * 100,2) ,0)
as ctr
from Ads
group by ad_id
order by ctr desc, ad_id
~~~

### 1327. List the Products Ordered in a Period
**提取日期， year(date), month(date)**
~~~sql
select p.product_name, sum(o.unit) as unit 
from Products p join Orders o
on p.product_id = o.product_id
where year(o.order_date) = 2020 and month(o.order_date) = 2
group by p.product_name
having sum(o.unit) >= 100
~~~

### 1350. Students With Invalid Departments
**保留null, left join**
**确认null：is null**
~~~sql
select s.id, s.name
from Students s left join Departments d
on s.department_id = d.id
where d.name is Null
~~~

### 1378. Replace Employee ID With The Unique Identifier
**保留null，left join**
~~~sql
select u.unique_id, e.name
from Employees e left join EmployeeUNI u
on e.id = u.id
~~~

### 1407. Top Travellers
**保留null，left join**
**ifnull()**
~~~sql
select u.name, ifnull(sum(r.distance),0) as travelled_distance
from Users u left join Rides r on r.user_id = u.id
group by r.user_id
order by sum(r.distance) desc, u.name
~~~

### 1435. Create a Session Bar Chart
**不可用case when：会丢失计数为0的项**
**使用union把所有可能性连接起来**
~~~sql
select '[0-5>' as bin, count(*) as total
from Sessions
where duration>=0 and duration < 5*60
union
select '[5-10>' as bin, count(*) as total
from Sessions
where duration>=5*60 and duration < 10*60
union
select '[10-15>' as bin, count(*) as total
from Sessions
where duration>=10*60 and duration < 15*60
union
select '15 or more' as bin, count(*) as total
from Sessions
where duration >= 15*60
~~~

### 1484. Group Sold Products By The Date
**group_concat: concate multiple rows of data into one field**
~~~sql
select sell_date, count(distinct product) as num_sold, 
group_concat(distinct product) as products
from activities
group by sell_date
~~~

### 1495. Friendly Movies Streamed Last Month
**group_concat: concate multiple rows of data into one field**
~~~sql
select distinct title 
from TVProgram t join Content c on t.content_id = c.content_id
where Year(t.program_date) = 2020 and month(t.program_date) = 6 
and c.Kids_content = 'Y' and c.content_type = 'Movies'
~~~

### 1511. Customer Order Frequency
**多个having条件，用if构成**
~~~sql
select c.customer_id, c.name
from Customers c join Orders o on c.customer_id = o.customer_id
join Product p on o.product_id = p.product_id
where year(o.order_date) = 2020
group by o.customer_id
having 
(
    sum(if(month(o.order_date) = 6, o.quantity*p.price, 0)) >= 100
    and
    sum(if(month(o.order_date) = 7, o.quantity*p.price, 0)) >= 100
)
~~~


### 1517. Find Users With Valid E-Mails
**正则表达式**
~~~sql
select * from Users
where mail regexp '^[a-zA-Z]+[a-zA-Z0-9\\_\\.\\-]*@leetcode\\.com$'
~~~
**解释**
- ^ 以什么开头
- [] 可选集合
- + 匹配一次或多次
- * 匹配0次或多次
- \\ 转义
- a{m,n} 匹配前面
- $ 结尾


### 1527. Patients With a Condition
**%字符串模糊匹配**
~~~sql
select * from Patients
where conditions like '%DIAB1%'
~~~

### 1543. Fix Product Name Format
**字符串处理:trim(), lower()**
**日期处理:DATE_FORMAT(xx, '%Y-%m')  Y4位年代，m数字月份，M英文月份**
~~~sql
select product_name, sale_date, count(*) as total
from
(select lower(trim(product_name)) as product_name, DATE_FORMAT(sale_date, "%Y-%m") as
 sale_date
from Sales) t
group by product_name, sale_date
order by product_name, sale_date
~~~


### 1543. Fix Product Name Format
**日期处理:DATE_FORMAT(xx, '%Y-%m')  Y4位年代，m数字月份，M英文月份**
~~~sql
select month, count(distinct order_id) as order_count, count(distinct customer_id) as customer_count 
from
(select DATE_FORMAT(order_date, '%Y-%m') as month, order_id, customer_id
 from Orders
 where invoice > 20) t
group by month
~~~

### 1571. Warehouse Manager
~~~sql
select w.name as warehouse_name, sum(p.Width * p.Length * p.Height * w.units)  as volume
from Warehouse w join Products p on w.product_id = p.product_id
group by w.name
~~~

### 1571. Warehouse Manager
**先找交易过的id,再用not in排除**
~~~sql
select customer_id, count(visit_id) as count_no_trans
from Visits
where visit_id not in (
    select distinct visit_id 
    from Transactions
    where amount > 0
)
group by customer_id
~~~

### 1587. Bank Account Summary II
~~~sql
select name, balance
from 
(select u.name as name, sum(t.amount) as balance
 from Users u join Transactions t on u.account = t.account
 group by u.account) t
where balance > 10000
~~~


### 1607. Sellers With No Sales
**子查询找到2020年卖过货的，再用not in筛选**
~~~sql
select seller_name
from Seller 
where seller_name not in
(select seller_name 
 from Seller s join Orders o on s.seller_id = o.seller_id
 where Year(o.sale_date)  = 2020
)
order by seller_name
~~~

## Medium
~~~
