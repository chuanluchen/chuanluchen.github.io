---
layout: project
title: '聚类算法'
date: 01 July 2020

---
## 聚类算法Overview
- 无监督学习
- 按照相似性/结构性组织数据
- 好的聚类算法：类内距离很小，类与类之间距离很远

## K均值聚类
- 基于相似性把数据分为指定数量的集群
- 必须事先确定类数K -> 事后进行对比与选择 
- 基于距离计算相似性【L1/L2距离函数-> 曼哈顿/欧式距离】
- 核心：通过迭代的方法，不断地寻找k个聚类中心 不断地把数据分配给新的聚类中心，目标使得数据到聚类中心的距离最小
- 预先假设: 每个集群中数据近似高斯分布，最好分布形状近似圆形
- 劣: 对于集群有大有小的数据，处理不良

### K-means algorithm【聚类中心不一定在数据集中】
- 初始化：划分K个集群，任意选取K个质心
- 迭代直至收敛
  - 重分配【把点分配给中心点】：将每一个数据点分配到距离（L2距离函数）最近的中心，即生成K个新集群
	- 重拟合【寻找新的中心点】：根据新的集群分配，重新计算cluster中心（质心：cluster内数据的算数平均值）
	- 重复迭代，直到结果收敛：不再出现新的质心

### K-medoids algorithm 【聚类中心必须在数据集中】
- 使用L1距离函数
- 选择离中心最近的样本点作为聚类中心

### 选取K值
-  Elbow方法
  - 最小化损失函数：Total within sum-of-squares 每个集群中点到质心的距离平方和
	- 选取不同的K值，并将不同K值所对应的损失函数画成折线
	- 找knee bend: 某个K值之前总平方和急速减少，但在这个K值之后减少的幅度大大降低 -> 该K值为最大集群数
- Silhouette Coefficient轮廓系数
  - 同时考虑within-cluster variation【Cohesion/内部距离越小越好】 & between-cluster variation【Separation/外部距离越大越好】
		<br>
  <img src="/assets/img/knowledge/clustering/clustering1.jpg"  width='50%'/>
  <br><br>
	- ai: 平均类内距离  bi:平均类间距离
  - 得到[-1,1]之间的值，越大表示聚类效果越好

## Hierarchical  Clustering层次聚类
- 层次聚类不需要预先指定聚类数量
- 层次聚类可以嵌套

### Agglomerative凝聚【常用】
- 初始化每个数据点当作一个集群
- 自下而上将相似集群聚合在一起
- 直到所有数据属于统一集群

### Divisive分裂
- 初始化所有数据点属于一个集群
- 自上而下分裂
- 直到所有数据都属于各自的集群

### 用距离定义相似性
- 两个点之间的距离：常用欧式距离
- 两个集群之间的距离
  - Complete linkage: maximum 
	- Single linkage: minimum
	- Average linkage: mean
	- Ward: Minimize within cluster variance将两个cluster融合成一个的距离差平方和【准确率最高】

### 从层次聚类中获得扁平聚类:Dendrogram切割
- 查看单个cluster: 获得树状结构图之后，在指定高度或指定集群数做切割
