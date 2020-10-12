---
layout: project
title: '28-Implement strStr()'
date: 01 July 2020

---
## 题意
> Implement strStr().
> Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
>
> Clarification:
> What should we return when needle is an empty string? This is a great question to ask during an interview.
> For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf()
>
> Example 1:
> - Input: haystack = "hello", needle = "ll"
> - Output: 2
>
> Example 2:
> - Input: haystack = "aaaaa", needle = "bba"
> - Output: -1
>
> Example 3:
> - Input: haystack = "", needle = ""
> - Output: 0
>
> Constraints:
> - 0 <= haystack.length, needle.length <= 5 * 104
>- haystack and needle consist of only lower-case English characters.

## 思路
- 先找到第一个匹配的字母， 再用substring的方法看后面是否相同


~~~python
class Solution(object):
    def strStr(self, haystack, needle):
        """
        :type haystack: str
        :type needle: str
        :rtype: int
        """
        if not needle: return 0
        for index, char in enumerate(haystack):
            if haystack[index] == needle[0]:
                if haystack[index:index+len(needle)] == needle:
                    return index
        return -1
~~~

## 分析
- Time: O(m * n)
- Space: O(1)
