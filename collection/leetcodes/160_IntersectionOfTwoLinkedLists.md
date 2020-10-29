---
layout: project
title: '160-Intersection of Two Linked Lists'
date: 01 July 2020

---
## 题意
> Write a program to find the node at which the intersection of two singly linked lists begins.
> For example, the following two linked lists:

~~~python
Example 1:
Input: intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3
Output: Reference of the node with value = 8
Input Explanation: The intersected node's value is 8 (note that this must not be 0 if the two lists intersect). From the head of A, it reads as [4,1,8,4,5]. From the head of B, it reads as [5,6,1,8,4,5]. There are 2 nodes before the intersected node in A; There are 3 nodes before the intersected node in B.

Example 2:
Input: intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
Output: Reference of the node with value = 2
Input Explanation: The intersected node's value is 2 (note that this must not be 0 if the two lists intersect). From the head of A, it reads as [1,9,1,2,4]. From the head of B, it reads as [3,2,4]. There are 3 nodes before the intersected node in A; There are 1 node before the intersected node in B.
~~~

## 思路
- 链表
- 计算两个链表的长度
- 让长的那个先走lenA-lenB步
- A, B同时走，直到遇见相同节点
        

~~~python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def getIntersectionNode(self, headA, headB):
        """
        :type head1, head1: ListNode
        :rtype: ListNode
        """

        if not headA or not headB: return None
        
        def getLength(head):
            length = 1
            cur = head
            while cur:
                cur = cur.next
                length += 1
            return length
        
        len_A = getLength(headA)
        len_B = getLength(headB)
        
    
        diff = abs(len_A - len_B)
        if len_A > len_B:
            while diff > 0:
                headA = headA.next
                diff -= 1
        else:
            while diff > 0:
                headB = headB.next
                diff -= 1
                
        while headA != headB:
            headA = headA.next
            headB = headB.next
        return headA
~~~

## 分析:
- Time: O(n) 
- Space: O(1) 
