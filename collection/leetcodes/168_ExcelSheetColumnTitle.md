---
layout: project
title: '168-Excel Sheet Column Title'
date: 01 July 2020

---
## 题意
> Given a positive integer, return its corresponding column title as appear in an Excel sheet.

~~~python

For example:

    1 -> A
    2 -> B
    3 -> C
    ...
    26 -> Z
    27 -> AA
    28 -> AB 
    ...

Example 1:
Input: 1
Output: "A"

Example 2:
Input: 28
Output: "AB"

Example 3:
Input: 701
Output: "ZY"
~~~

## 思路
- 字符串
- 10进制转换为26进制转换
- %26得到个位 -> + ord('A')得到ASCII
- /26处理十位 

~~~python
class Solution(object):
    def convertToTitle(self, n):
        """
        :type n: int
        :rtype: str
        """
        
        res =''
        while n:
            n = n-1
            res += chr(ord('A') + n%26)
            n/=26
        return res[::-1]      
~~~

## 分析:
- Time: O(logn)
- Space: O(1) 
