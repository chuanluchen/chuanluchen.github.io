---
layout: project
title: '227-Basic Calculator II'
date: 01 July 2020

---
## 题意
> Given a string s which represents an expression, evaluate this expression and return its value. 
> The integer division should truncate toward zero.

~~~python
Example 1:
Input: s = "3+2*2"
Output: 7

Example 2:
Input: s = " 3/2 "
Output: 1

Example 3:
Input: s = " 3+5 / 2 "
Output: 5
~~~

## 思路
- 栈：压栈匹配 + 数学运算

~~~python
class Solution(object):
    def calculate(self, s):
        """
        :type s: str
        :rtype: int
        """
        res = 0
        num = 0
        stack = []
        sign = '+'
        s = s.replace(' ','')
        
        for i in range(len(s)):
            # 提取当前数字
            if s[i].isdigit():
                num = num*10 + int(s[i])
            if (not s[i].isdigit() ) or i==len(s)-1: #遇到符号，处理当前数字
                if sign =='+': stack.append(num)
                elif sign =='-': stack.append(num*(-1))
                elif sign =='*': stack.append(num *(stack.pop())) # 乘法先运算在push
                elif sign =='/': stack.append(int(float(stack.pop())/float(num)))
                sign = s[i] # 更新当前符号
                num = 0
        
        # 对stack中进行加法运算
        for i in stack: 
            res += i
            
        return res
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
