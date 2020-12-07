---
layout: project
title: '224-Basic Calculator'
date: 01 July 2020

---
## 题意
> Implement a basic calculator to evaluate a simple expression string.
> The expression string may contain open ( and closing parentheses ), the plus + or minus sign -, non-negative integers and empty spaces

~~~python
Example 1:
Input: "1 + 1"
Output: 2

Example 2:
Input: " 2-1 + 2 "
Output: 3

Example 3:
Input: "(1+(4+5+2)-3)+(6+8)"
Output: 23
~~~

## 思路
- 压栈匹配进行数学计算

~~~python
class Solution(object):
    def calculate(self, s):
        """
        :type s: str
        :rtype: int
        """
        '''
        stack: 就近原则
        根据输入类型分类讨论
        - 数字：要考虑多位数字问题
        - 遇（： push进括号外的结果和括号前的符号
        - 遇）：pop括号内的结果
        - +：更新+前的结果
        - -：更新-前的结果，把减法理解为加负数，sign=-1
        
        3+4-(3+2)
        '''
        
        res = 0
        num = 0 # 随时将num还原为0
        stack = []
        sign = 1
        for c in s:
            if c.isdigit():
                num = num * 10 + int(c)
            elif c == "+":
                res += sign * num # 更新当前+之前结果
                num = 0
                sign = 1
            elif c == "-":
                res += sign * num # 更新当前-之前结果
                num = 0
                sign = -1 # sign更新为-
            elif c =="(":
                stack.append(res) # 将括号外的结果放进stack
                stack.append(sign) # 括号前的结果放进stack
                sign = 1
                res = 0 
            elif c == ")":
                res += num * sign  # 计算括号内结果
                num = 0
                res = res * stack.pop() + stack.pop() # 括号内结果 + 括号前结果
        
        # 处理最后一个数
        res += num * sign
        return res
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
