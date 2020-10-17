---
layout: project
title: '144-Binary Tree Preorder Traversal'
date: 01 July 2020

---
## 题意
> Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
> 先序遍历

## 思路
- 树的先序遍历

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def preorderTraversal(self, root):
        """
        :type root: TreeNode
        :rtype: List[int]
        """
        
        res = []
        if root == None: return res
        
        stack = [root]
        while stack:
            cur = stack.pop()
            res.append(cur.val)
            if cur.right: stack.append(cur.right)
            if cur.left: stack.append(cur.left)
        return res
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
