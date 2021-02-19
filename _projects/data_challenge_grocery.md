---
layout: project
title: '分析你的菜篮子'
date: 20 Feburary 2021
image:  
  path: /assets/img/projects/DataScience/basket_cover.jpg
caption: Data Challenge：超市商品聚类分析
hide_image: false
featured: false
---
## 问题
“啤酒与尿布”的故事是数据挖掘领域的一个传说。“啤酒”和“尿布”两个看上去没有关系的商品摆放在一起进行销售，居然获得了很好的销售收益。
这一现象的发现得益于沃尔玛的数据挖掘。这种针对超市门店关联商品的分析叫做购物篮分析。

今天这一Data Challenge的任务有着类似的设定：
- 研究消费者购买历史记录
- 将最有可能共同购买的物品聚类在一起，以替代目前的人工分类
- 每个商品只能属于一类

## 商品聚类分析的基本逻辑
- 这一项目明确要求每个商品只能属于一类，因此这是一个聚类问题
- 如果一个商品可以属于多个类别，这将变成一个关联规则分析 Association Rule
- 重点步骤
  - 将数据变换为N*M矩阵：N行交易，M行商品
  - 使用0/1标记商品是否被购买
  - 创造M*M相似性矩阵（基于correlation或者cosine similarity）
  - 对相似性矩阵进行聚类分析，先考虑k-means clustering,如果表现不好再尝试hierarchical clustering
  - 进行k-means clustering时，使用elbow方法寻找合适的k值
  - 要注意分类数目不能太多或太少，否则聚类将失去价值


## 完整项目
<script src="https://gist.github.com/chuanluchen/757cc0fda439229699c0a0d0211587ee.js"></script>
