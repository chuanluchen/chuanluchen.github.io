---
layout: project
title: '145-Binary Tree Postorder Traversal'
date: 01 July 2020

---
## 题意
> Given the root of a binary tree, return the postorder traversal of its nodes' values.

## 思路
- 树的后序遍历

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def postorderTraversal(self, root):
        """
        :type root: TreeNode
        :rtype: List[int]
        """
        res = []
        if root == None: return res
        stack = [root]
        while stack:
            cur = stack.pop()
            res.insert(0,cur.val)
            if cur.left: stack.append(cur.left)
            if cur.right: stack.append(cur.right)
        return res
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
