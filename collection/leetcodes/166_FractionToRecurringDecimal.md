---
layout: project
title: '166-Fraction to Recurring Decimal'
date: 01 July 2020

---
## 题意
> Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.
> If the fractional part is repeating, enclose the repeating part in parentheses.
> If multiple answers are possible, return any of them.
> It is guaranteed that the length of the answer string is less than 104 for all the given inputs.

~~~python
Example 1:
Input: numerator = 1, denominator = 2
Output: "0.5"

Example 2:
Input: numerator = 2, denominator = 1
Output: "2"

Example 3:
Input: numerator = 2, denominator = 3
Output: "0.(6)"

Example 4:
Input: numerator = 4, denominator = 333
Output: "0.(012)"

Example 5:
Input: numerator = 1, denominator = 5
Output: "0.2"
~~~

## 思路
- 数学题：特殊问题
- 注意小数点后面的算法：余数 * 10/ 除数
- 用HashMap记录 余数：字符串位置 -> 用于加'()'

~~~python
class Solution(object):
    def fractionToDecimal(self, numerator, denominator):
        """
        :type numerator: int
        :type denominator: int
        :rtype: str
        """
        
        if numerator == 0: return '0'
        res = ''
        
        if (numerator < 0) ^ (denominator < 0): # 分子分母符号相异
            res += '-'

        num,den = abs(numerator),abs(denominator)
        res += str(num // den)
        if num % den == 0: return res
        else: res+='.'
        
        '''
        除尽：
        10 / 4 = 2...2    => 2.
                     num* 10 // den
                     2*10/4   => 5   余数不断 * 10 // 分母 -> num = 余数
                     
        除不尽
        10 /3 =3...1                  => res: 3.
                   num* 10/3
                   10 /3 ->3...1      => res: 3.3   map:{1:2}
                   1 in map           '3.' + '(' + '3' + ')'
                   
        
        '''
        num = num % den
        map = {num: len(res)} # map：记录当前余数：字符串位置
        while num:
            num *= 10
            res+= str(num//den)
            num %= den
            if num in map:
                res = res[:map[num]] +'(' + res[map[num]:] + ')'
                return res
            else:
                map[num] = len(res)

        return res
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
