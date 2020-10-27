---
layout: project
title: '96-Unique Binary Search Trees'
date: 01 July 2020

---
## 题意
> Given n, how many structurally unique BST's (binary search trees) that store values 1 ... n?

~~~python
Example:
Input: 3
Output: 5
Explanation:
Given n = 3, there are a total of 5 unique BST's:

   1         3     3      2      1
    \       /     /      / \      \
     3     2     1      1   3      2
    /     /       \                 \
   2     1         2                 3
~~~

## 思路
- 动态规划
- 先初始化状态矩阵
- 再找状态转移函数

<img src="/assets/img/projects/code/96_UniqueBST.jpeg"/>

~~~python
class Solution(object):
    def numTrees(self, n):
        """
        :type n: int
        :rtype: int
        """
        dp = [0] * (n+1)
        
        dp[0] = 1
        dp[1] = 1
        
        for i in range(2, n + 1):
            for j in range(1, i+1): # 以每一个点为root
                left = j - 1
                right = i - j
                dp[i] += dp[left] * dp[right]
                
        return dp[n]
~~~
