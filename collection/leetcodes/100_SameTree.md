---
layout: project
title: '100-Same Tree'
date: 01 July 2020

---
## 题意
> Given two binary trees, write a function to check if they are the same or not.
> Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

~~~python
Example 1:
Input:     1         1
          / \       / \
         2   3     2   3

        [1,2,3],   [1,2,3]

Output: true

Example 2:
Input:     1         1
          /           \
         2             2

        [1,2],     [1,null,2]

Output: false

Example 3:
Input:     1         1
          / \       / \
         2   1     1   2

        [1,2,1],   [1,1,2]

Output: false
~~~

## 思路
- 树：双pre，同时走两边
- 递归调用

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def isSameTree(self, p, q):
        """
        :type p: TreeNode
        :type q: TreeNode
        :rtype: bool
        """
        if p==None and q==None: return True
        if p==None or q==None: return False
        if p.val != q.val: return False
        return self.isSameTree(p.left, q.left) and self.isSameTree(p.right, q.right)
~~~

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Fchuanluchen%2Fchuanluchen.github.io%2Fblob%2Fmain%2Fcollection%2Fleetcodes%2F_100_SameTree.py&style=github&showLineNumbers=on"></script>



## 分析:
- Time: O(n) 
- Space: O(n) 
