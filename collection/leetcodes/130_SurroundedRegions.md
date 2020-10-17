---
layout: project
title: '130-Surrounded Regions'
date: 01 July 2020

---
## 题意
> Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.
> A region is captured by flipping all 'O's into 'X's in that surrounded region.

~~~python
Example:
X X X X
X O O X
X X O X
X O X X

After running your function, the board should be:

X X X X
X X X X
X X X X
X O X X
~~~

> Explanation:
> Surrounded regions shouldn’t be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.

## 思路
- 把被 X 围起来的 O 变成 X，边界的 O 一定不会被围起来 -> 如果 O 和边界的 O 连通起来，那么这些 O 就都算作不被围起来
- 先找边界上的的O
  - 对边界上的O做DFS，把遇到的O标记为# -> 这些#就是可以连通到边界的
- 遍历所有节点，把剩下的O改成X
- 把#改回O

~~~python
class Solution(object):
    def solve(self, board):
        """
        :type board: List[List[str]]
        :rtype: None Do not return anything, modify board in-place instead.
        """
        if not board or len(board) == 0: return
        
        rows, cols = len(board), len(board[0])
        
        # 遍历columns
        for i in range(cols):
            if board[0][i] == 'O': self.dfs(0, i, board)  # 最上面一行
            if board[rows-1][i] == 'O': self.dfs(rows-1, i, board) # 最下面一行
        
        # 遍历rows
        for i in range(rows):
            if board[i][0] == 'O': self.dfs(i, 0, board) #最左边一列
            if board[i][cols-1] == 'O': self.dfs(i, cols-1, board) # 最右边一列
                
        for i in range(rows):
            for j in range(cols):
                if board[i][j] == '#': 
                    board[i][j] ='O'
                elif board[i][j] == 'O':
                    board[i][j] = 'X'
                    
    def dfs(self, i, j, board):
        if i < 0 or j < 0 or i== len(board) or j== len(board[0]):
            return
        
        if board[i][j] == '#': return
        
        if board[i][j] == 'O':
            board[i][j] = '#'
            self.dfs(i-1, j, board)
            self.dfs(i+1, j, board)
            self.dfs(i, j-1, board)
            self.dfs(i, j+1, board)
~~~

## 分析
- time : O(m * n)
- space : O(n)
