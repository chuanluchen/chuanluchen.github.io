---
layout: project
title: '如何提升客户的购买转化率? I'
date: 13 January 2021
image:  
  path: /assets/img/projects/DataScience/conversion_rate_cover.jpg
caption: Data to Action：机器学习预测转化率
hide_image: false
featured: false
---

## 商业问题
**商业诉求：如何提升转换率？**
- 背景：我们拥有网站到访的大量数据，包括用户是否转化为够买行为，以及他们的用户属性（国家，市场渠道，年龄，是否是新客户）和用户行为数据（到访session期间浏览的页面数）
- 任务：向产品团队和市场团队提出提升用户购买转化率的可操作性建议
**初步结论**
- 我们通过机器学习，建立树模型预测用户是否转化
- 通过机器学习模型，我们可以挖掘驱动用户转化的主要动因
- 该网站中30岁以下的年轻用户转化率表现好，这是潜在的市场机会，市场有必要多接触这一群体，尤其是这一群体中的已有客户
- 德国用户在转化率方面表现优异，但德国用户总体来说体量较小。对于市场团队来说，德国将是一个很大的机会
- 鉴于老用户在转化率上表现远远优于新用户，基于精准匹配的邮件营销策略值得尝试
- 超过30岁的用户的转化率下降严重，这背后的原因需要进一步研究，看网站UI，客户需求，产品供给哪里出现了问题。如何提升30岁以上客户的购买转化率将是数据科学家下一步研究的课题
- 中国地区的转化率偏低，可以进一步在语言版本上找原因，或许是翻译问题，或许本土化做的不够，也有可能是支付问题。鉴于该网站在中国地区有着广大用户群体，这是一个优先级更高的问题，亟待解决

## 机器学习探索这一类问题的基本策略
- 利用机器学习模型（树模型）建分类模型预测conversion
- 重视模型解释
  - feature importance找重要的特征/不重要的特征
  - dependence plot找特征中间的segmentation
  - tree plot找重要特征及关键分界点
- 结论与建议
  - 有哪些表现好的特征
    - segmentation是怎样的
    - 好中的不好是哪部分
    - 有什么方法能get more
  - 有哪些表现不好的特征
    - 猜测可能的原因并run test
    - 不好中的好是哪部分
    - 有什么方法能改进，big opportunity

## 完整项目
<iFrame seamless frameborder="0" src='/assets/img/projects/DataScience/1_Conversion_Rate.html' width="100%" height="600vh" scrolling="yes"> </iFrame>
