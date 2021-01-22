---
layout: project
title: 'Boosting'
date: 01 July 2020

---		
## Overview
- Boosting是一种集成学习方法

## 核心
- 串行工作:个体学习器的训练存在依赖关系，下一个学习器在前一个学习器的基础上继续优化 -> 训练新的学习器
- 加法模型：最终函数等于每次迭代的增量的累加和-> 最终结果时T个学习器的结果进行加权结合

## 步骤
  - 弱学习器：先在原数据集上训练出来一个学习器，样本使用一致的权重
  - 样本权重：在训练下一个学习器之前，增加前一个基学习器预测错误样本的权重
  - 强化学习器：用re-weighted sample训练新的学习器,使得后续基学习器更加关注标记错误的训练样本，尽可能纠正这些错误
  - 学习器权重：一直向下串行直至产生需要的T个基学习器，对所有学习器的赋予权重
  - 加权结合得到最终结果

## Boosting的两种优化算法
### Gradient Boosting 梯度下降【对应GBDT】
- 在函数空间中利用梯度下降进行优化，只用到一阶导数
- 沿着损失函数负梯度的方向更新函数
- 最终的函数是n次迭代函数增量的累加
<br>
<img src="/assets/img/knowledge/Boosting/boosting1.jpg" width="50%" />
<br><br>

### Newton Boosting 牛顿法【对应XGBoost】
- 在函数空间中利用牛顿法进行优化，同时用到一阶导数和二阶导数
- 沿着损失函数gradient/ hessian matrix的负方式更新函数
- 最终的函数是n次迭代函数增量的累加
<br>
<img src="/assets/img/knowledge/Boosting/boosting2.jpg" width="50%" />
<br><br>

## 优劣
- 优：对同时控制偏差bias和方差variance都有非常好的效果，更加注重偏差
- 劣：训练耗时
