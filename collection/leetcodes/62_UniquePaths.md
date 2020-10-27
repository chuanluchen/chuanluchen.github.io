---
layout: project
title: '62-Unique Paths'
date: 01 July 2020

---
## 题意
> A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
> The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
> How many possible unique paths are there?

~~~python
Example 1:
Input: m = 3, n = 7
Output: 28

Example 2:
Input: m = 3, n = 2
Output: 3
Explanation:
From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
1. Right -> Down -> Down
2. Down -> Down -> Right
3. Down -> Right -> Down

Example 3:
Input: m = 7, n = 3
Output: 28

Example 4:
Input: m = 3, n = 3
Output: 6
~~~

## 思路
- 动态规划
- dp[m][n]记录从起点走到当前位置的方法数
- 先初始化状态矩阵
- 再找状态转移函数

<img src="/assets/img/projects/code/62_UniquePaths.jpeg"/>

~~~python
class Solution(object):
    def uniquePaths(self, m, n):
        """
        :type m: int
        :type n: int
        :rtype: int
        """
        dp = [[0] * n]*m
        
        for i in range(m):
            dp[i][0] = 1
        
        for i in range(n):
            dp[0][i] = 1
            
        for i in range(1,m):
            for j in range(1, n):
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            
        return dp[m-1][n-1] #返回dp矩阵最后一格 dp[-1][-1]
        
~~~
