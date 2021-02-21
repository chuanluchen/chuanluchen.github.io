---
layout: project
title: '特征工程'
date: 01 July 2020

---
## 特征工程目标
- 去除原始数据中的杂质和冗余，进而提炼对预测有帮助的特征
- 什么是好的特征：对标签取值有强区分性
- 对于一个机器学习问题，数据和特征往往决定了结果的上限，而模型的选择及优化则是在逐步逼近这个上限

## 数据清洗 & EDA的基本操作
- 无关特征
- 缺失值
- 数据类型是否匹配- 优化
- 数据分布（boxplot，quantile）- 发现outlier
- 时间序列：趋势分析
- 单维度看分布：连续值distplot，类别型countplot/value_counts
- 多个维度看关联关系：corr, heatmap
- 留意有用的统计聚合特征

## 特征工程
- 数值型
  - 幅度缩放：最大最小值缩放、归一化
  - 离散化/分箱分桶(二值化、等距pd.cut、等频pd.qcut) -> 作用：非线性/加速/特征交叉/健壮性
  - 统计聚合特征：max min quantile
  - 四则运算：加减乘除
  - 幅度变化：取log/ square/ square root
  - 组合特征：引入大量非线性表达
  - 先学习再分箱：用树建模，把树的划分方式作为组合特征 
- 类别型
  - OneHot-encoding
  - label-encoding
  - binary-encoding
  - category-encoding
- 时间型
  - 时间点/时间段：星期几、几点钟
  - 时间分组/分段：工作日、周末、法定节假日...
  - 时间间隔：距离当前为止...
  - 不同的时间窗：过去一周内，过去一年内...
- 文本型
  - 词袋模型
  - TF-IDF
  - LDA
  - Word2vec/Word Embedding
