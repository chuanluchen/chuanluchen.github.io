---
layout: project
title: '86-Partition List'
date: 01 July 2020

---
## 题意
> Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.
> You should preserve the original relative order of the nodes in each of the two partitions.

~~~python
Example:
Input: head = 1->4->3->2->5->2, x = 3
Output: 1->2->2->4->3->5
~~~

## 思路
- 链表
- 建立两个LinkedList: small/ large
- 遍历：小于x的，在small中创建新节点；大于x的，在large中创建新节点
- small, large连起来

~~~python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def partition(self, head, x):
        """
        :type head: ListNode
        :type x: int
        :rtype: ListNode
        """        
        if not head or not head.next: return head
        
        small = ListNode(0)
        large = ListNode(0)
        small_cur = small
        large_cur = large
        
        while head:
            cur_val = head.val
            if cur_val < x:
                small_cur.next = ListNode(cur_val)
                small_cur = small_cur.next
            else:
                large_cur.next = ListNode(cur_val)
                large_cur = large_cur.next
            head = head.next
        
        # small/ large连起来
        small_cur.next = large.next
        return small.next
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
