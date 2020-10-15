---
layout: project
title: '171-Excel Sheet Column Number'
date: 01 July 2020

---
## 题意
> Given a column title as appear in an Excel sheet, return its corresponding column number.
> For example:
>
>    A -> 1
>    B -> 2
>    C -> 3
>    ...
>    Z -> 26
>    AA -> 27
>    AB -> 28 
>    ...
> Example 1:
> - Input: "A"
> - Output: 1
>
> Example 2:
> - Input: "AB"
> - Output: 28
>
> Example 3:
> - Input: "ZY"
> - Output: 701
>
> Constraints:
> - 1 <= s.length <= 7
> - s consists only of uppercase English letters.
> - s is between "A" and "FXSHRXW".

## 思路
- 字母的26进制转换

~~~python
class Solution(object):
    def titleToNumber(self, s):
        """
        :type s: str
        :rtype: int
        """
        res = 0
        for c in s:
            res *= 26
            res += ord(c) - ord('A') + 1
        return res        
~~~

## 分析
- Time: O(n)
- Space: O(1)
