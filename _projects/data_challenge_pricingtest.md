---
layout: project
title: '如何科学地调价？'
date: 13 January 2021
image:  
  path: /assets/img/projects/DataScience/pricing_test_cover.jpg
caption: Data to Action：价格AB Test
hide_image: false
featured: false
---

## 商业问题
**商业诉求：提价是否合理？**
- 背景：你的公司在出售一款$39的软件，老板希望测试一下价格从$39提升到$59是否可行？
- 任务：
  - 使用AB test验证价格可否提升到$59? 
  - 对实验组进行post-hoc analysis,对提升转化率提出操作性建议
  - 计算实验应该执行多长时间

**结论**
- AB test结果显示提价后转化率下降了25％，但人均收入有显著上升。如果着眼于总体收入(revenue)，实验结果是成功的。
- 从营销渠道上来看：朋友推荐是转化率最高的渠道，应在UI/UX更加突出；除此之外，Facebook/Google广告带来的客户人均收入最高，但考虑这两个渠道价格昂贵，并不是特别推荐；而SEO这个渠道的表现并没有差很多，
且是免费渠道，注重这个营销渠道将会带来更大的利润。
- 移动设备访问比网站访问能带来更高的人均收益。鉴于近几年移动设备流量在逐年增长，好好利用这个趋势将会带来更高的收益。在移动广告上加大投入也是值得尝试的策略
- iOS/Mac设备的用户对价格相对不敏感。iOS/ Android版本之间的差异值得进一步的研究
- 不同细分领域的收益差别变化很大，可以考虑针对不同产品制定不同的价格
- 利用significance level/ power/ minimum effect可以计算需要的采样大小,而根据每日流量，可进一步计算出每日需要的采样数。大约每日流量的11%需要纳入实验中来。


## 解决问题的基本策略
- 本项目进行AB test,目的不是为了观察转化率，而重在收益，毕竟这是公司更高层次的发展目标
- 提价实验验证之后，还要注重post-hoc analysis, 观察提价之后各个细分领域对提价的反馈，以提出改善转化率的建议

## 完整项目
<iFrame seamless frameborder="0" src='/assets/img/projects/DataScience/6_Pricing_Test.html' width="100%" height="600vh" scrolling="yes"> </iFrame>
