---
layout: project
title: '5-Longest Palindromic Substring'
date: 01 July 2020

---
## 题意
> Given a string s, return the longest palindromic substring in s.
> Example 1:
> - Input: s = "babad"
> - Output: "bab"
>- Note: "aba" is also a valid answer.
>
> Example 2:
> - Input: s = "cbbd"
> - Output: "bb"
>
> Example 3:
> - Input: s = "a"
> - Output: "a"
>
> Example 4:
> - Input: s = "ac"
> - Output: "a"
>
> Constraints:
> - 1 <= s.length <= 1000
> - s consist of only digits and English letters (lower-case and/or upper-case),

## 思路
- 中心扩散法
- 遍历字符串的每一个字符：把每一个字符作为中心，往两边拓展，看左右字符串是否相等
- 两种情况：
  - 回文字符串是奇数：开始条件-left= right
  - 回文字符串是偶数：开始条件-left， right= left+1
- 从中心向两边找，并截取字符串
- 当截取String> res长度时，更新res

~~~python
class Solution(object):
   
    def longestPalindrome(self, s):
        """
        :type s: str
        :rtype: str
        """
        #max_l = 0
        res = ""
        for i in range(0, len(s)):#以s[i] 为中心向左右扩散
            
            left, right = i, i #回文字符串是奇数，中心 = left = right
            while(left >= 0 and right < len(s) and s[left] == s[right]):          
                cur = s[left:right+1 ]
                if len(cur) > len(res):
                    res = cur
                left -= 1
                right += 1      
           
            left, right = i, i + 1 #回文字符串是偶数
            while(left >= 0 and right < len(s) and s[left] == s[right]):
                cur = s[left:right+1 ]
                if len(cur) > len(res):
                    res = cur
                left -= 1
                right += 1   
        return res
~~~

## 分析
- Time: O(n^2)
- Space: O(1)
