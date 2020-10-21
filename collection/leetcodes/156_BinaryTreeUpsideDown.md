---
layout: project
title: '156-Binary Tree Upside Down'
date: 01 July 2020

---
## 题意
> Given the root of a binary tree, turn the tree upside down and return the new root.
> You can turn a binary tree upside down with the following steps:
> - The original left child becomes the new root.
> - The original root becomes the new right child.
> - The original right child becomes the new left child.

~~~python
Flip upside down: 把4变成根节点，5成为左孩子，2成为右孩子
          1                  1
         / \                /
        2   3   -->        2 -> 3
       / \                /
      4   5              4 -> 5
~~~

## 思路
- 树 + 链表
- 递归调用

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def upsideDownBinaryTree(self, root):
        """
        :type root: TreeNode
        :rtype: TreeNode
        """
        if not root or (not root.left and not root.right): return root
        
        # 多层需要递归:对每一层left做变换        
        newRoot = self.upsideDownBinaryTree(root.left)
        # root.left成为root
        # root.right成为left
        # root成为right -> root成为叶子节点
        
        # 新              # 原
        root.left.left = root.right
        root.left.right = root
        root.left= None
        root.right = None
        
        return newRoot
~~~
