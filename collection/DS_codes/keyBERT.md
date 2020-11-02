---
layout: project
title: 'BERT模型提取关键词'
date: 01 July 2020

---
使用BERT模型进行文本处理 
[KeyBERT package](https://github.com/MaartenGr/KeyBERT/)
- n-gram 
- 去停用词
- 对关键词中相似结果进行离散化，两种算法
  - Max Sum Similarity：在指定数量的关键词中，选择n个最不相似的呈现
  - Maximal Marginal Relevance：最小化redundancy的同时最大化diversity

[Sample Code](https://github.com/chuanluchen/DataScienceCode/blob/main/keyBERT.ipynb)

~~~python
from keybert import KeyBERT

doc = """
aaabbbbbbcccc
      """

# BERT Embedding Model
model = KeyBERT('distilbert-base-nli-mean-tokens')
keywords = model.extract_keywords(doc)

# Extract single Keywords
model.extract_keywords(doc, keyphrase_length=1, stop_words='english') # stop_words could be None

# n-gram
model.extract_keywords(doc, keyphrase_length=2, stop_words=None)

# Diversity 1: Max Sum Similarity
# 参数：增加nr_candidates提升离散程度
# !!! nr_candidates <= 20% of the total number of unique words
model.extract_keywords(doc, keyphrase_length=3, stop_words='english', 
                           use_maxsum=True, nr_candidates=20, top_n=5)

# Maximal Marginal Relevance
# 参数：增加diversity提升离散程度
model.extract_keywords(doc, keyphrase_length=3, stop_words='english', use_mmr=True, diversity=0.7)
~~~
