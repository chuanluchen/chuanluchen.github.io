---
layout: project
title: '101-Symmetric Tree'
date: 01 July 2020

---
## 题意
> Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

~~~python
For example, this binary tree [1,2,2,3,4,4,3] is symmetric:

    1
   / \
  2   2
 / \ / \
3  4 4  3
 

But the following [1,2,2,null,3,null,3] is not:
    1
   / \
  2   2
   \   \
   3    3
~~~

## 思路
- 树：双pre，同时走两边
- 调用100 isSameTree: 看Node左边和右边是否相同

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def isSymmetric(self, root):
        """
        :type root: TreeNode
        :rtype: bool
        """
        if not root: return True
        return self.isSameTree(root.left, root.right)
    
    def isSameTree(self, p, q):
        if p==None and q==None: return True
        if p==None or q==None: return False
        if p.val != q.val: return False
        return self.isSameTree(p.left, q.right) and self.isSameTree(p.right, q.left) # 注意：左右镜像对比
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
