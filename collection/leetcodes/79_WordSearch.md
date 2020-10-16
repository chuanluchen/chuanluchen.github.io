---
layout: project
title: '79-Word Search'
date: 01 July 2020

---
## 题意
> Given a 2D board and a word, find if the word exists in the grid.
> The word can be constructed from letters of sequentially adjacent cells, where "adjacent" cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

~~~python
Example 1:
Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
Output: true

Example 2:
Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
Output: true
~~~

## 思路
- DFS + flood fill
- 找一个字母，做标记 -> 上下左右继续找

~~~python
class Solution(object):
    def exist(self, board, word):
        """
        :type board: List[List[str]]
        :type word: str
        :rtype: bool
        """
        for i in range(len(board)):
            for j in range(len(board[0])):
                if self.dfs_search(board, i, j, word, 0):
                    return True
        return False
    
    def dfs_search(self, board, i, j, word, index):
        if index >= len(word): return True
        if i < 0 or i >= len(board) or j < 0 or j >= len(board[0]): return False
        if board[i][j] ==  word[index] :
            index += 1
            copy = board[i][j]
            board[i][j] = '#'
            res = self.dfs_search(board, i-1, j, word, index) or self.dfs_search(board, i+1, j, word, index) or  self.dfs_search(board, i, j-1, word, index) or self.dfs_search(board, i, j+1, word, index)
            board[i][j] = copy
            return res
        
        return False
~~~
