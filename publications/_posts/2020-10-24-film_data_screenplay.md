---
layout: post
title: Film Data Science：项目开发与剧本分析
description: >
  数据科学在电影行业有哪些新鲜玩法：之一
image:  
  path: /assets/img/blog/screenplay.jpg
canonical_url: <!--http://bit.ly/hackster-urukey-->
hide_image: false
---

> “With all of its experience, with all the creative instincts of the wisest people in our business, no one, absolutely no one, can tell you what a movie is going to do in the marketplace…Not until the film opens in a darkened theatre and sparks fly up between the screen and the audience can you say this film is right...”<sup id="a1">[1](#f1)</sup>

Jack Valenti，MPAA的前任主席， 曾以这样的口吻强调电影项目在其早期充满了不确定性和不可预测性。

那数据科学在这个过程有什么意义呢？我的个人理解，不必把数据科学神化，它并没有什么的神奇的魔力来预言或保障电影项目的成功。但它的存在有价值。它的价值就在于：第一，当决策者在整个项目过程中遭遇一个又一个岔路口的时候，数据科学以更大的概率保护决策者不会误入歧途。第二，对于很多看不见摸不着人力无法估量的因素，数据科学提供一个相对客观相对精准的中间结果，供决策者参考。 第三，数据科学依然是一种包含不确定性的科学，但它可以告诉你这种不确定性的边界在哪里，并且尽可能地缩小这种不确定性。

在电影制作的前期，数据科学第一时间介入项目开发与剧本分析已经是屡见不鲜的案例。让我们来看看，在学术界和工业界，数据科学在电影领域有哪些新鲜的尝试？


### StoryFit：推荐系统辅助Comps策略

StoryFit<sup id="a2">[2](#f2)</sup>是美国一家小有名气的数据公司，为娱乐行业和出版行业提供数据科学支持。这个公司为电影项目主要提供三个方向的服务。首先是竞品挖掘（StoryFit Comps），根据预算，类型，选角，主题，故事走向，情感分析等维度，在数据库中找到与当前电影项目相似度最高的已有电影项目。其次是电影元数据挖掘（StoryFit MetaData），为客户已有的电影项目提取关键词，使得过去的电影项目在特定的主题、场景、时间点下能发挥长尾价值。此外，该公司提供剧本分析的服务，将剧本置于评分预测，类型预测，情感分析，关键词聚合等多个维度上进行评估。

在这里， 值得特别一提是StoryFit Comps。在影片立项的立项前期阶段，制片厂需要从成千上万的剧本中挑选出最适合拍摄的那一个，好莱坞把这一过程叫做Green-lighting。如何对一个剧本是否值得投资做出决策呢？制片厂常规的做法是“comps-based”策略，就是从过去已有的电影项目中寻找最接近当前剧本的5到10个电影项目，用他们的票房表现作为当前剧本商业潜力的参考。 这项工作的一大挑战是如何找到最接近剧本？如何衡量剧本之间的相似性？对于传统的剧本开发专家来说，这一选择很大程度上依赖于经验和直觉。但这恰恰是数据科学可以大展身手的一个极佳切入点。数据科学将一切特征理解为多维空间中的一个个向量。通过特性向量距离的计算即可衡量样本之间的相似性。这正是基于内容的推荐系统算法所做的事情。数据科学为“comps”精准筛选项目清单，这已是好莱坞制片厂甚至众多独立电影项目秘而不宣的工作方式。


### 基于剧本的机器学习模型预测票房

利用机器学习算法建立电影票房预测模型， 这在数据科学界已是老调常谈。数据科学家几乎人人都玩过电影数据集，人人都训练过票房预测模型。但立足于Green-lighting阶段，在各种可测量的特征非常有限的情况下，主要依赖剧本建立模型并不是一件容易的事。一项来自沃顿商学院的研究(Eliashberg et al., 2018)提供了一些新方向。研究者结合电影专业知识和NLP技术， 从300个电影拍摄脚本中提取三个层次的文本特征：一是电影类型和故事线走向（例如，动作片，有反转结尾），二是剧本的语义分析（例如，场景数量，内景比例，对话数量，对话长度，对话集中度），三是词汇层次（bag of words 词袋模型， TF-IDF权重矩阵，流行语/俗语频率）。高层特征由具备电影研究专业素养的专家问卷作答，底层特征由机器提取。基于提取的剧本特征，研究者训练了多个机器学习模型，用于预测电影票房。验证结果显示，基于RBF核的SVM模型的表现优于回归模型和树模型。目前的NLP技术对于文本的抽象理解能力还比较有限，这项研究中将电影研究专家对于剧本的理解纳入到机器学习模型，是一个有意思的尝试。而在文本特征提取方面，除了这项研究中提及的部分，日新月异的NLP技术其实还有很多应用的可能性。


### 剧本情感曲线驱动影片成功

Kurt Vonnegut在上世纪80年代创造了“情感曲线”(emotional arc）这个概念。并且，他首次提出了将故事的情感轨迹在二维平面上可视化的思路(Vonnegut, 1981)。数年之后，来自Vermont大学的研究团队使用NLP技术提取了1327部小说的情感轨迹，发现可以用6类情感曲线归纳所有的故事(Reagan et al., 2016)。这六类情感曲线包括：Rags to Riches（上扬型），Riches to Rags（下抑型），Man in a Hole（先抑后扬），Icarus（先扬后抑），Cinderella（扬-抑-扬），以及Oedipus（抑-扬-抑）。2020年，一个英国的研究团队将这种研究方法迁移到电影剧本上(Del Vecchio et al., 2020)。他使用NLP技术和NRC EMOTION LEXICON词表，对6174部电影剧本进行分析。研究证实，电影剧本的情感曲线也同样适用于这六个类别的划分。此外，他们还发现归属于Man in a Hole（先抑后扬）这类情感曲线的剧本有更高的概率获得好的票房收益。并且，这个研究发现已经预先排除了影片预算和类型的干扰。至于Man in a Hole这类剧情为什么更容易获得商业成功，研究者认为这种现象并不是因为这类电影更受观众青睐（以IMDB评分为指标），而是因为这类电影受到观众更多的关注，更容易被广泛讨论。当然，千万不能把这一研究结果简单化地理解为只要选择Man in a Hole的故事就能保证电影的成功。研究者强调，对于任何一类故事，恰当的剧本-预算-类型配置都有可能取得商业成功。在这项研究中，使用什么样的词表很大程度上决定了文本特征的质量。词表是否有扩展到其它语言的能力，也是值得思考的问题。


### StoryFit：角色互动网络

在这里，我们要再次提及StoryFit。在2020年6月发布的研究报告中（StoryFit, 2020），StoryFit提出了一个新观点：角色互动网络是预测预测剧情片成功与否的一个重要指标。观众在剧情片的时候，有着与其他类型不太一样的衡量标准：不是影片在多大程度上愉悦了自己，而是剧情是否足够的跌宕起伏。于是，在这个项目中，研究团队从计算机图论（Graph Theory）的视角来剖析剧情片的网络结构。他们将剧本中出现的角色作为节点（nodes），不同角色在同一场景共同出现且有对话作为边（edge），共同出现的次数作为边的权重(edge weights)， 从而可以绘制整个剧情的网络图（drama network）。在这个网络图中，或许所有角色都连通在一起，也可能出现多个不相连的角色群落。于是，这里出现了一个新的衡量指标，网络成分（network components），即连通图的数量。另外一个指标是互动密度（density）,即总的互动数量与角色数量的比例。基于这四个主要指标（节点数，边数，网络成分，密度），再加上其他统计信息（包括预算，影片时长等），研究团队训练了一个回归模型。通过皮尔逊系数的结果显示，剧情网络特征在一定程度上与影片成功与否（IMDB评分及IMDB评分数量）关联。研究团队特别指出当网络成分大于1时，也就是是剧情中出现多于一个角色群落的时候，有助于增加情节的复杂性和戏剧张力，进而提升影片的表现。这项研究带给我们的启发是，通过Graph Theory来解构剧情，提炼特征是一种新颖的尝试。但这个项目中建构的回归模型虽然解释力强，但泛化能力局限很大。在数据充足的情形下，不妨考虑采用机器学习中更复杂的模型继续探索。


### Wattpad: NLP剖析流行故事的DNA

IP电影的开发是一件省力讨巧的美事。也许电影还未开拍，就已经成为大家都在聊的事。所以，跟电影相关的挖掘不能仅仅停留在电影本身的平台和数据。Wattpad<sup id="a3">[3](#f3)</sup>是全球最大的原创写作平台,传播着用50种多种语言写成的超过50亿个原创故事，同时也成为了好莱坞项目来源的宝藏之地。Wattpad自我定位是一个数据驱动的公司。这个平台诞生伊始，他们就着力构建基于协同过滤算法的推荐系统——依据读者的阅读历史，向他们推荐感兴趣的故事。与此同时，Wattpad重金打造了一个Story DNA的项目。这个项目的核心是使用NLP技术和循环神经网络解构故事，通过研究句型结构，词汇和语法的使用来预测下一部畅销小说。然而Wattpad并没有向外界透露太多这个项目的细节，关于这个故事研究模型是如何实现的我们不得而知。



创新不断，未完待续……



### Notes

<b id="f1">1</b> Valenti, J. (1978). Motion Pictures and Their Impact on Society in the Year 2001, p. 7. Midwest Research Institute. [↩](#a1)<br>

<b id="f2">2</b> StoryFit. Retrieved October 20, 2020, from https://www.storyfit.com/ [↩](#a2)<br>

<b id="f3">3</b> Wattpad. Retrieved October 20, 2020, from  https://www.wattpad.com/ [↩](#a3)<br>



### References

Behrens, R., Foutz, N. Z., Franklin, M., Funk, J., Gutierrez-Navratil, F., Hofmann, J., & Leibfried, U. (2020). Leveraging analytics to produce compelling and profitable film content. *Journal of Cultural Economics*. https://doi.org/10.1007/s10824-019-09372-1

Del Vecchio, M., Kharlamov, A., Parry, G., & Pogrebna, G. (2020). The Data Science of Hollywood: Using Emotional Arcs of Movies to Drive Business Model Innovation in Entertainment Industries. *Journal of the Operational Research Society*, 1–28. https://doi.org/10.1080/01605682.2019.1705194

Eliashberg, J., Hui, S. K., & Zhang, Z. J. (2018). Assessing Box Office Performance Using Movie Scripts: A Kernel-Based Approach. *IEEE Transactions on Knowledge and Data Engineering*, *26*(11), 2639–2648. https://doi.org/10.1109/TKDE.2014.2306681

Reagan, A. J., Mitchell, L., Kiley, D., Danforth, C. M., & Dodds, P. S. (2016). The emotional arcs of stories are dominated by six basic shapes. *EPJ Data Science*, *5*(1), 1–12. https://doi.org/10.1140/epjds/s13688-016-0093-1

StoryFit. (n.d.). *Featuring Whitepaper: How Character Interactions Impact Drama Success*. Retrieved October 22, 2020, from https://www.storyfit.com/how-character-interactions-impact-drama-success  

Vonnegut, K. (1981) *Palm Sunday*, Rosetta Books LLC, New York.

Wattpad, Data Science, and the Future of Hollywood. (2018, October 18). *BrainStation Blog*. https://brainstation.io/blog/wattpad-data-science-and-the-future-of-hollywood
