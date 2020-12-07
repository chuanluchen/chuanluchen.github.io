---
layout: project
title: '20-Valid Parentheses'
date: 01 July 2020

---
## 题意
> Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
> An input string is valid if:
> - Open brackets must be closed by the same type of brackets.
> - Open brackets must be closed in the correct order.

~~~python
Example 1:
Input: s = "()"
Output: true

Example 2:
Input: s = "()[]{}"
Output: true

Example 3:
Input: s = "(]"
Output: false

Example 4:
Input: s = "([)]"
Output: false

Example 5:
Input: s = "{[]}"
Output: true
~~~

## 思路
- 栈：平衡符号
- 遇到正符号，把反符号push进去
- 验证遇到的反符号是否跟pop出来的相同
- 最终stack应该为空

~~~python
class Solution(object):
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
        if not s: return True
        stack =[]
        for i in s:
            if i=='(': stack.append(')')
            elif i=='{': stack.append('}')
            elif i=='[': stack.append(']')
            else: # 验证pop
                if not stack or i !=stack.pop():
                    return False
        
        # 最后stack为空，是为平衡
        return not stack 
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
