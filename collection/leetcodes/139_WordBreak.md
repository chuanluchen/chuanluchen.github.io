---
layout: project
title: '139-Word Break'
date: 01 July 2020

---
## 题意
> Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.
> Note:
> - The same word in the dictionary may be reused multiple times in the segmentation.
> - You may assume the dictionary does not contain duplicate words.

~~~python
Example 1:
Input: s = "leetcode", wordDict = ["leet", "code"]
Output: true
Explanation: Return true because "leetcode" can be segmented as "leet code".

Example 2:
Input: s = "applepenapple", wordDict = ["apple", "pen"]
Output: true
Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
             Note that you are allowed to reuse a dictionary word.

Example 3:
Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
Output: false
~~~

## 思路
- 动态规划
- dp记录找到的分割点
- 以每一个位置为终点，以dp记录的分割点为起点 -> 窗口找word是否存在于wordDict
<img src="/assets/img/projects/code/139_WordBreak.jpeg"/>

~~~python
class Solution(object):
    def wordBreak(self, s, wordDict):
        """
        :type s: str
        :type wordDict: List[str]
        :rtype: bool
        """
        dp = [0]
        for j in range(1,len(s)+1): #滑动窗口末尾 需要走到最后一个字符
            for i in dp:
                if s[i:j] in wordDict:
                    dp.append(j) 
                    break # 不再往后找，当前分割点为起点往后找起
        return dp[-1]==len(s)
~~~
