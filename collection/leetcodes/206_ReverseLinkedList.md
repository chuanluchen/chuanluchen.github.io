---
layout: project
title: '206-Reverse Linked List'
date: 01 July 2020

---
## 题意
> Reverse a singly linked list.

~~~python
Example:
Input: 1->2->3->4->5->NULL
Output: 5->4->3->2->1->NULL
~~~

> Follow up:
> - A linked list can be reversed either iteratively or recursively. Could you implement both?

## 思路
- 链表反转
- 最简便的方法：直接将指针反转
- 定位三个点: pre, cur, temp -> 迭代
<img src="/assets/img/projects/code/206_ReverseLinkedList.jpeg"/>

~~~python
        # 定位三个点: pre, cur, temp
        #   None   head   
        #    pre    cur     temp
        #        -->    -->
        #       <-------------
~~~


~~~python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def reverseList(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        if not head or not head.next: return head  
        
        pre, cur = None, cur # 定义pre, cur
        
        while cur:
            temp = cur.next # 定义temp
            temp.next  =  pre  # 反转
            pre = cur # 后移
            cur = temp # 后移
        return pre
~~~

## 分析:
- Time: O(n) 
- Space: O(1) 
