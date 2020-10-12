---
layout: project
title: '3-Longest Substring Without Repeating Characters'
date: 01 July 2020

---
## 题意
>Given a string s, find the length of the longest substring without repeating characters. 
>
>Example 1: 
>- Input: s = "abcabcbb"
>- Output: 3
>- Explanation: The answer is "abc", with the length of 3.
>
>Example 2: 
>- Input: s = "bbbbb"
>- Output: 1
>- Explanation: The answer is "b", with the length of 1.
>
>Example 3:
>- Input: s = "pwwkew"
>- Output: 3
>- Explanation: The answer is "wke", with the length of 3.
>- Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
>
>Example 4:
>- Input: s = ""
>- Output: 0
> 
>Constraints:
>- 0 <= s.length <= 5 * 104
>- s consists of English letters, digits, symbols and spaces.

## 思路
- window思想：双指针[left, right,记录window起点终点]，Hashset[记录window不重复元素]
- 遍历字符串
  - 遇到新元素，放入hashset，res更新为len(hashset)，终点++
  - 遇到重复元素，更新window起点 -> set中删除起点的值，起点++ -> 会一直循环到去除right重复的元素

~~~python
class Solution(object):
    def lengthOfLongestSubstring(self, s):
        """
        :type s: str
        :rtype: int
        """
        if not s: return 0
        hashset = set()  #1. HashSet记录window中的字母
        left, right, res = 0, 0, 0 # 2. 双指针
        while left < len(s) and right < len(s):
            if s[right] in hashset:  # 4.遇到重复元素: 从set去除左边的，left++
                hashset.remove(s[left])
                left+= 1
            else: # 3. 遇到新元素：加入set， res取当前最大, right++
                hashset.add(s[right])
                res = max(len(hashset), res)
                right += 1
        return res
~~~

## 分析
- Time: O(n)
- Space: O(n)
