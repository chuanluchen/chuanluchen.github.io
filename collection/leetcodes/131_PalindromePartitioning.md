---
layout: project
title: '131-Palindrome Partitioning'
date: 01 July 2020

---
## 题意
> Given a string s, partition s such that every substring of the partition is a palindrome.
> Return all possible palindrome partitioning of s.
> Example:
> - Input: "aab"
> - Output:
>[
>  ["aa","b"],
>  ["a","a","b"]
>]

## 思路
- 回溯法 + 子集
- 预先判断是否palindrome

~~~python
class Solution(object):
    def partition(self, s):
        """
        :type s: str
        :rtype: List[List[str]]
        """
        res =[]
        
        def isPanlindrome(s):
            return s==s[::-1]
        
        def backtrack(res, temp, s):
            if len(s) == 0:
                res.append(temp[:])
                return
            
            for i in range(len(s)):
                if isPanlindrome(s[:i+1]):
                    temp.append(s[:i+1])
                    backtrack(res, temp, s[i+1:])
                    temp.pop()
        backtrack(res, [], s)
        return res
~~~

## 分析
- Time: O(2^n)
- Space: O(n)
