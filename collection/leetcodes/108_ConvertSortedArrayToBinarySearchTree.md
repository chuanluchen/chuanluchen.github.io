---
layout: project
title: '108-Convert Sorted Array to Binary Search Tree'
date: 01 July 2020

---
## 题意
> Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
> For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
~~~python
  [1,2,3,4,5]
       3
    2      4
 1           5
~~~

## 思路
- 树：中序遍历的逆序
- 二分法：不断地找中点作为root, 对左右进行递归

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def sortedArrayToBST(self, nums):
        """
        :type nums: List[int]
        :rtype: TreeNode
        """
        if not nums:return None
        return self.helper(nums, 0, len(nums)-1)
             
    def helper(self, nums, left, right):
        if left> right:return 

        mid = (left + right) // 2
        root = TreeNode(nums[mid])
        root.left = self.helper(nums, left, mid-1)
        root.right = self.helper(nums, mid+1, right)
        return root

## 精简写法     
class Solution(object):
    def sortedArrayToBST(self, nums):
        """
        :type nums: List[int]
        :rtype: TreeNode
        """
        if not nums: return None
        l = len(nums)
        root = TreeNode(nums[l//2])
        root.left = self.sortedArrayToBST(nums[:l//2])
        root.right = self.sortedArrayToBST(nums[l//2+1:])
        return root
~~~

## 分析:
- Time: O(n) 
- Space:O(n)  栈空间O（logn）+ 创建所有节点O（n）
