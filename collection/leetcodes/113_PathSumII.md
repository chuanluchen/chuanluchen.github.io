---
layout: project
title: '113-Path Sum II'
date: 01 July 2020

---
## 题意
> Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.
> Note: A leaf is a node with no children.

~~~python
Example:

Given the below binary tree and sum = 22,

      5
     / \
    4   8
   /   / \
  11  13  4
 /  \    / \
7    2  5   1
Return:

[
   [5,4,11,2],
   [5,8,4,5]
]
~~~

## 思路
- 树的pre order遍历 + 回溯法

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def pathSum(self, root, sum):
        """
        :type root: TreeNode
        :type sum: int
        :rtype: List[List[int]]
        """
        res = []
        if not root: return res
        
        # 回溯法：对左右子树分别调用
        def backtrack(res, temp, root, sum):
            if not root: return
            temp.append(root.val)
            if not root.left and not root.right: # 结束条件：一路找到叶子节点
                if sum == root.val: # 符合sum:加入结果
                    res.append(temp[:])
                    
            backtrack(res, temp, root.left, sum-root.val)
            backtrack(res, temp, root.right, sum-root.val)
            temp.pop()
            
            
        backtrack(res, [], root, sum)
        return res
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
