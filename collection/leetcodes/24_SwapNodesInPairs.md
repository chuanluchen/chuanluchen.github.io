---
layout: project
title: '24-Swap Nodes in Pairs'
date: 01 July 2020

---
## 题意
> Given a linked list, swap every two adjacent nodes and return its head.
> You may not modify the values in the list's nodes. Only nodes itself may be changed.

~~~python
Example 1:
Input: head = [1,2,3,4]
Output: [2,1,4,3]

Example 2:
Input: head = []
Output: []

Example 3:
Input: head = [1]
Output: [1]
~~~

## 思路
- 树：双pre，同时走两边
- 递归调用

~~~python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def swapPairs(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        # 改变头节点，定义dummy
        dummy = ListNode(0)
        dummy.next = head
        
        # dummy  -->  1   -->   2  ---> 3
        #  pre   --> n1   -->   n2
        #      pre.next   pre.next.next
        #  注意swap节点顺序： 1->3 2->4 3->2                     
        
        pre = dummy
        while pre.next and pre.next.next:
            n1, n2 = pre.next,pre.next.next
            pre.next = n2
            n1.next = n2.next
            n2.next = n1
            pre = n1
        return dummy.next
        
~~~

## 分析:
- Time: O(n) 
- Space: O(1) 
