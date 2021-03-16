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
  src='/assets/img/projects/hollywood_netwok/degree_importance.html'  width="120%" height="800vh" scrolling="yes">
</iFrame>
<img src="/assets/img/projects/hollywood_netwok/degreelist.jpg" width='50%'/>
<br><br>

点度中心性评估的是一个节点所拥有的直接连接的数量，也就是边的数量，又称为“度”。在社会网络中，一个人的连接的数量越多，点度中心性就越高，其社会关系越多。

发现：
- 在好莱坞合作网络中，罗伯特·德尼罗拥有641位合作者，高居点度中心性的榜首。这说明德尼罗不仅影坛常青，更是高产，而且并不局限于特定的制作团队。
- 令人意外的是，几位电影配乐作曲家，排名非常靠前，例如杰瑞·高史密斯与詹姆斯·牛顿·霍华德。
- 尼古拉斯·凯奇虽在影片质量上饱受争议，但不得不佩服其高产。
- 同样排名比较靠前的是几位特色鲜明的黄金配角，例如塞缪尔·杰克逊，“硬汉”布鲁斯·威利斯等。
- 妮可·基德曼是头20名中唯一的女性，这也侧面反映了好莱坞创作群落中男性主导的倾向。

## 特征向量中心性：谁跟重量级人物合作
<iFrame seamless frameborder="0"
  src='/assets/img/projects/hollywood_netwok/eigencentrality_importance.html'  width="120%" height="800vh" scrolling="yes">
</iFrame>
<img src="/assets/img/projects/hollywood_netwok/eigenlist.jpg" width='50%'/>
<br><br>
特征向量中心性不仅评估直接连接的数量，还考虑相连节点的重要性。其隐含的假设就是，与你相连的人越重要，你就越重要。

发现：
- 罗伯特·德尼罗不负众望地再次登顶，而后面几位的排序有了些许变化。
- 尼古拉斯·凯奇因其创作团队质量的问题，跌出了头3名。
- 头20名的榜单中新增了一些我们熟悉的名字，例如朱丽安·摩尔，安东尼·霍普金斯，汤姆·汉克斯，茱莉亚·罗伯茨等。这意味着他们的合作者虽然没有特别多，但合作的的更多是网络中的重要人物。


## 中介中心性：谁是连接不同合作群落的桥梁
<iFrame seamless frameborder="0"
  src='/assets/img/projects/hollywood_netwok/betweennesscentrality_importance.html'  width="120%" height="800vh" scrolling="yes">
</iFrame>
<img src="/assets/img/projects/hollywood_netwok/betweennesslist.jpg" width='50%'/>
<br><br>
任何两点之间都存在一条最短路径。当一个节点更多地出现其它成员的最短路径之上，那么该节点的中介中心性就越高。中介中心性的现实意义是，当一个社会网络中存在多个群落的时候，中介中心性高的点更适合充当不同群落之间沟通的桥梁。

发现：
- 网络图中尺寸较大的点连接着不同的创作群落，尤其是地域上不同的创作群落
- 来自印度的国宝级作曲家拉赫曼具有最高的中介中心性，他成功地沟通了好莱坞团队和印度制作团。
- 紫色代表的美国主创人员和蓝绿色代表的英国主创人员相对均匀嵌入在好莱坞网络中。而威廉·莎士比亚作为最成功的剧作家，因其作品数次被翻拍，成功地成为了多个群落的桥梁。
- 值得一提的是，我们在这个网络图中我们看到了成龙和李连杰，他们成为了好莱坞沟通中国制作团队的桥梁。
- 总体来说，非英语系国家的创作群落离好莱坞距离比较远。

## 接近中心性: 谁是“社会活动家”
<iFrame seamless frameborder="0"
  src='/assets/img/projects/hollywood_netwok/closenesscentrality_importance.html'  width="120%" height="800vh" scrolling="yes">
</iFrame>
<img src="/assets/img/projects/hollywood_netwok/closenesslist.jpg" width='50%'/>
<br><br>

接近中心性计算的一个点到其它所有点的距离之和。如果一个节点到图中其它节点的距离都很小，那么它具有很高的接近中心性。在一个复杂的社会网络中，接近中心性高的人物扮演的是“社会活动家”的角色。

发现：
- 在当前的好莱坞合作网络中，并没有出现在接近中心性上绝对重要的点。所有主创人员的数值都在一个相对小的区域内非常接近。
- 我们在此呈现的仅仅是在接近中心性上相对较高的节点。
- 对此结果我们的猜测是：一，在如此复杂的网络中，并没有什么人物有能力连接到足够数量的节点。二，在好莱坞的真实环境中，重要的“社会活动家”往往出现在幕后，而非台前主创人员名单上的人物。他们有可能是电影公司的决策者，或是将剧组班底攒在一起的幕后关键人物，例如韦恩斯坦兄弟这样的人物，而这一信息是IMDB台前主创名单中所未能涵盖的。

