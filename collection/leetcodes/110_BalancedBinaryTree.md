---
layout: project
title: '110-Balanced Binary Tree'
date: 01 July 2020

---
## 题意
> Given a binary tree, determine if it is height-balanced.
> For this problem, a height-balanced binary tree is defined as: a binary tree in which the left and right subtrees of every node differ in height by no more than 1.
~~~python
Example 1:
Given the following tree [3,9,20,null,null,15,7]:
     
          3
         / \
        9  20
          /  \
         15   7
Return true.

Example 2:
 Given the following tree [1,2,2,3,3,null,null,4,4]:
             1
            / \
           2   2
          / \
         3   3
        / \
       4   4
Return false.
~~~

## 思路
- 树：PostOrder
- 分别求左子树高度，右子树高度，diff<1
- 求子树高度：max(left, right) + 1

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def isBalanced(self, root):
        """
        :type root: TreeNode
        :rtype: bool
        """
        if not root: return True
        return self.helper(root) != -1
    
    # 计算高度
    def helper(self, root):
        if not root: return 0
        left = self.helper(root.left)
        right = self.helper(root.right)
        if left==-1 or right == -1 or abs(left - right) > 1: # 左右不平衡：-1
            return -1 # 避免左右子树已经是不平衡的
        return max(left, right) + 1 # 左右取最大+1
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
