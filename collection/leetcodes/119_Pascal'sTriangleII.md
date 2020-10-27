---
layout: project
title: '119-Pascal's Triangle II'
date: 01 July 2020

---
## 题意
> Given an integer rowIndex, return the rowIndexth row of the Pascal's triangle.
> Notice that the row index starts from 0.

~~~python
Example 1:
Input: rowIndex = 3
Output: [1,3,3,1]

Example 2:
Input: rowIndex = 0
Output: [1]

Example 3:
Input: rowIndex = 1
Output: [1,1]
~~~

## 思路
- 递归 + 暴力找规律
- 同118，只返回指定行结果

~~~python
class Solution(object):
    def getRow(self, rowIndex):
        """
        :type rowIndex: int
        :rtype: List[int]
        """
        res = []
        for i in range(rowIndex+1): #注意要走到rowIndex
            res.append([1] * (i + 1))
            for j in range(1, i):
                res[i][j] = res[i-1][j-1]+res[i-1][j]
        return res[rowIndex]
~~~

## 分析:
- Time: O(n^2) 
- Space: O(n) 
