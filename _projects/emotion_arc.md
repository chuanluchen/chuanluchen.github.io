---
layout: project
title: '像数据科学家一样读电影剧本'
date: 12 April 2020
image:  
  path: /assets/img/projects/emotion_arc/screeplay.jpg
caption: NLP：电影剧本的情感曲线
hide_image: false
featured: true
---

## 缘起：数据科学家如何读小说

University of Vermont与University of Adelaide两所大学的研究团队曾在2016年做过一项研究[^脚注ID1]：他们通过NLP技术对古登堡收藏项目中的1327篇小说做了语义情感分析。进而通过矩阵分解，主成分分析，层次聚类，他们发现小说中错综复杂的情感轨迹都可以归纳为六种基本的情感曲线：
1. Rags to Riches：情感曲线不断上扬。
2. Riches to Rags：情感曲线由盛转衰
3. Man in a Hole：先抑后扬
4. Icarus：先扬后抑
5. Cinderella：灰姑娘型，扬-抑-扬
6. Oedipus：俄狄浦斯型，抑-扬-抑

这个项目的基本思路是：经过长期的研究，构建一个10000词的情感正负（happiness）指数词表。针对具体的文本，把每10000个词作为一个窗口，扫遍小说全文，进而可以得到一篇小说在连续窗口下的情绪变化曲线。这套方向后来衍生成为一个研究全球英文Twitter情感走势的一个较为成熟的工具。[^脚注ID2]

需要指明的是，这项研究的重心不在于故事情节或叙事张力，它更加关注的是作者如何通过文本或者措辞的运用来激发读者的情绪。这种情感曲线虽然不是故事情节的直接表征，但是可以间接地衡量读者情绪的变化。

## 电影剧本的情感曲线

看到这项研究的时候，我不禁好奇，我们对于电影剧本能否做类似的尝试？

当然，在做尝试的时候，我也可以做一点点改进。既然我们关心的是文本的情绪激发程度，仅仅用情绪正负的程度区分或许不能精准的实现我们的诉求。在这里，我选择借助更新的一些NLP研究成果。NRC Valence, Arousal, and Dominance (VAD) Lexicon词表[^ 脚注ID3 ]对超过20000个英文单词进行valence, arousal, dominance三个维度的评分。具体来说，valence指的是情绪正负（欢乐/不悦）维度，arousal指的是情绪积极（excited or active）/消极(calm or passive)这一维度，dominance指的是掌控力强/弱的维度。其中，arousal这一指标更符合我们对于了解文本在多大程度上能够激发读者情绪的需求。在arousal维度上得分比较的高的词，有abduction, exorcism, homicide等，得分比较低的词有mellow,siesta, napping等等。

具体的实现参考以上小说研究项目。

首先，[IMSDb](https://www.imsdb.com/)网站提供了丰富的英文电影剧本，可供选择。

然后，对于获得的电影剧本文本进行处理。由于电影剧本篇幅通常少于小说，我选取1000词做为窗口。我使用正则表达式对文本进行基本清洗，去停用词，进而计算当前文本窗口内的加权情绪激发得分。

最后，把连续窗口放在横轴，情绪激发得分放在纵轴，我们就得到了一个电影剧本的情感曲线。

## 情感曲线实例

用这种方法，我们可以针对任何一个英文的电影剧本，绘制情感曲线图。以下随机展示几个例子。
<iFrame seamless frameborder="0"
  src='/assets/img/projects/emotion_arc/Joker.html'  width="100%">
</iFrame>
<br><br>
看过Joker(2019)的童鞋一定不会惊讶于这幅情感曲线图的走势。这部电影从头到尾都在压抑和癫狂中不断切换，几乎没有喘息的空间。电影剧本的整体情绪得分比较高，跌宕起伏亦非常明显。最后随着男主角走向崩溃与自我毁灭，这种文本上的情绪也被推向一个又一个高峰。

<iFrame seamless frameborder="0"
  src='/assets/img/projects/emotion_arc/Do The Right Thing.html'  width="100%">
</iFrame>

<br><br>
1989年的Do the Right Thing是一部反映纽约社区种族矛盾的电影。从剧本的情绪曲线上看，这个故事在略显平稳的叙述口吻展开。虽然偶有波澜，但在故事的发展进程中，并没有像Joker那样焦灼的起伏。但在故事的最后五分之一，多条线索的冲突集中爆发，形成了一个对观众情绪扰动的高峰。
<iFrame seamless frameborder="0"
  src='/assets/img/projects/emotion_arc/Forrest Gump.html'  width="100%">
</iFrame>
<br><br>
大家熟知的阿甘正传的情感曲线则看起来有些异类。这个剧本在前五分之一的阶段就已经到达了情绪激发的高峰。而在后续的故事发展中，情感曲线在基本平缓的趋势中稳步下降。阿甘的一生非常传奇，但整个故事是以一种大智若愚，平平淡淡的方式讲述的，或许这正是这种表述的高明之处。从情感曲线中，我们似乎能够窥测到这种独特叙事的端倪。

## 可为与不可为

- 这个小小的side project并不涉及什么创新的模型或复杂的算法，我只是将已有的研究方法拿到电影领域做了一些实现和尝试。
- 目前的NLP技术对于基于词汇的情感分析挖掘比较充分，但对于文本的抽象把握还不成熟。因此，目前的情感曲线并不能基于情节本身进行描绘，而只能是、基于词汇的语义而产生。虽然不能直接地帮助我们剖析剧情，但这种情感曲线不失为从数据科学的视角量化/可视化电影文本的一种新方式。
- 照搬此方法到中文电影剧本可能会有偏差。虽然NRC-VAD Lexicon词表提供了各个语言的版本，但词汇的对应是基于Google Translate产生，不免产生大量语义的损失。因此，当前的方法并没有在中文电影剧本上尝试。



[^脚注ID1]: Reagan, A. J., Mitchell, L., Kiley, D., Danforth, C. M., & Dodds, P. S. (2016). The emotional arcs of stories are dominated by six basic shapes. *EPJ Data Science*, *5*(1), 31. https://doi.org/10.1140/epjds/s13688-016-0093-1
[^脚注ID2]: *Hedonometer*. (n.d.). Retrieved October 20, 2020, from http://hedonometer.org/timeseries/en_all/
[^ 脚注ID3 ]: Obtaining Reliable Human Ratings of Valence, Arousal, and Dominance for 20,000 English Words.](https://saifmohammad.com/WebDocs/acl2018-VAD.pdf) Saif M. Mohammad. In *Proceedings of* the 56th Annual Meeting of the Association for Computational Linguistics, Melbourne, Australia, July 2018.

