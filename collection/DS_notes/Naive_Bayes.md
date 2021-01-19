---
layout: project
title: '朴素贝叶斯'
date: 01 July 2020

---
## 贝叶斯公式
- 条件B发生下事件A的条件概率：
$$\mathbf{p}(\mathbf{A} \mid \mathbf{B})=\frac{P(A B)}{P(B)}$$
- 已知p(A|B), 求p(B|A) 
$$P(B \mid A)=\frac{P(A \mid B) P(B)}{P(A)}$$
- 贝叶斯最大的用途是打通了条件概率之间的通路，p(A|B)<=>p(B|A) 

## 朴素贝叶斯
<br>
<img src="/assets/img/knowledge/Naive_Bayes/Bayes1.jpg" width="70%" />
<br><br>
- 朴素贝叶斯 = 贝叶斯定理 + 条件独立假设 + 平滑（拉普拉斯平滑）
- 假设1：条件
- 朴素贝叶斯 = 贝叶斯定理 + 条件独立假设 + 平滑（拉普拉斯平滑）独立
- 朴素贝叶斯 = 贝叶斯定理 + 条件独立假设 + 平滑（拉普拉斯平滑）

## 三种SVM形式
- 硬间隔支持向量机Hard Margin：不允许出现任何点出现在间隔内，应对线性可分问题
- 软间隔支持向量机 Soft Margin：允许出现分类错误的点或点可以进入margin，应对近似线性可分问题
- 非线性支持向量机 Kernel-based：使用核函数和软间隔最大化，解决非线性问题

## 几个核心概念
- 超平面：在n维空间中总会有一个n-1空间将点分开 e.g. 在一维空间中是一个点，二维空间中是一条线，高维空间中是一个超平面
- 最优分离超平面 maximum margin classifier: 最大程度地将不同组地点分开，尽可能远离所有类别的点【margin最大】，即我们要找的决策面【超平面】
- 支持向量：两组数据中与超平面最近的点
- 间隔margin：支持向量与超平面之间的距离
- 学习目标：最优分离超平面要求远离所有点，即最大化margin
- 决策边界只跟支持向量有关系，跟其它点没有关系
- SVM 通过间隔最大化可以将优化问题转换成一个凸优化问题，这时解是唯一的。

## 假设函数
$$
\begin{aligned}
\hat{y}=\operatorname{sign}\left(w^{T} x+b\right) \\
\text { 其中 } \operatorname{sign}(x)=\left\{\begin{array}{ll}
-1 & x<0 \\
1 & x \geq 0
\end{array}\right.
\end{aligned}
$$
<br>
<img src="/assets/img/knowledge/SVM/SVM1.jpg" width="50%" />
<br><br>

## 损失函数		
- Hinge Loss(合页形): $$J(z)=\max (0,1-z)$$	
<br>
<img src="/assets/img/knowledge/SVM/SVM2.jpg" width="50%" />
<br><br>


