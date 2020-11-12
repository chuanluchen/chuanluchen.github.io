---
layout: project
title: '数据库与MySQL'
date: 01 June 2020
screenshot: /assets/img/projects/code/SQL.jpg
---

- [Easy](#Easy)
- [Medium](#Medium)
{:toc}

## Easy
### 175 Combine Two Tables👏
- LEFT JOIN
~~~sql
select P.FirstName, P.LastName, A.city, A.State 
from Person as P Left join Address as A 
on p.PersonId = A.PersonId
~~~

### 176. Second Highest Salary👏
- 先查询出最高的工资，然后查询身高小于该值的最高工资
- 直接使用order...limit 1 offset 无法handle Null和并列第一的情况
~~~sql
Select Max(Salary) as SecondHighestSalary 
from Employee 
where Salary < (select MAX(Salary) from Employee)
~~~

### 181. Employees Earning More Than Their Managers👏
- 表的内部比较：自连接根据两个条件inner join
- 1. manager id = id 2. 工资大于manager salary
~~~sql
select a.Name as Employee 
from Employee a inner join Employee b
on a.ManagerId = b.Id
and a.Salary > b.Salary
~~~

### 182. Duplicate Emails👏
- 找重复字段，group by, + having count > 1
~~~sql
select Email 
from Person
group by Email
having count(Email) > 1
~~~

### 183. Customers Who Never Order👏
- 用NOT IN找不在Order中的id
~~~sql
Select Name as Customers
from Customers
where Id NOT IN (
    select distinct CustomerId from Orders
)
~~~

### 196. Delete Duplicate Emails👀
- Delete +表的内部比较（自连接)
~~~sql
Delete p1
from Person p1, Person p2
where p1.Email = p2.Email and p1.Id >  p2.Id
~~~

### 197. Rising Temperature👏
- 表的内部比较(自连接) + 使用DATEDIFF
~~~sql
select a.id
from Weather a, Weather b
where DATEDIFF(a.recordDate,b.recordDate) = 1 and a.Temperature> b.Temperature
~~~

### 511. Game Play Analysis I👏
~~~sql
Select player_id, MIN(event_date) as first_login
from Activity
group by player_id
~~~

### 512. Game Play Analysis II👏
- 先用自查询第一次登陆的时间，再提取其他的列
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

### 577. Employee Bonus👏
- 要保留null: 注意left join, 并且判断 is null
~~~sql
select e.name, b.bonus 
from Employee e
Left join Bonus b
on e.empId = b.empId
where b.bonus is null or b.bonus < 1000
~~~

### 584. Find Customer Referee👏
- 要保留null: 判断 is null
~~~sql
select name from customer
where referee_id is null or referee_id <> 2
~~~

### 586. Customer Placing the Largest Number of Orderse👏
- group by + order + 取第一个
~~~sql
select customer_number
from orders
group by customer_number
order by count(order_number) desc
limit 1
~~~

### 595. Big Countries👏
~~~sql
select name, population, area
from World
where area > 3000000 or population > 25000000
~~~

### 596. Classes More Than 5 Students👏
- 注意排除duplicate
~~~sql
select class 
from courses
group by class
having count(distinct student)>=5
~~~

### 597. Friend Requests I: Overall Acceptance Rate👏
- 多重考虑：distinct, count,if null
~~~sql
select round(
    IFNULL(count(distinct r.requester_id, r.accepter_id) 
           / count(distinct f.sender_id, f.send_to_id)
           , 0), 2) as accept_rate
from friend_request f, request_accepted r
~~~

### 603. Consecutive Available Seats👏
- 自连接
~~~sql
select distinct a.seat_id 
from cinema a, cinema b
where a.free = '1' and b.free = '1'
and ((a.seat_id = b.seat_id + 1) or (a.seat_id = b.seat_id - 1) )
~~~

### 607. Sales Person👏
- 先找RED做过的交易，用NOT IN取其它
~~~sql
select name 
from salesperson 
where sales_id not in (
    select o.sales_id 
    from orders o join company c on o.com_id = c.com_id
    where c.name = 'RED'
)
~~~

### 610. Triangle Judgement👏
- case when
~~~sql
select *, 
case
when x + y > z and y + z >x and x + z > y then 'Yes'
else 'No'
end as triangle
from triangle
~~~

### 613. Shortest Distance in a Line👏
- 自连接，找差的绝对值的最小值
~~~sql
select min(abs(a.x - b.x)) as shortest
from point a cross join point b
where a.x !=  b.x
~~~

### 619. Biggest Single Number👀
- 子查询：先找出现一次的数；再找最大
- 注意子查询需要alias
~~~sql
select max(num) as num
from
(select num from my_numbers
group by num
having count(*) = 1) as T
~~~

### 620. Not Boring Movies👏
- 注意降序
~~~sql
select * 
from cinema
where id % 2 != 0 and description != 'boring'
order by rating desc
~~~

### 627. Swap Salary👏
~~~sql
update salary
set sex = if(sex = 'm', 'f','m')
~~~

### 1050. Actors and Directors Who Cooperated At Least Three Times👏
~~~sql
select actor_id, director_id
from ActorDirector
group by actor_id, director_id
having count(timestamp) >=3
~~~

### 1068. Product Sales Analysis I👏
~~~sql
select product_name, year, price
from Sales s
join Product p on s.product_id = p.product_id
~~~

### 1069. Product Sales Analysis II👏
~~~sql
select product_id, sum(quantity) as total_quantity
from Sales
group by product_id
~~~

### 1075. Project Employees I👏
~~~sql
select P.project_id, round(sum(E.experience_years )/ count(E.employee_id),2) as average_years
from Employee E join Project P on E.employee_id = P.employee_id
group by P.project_id
~~~

### 1076. Project Employees II👏
- 注意:可能有多个project有最大employee count
- 先找到最大count, 再做筛选
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

### 1082. Sales Analysis I👏
- 先找到最高sales, 再做筛选
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

### 1083. Sales Analysis II👏
- group by 之后用sum(if xx, 1, 0)筛选品牌
~~~sql
select buyer_id
from Sales s left join Product p on s.product_id = p.product_id
group by buyer_id
having sum(if(p.product_name='S8', 1, 0)) > 0 
and sum(if(p.product_name = 'iPhone', 1, 0)) = 0
~~~

### 1084. Sales Analysis III👏
- group by 之后用having+两个条件
- sum(if xx, 1, 0)筛选日期，注意日期加引号

~~~sql
select p.product_id, p.product_name
from Sales s join Product p on s.product_id = p.product_id
group by s.product_id
having sum(if(sale_date > '2019-03-31', 1, 0)) = 0 
and sum(if(sale_date < '2019-01-01', 1, 0)) = 0
~~~

### 1113. Reported Posts👏
- 先筛选日期， report
- 日期function:DATE_SUB('2019-07-05', INTERVAL 1 DAY)
~~~sql
select extra as report_reason, count(distinct post_id) as report_count
from Actions
where action_date = DATE_SUB('2019-07-05', INTERVAL 1 DAY) and action='report'
group by extra
~~~

### 1141. User Activity for the Past 30 Days I👏
- 先筛选日期
- 日期function:DATEDIFF(a, b) -> 求a-b
- 时间窗口<30
~~~sql
select activity_date as day, count(distinct user_id) as active_users
from Activity
where DATEDIFF('2019-07-27',activity_date) < 30
group by activity_date
~~~

### 1142. User Activity for the Past 30 Days II👀
- 先筛选日期
- 日期function:DATEDIFF(a, b) -> 求a-b
- 需要使用ifnull避免选不出来
~~~sql
select ifnull(round(count(distinct session_id)/count(distinct user_id),2),0) as average_sessions_per_user
from activity
where datediff("2019-07-27",activity_date)<30
~~~

### 1148. Article Views I👏
~~~sql
select distinct viewer_id as id
from Views
where author_id = viewer_id
order by viewer_id
~~~

### 1173. Immediate Food Delivery I👏
- 在sum中做逻辑判断
~~~sql
select round(
    sum(order_date=customer_pref_delivery_date) /
    count(*)
    ,4)*100
as immediate_percentage
from Delivery
~~~


### 1179. Reformat Department Table👀
- 用case when then做判断，创造多列
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

### 1211. Queries Quality and Percentage👏
- if逻辑判断
~~~sql
select query_name, round(avg(rating/position),2) as quality, 
round(sum(if(rating < 3, 1, 0))/count(rating) *100, 2) as poor_query_percentage
from Queries
group by query_name
~~~

### 1241. Number of Comments per Post👏
- 自连接，需要保留Null行使用left/ right join
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

### 1251. Average Selling Price👀
- 以多重条件Join
~~~sql
select p.product_id, round(sum(p.price * u.units)/ sum(u.units),2) as average_price 
from Prices p join UnitsSold u
on p.product_id = u.product_id 
and u.purchase_date >=p.start_date 
and u.purchase_date <= p.end_date
group by p.product_id
~~~

### 1280. Students and Examinations👀
- 使用cross join得到笛卡尔积
- 注意只有e.subject_name才会出现null值
~~~sql
select s.student_id, s.student_name, c.subject_name, ifnull(count(e.subject_name),0) as attended_exams
from Students s cross join Subjects c 
left join Examinations e on s.student_id = e.student_id and c.subject_name= e.subject_name
group by s.student_id, c.subject_name
order by s.student_id, c.subject_name
~~~


### 1294. Weather Type in Each Country👏
- case when
- 注意使用month(date)提取月份
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

### 1303. Find the Team Size👏
- left join
- 子查询作为表进行join
~~~sql
select a.employee_id, b.team_size
from Employee a
left join 
(select team_id, count(employee_id) as team_size 
 from Employee group by team_id) as b
on a.team_id = b.team_id
~~~

### 1322. Ads Performance👀
- sum()中使用=逻辑判断
- ifnull()
~~~sql
select ad_id, 
ifnull(round(sum(action='Clicked')/(sum(action='Clicked') + sum(action='Viewed')) * 100,2) ,0)
as ctr
from Ads
group by ad_id
order by ctr desc, ad_id
~~~

### 1327. List the Products Ordered in a Period👏
- 提取日期， year(date), month(date)
~~~sql
select p.product_name, sum(o.unit) as unit 
from Products p join Orders o
on p.product_id = o.product_id
where year(o.order_date) = 2020 and month(o.order_date) = 2
group by p.product_name
having sum(o.unit) >= 100
~~~

### 1350. Students With Invalid Departments👏
- 保留null, left join
- 确认null：is null
~~~sql
select s.id, s.name
from Students s left join Departments d
on s.department_id = d.id
where d.name is Null
~~~

### 1378. Replace Employee ID With The Unique Identifier👏
- 保留null，left join
~~~sql
select u.unique_id, e.name
from Employees e left join EmployeeUNI u
on e.id = u.id
~~~

### 1407. Top Travellers👏
- 保留null，left join
- ifnull()
~~~sql
select u.name, ifnull(sum(r.distance),0) as travelled_distance
from Users u left join Rides r on r.user_id = u.id
group by r.user_id
order by sum(r.distance) desc, u.name
~~~

### 1435. Create a Session Bar Chart👏
- 不可用case when：会丢失计数为0的项
- 使用union把所有可能性连接起来
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

### 1484. Group Sold Products By The Date👀
- group_concat: concate multiple rows of data into one field
~~~sql
select sell_date, count(distinct product) as num_sold, 
group_concat(distinct product) as products
from activities
group by sell_date
~~~

### 1495. Friendly Movies Streamed Last Month👏
- group_concat: concate multiple rows of data into one field
~~~sql
select distinct title 
from TVProgram t join Content c on t.content_id = c.content_id
where Year(t.program_date) = 2020 and month(t.program_date) = 6 
and c.Kids_content = 'Y' and c.content_type = 'Movies'
~~~

### 1511. Customer Order Frequency👀
- 多个having条件，用if构成
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


### 1517. Find Users With Valid E-Mails👀
- 正则表达式
~~~sql
select * from Users
where mail regexp '^[a-zA-Z]+[a-zA-Z0-9\\_\\.\\-]*@leetcode\\.com$'
~~~
**解释**
- ^ 以什么开头
- [] 可选集合
- 加号\+ 匹配一次或多次
- 星号\* 匹配0次或多次
- 双\\\\ 转义
- $ 结尾


### 1527. Patients With a Condition👏
- %字符串模糊匹配
~~~sql
select * from Patients
where conditions like '%DIAB1%'
~~~

### 1543. Fix Product Name Format👀
- 字符串处理:trim(), lower()
- 日期处理:DATE_FORMAT(xx, '%Y-%m')  Y4位年代，m数字月份，M英文月份
~~~sql
select product_name, sale_date, count(*) as total
from
(select lower(trim(product_name)) as product_name, DATE_FORMAT(sale_date, "%Y-%m") as
 sale_date
from Sales) t
group by product_name, sale_date
order by product_name, sale_date
~~~


### 1565. Unique Orders and Customers Per Month👏
- 日期处理:DATE_FORMAT(xx, '%Y-%m')  Y4位年代，m数字月份，M英文月份
~~~sql
select month, count(distinct order_id) as order_count, count(distinct customer_id) as customer_count 
from
(select DATE_FORMAT(order_date, '%Y-%m') as month, order_id, customer_id
 from Orders
 where invoice > 20) t
group by month
~~~

### 1571. Warehouse Manager👏
~~~sql
select w.name as warehouse_name, sum(p.Width * p.Length * p.Height * w.units)  as volume
from Warehouse w join Products p on w.product_id = p.product_id
group by w.name
~~~

### 1581. Customer Who Visited but Did Not Make Any Transactions👏
- 先找交易过的id,再用not in排除
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

### 1587. Bank Account Summary II👏
~~~sql
select name, balance
from 
(select u.name as name, sum(t.amount) as balance
 from Users u join Transactions t on u.account = t.account
 group by u.account) t
where balance > 10000
~~~


### 1607. Sellers With No Sales👏
- 子查询找到2020年卖过货的，再用not in筛选
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

### 1623. All Valid Triplets That Can Represent a Country👏
- 多表选择,然后做排除

~~~sql
select a.student_name as member_A,
b.student_name as member_B,
c.student_name as member_C
from SchoolA a, SchoolB b, SchoolC c
where a.student_name <> b.student_name
and  b.student_name <> c.student_name
and  a.student_name <> c.student_name
and a.student_id <>  b.student_id
and b.student_id <>  c.student_id
and a.student_id <>  c.student_id
~~~


## Medium
### 177. Nth Highest Salary👀
- 传入的参数要更改必须要事先SET...;
- limit xx, offset xx
- distinct可返回Null
~~~sql
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    SET N=N-1;
  RETURN (
      # Write your MySQL query statement below.
      select distinct Salary
      from Employee
      order by Salary desc
      limit 1 offset N
  );
END
~~~

### 178. Rank Scores👏
- 一个分数的名次：就是表中>=这个分数的数量
- 对自己的表：找>=当前分数的分数，count之
~~~sql
select s.Score,
    (select count(distinct t.Score) 
     from Scores t 
     where s.Score <= t.Score
    ) as `Rank`
from Scores as s
order by s.Score desc
~~~

### 180. Consecutive Numbers👀
- 自连接3遍：找数字一致，id连续的
~~~sql
select distinct a.Num as ConsecutiveNums
from Logs a 
join Logs b on (a.Num = b.Num and a.Id = b.Id - 1)
join Logs c on (b.Num = c.Num and b.Id = c.Id - 1)
~~~

### 184. Department Highest Salary👏
- 自连接：先找本人所在部门最高的工资，再筛选工资=部门最高工资的人
~~~sql
select d.Name as Department, e.Name as Employee, e.Salary
from Department d join Employee e on d.Id = e.DepartmentId
where e.Salary = (
    select Max(salary) from Employee e2 where e2.DepartmentId = e.DepartmentId
)
~~~

### 534. Game Play Analysis III👏
~~~sql
select a.player_id, a.event_date, sum(b.games_played) as games_played_so_far
from Activity a join Activity b
on a.player_id = b.player_id and b.event_date <= a.event_date
GROUP By a.player_id, a.event_date

select player_id, event_date, 
sum(games_played) over(partition by player_id order by event_date) as games_played_so_far
from Activity
~~~

### 550. Game Play Analysis IV🧶
- 自连接：找同一个人的后一天【注意left join方便总人数】
- where确保a是第一天
~~~sql
select round(count(b.event_date)/count(a.player_id),2) as fraction 
from Activity a left join Activity b
on a.player_id = b.player_id and DATEDIFF(b.event_date, a.event_date) = 1
where (a.player_id, a.event_date) in ( # 保证a是first date
     select player_id, min(event_date) 
     from Activity 
     group by player_id
 )
~~~

### 570. Managers with at Least 5 Direct Reports👏
- 两组关联：非目标组做子查询，目标组用where...in 筛选
~~~sql
select Name 
from Employee 
where Id in (
    select ManagerId from Employee
    group by ManagerId
    having count(Id) >= 5
)
~~~

### 574. Winning Candidate👏
- 两组关联：非目标组做子查询，目标组用where...筛选
~~~sql
select Name 
from Candidate 
where id = (
    select CandidateId
    from Vote
    group by CandidateId
    order by count(id) desc
    limit 1
)
~~~

### 578. Get Highest Answer Rate Question👏
- 组内找最大：直接order by... limit
- 用sum(if(condition, 1, 0))做标记
~~~sql
select question_id as survey_log
from survey_log
group by question_id
order by sum(if(action = 'answer', 1, 0)) / sum(if(action = 'show', 1, 0)) desc
limit 1
~~~


### 580. Count Student Number in Departments👏
- 保留null 用left join
- null参与计数用ifnull(xxx, 0)
~~~sql
select d.dept_name, ifnull(count(s.student_id), 0) as student_number
from department d left join student s
on d.dept_id = s.dept_id
group by d.dept_name
order by student_number desc, d.dept_name
~~~

### 585. Investments in 2016👀
- 组内找相同特征/不同特征：where + 自连接 a.特征 = b.特征
- 分别用in和not in
~~~sql
select sum(TIV_2016) as TIV_2016
from insurance
where PID in 
( select a.PID from insurance a, insurance b
 where a.PID <> b. PID and a.TIV_2015 = b.TIV_2015
)
and PID not in
( select a.PID from insurance a, insurance b
  where a.PID <> b. PID
  and a.LAT = b.LAT and a.LON = b.LON
)
~~~

### 602. Friend Requests II: Who Has the Most Friends👀
- 需要union两组数据：他申请的朋友 + 接受他的朋友
- 注意使用Union all: 允许重复数据
~~~sql
select id, count(*) as num
from 
( select requester_id as id from request_accepted
 UNION ALL
 select accepter_id  as id from request_accepted
) t
group by id
order by num desc
limit 1
~~~

### 608. Tree Node👏
- 定义组别，case when
~~~sql
select id, 
case 
    when p_id is null then 'Root'
    when id in (select distinct p_id from tree) then 'Inner'
    else 'Leaf'
    end
    as Type
from tree
order by id
~~~

### 612. Shortest Distance in a Plane🧶
- 所有可能性：找所有点之间距离 cross join
- 排除同一点
- sqrt((x1-x2)^2 + (y1-y2)^2)
~~~sql
select round( sqrt(min(pow(a.x-b.x,2) + pow(
a.y - b.y,2))), 2) as shortest
from point_2d a cross join point_2d b
where a.x != b.x or a.y != b.y
~~~

### 614. Second Degree Follower👏
- 两组join,注意列名比较疑惑
- 必须用distinct
~~~sql
select a.followee as follower, count(distinct a.follower) as num
from follow a join follow b
on a.followee = b.follower
group by a.followee
order by a.followee
~~~

### 626. Exchange Seats🧶
- 直接改id:偶数-1，奇数加1 -> if
- 奇数且最后一行：不动 -> 需要计算总数
~~~sql
select if(a.id % 2=1 and a.id = total, a.id, if(a.id%2 =1, a.id + 1, a.id - 1)) as id, 
          student
from seat a, (select count(*) as total from seat) b
order by id
~~~


### 1045. Customers Who Bought All Products👀
- group by之后，保证产品数量相等
~~~sql
select customer_id
from Customer
group by customer_id
having count(distinct product_key) = (select count(distinct product_key) from Product)
~~~


### 1070. Product Sales Analysis III👏
- 把product_id, year联合起来找符合条件的
~~~sql
select product_id, year as first_year, quantity, price
from Sales
where (product_id, year) in 
    (select product_id, min(year)
    from Sales 
    group by product_id
    )
~~~

### 1077. Project Employees III👀
- project_id, experience_years联合起来找符合条件的
~~~sql
select p.project_id, p.employee_id
from Project p join Employee e 
on p.employee_id = e.employee_id
where (p.project_id,e.experience_years) in
    (select p.project_id, max(e.experience_years)
    from Project p join Employee e 
    on p.employee_id = e.employee_id 
    group by project_id
    )
~~~

### 1098. Unpopular Books🧶
- 注意left join，没有销量的书也算
- 基于（多个条件）join
~~~sql
SELECT b.book_id, b.name 
from books b left JOIN orders o 
ON (b.book_id = o.book_id AND o.dispatch_date BETWEEN DATE('2018-06-23') AND DATE('2019-06-23'))
WHERE b.available_from <= DATE('2019-05-23')
GROUP BY b.book_id
HAVING ifnull(sum(o.quantity),0) < 10
~~~

### 1107. New Users Daily Count
- 子查询先找到符合条件的user_id, login_date，再做筛选
~~~sql
select login_date, count(user_id) as user_count 
from 
    (select user_id, min(activity_date) as login_date
     from Traffic
     where activity = 'login'
     group by user_id
    ) t
where DATEDIFF('2019-06-30', login_date) <=90
group by login_date
~~~

### 1112. Highest Grade For Each Student
- 子查询找到每个人的最高分
- 再用(id, grade)联合做筛选
~~~sql
select student_id, min(course_id) as course_id, grade
from Enrollments
where (student_id, grade) in
(select student_id, max(grade)
 from Enrollments
 group by student_id
)
group by student_id
order by student_id
~~~

### 1126. Active Businesses👏
- 复杂聚合问题：将聚合指标作为一个表与主表join -> 相当于多出一列
~~~sql
select e.business_id 
from Events e join 
    (select event_type, avg(occurences) as avg_occ
     from Events
     group by event_type
    ) t
    on e.event_type = t.event_type and e.occurences > t.avg_occ
group by e.business_id
having count(*)>1
~~~

### 1132. Reported Posts II
- 复杂聚合问题：from + 单独算每一天的proprorion作为一个表
- 主表对proportion求平均
~~~sql
select round(avg(proportion) * 100, 2) as average_daily_percent
from
    (select a.action_date, count(distinct r.post_id)/ count(distinct a.post_id) as proportion
    from Actions a left join Removals r
    on a.post_id = r.post_id
    where a.extra = 'spam'
    group by a.action_date
     ) t
~~~

### 1149. Article Views II
- 注意article，viewer取distinct
~~~sql
select distinct viewer_id as id
from Views
group by viewer_id, view_date
having count(distinct article_id) > 1
~~~

### 1158. Market Analysis I
- 保留null值，left join

~~~sql
select u.user_id as buyer_id, u.join_date as join_date, ifnull(count(o.order_id),0)  as orders_in_2019
from Users u left join Orders o # 保留Null值
on u.user_id = o.buyer_id and year(o.order_date) = '2019' # 双重join条件
group by u.user_id
~~~

### 1164. Product Price at a Given Date
- 两种情况union起来
	- 2019-08-16之前改过价格，使用最大日期的价格
	- 2019-08-16之前没有改过价格，价格为10
	
~~~sql
select product_id, price 
from (
    select product_id,new_price as price
    from Products
    where (product_id, change_date) in (
        select product_id, max(change_date)
        from Products
        where change_date <= date('2019-08-16')
        group by product_id
        ) 
 
    union
    select product_id, 10 as price
     from Products 
     where product_id not in (
         select product_id 
         from Products
         where change_date <= date('2019-08-16')
     )
 ) t
order by price desc
~~~

### 1174. Immediate Food Delivery II
- 复杂聚合：单独做表对数据做标记

~~~sql
select round(sum(label) / count(customer_id)*100, 2)
as immediate_percentage
from (
    select customer_id, if(min(order_date)=min(customer_pref_delivery_date), 1, 0) as label
    from Delivery
    group by customer_id
    ) t
~~~

### 1193. Monthly Transactions I
- 聚合中使用if做标记
~~~sql
select DATE_FORMAT(trans_date, '%Y-%m') as month, country, count(id) as trans_count, sum(if(state = 'approved', 1, 0)) as approved_count,sum(amount) as trans_total_amount,sum(if(state='approved', amount, 0)) as approved_total_amount
from Transactions
group by month, country
~~~

### 1204. Last Person to Fit in the Elevator
- window function写running total: sum(...) over (order by ...)
~~~sql
select person_name
from 
(select person_name, sum(weight) over(order by turn) as running_total
 from queue ) t
where running_total<= 1000
order by running_total desc # 找最后一个人
limit 1
~~~

### 1205. Monthly Transactions II
- 把transactions部分和chargeback部分union起来造一个表
~~~sql
select DATE_FORMAT(trans_date, '%Y-%m') as month,
country,
sum(if(state ='approved',1,0)) as approved_count,
sum(if(state ='approved',amount,0)) as approved_amount,
sum(if(state = 'chargeback', 1,0)) as chargeback_count,
sum(if(state = 'chargeback',amount,0)) as chargeback_amount
from 
    (select *
    from Transactions
    where state = 'approved'
    union
    select t.id, t.country, 'chargeback',t.amount,c.trans_date
    from Transactions t
    join Chargebacks c on t.id = c.trans_id) temp
group by date_format(trans_date, '%Y-%m'), country
~~~

### 1212. Team Scores in Football Tournament
- 先找主场得分 Union ALL 客场得分， right join 队名
~~~sql
select t.team_id as team_id, t.team_name, ifnull(sum(a.points),0) as num_points
from 
(select host_team as team, 
sum(case
    when host_goals > guest_goals then 3
    when host_goals = guest_goals then 1
    else 0 end) as points
from Matches
group by host_team
union all
select guest_team as team, 
sum(case
    when host_goals > guest_goals then 0
    when host_goals = guest_goals then 1
    else 3 end) as points
from Matches
group by guest_team ) a
right join Teams t 
on a.team = t.team_id
group by t.team_id
order by num_points desc, team_id
~~~


### 1264. Page Recommendations
- 某人的朋友-> 朋友喜欢的 -> not in自己喜欢的
~~~sql
select distinct l.page_id as recommended_page
from
(select user2_id as friend from Friendship
where user1_id = 1
union
select user1_id as friend from Friendship
where user2_id = 1) a join Likes l
on a.friend = l.user_id
where l.page_id not in
(select page_id from Likes
 where user_id = 1
)
~~~

### 1270. All People Report to the Given Manager
- 用left join找上一层经理
- 第三层manage_id = 1
~~~sql
select a.employee_id from Employees a
left join Employees b on a.manager_id = b.employee_id
left join Employees c on b.manager_id = c.employee_id
where c.manager_id = 1 and a.employee_id != 1
~~~

### 1285. Find the Start and End Number of Continuous Ranges
- 一串连续数字，跟row number的差值是一致的
- 用window function计算与row_number()的差值，作为依据分组，找min, max
~~~sql
select min(log_id) as start_id, max(log_id) as end_id
from 
(select log_id, (log_id - row_number() over (order by log_id)) as diff
 from Logs
) t
group by t.diff
~~~

### 1308. Running Total for Different Genders
- window function： sum() over (partition by xxx order by xxx) 
~~~sql
select gender, day, sum(score_points) over (partition by gender order by day) as total
from Scores
group by gender, day
order by gender, day
~~~

### 1321. Restaurant Growth
- 先找每天收入
- window function前6天之和：sum(amount) over(order by visited_on rows 6 preceding)
- 剔除不足6天的
~~~sql
select * from
(
    select visited_on, 
        sum(amount) over(order by visited_on rows 6 preceding) amount, # 当前+前6天总和
        round(avg(amount) over(order by visited_on rows 6 preceding),2) average_amount
    from
    (   # 先计算每一天的amount
        select visited_on, sum(amount) amount
        from Customer
        group by visited_on
    ) t
) temp 
where DATEDIFF(visited_on,(select min(visited_on) from Customer)) >=6 # 去除前5天
order by visited_on
~~~

### 1341. Movie Rating
- 分别找答案，Union all在一起
~~~sql
(select u.name as results
from Users u join Movie_Rating mr
on u.user_id = mr.user_id
group by mr.user_id
order by count(mr.movie_id) desc, u.name
limit 1)
union all
(select m.title as results
from Movies m join Movie_Rating mr
on m.movie_id = mr.movie_id
where Year(mr.created_at) = 2020 and month(mr.created_at) = 2
group by mr.movie_id
order by avg(mr.rating) desc, m.title
limit 1)
~~~


### 1355. Activity Participants
- 掐头去尾

~~~sql
select a.name as activity
from Activities a left join Friends f
on a.name = f.activity
group by f.activity
having count(f.id) != (select count(id) from Friends group by activity order by count(id) desc limit 1)
and count(f.id) != (select count(id) from Friends group by activity order by count(id)  limit 1)
~~~


### 1364. Number of Trusted Contacts of a Customer 
- 掐头去尾

~~~sql
select i.invoice_id, c.customer_name, i.price, 
	   count(distinct contact_name) as 'contacts_cnt', 
       sum(if(contact_name in (select customer_name from Customers), 1,0)) as 'trusted_contacts_cnt'
from Invoices i
join Customers c
on i.user_id = c.customer_id
left join Contacts o
on c.customer_id = o.user_id
group by i.invoice_id, c.customer_name, i.price
order by i.invoice_id
~~~

### 1393. Capital Gain/Loss
- Sell价格总和-Buy价格总和

~~~sql
select stock_name, sum(if(operation='Sell', price, 0)) - sum(if(operation='Buy', price, 0)) 
as capital_gain_loss
from Stocks
group by stock_name
~~~

### 1398. Customers Who Bought Products A and B but Not C

~~~sql
select customer_id, customer_name
from Customers
where customer_id in 
    (select customer_id
    from Orders
    where product_name = 'A'
     )
and customer_id in 
    (select customer_id
    from Orders
    where product_name = 'B'
     )
and customer_id not in 
    (select customer_id
    from Orders
    where product_name = 'C'
     )
~~~

### 1421. NPV Queries

~~~sql
select q.id, q.year, ifnull(n.npv, 0) as npv
from Queries q left join NPV n
on q.id = n.id and q.year = n.year
~~~

### 1440. Evaluate Boolean Expression
- case when找出true的情况，其它为false

~~~sql
select e.*,
case 
when operator = '=' and v1.value = v2.value then 'true'
when operator = '<' and v1.value < v2.value then 'true'
when operator = '>' and v1.value > v2.value then 'true'
else 'false'
end as value
from Expressions e, Variables v1, Variables v2
where e.left_operand = v1.name
and e.right_operand = v2.name
~~~


### 1445. Apples & Oranges
- 区分apple, orange ->  sold_num * 1 or -1

~~~sql
select sale_date, sum(adjusted_num) as diff
from (
    select sale_date, if(fruit='apples', sold_num*1, sold_num*(-1)) as adjusted_num
    from Sales
    )t
group by sale_date
order by sale_date
~~~

### 1454. Active Users👀
- 使用dense_rank()针对每个id的login_date排名 -> 连续的情形下：login_date - rank值是一样的
- group by ID，login_date - rank -> 找count>=5的人
- 注意count日期要用distinct避免重复日期

~~~sql
with temp as (
    select id, login_date,
    dense_rank() over(partition by id order by login_date) as day_rank  
    from Logins
)

select distinct t.id, a.name
from temp t join Accounts a
on t.id = a.id
group by t.id, DATE_SUB(t.login_date,interval t.day_rank day)
having count(distinct t.login_date) >= 5  # 有同天多次登录
~~~

### 1459. Rectangles Area
- 自连接
- 条件：a.id < b.id, a.x_value != b.x_value, a.y_value != b.y_value

~~~sql
select a.id as p1, b.id as p2, abs(a.x_value - b.x_value)*abs(a.y_value - b.y_value) as area
from Points a, Points b
where a.id < b.id
and a.x_value != b.x_value
and a.y_value != b.y_value
order by area desc, p1, p2
~~~


### 1468. Calculate Salaries
- 先算税率

~~~sql
with temp as
( select company_id, 
 case
 when max(salary) < 1000 then 0
 when max(salary) <= 10000 then 0.24
 when max(salary) > 10000 then 0.49
 end as tax_rate
 from Salaries
 group by company_id
)

select s.company_id, s.employee_id, s.employee_name, 
round(s.salary * (1-t.tax_rate),0) as salary
from Salaries s left join temp t
on s.company_id = t.company_id
~~~


### 1501. Countries You Can Safely Invest In
- 打进或打出都算 call_id or callee_id属于某个国家
- substring(xx, start, length)

~~~sql
select cc.name as country 
from Calls c, Person p, Country cc
where (p.id=c.caller_id or p.id=c.callee_id) 
and cc.country_code=substring(p.phone_number,1,3)
group by cc.name 
having avg(c.duration)>(select avg(duration) from Calls)
~~~


### 1532. The Most Recent Three Orders
- CTE:rank() 
- 筛选rank <= 3

~~~sql
with temp as
( select customer_id, order_id, order_date, 
 rank() over (partition by customer_id order by order_date desc) as o_rank
 from Orders
)

select c.name as customer_name, t.customer_id, t.order_id, t.order_date
from Customers c join temp t
on c.customer_id = t.customer_id
where t.o_rank <= 3
order by customer_name, t.customer_id, t.order_date desc
~~~

### 1549. The Most Recent Orders for Each Product
- CTE:rank()

~~~sql
with temp as
( select product_id, order_id, order_date, rank() over (partition by product_id order by order_date desc) as p_rank
 from Orders
)

select p.product_name, t.product_id, t.order_id, t.order_date
from Products p join temp t
on p.product_id =  t.product_id
where t.p_rank = 1
order by p.product_name, t.product_id, order_id
~~~

### 1555. Bank Account Summary
- 花出的钱 + 收到的钱 -> CTE算出Amount
- 再考虑credit问题

~~~sql
with temp as
(select user_id, sum(amount) as balance from 
    (select paid_by as user_id, -1*amount as amount
     from Transactions
    union all
    select paid_to as user_id, amount
     from Transactions
     ) c
 group by user_id
)

select u.user_id, u.user_name,u.credit + ifnull(t.balance, 0) as credit, 
if(u.credit + ifnull(t.balance, 0) < 0, 'Yes', 'No') as credit_limit_breached
from Users u left join temp t
on u.user_id = t.user_id
~~~

### 1596. The Most Frequently Ordered Products for Each Customer
- CTE找分类rank

~~~sql
# CTE找到每个顾客买的东西 rank
with temp as
(select customer_id, 
 product_id, 
 rank() over(partition by customer_id order by count(order_id) desc) as p_rank
 from Orders 
 group by customer_id, product_id
 )
 
 # 找rank 1的product name
 select t.customer_id, t.product_id, p.product_name
 from temp t join Products p
 on t.product_id = p.product_id
 where t.p_rank = 1
~~~

### 1613. Find the Missing IDs
- Recursive CTE生成连续数字

~~~sql
# recursive CTE生成1到100的连续数字
with recursive cte as (
    select 1 as value union all select value + 1 from cte where value < 100
)
select value as ids
from cte 
where value not in
    (select customer_id from Customers)
and value < (select max(customer_id) from Customers)
~~~

## Hard
### 185. Department Top Three Salaries👀 
- CTE: dense_rank()

~~~sql
with temp as
( select Name, Salary, DepartmentId,
 dense_rank() over (partition by DepartmentId order by Salary desc) as s_rank
 from Employee
)

select d.Name as Department, t.Name as Employee, t.Salary
from Department d left join temp t
on d.Id = t.DepartmentId
where t.s_rank <= 3
~~~

### 262. Trips and Users👀  
- 日期 between 'xxx' and 'xxx'

~~~sql
with temp as 
( select Id, Status, Request_at
 from Trips
 where Client_id not in 
    (select Users_Id from Users 
     where Role='client' and Banned='Yes'
    )
 and Driver_id not in
     (select Driver_Id from Users 
     where Role='driver' and Banned='Yes'
    )
 and Request_at between '2013-10-01' and '2013-10-03'
)

select Request_at as Day,round(sum(if(Status != 'completed', 1, 0))/count(Id),2) as `Cancellation Rate`
from temp
group by Request_at
~~~


### 569. Median Employee Salary👀
- window function:用row_number找每个公司排序，用count找每个公司count
- count为奇数，找中间那个数；count为偶数，找中间两个数

~~~sql
with temp as
( select *, 
 row_number() over(partition by Company order by Salary) as s_rank,#用row_number不要用rank, 否则有跳过的问题
 count(*) over(partition by Company) as count
 from Employee
)

select Id, Company, Salary
from temp
where (count%2=1 and s_rank=(count+1)/2)  # count为奇数：median为中间那个数
or (count%2=0 and ((s_rank=count/2) or (s_rank=count/2+1))) # count为偶数：median为中间两个数
~~~

### 571. Find Median Given Frequency of Numbers👀
- window function:找running_total, count
- 注意median定义：一个数或两个数平均 -> 定位所属区间，算avg

~~~sql
with temp as (
    select *, 
    sum(Frequency) over (order by Number) as running_total,
    sum(Frequency) over () as count #注意使用window function算总sum的写法
    from Numbers
)

select avg(Number) as median
from temp
where count/2 <= running_total     # 定位median落在哪个区间
and count/2 >= running_total - Frequency
~~~

### 579. Find Cumulative Salary of an Employee👀
- 针对每个人， 每个月计算三个月的running_total：sum() over (...row 2 preceding)
- 去除每个人最近月份

~~~sql
# 针对每个人， 每个月计算三个月的running_total
select Id, Month, 
sum(Salary) over(partition by Id order by Month rows 2 preceding ) as Salary
from Employee 
where (Id, Month) not in  # 去除每个人最近的那个月份
    (select Id, max(Month)
     from Employee
     group by Id
    )
order by Id, Month desc
~~~

### 601. Human Traffic of Stadium👀
- id - row_number() over (order by id) as diff
- group by diff找连续数字组

~~~sql
with temp as(
    select id, visit_date, people, 
    id - row_number() over(order by id) as diff
    from Stadium 
    where people >= 100
)

select id, visit_date, people
from temp
where diff in (     # 不能直接group否则得不到组内详细信息
    select diff from temp
    group by diff 
    having count(*) >= 3
)
~~~

### 615. Average Salary: Departments VS Company👀
- avg() over (partition by...) 算公司avg和部门avg
- 注意这里日期必须用distinct

~~~sql
with temp as(
select distinct DATE_FORMAT(s.pay_date,'%Y-%m') as pay_month, 
e.department_id,
avg(s.amount) over (partition by DATE_FORMAT(s.pay_date,'%Y-%m')) as avg_com,
avg(s.amount) over (partition by e.department_id, DATE_FORMAT(s.pay_date,'%Y-%m')) as avg_depart
from salary s join employee e
on s.employee_id = e.employee_id
)

select pay_month, department_id, 
case
when avg_depart = avg_com then 'same'
when avg_depart > avg_com then 'higher'
else 'lower' end as comparison
from temp
~~~

### 618. Students Report By Geography

~~~sql
with temp as
( select 
 case when continent = 'America' then name end as 'America',
 case when continent = 'Europe' then name end as 'Europe',
 case when continent = 'Asia' then name end as 'Asia',
 row_number() over(partition by continent order by name) as name_rk # name 内部排序用于安排name的行
 from student
)

select max(America) as America, max(Asia) as Asia, max(Europe) as Europe  #max去除null
FROM temp
GROUP BY name_rk
~~~

### 1097. Game Play Analysis V
- 先找install date
- count install date -> installs/ 分母
- count 同一人 & 后一天 -> 分子

~~~sql
with temp as(
    select player_id, 
    min(event_date) as install_dt
    from Activity
    group by player_id
)

# count install_date -> installs 分母
# 找player_id, login_date + 1  -> 分子
select t.install_dt, 
count(t.player_id) as installs,
round(count(a.event_date) / count(t.player_id),2) as Day1_retention
from temp t left join Activity a
on t.player_id = a. player_id
and DATE_ADD(t.install_dt, interval 1 day) = a.event_date
group by install_dt
order by install_dt
~~~

### 1127. User Purchase Platform
- 针对每人/每天：mobile/ desktop的总量进行统计
- 分别统计total_amount, total_user -> Union all

~~~sql
# 针对每人/每天：mobile/ desktop的总量进行统计
with temp as(
    select user_id, spend_date, 
    sum(if(platform='mobile', amount, 0)) as mobile_amount,
    sum(if(platform='desktop', amount, 0)) as desktop_amount
    from Spending
    group by user_id, spend_date
)

select spend_date, 'desktop' as platform,
sum(if(desktop_amount>0 and mobile_amount=0,desktop_amount,0)) as total_amount, # desktop only
sum(if(desktop_amount>0 and mobile_amount=0,1,0)) as total_users
from temp
group by spend_date
union all
select spend_date, 'mobile' as platform,
sum(if(desktop_amount=0 and mobile_amount>0,mobile_amount,0)) as total_amount, # mobile only
sum(if(desktop_amount=0 and mobile_amount>0,1,0)) as total_users
from temp
group by spend_date
union all
select spend_date, 'both' as platform,
sum(if(desktop_amount>0 and mobile_amount>0,mobile_amount+desktop_amount,0)) as total_amount, # both
sum(if(desktop_amount>0 and mobile_amount>0,1,0)) as total_users
from temp
group by spend_date
~~~

### 1159. Market Analysis II
- 先找到second item的品牌

~~~sql
with temp as(
    select o.seller_id, i.item_brand,
    rank() over (partition by seller_id order by order_date) as item_rank
    from Orders o join Items i
    on o.item_id = i.item_id
)

select u.user_id as seller_id,
if(u.favorite_brand = t.item_brand,'yes', 'no') as '2nd_item_fav_brand'
from Users u left join
    (
    select seller_id, item_brand  
    from temp
    where item_rank = 2
    ) t
on u.user_id = t.seller_id
~~~

### 1194. Tournament Winners
- 先找到所有人得分
- 再找每组排名第一的

~~~sql
with temp as(
    select player, sum(scores) as scores
    from
        (select first_player as player, first_score as scores
        from Matches
        union all
        select second_player as player, second_score as scores
        from Matches) c
    group by player
)

select group_id, player_id
from
(select p.group_id,p.player_id, 
rank() over(partition by p.group_id order by t.scores desc,player_id) as score_rank
from temp t right join  Players p
on t.player = p.player_id
) t
where score_rank = 1
~~~

### 1194. Tournament Winners
- 先找到所有人得分
- 再找每组排名第一的

~~~sql
with temp as(
    select player, sum(scores) as scores
    from
        (select first_player as player, first_score as scores
        from Matches
        union all
        select second_player as player, second_score as scores
        from Matches) c
    group by player
)

select group_id, player_id
from
(select p.group_id,p.player_id, 
rank() over(partition by p.group_id order by t.scores desc,player_id) as score_rank
from temp t right join  Players p
on t.player = p.player_id
) t
where score_rank = 1
~~~

### 1225. Report Contiguous Dates
- 取连续日趋：DAYOFYEAR(success_date) - row_number() over (order by success_date) as diff_dt -> group by
- 注意用DAYOFYEAR，否则月份断开

~~~sql
with temp as(
    select 'succeeded' as state, success_date as event_dt,
    DAYOFYEAR(success_date) - row_number() over (order by success_date) as diff_dt
    from succeeded
    where success_date between '2019-01-01' and '2019-12-31'
    union all
    select 'failed' as state, fail_date as event_dt,
    DAYOFYEAR(fail_date) - row_number() over (order by fail_date) as diff_dt
    from failed
    where fail_date between '2019-01-01' and '2019-12-31'
)

select state as period_state, min(event_dt) as start_date, max(event_dt) as end_date
from temp
group by state, diff_dt
order by start_date
~~~

### 1336. Number of Transactions per Visit
- 多个CTE with recursive写前面，即便不是所有CTE都是recursive

~~~sql
# 计算每人每次visit的transaction count
with recursive a as (
    select v.user_id, v.visit_date,
    if(t.transaction_date is null, 0, count(t.transaction_date)) as transactions_count
    from Visits v left join Transactions t
    on v.user_id = t.user_id
    and v.visit_date = t.transaction_date
    group by v.user_id, v.visit_date
),

# 计算相应transaction count的count
b as(
    select transactions_count, count(*) as visits_count
    from a
    group by transactions_count
),

# recursive CTE:生成0~n的连续数字
c as (
    select 0 as transactions_count
    union all
    select transactions_count + 1 from c where transactions_count < 
        (select max(transactions_count) from b)
)

select c.transactions_count, ifnull(b.visits_count, 0) as visits_count
from c left join b
on c.transactions_count =b.transactions_count
~~~

### 1369. Get the Second Most Recent Activity👀

~~~sql
with temp as
(
    select * ,
    rank() over (partition by username order by startDate desc) as activity_rank,
    count(activity) over (partition by username) as count_activity
    from UserActivity
)

select username, activity, startDate, endDate
from temp
where count_activity=1 or activity_rank = 2
~~~

### 1384. Total Sales Amount by Year

~~~sql
# 生成所有年份的start_date, end_date
WITH recursive yearsAll
AS    (SELECT (select year(min(period_start)) from Sales) AS years     -- anchor member
        ,(select concat(years, '-01-01')) AS startDate
        ,(select concat(years, '-12-31')) AS endDate
        UNION ALL
        SELECT years + 1                                                -- recursive member
        ,(select concat(years + 1, '-01-01')) AS startDate
        ,(select concat(years + 1, '-12-31')) AS endDate
        FROM   yearsAll
        WHERE  years <= (select year(max(period_end)) from Sales)        -- terminator
       )
       
SELECT s.product_id,p.product_name,cast(y.years as char) as report_year,
((case 
  when year(s.period_start) = year(s.period_end) then datediff(s.period_end,s.period_start) + 1  #用一年内找range:end-start+1
  else (case when year(s.period_start) = y.years then datediff(y.endDate,s.period_start) + 1  # start/end跨年
              when year(s.period_end)   = y.years  then datediff(s.period_end,y.startDate) + 1 
              else dayofyear(endDate) end) end) * s.average_daily_sales) as total_amount 
FROM  Sales s
inner join Product p on s.product_id = p.product_id
inner join yearsAll y on y.years between year(s.period_start) and year(s.period_end)
order by product_id,report_year
~~~

### 1412. Find the Quiet Students in All Exams
- 正序rank一遍，倒序rank一遍
- 排除掉rank=1的学生

~~~sql
# 生成所有年份的start_date, end_date
WITH recursive yearsAll
AS    (SELECT (select year(min(period_start)) from Sales) AS years     -- anchor member
        ,(select concat(years, '-01-01')) AS startDate
        ,(select concat(years, '-12-31')) AS endDate
        UNION ALL
        SELECT years + 1                                                -- recursive member
        ,(select concat(years + 1, '-01-01')) AS startDate
        ,(select concat(years + 1, '-12-31')) AS endDate
        FROM   yearsAll
        WHERE  years <= (select year(max(period_end)) from Sales)        -- terminator
       )
       
SELECT s.product_id,p.product_name,cast(y.years as char) as report_year,
((case 
  when year(s.period_start) = year(s.period_end) then datediff(s.period_end,s.period_start) + 1  #用一年内找range:end-start+1
  else (case when year(s.period_start) = y.years then datediff(y.endDate,s.period_start) + 1  # start/end跨年
              when year(s.period_end)   = y.years  then datediff(s.period_end,y.startDate) + 1 
              else dayofyear(endDate) end) end) * s.average_daily_sales) as total_amount 
FROM  Sales s
inner join Product p on s.product_id = p.product_id
inner join yearsAll y on y.years between year(s.period_start) and year(s.period_end)
order by product_id,report_year
~~~

### 1479. Sales by Day of the Week👀    
- CTE先取出每天每个类别的数量 dayname()
- 再分成多列

~~~sql
# 每天每个类别的数量
with temp as(
    select dayname(o.order_date) as day, #使用dayname取day of week
    sum(o.quantity) as quant,
    i.item_category  as category
    from Items i left join Orders o
    on i.item_id = o.item_id
    group by day,  i.item_category 
)

select 
    category,  
    sum(if(day = 'Monday', quant,0)) as Monday,
    sum(if(day = 'Tuesday', quant,0)) as Tuesday,
    sum(if(day = 'Wednesday', quant,0)) as Wednesday,
    sum(if(day = 'Thursday', quant,0)) as Thursday,
    sum(if(day = 'Friday', quant,0)) as Friday,
    sum(if(day = 'Saturday', quant,0)) as Saturday,
    sum(if(day = 'Sunday', quant,0)) as Sunday
from temp
group by category
order by category
~~~



