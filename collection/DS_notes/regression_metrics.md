---
layout: project
title: '回归问题评估指标'
date: 01 July 2020
---
## 均方差MSE
- 公式：$$\mathrm{MSE}=\frac{1}{n} \sum_{i=1}^{n}\left(\widehat{y_{i}}-y_{i}\right)^{2}$$
- 预测值和真实值之间误差的平方和的平均，越低越好
- 误差之间权重不同：误差大权重大

## 平均绝对误差 MAE
$$
\mathrm{MAE}=\frac{1}{n} \sum_{i=1}^{n}\left|y_{i}-\hat{y}_{i}\right|
$$
- 预测值和真实值之间误差的绝对值的平均， 越低越好
- 误差权重一致

## 均方根误差 RMSE
- 公式：$$R M S E=\sqrt{M S E}$$
- 削弱MSE的幅度

## R2
- 公式：$$R^{2}=1-\frac{\sum_{i=1}^{n}\left(y_{i}-\hat{y}_{i}\right)^{2}}{\sum_{i=1}^{n}\left(y_{i}-\bar{y}\right)^{2}}$$
- 得到[0,1]之间的分数，模型对方差的解释力,越接近1越好
