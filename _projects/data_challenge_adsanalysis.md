---
layout: project
title: '如何评估在线广告？'
date: 24 January 2021
image:  
  path: /assets/img/projects/DataScience/ads_analysis_cover.jpg
caption: Data Challenge：广告分析
hide_image: false
featured: false
---

## 在线广告的几个重要数据
- 曝光量
- 点击量
- 点击触达率Click-through-rate:点击量/曝光量
- 转化率Converstion Rate：广告转化的数量/广告曝光数量
- 单次点击成本
- 广告利润：广告转化带来的收益-广告成本

## 关键指标及其侧重
- 点击触达率CTR
  - 用户增长方向，目标是将用户导入网站
  - 优：适合衡量用户需求，方便验证
  - 劣：不考虑用户导入网站之后的行为，不考虑成本，钓鱼广告会使此指标虚高
- 转化率 CR
  - 用户增长方向 + 产品方向，目标是将用户转化为客户
  - 优：考虑用户进入网站之后的行为
  - 劣: 不考虑成本，不区分需求问题和供给问题，无法衡量多次访问之后才做购买的情况
- 广告利润
  - 产品/商业方向
  - 优：跟公司的最高目标相关
  - 劣：难以界定短期收益（更应考虑长期的User Lifetime Value),不考虑前几个漏斗环节的表现

## 选取评估指标
- 考虑综合指标，此项目选取的指标是点击触达率 + 广告利润
- 在保证广告利润在一定分界点之上，选择CTR最高的5个广告类别

## 预测广告曝光量/转化量
- 使用fbprophet package进行时序性预测
- 结合长期pattern和短期pattern预测未来某个时间段的表现

## 对趋势性数据聚类
- 建立线性回归模型
- 查看系数和p-value,以判断趋势是显著上升、显著下降还是持平。

## 完整项目
