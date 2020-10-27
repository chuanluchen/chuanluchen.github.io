---
layout: project
title: '118-Pascal's Triangle'
date: 01 July 2020

---
## 题意
> Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.

~~~python
Example:

Input: 5
Output:
[
     [1],
    [1,1],
   [1,2,1],
  [1,3,3,1],
 [1,4,6,4,1]
]
~~~

## 思路
- 递归 + 暴力找规律
- 先在每行生成相应个数的1
- pascal三角规律：res[i][j] = res[i-1][j-1] + res[i-1][j]

~~~python
class Solution(object):
    def generate(self, numRows):
        """
        :type numRows: int
        :rtype: List[List[int]]
        """
        res = []
        # 遍历行：每行生成相应位数的1占位
        for i in range(numRows):
            res.append([1]*(i+1)) 
            for j in range(1, i): # 遍历列的中间项
                res[i][j] = res[i-1][j-1] + res[i-1][j]
        return res
~~~

## 分析:
- Time: O(n^2) 
- Space: O(n) 
