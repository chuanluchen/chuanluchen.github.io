---
layout: project
title: '优化问题和基于梯度的方法'
date: 01 July 2020

---
## 优化问题
- 优化问题，从数学上来讲是最小化的问题，找局部极小值的问题
- 两种基本优化方法
  - 无约束最小化问题
    1. 解析解方法：令导数等于0，求参数
      - 令导数/梯度等于0，可以找到函数的‘临界点’，在这个点处函数为极大值/极小值
      - 当目标函数是多元函数时，让目标函数的每一个偏导数为0，求参数
      - 劣：计算量大 / 有时不存在解析解
    2. 基于梯度的方法：常用
      - 梯度下降法/ 牛顿法：区别在于优化时使用了一阶/二阶泰勒展开
   - 有约束条件的最小化问题： 拉格朗日乘子法

## 泰勒展开
- 泰勒展开：用函数在某点上的取值来逼近附近取值，展开越多越接近
  $$f(x)=\sum_{n=0}^{\infty} \frac{f^{(n)}\left(x_{0}\right)}{n !}\left(x-x_{0}\right)^{n}$$
  - 一阶泰勒展开： $$f(x) \approx f\left(x_{0}\right)+f^{\prime}\left(x_{0}\right)\left(x-x_{0}\right)$$ 
  - 二阶泰勒展开： $$f(x) \approx f\left(x_{0}\right)+f^{\prime}\left(x_{0}\right)\left(x-x_{0}\right)+f^{\prime \prime}\left(x_{0}\right) \frac{\left(x-x_{0}\right)^{2}}{2}$$
  - n阶泰勒展开： $$f(x)=f\left(x_{0}\right)+f^{\prime}\left(x_{0}\right)\left(x-x_{0}\right)+\frac{f^{\prime \prime}\left(x_{0}\right)}{2 !}\left(x-x_{0}\right)^{2}+\cdots+\frac{f^{(n)}\left(x_{0}\right)}{n !}\left(x-x_{0}\right)^{n}+R_{n}(x)$$
- 泰勒展开在GBDT上的应用：参数迭代或模型迭代,用前一个参数值来推测下一个参数值的结果
$$
\begin{aligned}
&x^{t}=x^{t-1}+\Delta t \rightarrow f\left(x^{t}\right) \text { 在t-1出做泰勒展开 }\\
&\mathrm{f}\left(x^{t}\right) \approx \mathrm{f}\left(x^{t-1}\right)+\mathrm{f}^{\prime}\left(x^{t-1}\right) \Delta x\\
&f\left(x^{t}\right) \approx f\left(x^{t-1}\right)+f^{\prime}\left(x^{t-1}\right) \Delta x+f^{\prime \prime}\left(x^{t-1}\right) \frac{\Delta x^{2}}{2}
\end{aligned}
$$



<br>
<img src="/assets/img/knowledge/overview/bias_variance.jpg"  width='40%'/>
<br><br>

