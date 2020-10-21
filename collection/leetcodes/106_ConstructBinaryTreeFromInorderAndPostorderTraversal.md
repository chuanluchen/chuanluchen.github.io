---
layout: project
title: '106-Construct Binary Tree from Inorder and Postorder Traversal'
date: 01 July 2020

---
## 题意
> Given inorder and postorder traversal of a tree, construct the binary tree.
> Note: You may assume that duplicates do not exist in the tree.

~~~python
For example, given
inorder = [9,3,15,20,7]
postorder = [9,15,7,20,3]
Return the following binary tree:
    3
   / \
  9  20
    /  \
   15   7
~~~

## 思路
- 树的实现题
- 根据postorder/ inorder建树
- 递归：先找root，再找左右子树的postorder/inorder-> 递归
- 同105

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def buildTree(self, inorder, postorder):
        """
        :type inorder: List[int]
        :type postorder: List[int]
        :rtype: TreeNode
        """
        # inorder: 左左左中右右右
        # postorder:左左左右右右中
        if not postorder:return None
        
        root = TreeNode(postorder[-1])
        root_index = inorder.index(root.val)   
        left_in = inorder[:root_index]
        right_in = inorder[root_index + 1:]
        
        l_left = len(left_in)       
        left_pos = postorder[:l_left]
        right_pos = postorder[l_left : -1]
        
        root.left = self.buildTree(left_in, left_pos)
        root.right = self.buildTree(right_in, right_pos)
        
        return root
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
