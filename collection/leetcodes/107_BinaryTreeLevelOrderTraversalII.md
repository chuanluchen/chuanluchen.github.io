---
layout: project
title: '107-Binary Tree Level Order Traversal II'
date: 01 July 2020

---
## 题意
> Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).

~~~python
For example:
Given binary tree [3,9,20,null,null,15,7],
    3
   / \
  9  20
    /  \
   15   7
return its bottom-up level order traversal as:
[
  [15,7],
  [9,20],
  [3]
]
~~~

## 思路
- 树：LevelOrder
- level放入res的时候用insert(0, xx)

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def levelOrderBottom(self, root):
        """
        :type root: TreeNode
        :rtype: List[List[int]]
        """
        res = []
        if not root: return res
        queue = [root]
        while queue:
            size = len(queue)
            level = []
            for i in range(size):
                cur = queue.pop(0)
                if cur.left: queue.append(cur.left)
                if cur.right: queue.append(cur.right)
                level.append(cur.val)
            res.insert(0,level)
        return res
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
