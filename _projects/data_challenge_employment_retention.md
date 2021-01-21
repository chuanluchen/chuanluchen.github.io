---
layout: project
title: '你会因何而辞职？'
date: 14 January 2021
image:  
  path: /assets/img/projects/DataScience/employement_retention_cover.jpg
caption: Data Challenge：机器学习模型挖掘员工流失的动因
hide_image: false
featured: false
---

## 如何用机器学习的方式挖掘某个事件的主要动因
1. 将感兴趣的事件定义为label作为target
2. 收集数据，通常包括用户属性和行为属性
3. 建立分类模型进行预测，树模型为宜
4. 重在模型解释
  - Feature Importance查看重要特征
  - Tree Plot查看重要特征的分界点及Segmentation

## 本项目中员工流失模型得出的结论
- 工资是预测员工流失的最重要的原因，员工工资在[62500,224500]范围内有更高的概率离职（美国加州IT企业标准）。低收入的员工和高收入的员工反而不那么容易离职，可能是因为高工资的员工对现状相对满意，而低收入的员工或许在就业市场上没有太多竞争力。
- 大部分的员工离职发生在就职第一/第二周年。
- 当前数据集中的特征有限，因而得到工资是极为重要的特征。在一个机器学习模型中，如果一个特征占据了绝对优势通常暗示着什么问题。但在当前问题中，倒是可以理解的。工资是一个具有很高概括力的特征，它往往跟其它很多特征相关，例如某人的工作资历，市场竞争力，是否在该公司受到赏识等等。如果能补充这些底层信息加入模型，则能提升模型的解释力。
- 另外，也可考虑加入其它特征进一步挖掘员工流失的原因，例如员工在职期间的升职加薪情况，以及离职人员下一份工作的工资。

## 完整项目
<script src="https://gist.github.com/chuanluchen/95b84afe256d43bed7da327aa2d260b2.js"></script>
