---
layout: project
title: '你的AB Test真实合理吗?'
date: 14 January 2021
image:  
  path: /assets/img/projects/DataScience/ab_test_cover.jpg
caption: Data Science Challenge 2
hide_image: false
featured: false
---

## AB Test的基本逻辑
1. 两个组别：控制组，实验组
2. 两个假设：零假设（没有明显变化），备择假设
3. t-test，计算统计量
4. 计算p-value, 做出推断

## 判断AB test合理与否的几个关键
1. 足够的数据
2. 控制组和实验组规模相当
3. 实验进行足够的时长，以抓住一段周期（一周）的规律，最少一周，两周为宜
4. 用可视化的方式检验控制组/测试组的变化趋势，查看是否有猛烈变化
5. 控制组和实验组中的用户构成一致【重中之重】：例如，在控制组中有10%英国用户，在实验组中也应该有大致相当的比例

## 检验控制组/实验组中用户构成的方法
- 普通方法:针对不同分类画图比较
- 高级方法:建立树模型预测用户所属组别，查看tree plot。如果存在特征能将两组用户明显地区分开来，则说明该类别的分布出现了问题。


<script src="https://gist.github.com/chuanluchen/d97c7df35678ed9d7b8cfd305aba02ee.js"></script>
