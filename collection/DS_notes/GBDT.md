---
layout: project
title: 'BGDT'
date: 01 July 2020

---		
## Overview
- GBDT是应用Gradient Boosting的机器学习算法
- 广义GBDT泛指所有使用gradient boosting进行优化算法
- 狭义GBDT特指使用贪心法迭代求解的算法

## 核心
- GBDT解决优化的问题的时候：在函数空间中利用梯度下降法【只用到一阶导】
- 串行算法：下一颗树的生长方式依赖于上一棵树
- 加法模型：多个树模型加权结合
- 每棵树的训练目标：拟合前T-1棵树模型的负梯度方向【梯度下降】，最小化损失函数
- 找到参数最优解：通过贪心法，迭代求局部最优解
	
## 步骤
- 初始化第一个树模型
- 迭代
  - 找前T-1棵树模型的负梯度方向【代入loss function对模型求偏导】
  - 训练第T棵树：拟合负梯度方向，最小化损失函数
  - 通过line search 找步长
  - 更新前T棵树的模型
- 输出最终模型

<br>
<img src="/assets/img/knowledge/GBDT/GBDT1.jpg" width="60%" />
<br><br>

## 优劣
### 优
  - 通过多次迭代，对改善模型的偏差和方差效果都很好，更注重偏差
  - 特征自动组合，引入非线性
	- 对数据容纳性好【High Dimensionality / Missing value/ Outlier/ Redundant variables/ Data Distribution】
### 劣
- 解释性较差
- 训练并行度低



