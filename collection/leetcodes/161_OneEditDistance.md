---
layout: project
title: '161-One Edit Distance'
date: 01 July 2020

---
## 题意
> Given two strings s and t, return true if they are both one edit distance apart, otherwise return false.
> A string s is said to be one distance apart from a string t if you can:
> - Insert exactly one character into s to get t.
> - Delete exactly one character from s to get t.
> - Replace exactly one character of s with a different character to get t.

~~~python
Example 1:
Input: s = "ab", t = "acb"
Output: true
Explanation: We can insert 'c' into s to get t.

Example 2:
Input: s = "", t = ""
Output: false
Explanation: We cannot get t from s by only one step.

Example 3:
Input: s = "a", t = ""
Output: true

Example 4:
Input: s = "", t = "A"
Output: true
~~~

## 思路
- Substring
- 定位不同字母，分情况讨论

~~~python
class Solution(object):
    def isOneEditDistance(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        for i in range(min(len(s), len(t))):
            if s[i] != t[i]: 
                if len(s)==len(t): return s[i+1:] == t[i+1:] #s替换一位
                elif len(s) >  len(t): return s[i+1:] == t[i:] #s多一位
                else: return s[i:] == t[i+1:] #s删掉一位
        
        return abs(len(s) - len(t)) == 1 #只能有一位长度差异

~~~

## 分析:
- Time: O(n^2)  <- substring的时间复杂度是O(n)
- Space: O(1) 
