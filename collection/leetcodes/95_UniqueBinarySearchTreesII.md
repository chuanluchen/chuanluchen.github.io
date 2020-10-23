---
layout: project
title: '95-Unique Binary Search Trees II'
date: 01 July 2020

---
## 题意
> Given an integer n, generate all structurally unique BST's (binary search trees) that store values 1 ... n.

~~~python
Example:
Input: 3
Output:
[
  [1,null,3,2],
  [3,2,null,1],
  [3,1,null,null,2],
  [2,1,3],
  [1,null,2,null,3]
]
Explanation:
The above output corresponds to the 5 unique BST's shown below:

   1         3     3      2      1
    \       /     /      / \      \
     3     2     1      1   3      2
    /     /       \                 \
   2     1         2                 3
~~~
- Constraint
  - 0 <= n <= 8

## 思路
- DFS  + 回溯

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def generateTrees(self, n):
        """
        :type n: int
        :rtype: List[TreeNode]
        """
        if n==0: return []
        return self.helper(1, n)
    
    def helper(self, start, end):
        res = []
        if start > end: # 此时没有数字
            res.append(None)
            return res
        for i in range(start, end + 1): # 遍历start -> end， 尝试把每一个数i作为root
            # 所有可能的左子树
            left_list = self.helper(start, i-1)
            # 所有可能的右子树
            right_list = self.helper(i + 1, end)
            
            # 左右子树两两结合
            for l in left_list:
                for r in right_list:
                    root = TreeNode(i)
                    root.left = l
                    root.right = r
                    res.append(root)
        return res
~~~
