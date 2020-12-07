---
layout: project
title: '150-Evaluate Reverse Polish Notation'
date: 01 July 2020

---
## 题意
> Evaluate the value of an arithmetic expression in Reverse Polish Notation.
> Valid operators are +, -, *, /. Each operand may be an integer or another expression.
> Note:
> - Division between two integers should truncate toward zero.
> - The given RPN expression is always valid. That means the expression would always evaluate to a result and there won't be any divide by zero operation.

~~~python
Example 1:
Input: ["2", "1", "+", "3", "*"]
Output: 9
Explanation: ((2 + 1) * 3) = 9

Example 2:
Input: ["4", "13", "5", "/", "+"]
Output: 6
Explanation: (4 + (13 / 5)) = 6

Example 3:
Input: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
Output: 22
Explanation: 
  ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
= ((10 * (6 / (12 * -11))) + 17) + 5
= ((10 * (6 / -132)) + 17) + 5
= ((10 * 0) + 17) + 5
= (0 + 17) + 5
= 17 + 5
= 22
~~~

## 思路
- 顺序原则/就近原则：stack解决
- 遇到数字：转成Int,push stack
- 遇到符号：pop()前两个数字，进行计算，把当前结果push进stack
- 注意减法、除法的顺序
- 结果为stack中仅剩的那个东西

~~~python
class Solution(object):
    def evalRPN(self, tokens):
        """
        :type tokens: List[str]
        :rtype: int
        """
        stack = []
        for t in tokens:
            if t == '+':
                stack.append(stack.pop() + stack.pop())
            elif t == '*': 
                stack.append(stack.pop() * stack.pop())
            elif t == '-':
                b = stack.pop()
                a = stack.pop()
                stack.append(a - b)
            elif t == '/':
                b = stack.pop()
                a = stack.pop()
                stack.append(int(float(a) / float(b)))
            else: stack.append(int(t))
        return stack.pop()
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
