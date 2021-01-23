---
layout: project
title: 'LightGBM'
date: 01 July 2020

---		
## Overview
- lightGBM是对XGBoost的改进: 速度更快，内存占用更低

## 对XGBoost的改进
- 直方图算法：对连续特征离散化，构造一个直方图，寻找最优分割点
  - 用离散后的bin，替代连续值，减少空间使用量
  - 离散化后的bin积累统计量，根据bin寻找最优分割点
  - 直方图做差：一个叶子的直方图可以由它的父亲节点的直方图与它兄弟节点的直方图做差得到，进一步提高效率
- Leaf-wise split: 深度优先，只选取具有最大增益的节点进行分裂，不需要对每一层所有节点进行分裂【XGBoost】 -> 收敛速度容易过拟合，需要用Max_depth限制
- Gradient-based One Side Sampling (GOSS)：利用了GBDT中的样本梯度和误差的关系，对训练样本进行采样。每次迭代保留误差大【梯度高】的样本，只保留部分误差小【梯度低】的样本子集 -> 不损失精度的前提下，提升训练速度

## LightGBM faster than XGBoost
- 特征并行，数据并行，投票并行
- 速度更快，内存占用更低
  - 直方图算法
  - Goss
  - leaf-wise split 但要注意过拟合问题

## 重要参数
- Objective
  - Regression
  - Binary: binary classification
  - Multiclass: multinomial classification
- Evaluation metric
  - 回归： rmse/mae
  - 分类：logloss/error/merror/mlogloss/auc
- Boosting参数
  - Boosting: gbdt/rf/dart/goss
  - num_iterations：迭代的次数，构建树的数目
  - Early stopping round：多少轮迭代后没有改进就停止训练，一般num_iterations的10%
  - Is_unbalace: True时，算法将尝试自动平衡占主导地位的标签的权重(使用列集中的pos/neg分数)
  - Scaleposweight：改变正负样本比例，负样本/正样本的比例
  - Learning rate
- Tree参数
  - Max depth：树的最大深度 5~35
  - Num leaves: 一个树的叶子数 35~65
  - Min data in leaf：叶子节点上的最小样本数
  - Bagging fraction：样本采样 0.6~1
  - Bagging frequency：bagging频率，每K轮迭代进行一次bagging 2~8
  - Feature fraction：特征采样  0.6~1
  - Max bin:直方图bin的数量
  - L1 regularization  0~0.6
  - L2 regularization 0~40

