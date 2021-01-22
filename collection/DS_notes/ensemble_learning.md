---
layout: project
title: 'Ensemble Learning集成学习'
date: 01 July 2020

---

## Overview
- 集成学习：将多个学习器，按照某种策略结合在一起，使其泛化能力要优于其中任何一个学习器

## 基本结构
<br>
<img src="/assets/img/knowledge/Ensemble/ensemble1.jpg" width="40%" />
<br><br>
		
## 学习器
- 根据基学习器不同分类
  - 同质集成：个体学习器属于同一算法
  - 异质集成：属于不同算法的学习器
- 学习器选择的核心：“好而不同”， trade-off  between accuracy and diversity
  - 基学习器之间的多样性是影响集成学习泛化能力的重要因素
  - 准确度较高，差异度也较高，可以较好地提升集成能力

## 结合策略
- 平均法：简单平均，加权平均【个体学习器差异较大时使用】
- 投票法：绝对投票，相对投票，加权投票
  - 投票法可根据类别【hard voting】或概率【soft voting】进行
  - 但异质集成必须基于类别投票
- Stacking学习法：建立一个线性模型学习多个学习器到True Label之间的关系

## 主流集成及升级方案
- Bagging -> Random forest
- Boosting -> GBDT -> XGBoost

## Bagging vs. Boosting
- Bagging
  - 核心是建立差异化的模型
  - 并行工作方式，学习器之间没有先后顺序可以同时进行
  - 改善过拟合，改善模型方差
- Boosting
  - 核心是Learn from your mistake.
  - 串行工作方式，学习器之间存在依赖关系，下一个学习器在前一个学习器基础上进行优化
  - 对控制偏差和方差都有非常好的效果，更加注重改善偏差
