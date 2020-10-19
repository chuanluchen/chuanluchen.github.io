---
layout: project
title: '111-Minimum Depth of Binary Tree'
date: 01 July 2020

---
## 题意
> Given a binary tree, find its minimum depth.
> The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
> Note: A leaf is a node with no children.

~~~python
 Example:
 Given binary tree [3,9,20,null,null,15,7],
   
          3
         / \
        9  20
          /  \
         15   7 
 return its minimum depth = 2 -> 3, 9
~~~

## 思路
- 树：双pre，同时走两边
- root到最近的叶子节点：一共走的节点数

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def minDepth(self, root):
        """
        :type root: TreeNode
        :rtype: int
        """
        if not root: return 0  
        if root.left == None or root.right==None:  #一边为空的情况：左边为空，走右边； 右边为空，走左边 -> 取max + root自己
            return max(self.minDepth(root.left), self.minDepth(root.right)) + 1
        return min(self.minDepth(root.left), self.minDepth(root.right)) +1 # 左右都有，两边走 -> 取min + root自己
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
