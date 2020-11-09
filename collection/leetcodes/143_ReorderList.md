---
layout: project
title: '143-Reorder List'
date: 01 July 2020

---
## 题意
> Given a singly linked list L: L0→L1→…→Ln-1→Ln,
> reorder it to: L0→Ln→L1→Ln-1→L2→Ln-2→…
> You may not modify the values in the list's nodes, only nodes itself may be changed.

~~~python
Example 1:
Given 1->2->3->4, reorder it to 1->4->2->3.

Example 2:
Given 1->2->3->4->5, reorder it to 1->5->2->4->3.

~~~

## 思路
- 链表 综合问题
- 找中点，分成两个链表l1,l2
- reverse l2
- insert l2 into l1

~~~python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def reorderList(self, head):
        """
        :type head: ListNode
        :rtype: None Do not return anything, modify head in-place instead.
        """
        if not head or not head.next: return head
        
        middle = self.getMiddle(head)
        l1 = head
        l2 = middle.next
        middle.next = None
        l2 = self.reverse(l2)
        return self.insert(l1, l2)
    
    
    def getMiddle(self,head):
        slow, fast = head, head
        while fast.next and fast.next.next:
            slow = slow.next
            fast = fast.next.next
        return slow
    
    def reverse(self,head):
        # 反转指针
        # pre    head   temp
        # <-------
        pre = None
        while head:
            temp = head.next
            head.next = pre
            pre, head = head, temp
        return pre
        
    def insert(self, a, b):
        #  a    a.next
        #  1 -> 2 -> 3
        #  4 -> 5 -> 6
        #  bHead
        while a and b:
            bHead = b
            b = b.next
            bHead.next = a.next
            a.next = bHead
            a = a.next.next # a往后走两个      
        return a
~~~

## 分析:
- Time: O(n) 
- Space: O(1) 
