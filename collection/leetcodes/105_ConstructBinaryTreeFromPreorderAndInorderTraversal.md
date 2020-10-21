---
layout: project
title: '105-Construct Binary Tree from Preorder and Inorder Traversal'
date: 01 July 2020

---
## 题意
> Given preorder and inorder traversal of a tree, construct the binary tree.
> Note:You may assume that duplicates do not exist in the tree.

~~~python
For example, given
preorder = [3,9,20,15,7]
inorder = [9,3,15,20,7]
Return the following binary tree:

    3
   / \
  9  20
    /  \
   15   7
~~~

## 思路
- 树的实现题
- 根据preorder/ inorder建树
- 递归：先找root，再找左右子树的preorder/inorder-> 递归

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def buildTree(self, preorder, inorder):
        """
        :type preorder: List[int]
        :type inorder: List[int]
        :rtype: TreeNode
        """
        # 根据preorder/ inorder建树
        # preoder: 中左左左右右右
        # inorder：左左左中右右右
        # 找root，找left_pre, left_in, right_pre, right_in递归
        if not preorder or not inorder: return None
        root = TreeNode(preorder[0]) 
        root_index = inorder.index(root.val)
        left_in = inorder[:root_index]
        right_in = inorder[root_index + 1:]
        
        l_left = len(left_in)
        left_pre = preorder[1:l_left + 1]
        right_pre = preorder[l_left + 1:]
        
        #递归
        root.left = self.buildTree(left_pre, left_in)
        root.right = self.buildTree(right_pre, right_in)
        
        return root
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
