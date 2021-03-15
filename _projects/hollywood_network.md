---
layout: project
title: '谁是好莱坞最重要的人'
date: 12 January 2021
image:  
  path: /assets/img/projects/hollywood_netwok/hollywood_network_cover.jpg
caption: 网络分析+可视化：以结构化的思维看待好莱坞合作网络
hide_image: false
featured: true
---

## Overview

谁是好莱坞最重要的人？这个问题或许有很多种回答，也许重要的人是拍出影史最高票房的创作者，也许重要的人是多部优质作品的决策者。在这个项目中，我们试图通过IMDB数据，从合作网络的角度来回答这个问题。

人与人之间的互动构成网络。毫无疑问，电影工作者的合作就构成了一个复杂的社会网络。在这个网络中，一个主创人员可视为一个节点(node)。主创人员在同一部作品中有过合作则连成一条边(edge)。我们使用的数据来自于IMDB公开数据集。为了将研究范围加以限定，我们选取了1960年以来（即公认的当代好莱坞起始的时间），总打分数量高于均值的电影作品。这一数据集的另一好处是，事先已经对每部作品最重要的10位主创进行了排序，其中包括影片的导演，制片人，主演，编剧，原创作者，特效，作曲等关键岗位的演职人员。这就为我们定义一部影片的主创提供了依据。最终，我们基于13493部影片，和54799位主创人员构建了这一好莱坞合作网络。

那么衡量一个节点在网络中的重要性？其实，计算机的图理论在网络结构方面已有深入的探讨。这里，我们将应用四个指标，包括点度中心性(degree centrality)，特征向量中心性(eigenvector centratliy),中介中心性(betweenness centrality),和接近中心性(closeness centrality)，从多个角度来衡量一个主创人员在好莱坞合作网络中的影响力。

## 点度中心性：谁拥有最多的合作者
<iFrame seamless frameborder="0"
  src='/assets/img/projects/hollywood_netwok/degree_importance.html'  width="100%" height="800vh" scrolling="no">
</iFrame>
<br>
<br><br>
<img src="/assets/img/projects/hollywood_netwok/degreelist.jpg"/>
<br><br>

点度中心性评估的是一个节点所拥有的直接连接的数量，也就是边的数量，又称为“度”。在社会网络中，一个人的连接的数量越多，点度中心性就越高，其社会关系越多。
在好莱坞合作网络中，罗伯特·德尼罗拥有641位合作者，高居点度中心性的榜首，在很多人心中他是上世纪以来最伟大的演员。其次是杰瑞·高史密斯和尼古拉斯·凯奇，前者是美国著名的电影配乐作曲家，后者是饱受争议的高产演员。排在后面的是好莱坞的黄金男配角塞缪尔·杰克逊，和另一位著名的电影配乐者詹姆斯·牛顿·霍华德。

## 特征向量中心性：谁跟重量级人物合作
<iFrame seamless frameborder="0"
  src='/assets/img/projects/hollywood_netwok/eigencentrality_importance.html'  width="100%" height="800vh" scrolling="no">
</iFrame>
<br>
<br><br>
<img src="/assets/img/projects/hollywood_netwok/eigenlist.jpg"/>
<br><br>
特征向量中心性不仅评估直接连接的数量，还考虑相连节点的重要性。其隐含的假设就是，与你相连的人越重要，你就越重要。
在上面的网络图中，我们发现罗伯特·德尼罗不负众望地再次登顶。而后面几位的排序有了些许变化，这意味着音乐家詹姆斯·牛顿·霍华德，制片人斯科特·鲁丁，“硬汉”布鲁斯·威利斯，音乐家马克·伊夏，相比其他几位，跟更加重量级的任务合作过。

## 中介中心性：谁是连接不同合作群落的桥梁
<iFrame seamless frameborder="0"
  src='/assets/img/projects/hollywood_netwok/betweencentrality_importance.html'  width="100%" height="800vh" scrolling="no">
</iFrame>
<br>
<br><br>
<img src="/assets/img/projects/hollywood_netwok/betweennesslist.jpg"/>
<br><br>
任何两点之间都存在一条最短路径。当一个节点更多地出现其它成员的最短路径之上，那么该节点的中介中心性就越高。中介中心性的现实意义是，当一个社会网络中存在多个群落的时候，中介中心性高的点更适合充当不同群落之间沟通的桥梁。
在以上的网络图中，我们看到来自印度的作曲家拉赫曼具有最高的中介中心性，他成功地沟通了好莱坞团队和印度制作团。紫色代表的美国主创人员和蓝绿色代表的英国主创人员相对均匀嵌入在好莱坞网络中。而威廉·莎士比亚作为最成功的剧作家，因其作品数次被翻拍，成功地成为了多个群落的桥梁。值得一提的是，我们在这个网络图中我们看到了成龙和李连杰，他们成为了好莱坞沟通中国制作团队的桥梁。

## 接近中心性
<iFrame seamless frameborder="0"
  src='/assets/img/projects/hollywood_netwok/closenesscentrality_importance.html'  width="100%" height="800vh" scrolling="no">
</iFrame>
<br>
<br><br>
<img src="/assets/img/projects/hollywood_netwok/closenesslist.jpg"/>
<br><br>

接近中心性计算的一个点到其它所有点的距离之和。如果一个节点到图中其它节点的距离都很小，那么它具有很高的接近中心性。在一个复杂的社会网络中，接近中心性高的人物扮演的是“社会活动家”的角色。
在好莱坞合作网络这么一个相对复杂的网络中，并没有出现在接近中心性上绝对重要的点。所有主创人员的数值都在一个相对小的区域内非常接近。我们在此呈现的仅仅是在接近中心性上相对较高的节点。对此结果我们的猜测是，好莱坞的真实环境中，重要的“社会活动家”往往出现在幕后，而非台前主创人员名单上的人物。他们有可能是电影公司的决策者，或是将剧组班底攒在一起的幕后关键人物，而这一信息是IMDB数据所难以涵盖的。

