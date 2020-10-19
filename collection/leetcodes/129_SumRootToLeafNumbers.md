---
layout: project
title: '129-Sum Root to Leaf Numbers'
date: 01 July 2020

---
## 题意
> Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.
> An example is the root-to-leaf path 1->2->3 which represents the number 123.
> Find the total sum of all root-to-leaf numbers.
> Note: A leaf is a node with no children.

~~~python
Example:
Input: [1,2,3]
    1
   / \
  2   3
Output: 25
Explanation:
The root-to-leaf path 1->2 represents the number 12.
The root-to-leaf path 1->3 represents the number 13.
Therefore, sum = 12 + 13 = 25.

Example 2:
Input: [4,9,0,5,1]
    4
   / \
  9   0
 / \
5   1
Output: 1026
Explanation:
The root-to-leaf path 4->9->5 represents the number 495.
The root-to-leaf path 4->9->1 represents the number 491.
The root-to-leaf path 4->0 represents the number 40.
Therefore, sum = 495 + 491 + 40 = 1026.
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
    def sumNumbers(self, root):
        """
        :type root: TreeNode
        :rtype: int
        """
        # 数的表示前一个root.val* 10 +当前root.val
        return self.helper(root, 0)
    
    def helper(self, root, num):
        if root== None: return 0
        if root.left == None and root.right == None: # 走到叶子节点：得到当前数
            return num* 10 + root.val
        # 左右子树数值加起来
        return self.helper(root.left, num* 10 + root.val) + self.helper(root.right, num* 10 + root.val)
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
