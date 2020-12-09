---
layout: project
title: '32-Longest Valid Parentheses'
date: 01 July 2020

---
## 题意
> Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

~~~python
Example 1:
Input: s = "(()"
Output: 2
Explanation: The longest valid parentheses substring is "()".

Example 2:
Input: s = ")()())"
Output: 4
Explanation: The longest valid parentheses substring is "()()".

Example 3:
Input: s = ""
Output: 0
~~~

## 思路
- 栈：平衡符号
- stack中放前一个还没有被匹配的下标
- 遇到(: 把index push进stack
- 遇到): stack.pop()
  - stack还有：更新res
  - stack is empty: 没有可以匹配的了，放入栈

~~~python
class Solution(object):
    def longestValidParentheses(self, s):
        """
        :type s: str
        :rtype: int
        """
        
        stack=[-1]
        res = 0
        for i, x in enumerate(s):
            if x=='(':
                stack.append(i)
            else:
                stack.pop() # 匹配
                if stack: 
                    length = i-stack[-1]
                    res = max(res, length)
                else:
                    stack.append(i)
        return res 
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
