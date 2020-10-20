---
layout: project
title: '109-Convert Sorted List to Binary Search Tree'
date: 01 July 2020

---
## 题意
> Given the head of a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.
> For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

## 思路
- 链表转成数组
- 套用108题做法

~~~python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def sortedListToBST(self, head):
        """
        :type head: ListNode
        :rtype: TreeNode
        """
        if not head:return None
        # 链表转成数组
        l = list()
        while(head):
            l.append(head.val)
            head = head.next
        return self.sortedArrayToBST(l)
        
    def sortedArrayToBST(self, nums):
        if not nums: return None
        l = len(nums)
        root = TreeNode(nums[l//2])
        root.left = self.sortedArrayToBST(nums[:l//2])
        root.right = self.sortedArrayToBST(nums[l//2+1:])
        return root
~~~

## 分析:
- Time: O(n) 
- Space:O(n) 
