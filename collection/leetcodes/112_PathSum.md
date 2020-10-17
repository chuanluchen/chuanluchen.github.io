---
layout: project
title: '112-Path Sum'
date: 01 July 2020

---
## 题意
> Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.
> Note: A leaf is a node with no children.
> return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.

~~~python
Given the below binary tree and sum = 22,

      5
     / \
    4   8
   /   / \
  11  13  4
 /  \      \
7    2      1
~~~

## 思路
- 双pre：两个先序遍历，同时左右开工的走
- 每走一层，sum减去root.val

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def hasPathSum(self, root, sum):
        """
        :type root: TreeNode
        :type sum: int
        :rtype: bool
        """
        if not root: return False
        if not root.left and not root.right: # 走到头，结束条件
            return sum == root.val # 每走一层，sum-当前root值
        
        return self.hasPathSum(root.left, sum-root.val) or self.hasPathSum(root.right, sum-root.val)
   
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
