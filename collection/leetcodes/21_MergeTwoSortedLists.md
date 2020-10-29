---
layout: project
title: '21-Merge Two Sorted Lists'
date: 01 July 2020

---
## 题意
> Merge two sorted linked lists and return it as a new sorted list. The new list should be made by splicing together the nodes of the first two lists.

~~~python
Example 1:
Input: l1 = [1,2,4], l2 = [1,3,4]
Output: [1,1,2,3,4,4]

Example 2:
Input: l1 = [], l2 = []
Output: []

Example 3:
Input: l1 = [], l2 = [0]
Output: [0]
~~~

## 思路
- 链表
- 创建一个新链表保存结果
- 遍历两个list, 小的放入链表
- 两个list有剩余的接上

~~~python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def mergeTwoLists(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        
        dummy = ListNode(0)
        cur = dummy
        
        while l1 and l2:
            if l1.val < l2.val:
                cur.next = ListNode(l1.val)
                l1 = l1.next
            else:
                cur.next = ListNode(l2.val)
                l2 = l2.next
            cur = cur.next
            
        # l1或l2有剩余，接到dummy上
        if l1: cur.next = l1
        if l2: cur.next = l2
            
        return dummy.next
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
