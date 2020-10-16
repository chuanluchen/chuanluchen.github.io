---
layout: project
title: '200-Number of Islands'
date: 01 July 2020

---
## 题意
> Given an m x n 2d grid map of '1's (land) and '0's (water), return the number of islands.
> An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. 
> You may assume all four edges of the grid are all surrounded by water.
~~~python
Example 1:
Input: grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]

Example 2:
Input: grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
Output: 3
~~~

>Constraints:
> - m == grid.length
> - n == grid[i].length
> - 1 <= m, n <= 300
> - grid[i][j] is '0' or '1'.

## 思路
- 遍历数组grid
- 遇到一个1，用DFS把周围都标记为0,相连的陆地相当于一个岛
- 对DFS的次数进行count，就是岛的数目。
- DFS的作用：已知当前是1，把它周围相邻的所有1全部转成0.

~~~python
class Solution(object):
    def numIslands(self, grid):
        """
        :type grid: List[List[str]]
        :rtype: int
        """
        if not grid: return 0
        m  = len(grid)
        n = len(grid[0])
        res = 0
        
        for i in range(m):
            for j in range(n):
                if grid[i][j] == '1':
                    self.fillDFS(grid, i, j)
                    res += 1
        return res
    
    def fillDFS(self,grid,i,j):
        if i < 0 or j < 0 or i >= len(grid) or j >= len(grid[0]) or grid[i][j]=="0":
            return 
        
        grid[i][j] = "0"
        self.fillDFS(grid,i-1,j)
        self.fillDFS(grid,i+1,j)
        self.fillDFS(grid,i,j-1)
        self.fillDFS(grid,i,j+1)     
~~~

## 分析
- Time: O(K * m * n)  K表示1的个数，fillDFS遍历的是1的个数，m / n 嵌套for循环
- Space: O（K） 在fillDFS算法中需要开辟K（K个1）个栈空间，最差情况是走完全部O（m * n）
