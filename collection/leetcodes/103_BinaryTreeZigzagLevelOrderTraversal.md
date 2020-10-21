---
layout: project
title: '103-Binary Tree Zigzag Level Order Traversal'
date: 01 July 2020

---
## 题意
> Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).

~~~python
For example:
Given binary tree [3,9,20,null,null,15,7],
    3
   / \
  9  20
    /  \
   15   7
return its zigzag level order traversal as:
[
  [3],
  [20,9],
  [15,7]
]
~~~

## 思路
- 树：层次遍历
- 加入层数：控制加入res是正序还是倒序

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def zigzagLevelOrder(self, root):
        """
        :type root: TreeNode
        :rtype: List[List[int]]
        """
        res = []
        if not root:return res
        queue =[root]
        row_num = 0
        while queue:
            size = len(queue)
            level = []
            for i in range(size):
                cur = queue.pop(0)
                if cur.left: queue.append(cur.left)
                if cur.right: queue.append(cur.right)
                level.append(cur.val)
            if row_num % 2 == 0: 
                res.append(level)
            else:
                res.append(level[::-1])
            row_num += 1
        return res
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
