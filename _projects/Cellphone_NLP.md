---
layout: project
title: 'Samsung Galaxy S8 vs. iPhone 8: NLP Analysis of Customer Posts'
date: 12 Aug 2021
image:  
  path: /assets/img/projects/Cellphone_NLP/iPhone_Galaxy_cover_pic.jpeg

caption: Onlien Reviews+NLP+Real-world Dataset
hide_image: false
featured: true
---
<img src="/assets/img/projects/Cellphone_NLP/iPhone_Galaxy_cover_pic.jpeg"/>
<br><br>

### **I. Background and Objectives**

To understand their customers more deeply is always a direction companies are heading to and are investing heavily. Traditional survey-based study and focus group could provide valueble insight. But the content of reviews or posts of consumers on internet could serve as additional source for companies to dive into.

NLP techniques have the potential to help us mining the insight of the customers' reviews or posts. Here I will apply the most commonly used ones on a real-world dataset to further explore the potential of NLP techniques.

Samsung Galaxy S8 and iPhone 8 were released in 2017. Both products attracted significant amount of discussion online. I choose the real-world dataset of tweets and posts regarding these two products mainly considering two reasons: on one hand, there are enough posts as data source to generate meaningful insight; on the other hand, 3 years have past and now we should be able to revisit the product launching even in a more objective manner.

With the insight provided, the objective is:
- For product managers to understand the preference of customers
- For the companies to better plan their market campaign

Keep the objectives in mind, the analysis is going to answer the following questions:
- How did the sentiment of posts and tweets change over time?
- Is there any significant difference between the posts on Twitter and the one on the other platform?

The key challenging of the project is:
- Data cleaning and feature engineering as this is a real world dataset
- Limited domain knowledge
- Large size of dataset makes model finetuning time consuming


### **II. Exploratory Data Analysis**

The dataset I have includes tweets, blogs, and customer reviews collected from different platforms, based on the key words of "Samsung Galaxy S8" and "iPhone 8", covering the timeframe from 2 weeks before product release till 40 days after product release. The initial dataset includes ~400k records, each has 41 fields.

Here I will not enter into details about the data cleaning, though these steps takes ~50% of the time and effort. Only few steps I'd like to highlight:

- Some of the tweets or posts are indeed posted as professional reviews. Such reviews need to be removed from the dataset for two reasons. On one hand, it doesn't reflect what the consumers are thinking about. On the other hand, focus group or interviews with professional reviewers or opinion leaders probably would provide more insight of their opinion than mining data using NLP techniques. To identify the professional reviews or posts of celebrities, we could look at the number of daily views of posts or number of followers of twitter user. Dropping the records which are outliers in the field mentioned before, we could get rid of the professional reviews.
- Transfer the calendar date into the number of days relative to the product launch event. For example, a review posted 1 week before the product release will have a relative date of -7, while a review posted 1 week after the release will have a relative date of 7.
- Twitter has a strict limit on the length of tweets while other platforms don't. Such limit might shape the way consumers expressing their opinion on Twitter. For example, bearing such limits in words, Twitter users might express their opinion in a more direct way. More importantly, tweet's limit will lead to an imbalanced distribution of the length of records if we analyze tweets and other posts together. Such imbalanced distribution may create troubles when analyzing term frequencies. Therefore, it makes sense to analyze tweets and other posts separately.
- There might be posts or twitters discussing both iPhone 8 and Samsung Galaxy S8. Identifying the author's opinion about either of the products from such posts would be quite challenging. So here I keep only tweets or posts discussing one product, and perform the analysis separately. In other words, the same analysis will be repeated for four categories:

    1. Tweets of iPhone 8
    2. Other posts of iPhone 8
    3. Tweets of Samsung Galaxy S8
    4. Other posts of Samsung Galaxy S8


### **III. NLP & Result Interpretation**

The following techniques are applied here to dig the insight of the data:

- Bag of Words: 
- Topic Modeling
- Sentiment Analysis
- Combine the NLP result with other features, especially the days to release.

The firgure below shows the major techniques and libraries used to perform the analysis.
<br><br>
<img src="/assets/img/projects/Cellphone_NLP/NLP_Overview.jpg"/>
<br><br>

Since the objective of this blog is to discuss the potential of NLP techniques, I will only present part of the findings here. 

The topic modeling is implemented through tf-idf tranformation and LDA, using sklearn. After fine-tuning the number of topics manually, there are some interesting findings:
- The release event itself is a popular topic for iPhone on Twitter
- In other posts, there is a topic focusing on new features of iPhone 8, including battery, touch id, screen, wireless charging...
- In other posts about iPhone 8, there is another topic focusing on iOS 11 and Apps
- In other posts about Samsung Galaxy S8, there is a topic focusing on the appearance

Now we have some meaningful topics identified, the next step will be to perform sentiment analysis for each topic of each mobile model. Simply looking at the overall sentment doesn't add much value. Instead, here we could analyze the sentiment of tweets or posts for each single day.

There are some interesting findings.

The figure below shows the sentiment of non-tweet posts about iPhone 8, under the topic discussing new features. The horizontal axis shows the days to product release date. The boxplot shows the distribution of sentiment. The blue solid line shows the number of tweets or posts. And the red dash line shows the average sentiment on that specific day.

<br><br>
<img src="/assets/img/projects/Cellphone_NLP/Posts_iPhone_Topic_Features.jpg"/>
<br><br>

From the figure, it could be observed that:
1. As expected, there is a peak of discussion on the day of release (Day 0)
2. On day 14, there is a peak of discussion but a sudden drop of sentiment - this suggests us to look deeper into what happend on that day. In deed, it is the time when the issue of iPhone battery swelling was reported. If we further explore the posts on that day, actually ~68% of negative posts in this category on that day mentioned "battery". While in the previous week, only 30% of negative posts mentioned it on average.
3. Surprisingly, the sentiment improved within one week. Based on the limited information, I couldn't come up with the insight to explain what happened. But my hypothesis is that Apple took certain actions for crisis PR.
4. On day 27, there is another sudden drop in the sentiment. This is probably the reaction to the Apple's reply to the battery swelling issue.

Clearly the data itself doesn't explain everything. But it pointed out an interesting direction for companies to further explore - what Apple has done in term of crisis PR right after day 14?

Another example is still about iPhone 8. Here I perform the same analysis about the non-tweet posts under the topic relate to iOS. From the figure below, it could be observed that:
1. The discussion of iOS has two peaks - one is on day 0 when the iPhone 8 was released; the other one is on day 11 when the iOS 11.0.2 was released.
2. One week before the release of iPhone 8 (day -8), the average sentiment reach a peak. This reflects the high appreciation of consumers about the new iOS. Meanwhile, it also indicates the high expectation from the same group.
3. On day 11, the day when iOS 11.0.2 was released, there is a peak of dicussion and the average sentiment towards iOS 11 droped to almost neutral. If we further explore the distribution of sentiment, on that day there are more strongly negative posts showing as outliers in the box plot. About 89% of negative posts on that day mentioned iOS, while the percentage in previous week is only 35%.
4. Then in the following days the number of posts decreased and the sentiment increased. This doesn't necessarily mean that the consumer's opinion about iOS was turned over. Rather, my hypothesis is that a large portion of the consumers with a negative experience of iOS 11.0.2 have expressed their disappoint already on day 11. The fact that they no longer post negative reviews doesn't mean they now believe that iOS 11.0.2 is good.

<br><br>
<img src="/assets/img/projects/Cellphone_NLP/Posts_iPhone_Topic_iOS.jpg"/>
<br><br>

To sum up, the key take-away from the figure and analysis above is that consumer's experience is about the overall ecosystem, not the phone itself. If the company failed to promote the overal customer experience, even a good product might see damage of its reputation.

Also, the analysis of Galaxy Samsung S8 provides interesting insight. The figure below shows the similar exercise for non-tweet posts Galaxy S8, under the topic discussing appearance.

<br><br>
<img src="/assets/img/projects/Cellphone_NLP/Posts_Galaxy_Topic_Appearance.jpg"/>
<br><br>

From the figure, we could learn that:
1. Unlike the reviews of iPhone 8, the discussion about Galaxy S8 seem to be more diversed. The sentiment changes day by day probably because the smaller amount of posts collected. Or it might also because of the lower loyalty of Samsung's user. A second look at traditional analysis such as focus group or customer surveys might help validating the hypothesis.
2. Between day 20 and day 24, there is an increasing trend of dicussion and increasing sentiment. The top 20 words extracted from tokenized posts during that period doesn't provide much useful insight. If we are interested in further understanding what happened during that period, the suggested way would be interviewing the after-release market campaign leader at that time.

Up to now, we looked at the topics, the sentiment, and the top N words of certain groups of posts. However there is no word cloud created. I did it on purpose. Word cloud is a fancy visualization, but it doesn't always show useful insight. Instead, based on whether certain token show up in the top-N-word list of postive or negative sentiment posts, I picked up the one that may suggest us for further exploration, as shown in the figure below.

<br><br>
<img src="/assets/img/projects/Cellphone_NLP/Top_Words.jpg"/>
<br><br>


### **IV. Next Steps**

Based on the insight discussed so far, there are further actions could be taken:
1. To engage domain expert to review the findings and to suggest subjects of interests
2. To apply traditional tools to supplement the finding through applying NLP techniques, including the crisis PR of Apple, the release of iOS 11.0.2, and the after-release market campaign of Galaxy S8.
3. To retrieve sales data. In this way we could further explore how changes in sentiment drives might be correlated with sales.
4. To use more advanced model, such as BERT.
5. More feature engineering - this is applicable for almost all the machine learning analysis

In a nutshell, data science is a field of both science and art. Indeed, NLP contribute a large portion on the art side. What we have demonstrated on this real-world dataset is that applying NLP techniques could provide us certain level of insight and help us in shaping our hypothesis. Then based on the direction we learn from NLP techniques, other tools, including traditional focus group, interview, and survey, could help us further validating our hypothesis.
