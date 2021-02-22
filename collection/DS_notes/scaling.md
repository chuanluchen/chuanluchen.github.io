---
layout: project
title: '特征缩放'
date: 01 July 2020

---

## 特征缩放
- 对计算型模型尤其重要：使不同特征具有可比性，在机器学习中能以同等速度收敛【否则，数值大的特征主导着模型】
- 树模型不需要缩放

## 四种特征缩放方法
### z-score normalization/standardization
- 公式：$$x^{\prime}=\frac{x_{i}-\bar{x}}{\sigma}$$
- 将原数据映射到均值为0，标准差为1的分布上->原始数据距离均值有多少个标准差

### mean normalization
- 公式：$$x^{\prime}=\frac{x-\operatorname{mean}(x)}{\max (x)-\min (x)}$$
- 对原始数据进行线性变换，使结果映射到[0,1]区间内
 
### min-max normalization/ Rescaling
- 公式：$$x^{\prime}=\frac{x_{i}-\min (x)}{\max (x)-\min (x)}$$
- 对原始数据进行线性变换，使结果映射到[0,1]区间内,实现对原始数据的等比缩放

### 百分位缩放
- Robust scaler / quantile transformer
- 根据百分位信息对数据进行缩放，保留数据排序信息，不受极值影响

## 标准化与归一化：常被误用
- 标准化 Standardization
 -【通常指z-score normalization】：将原数据映射到均值为0，标准差为1的分布上
- 归一化 Normalization
 -【通常指min-max normalization】：将变量转换到一定范围[0,1] or [-1,1]

