---
layout: project
title: '61-Rotate List'
date: 01 July 2020

---
## 题意
> Given a linked list, rotate the list to the right by k places, where k is non-negative.

~~~python
Example 1:
Input: 1->2->3->4->5->NULL, k = 2
Output: 4->5->1->2->3->NULL
Explanation:
rotate 1 steps to the right: 5->1->2->3->4->NULL
rotate 2 steps to the right: 4->5->1->2->3->NULL

Example 2:
Input: 0->1->2->NULL, k = 4
Output: 2->0->1->NULL
Explanation:
rotate 1 steps to the right: 2->0->1->NULL
rotate 2 steps to the right: 1->2->0->NULL
rotate 3 steps to the right: 0->1->2->NULL
rotate 4 steps to the right: 2->0->1->NULL
~~~

## 思路
- 链表
- 把链表做成环

<img src="/assets/img/projects/code/61_RotateList.jpeg"/>

~~~python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def rotateRight(self, head, k):
        """
        :type head: ListNode
        :type k: int
        :rtype: ListNode
        """
        if not head or not head.next: return head
        
        # 把链表做成环
        cur = head
        length = 1
        while cur.next:
            cur = cur.next
            length += 1
        cur.next = head
        
        # 正着走len-k  -> len - k%len
        # 走到新head前一个
        for i in range(1, length - k %length): # 注意边界
            head = head.next
        res = head.next
        head.next = None #截断链表
        return res
        
~~~

## 分析
- Time: O(n)
- Space: O(n)
