---
layout: project
title: '98-Validate Binary Search Tree'
date: 01 July 2020

---
## 题意
> Given a binary tree, determine if it is a valid binary search tree (BST).
> Assume a BST is defined as follows:
>   - The left subtree of a node contains only nodes with keys less than the node's key.
>   - The right subtree of a node contains only nodes with keys greater than the node's key.
>   - Both the left and right subtrees must also be binary search trees.

~~~python
Example 1:
    2
   / \
  1   3

Input: [2,1,3]
Output: true

Example 2:
    5
   / \
  1   4
     / \
    3   6

Input: [5,1,4,null,null,3,6]
Output: false
Explanation: The root node's value is 5 but its right child's value is 4.
~~~

## 思路
- 树：中序遍历
- 验证中序遍历后结果是升序，且没有重复元素

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def isValidBST(self, root):
        """
        :type root: TreeNode
        :rtype: bool
        """   
        inOrderSeq = self.inOrder(root)
        
        # 左 < 中 < 右
        # 没有重复元素
        return len(inOrderSeq) == len(set(inOrderSeq)) and inOrderSeq ==  sorted(inOrderSeq) 
        
    def inOrder(self, root):
        if not root: return[]
        return self.inOrder(root.left) + [root.val] +self.inOrder(root.right)
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
