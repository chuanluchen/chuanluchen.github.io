---
layout: project
title: '假设检验与AB Test'
date: 01 July 2020

---

## 假设检验的重要性
- 我们做实验的时候，通常接触不到population这个总体，因此我们通过样本来推测总体 ->这种inference就是假设
- 假设检验就是一种检验这种假设是否成立的方法

## AB test
- 当产品测试一个新功能的时候，使用随机抽样对用户分成控制组和实验组。
- 控制组用户使用老版本，实验组用户使用新版本。来验证新功能是否能提升产品表现
- AB test原理基础是假设检验

## 假设检验【AB Test】步骤
**1.定义原假设 Null/备择假设 Alternative**
- 原假设H0：无效，无差异（通常有等号=,≥,≤）
- 备择假设H1：有效，有差异
- AB test H0：新功能没有价值，mean(实验组)-mean(控制组)差值为0，H0描述了一个均值为0的正态分布
- AB test H1：新功能有价值，mean(实验组)-mean(控制组) 差值不为0，H1描述了一个均值不为0的正态分布
<br>
<img src="/assets/img/knowledge/ABtest/hypothesis_test1.jpg" width="50%" />
<br>
		
**2.选择显著性水平significance level α**
- 通常选择95%置信水平，α值为0.05
- 本质上是允许type I error出现的概率
  
**3.确定检验功效和样本数量**
- 检验功效【也是sensitivity】为1-β， 通常取值0.8
- β本质上是允许type II error出现的概率
- 根据α， power， based metric, 预期最小差异值可计算所需样本数量
  
**4.计算检验统计量与检验p-value**
- Z检验：已知标准差，检验两组均值
- T检验：不只标准差，检验两组均值
- Anova检验：检验三组以上均值
- Chi-sqaure卡方检验：检验分类数据之间的依赖关系
- p-value的实质：把H1假设测量的差值放到H0描述的正态分布里，计算在这个分布下这个差值出现的概率
  <br>
  <img src="/assets/img/knowledge/ABtest/hypothesis_test2.jpg" width="50%" />
  <br>
			
**5.将检验p-value与显著性水平做比较，判断是否能否定原假设**
- p-value <= 显著性水平：否定原假设，肯定备择假设
	- 等同说法：样本统计量与假设值之间具有统计意义上显著差异，不是偶然事件
	- p-value足够小说明这个H1描述的差值并不是由H0这个分布产生的， 可以推翻H0，认为新功能有价值
- p-value > 显著性水平,无法否定原假设，证据不足

## 假设检验的两种错误
- 假设检验基于概率，因此始终存在出现错误的概率
- 两种错误的风险逆相关，并由显著性水平和检验功效来确定
<br>
<img src="/assets/img/knowledge/ABtest/hypothesis_test3.jpg" width="50%" />
<br>

**Type I error: False positive**
- 原假设为真，但遭到了否定，犯错概率为α。当否定原假设的时候，就要面对5%的犯错概率。
- 为了降低风险，要使用较低的alpha值
	
**Type II error: False Negative**
- 原假设为假，但无法否定它， 犯错概率为β，依赖于检验功效
- 为了降低风险，确保足够大的检验功效

## 样本大小
- 样本大小由base metric, 预期最小变化幅度，显著性水平α，功效1-β共同决定
	
**α vs. β trade-off**
<br>
<img src="/assets/img/knowledge/ABtest/hypothesis_test4.jpg" width="60%" />
<br>
- α是允许type Error I出现的概率，β是允许type Error II 出现的概率
- 当α值设置很小，t检验值就会向右移动，β会变大
- 当样本量一定的情况下， α减小，β增大；α增大，β减小
- 要同时减小α，β，需要增大样本量
	
**计算所需样本大小的三种方法**
- Built-in library
- Look up answer in a table
- [Online calculator](https://www.evanmiller.org/ab-testing/sample-size.html)
 <br>
 <img src="/assets/img/knowledge/ABtest/hypothesis_test5.jpg" width="60%" />
 <br>
			
## 统计意义上的显著性与实际显著性
- 统计意义的显著性并不意味着实际差值显著
- 样本量足够多或重复多次实验的时候，会提升小概率事件发生的概率，极小的差值会变得显著
- 考虑使用Bonferroni correction: α / number of tests

## 判断AB test合理与否的几个关键
- 足够的数据
- 控制组和实验组规模相当
- 实验进行足够的时长，以抓住一段周期（一周）的规律，最少一周，两周为宜
- 用可视化的方式检验控制组/测试组的变化趋势，查看是否有猛烈变化
- 控制组和实验组中的用户构成一致【重中之重】：例如，在控制组中有10%英国用户，在实验组中也应该有大致相当的比例

