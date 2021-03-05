---
layout: project
title: '如何识别电商欺诈？'
date: 14 January 2021
image:  
  path: /assets/img/projects/DataScience/fraud_cover.jpg
caption: Data Challenge：机器学习预测欺诈行为
hide_image: false
featured: false
---
## 问题
- 如何通过用户在电商上的第一次购买行为，判断是否存在欺诈行为，例如信用卡盗刷、洗钱等。

## 识别欺诈行为的基本逻辑
- 建立机器学习分类模型预测欺诈行为的概率
- 重点特征工程
  - ip地址对应的国家
  - 购买行为与账户注册的时间间隔
  - 重复IP地址
  - 重复设备

## 选择合适的threshold
- 要预先考虑false positive与false negative的代价
  - 在电商案例中，较高false positive意味着将更多无辜的人判断为了欺诈，进而提高了验证门槛，有可能导致用户流失。
  - 而较高的false negative意味着无法预先识别欺诈行为，可能直接导致金钱损失。
- 为了同时最大化sensitivy和specifity, 在这个案例中选择最大化 tpr - fpr,由此可以计算得出优化的threshold。


## 如何将机器学习模型应用于产品
- 此类模型的常用用途是辅助进行风险管理
- 根据对每个用户的欺诈行为预测概率，我们可以把风险分为多个层次，从而采取不同的措施
  - 高风险：冻结操作，人工审核，进而阻止该用户的进入
  - 中风险：需要额外验证（电话号码验证，其它账户验证）
  - 低风险：畅通无阻
- 选取风险阈值的方法
  - 可通过预测概率均值来创造二分层次
  - 均值 +/-标准差来生成三分层次
  - 利用quantile生成多个层次


## 完整项目
<script src="https://gist.github.com/chuanluchen/b6d3599e11ee960b68d5526ba7d8a534.js"></script>
