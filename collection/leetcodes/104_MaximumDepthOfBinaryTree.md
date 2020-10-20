---
layout: project
title: '104-Maximum Depth of Binary Tree'
date: 01 July 2020

---
## 题意
> Given a binary tree, find its maximum depth.
> The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
> Note: A leaf is a node with no children.

~~~python
Given binary tree [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
return its depth = 3.
~~~

## 思路
- 树 postOrder
- 分别找左/右最大深度，取最大值 +1

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def maxDepth(self, root):
        """
        :type root: TreeNode
        :rtype: int
        """
        if not root: return 0
        left = self.maxDepth(root.left)
        right = self.maxDepth(root.right)
        return max(left, right) +  1
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
