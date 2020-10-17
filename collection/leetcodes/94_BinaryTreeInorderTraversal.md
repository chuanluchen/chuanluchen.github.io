---
layout: project
title: '94-Binary Tree Inorder Traversal'
date: 01 July 2020

---
## 题意
> Given the root of a binary tree, return the inorder traversal of its nodes' values.

## 思路
- 树的中序遍历
- stack实现：不断的把左子树加入stack, 走到头 -> pop出 -> 走右边

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def inorderTraversal(self, root):
        """
        :type root: TreeNode
        :rtype: List[int]
        """
        res = []
        if root== None: return res
        
        stack=[]
        cur = root
        while stack or cur:
            if cur:
                stack.append(cur) 
                cur = cur.left
            else:
                cur = stack.pop()
                res.append(cur.val)
                cur = cur.right
        return res
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
