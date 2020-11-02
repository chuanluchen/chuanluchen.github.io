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


~~~python
from keybert import KeyBERT

doc = """
         Supervised learning is the machine learning task of learning a function that
         maps an input to an output based on example input-output pairs.[1] It infers a
         function from labeled training data consisting of a set of training examples.[2]
         In supervised learning, each example is a pair consisting of an input object
         (typically a vector) and a desired output value (also called the supervisory signal). 
         A supervised learning algorithm analyzes the training data and produces an inferred function, 
         which can be used for mapping new examples. An optimal scenario will allow for the 
         algorithm to correctly determine the class labels for unseen instances. This requires 
         the learning algorithm to generalize from the training data to unseen situations in a 
         'reasonable' way (see inductive bias).
      """
      
model = KeyBERT('distilbert-base-nli-mean-tokens')
keywords = model.extract_keywords(doc)

###### Extract Keywords
# single keyword
model.extract_keywords(doc, keyphrase_length=1, stop_words='english')
#['learning', 'training', 'algorithm', 'class', 'mapping']
# n-gram
model.extract_keywords(doc, keyphrase_length=2, stop_words=None)
['learning algorithm',
 'machine learning',
 'supervised learning',
 'learning function',
 'algorithm analyzes']
Diversification
Diviersification
# Max Sum Similarity
model.extract_keywords(doc, keyphrase_length=3, stop_words='english', 
                           use_maxsum=True, nr_candidates=20, top_n=5)
['set training examples',
 'generalize training data',
 'requires learning algorithm',
 'supervised learning algorithm',
 'learning machine learning']
# Maximal Marginal Relevance
model.extract_keywords(doc, keyphrase_length=3, stop_words='english', use_mmr=True, diversity=0.7)
['algorithm generalize training',
 'labels unseen instances',
 'new examples optimal',
 'determine class labels',
 'supervised learning algorithm']
~~~


<script src="https://gist.github.com/chuanluchen/ddff1b3575c8489014a796c2599d7a82.js"></script>
