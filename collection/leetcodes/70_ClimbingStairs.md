---
layout: project
title: '70-Climbing Stairs'
date: 01 July 2020

---
## 题意
> You are climbing a stair case. It takes n steps to reach to the top.
> Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

~~~python
Example 1:
Input: 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps

Example 2:
Input: 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step
~~~

## 思路
- 递归：相当于fibonacci -> 从n=0开始 1, 1, 2, 3, 5...
- 递归会超时，迭代必须掌握

~~~python
def climbStairs1(n):
    """
    :type n: int
    :rtype: int
    """
    if n == 0 or n == 1:
        return 1
    return climbStairs1(n - 1) + climbStairs1(n - 2)

# 迭代
def climbStairs2(self, n):
        a = b = 1
        for i in range(n): 
            a, b = b, a + b
        return a
~~~

## 分析:
- Time: O(2^n)    O(n)
- Space: O(n)     O(1)
