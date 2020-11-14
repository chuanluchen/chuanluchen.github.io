---
layout: project
title: '8-String to Integer (atoi)'
date: 01 July 2020

---
## 题意
> Implement atoi which converts a string to an integer.
> The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
> The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
> If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
> If no valid conversion could be performed, a zero value is returned.
> Note:
> - Only the space character ' ' is considered a whitespace character.
> - Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, 231 − 1 or −231 is returned.

~~~python
Example 1:
Input: str = "42"
Output: 42

Example 2:
Input: str = "   -42"
Output: -42
Explanation: The first non-whitespace character is '-', which is the minus sign. Then take as many numerical digits as possible, which gets 42.

Example 3:
Input: str = "4193 with words"
Output: 4193
Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.

Example 4:
Input: str = "words and 987"
Output: 0
Explanation: The first non-whitespace character is 'w', which is not a numerical digit or a +/- sign. Therefore no valid conversion could be performed.

Example 5:
Input: str = "-91283472332"
Output: -2147483648
Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer. Thefore INT_MIN (−231) is returned.
~~~

## 思路
- 数学题: str to integer

~~~python
class Solution(object):
    def myAtoi(self, str):
        """
        :type str: str
        :rtype: int
        """
        # 1. strip
        str = str.strip()
        
        # 2. check range
        if not str or len(str) ==0: return 0
        
        # 3. sign
        res, start, sign = 0, 0, 1
        if str[0]=='+': start += 1
        elif str[0] =='-':
            start += 1
            sign = -1
        
        # 4. str -> digits
        for i in range(start, len(str)):
            if not str[i].isdigit():
                return res * sign
            else:
                res = res* 10 + ord(str[i])-ord('0')
            
        # 5. boundary
            if res > 2**31 - 1 and sign==1: return 2**31 - 1
            if res > 2**31 - 1 and sign==-1: return -2**31
        return res * sign
~~~

## 分析:
- Time: O(n) 字符串长度
- Space: O(1) 
