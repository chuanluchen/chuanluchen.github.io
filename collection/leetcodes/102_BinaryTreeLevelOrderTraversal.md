---
layout: project
title: '102-Binary Tree Level Order Traversal'
date: 01 July 2020

---
## 题意
> Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

~~~python
For example:
Given binary tree [3,9,20,null,null,15,7],
    3
   / \
  9  20
    /  \
   15   7
return its level order traversal as:
[
  [3],
  [9,20],
  [15,7]
]
~~~

## 思路
- 树的层次遍历

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def levelOrder(self, root):
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
            res.append(level)
        return res
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
