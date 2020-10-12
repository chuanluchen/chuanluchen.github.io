---
layout: project
title: '242-Valid Anagram'
date: 01 July 2020

---
## 题意
> Given two strings s and t , write a function to determine if t is an anagram of s.
>
> Example 1:
> - Input: s = "anagram", t = "nagaram"
> - Output: true
>
> Example 2:
> - Input: s = "rat", t = "car"
> - Output: false
> - Note:You may assume the string contains only lowercase alphabets.
>
> Follow up:
> What if the inputs contain unicode characters? How would you adapt your solution to such case?


## 思路
- Count Sort思想

~~~python
class Solution(object):
    def isAnagram(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        from collections import Counter
        return Counter(s) == Counter(t)
~~~

## 分析:考虑Counter的复杂度
- Time: O(n) 
- Space: O(n)
