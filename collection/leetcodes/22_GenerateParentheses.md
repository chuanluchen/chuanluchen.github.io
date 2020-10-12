---
layout: project
title: '22-Generate Parentheses	'
date: 01 July 2020

---
## 题意
> Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses. 
>
> Example 1:
> - Input: n = 3
> - Output: ["((()))","(()())","(())()","()(())","()()()"]
>
> Example 2:
> - Input: n = 1
> - Output: ["()"] 
>
> Constraints:1 <= n <= 8

## 思路
- 回溯法+剪枝。
- 剪枝原则：放了左括号才能放右括号，left 代表还能放左括号的个数，right 代表还能放右括号的个数

~~~python
class Solution(object):
    def generateParenthesis(self, n):
        """
        :type n: int
        :rtype: List[str]
        """
          
        res = [] 
        
        def dfs(tmp, left, right):
            if len(tmp) == 2 * n: #左右全用上了 
                res.append(tmp)

            if left: # 先控制左括号的数量：加入左括号
                dfs(tmp + "(", left - 1, right)
            if right > left: # 控制右括号的数量：保证已经放入的右括号少于左括号
                dfs(tmp + ")", left, right - 1)
        
        dfs("", n, n)
        return res

~~~

## 分析
- Time: O(n!)或（2^n）
- Space: O(n)
