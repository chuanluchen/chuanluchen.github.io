---
layout: project
title: '159-Longest Substring with At Most Two Distinct Characters'
date: 01 July 2020

---
## 题意
> Given a string s , find the length of the longest substring t  that contains at most 2 distinct characters.
> 
> Example 1:
> - Input: "eceba"
> - Output: 3
> - Explanation: t is "ece" which its length is 3.
> 
> Example 2:
> - Input: "ccaabbb"
> - Output: 5
> - Explanation: t is "aabbb" which its length is 5.

## 思路
- window思想：sliding window双指针[left, right,记录window起点终点]，count sort
- 遍历字符串
  - 遍历字符串，进行count sort, 找right
  - 当count中超过2个字母时，缩小window: 右移left

~~~python
class Solution(object):
    def lengthOfLongestSubstringTwoDistinct(self, s):
        """
        :type s: str
        :rtype: int
        """
        res = left = 0
        count = collections.Counter()
        # 遍历：count Sort：找right
        for right, char in enumerate(s):
            count[char] += 1
            # 当count中超过2个字母时：缩小window, 右移left
            while len(count) > 2:
                count[s[left]] -= 1  # count中减掉left字母
                if count[s[left]] == 0: del count[s[left]]
                left += 1
            res = max(res, right - left + 1)
        return res
~~~

## 分析
- Time: O(n)
- Space: O(n)
