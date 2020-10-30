---
layout: project
title: '92-Reverse Linked List II'
date: 01 July 2020

---
## 题意
> Reverse a linked list from position m to n. Do it in one-pass.
> Note: 1 ≤ m ≤ n ≤ length of list.

~~~python
Example:
Input: 1->2->3->4->5->NULL, m = 2, n = 4
Output: 1->4->3->2->5->NULL
~~~


## 思路
- 链表反转
- 先走到需要反转的地方
- 局部反转
<img src="/assets/img/projects/code/92_ReverseLinkedListII.jpeg"/>


~~~python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def reverseBetween(self, head, m, n):
        """
        :type head: ListNode
        :type m: int
        :type n: int
        :rtype: ListNode
        """
        dummy = ListNode(0)
        dummy.next  = head
        
        # pre走m-1步，走到反转节点前一个
        pre = dummy
        for i in range(m-1):
            pre = pre.next
        
        # 找到反转第一个节点
        cur = pre.next
        
        # 局部反转:n-m次
        for i in range(n - m):
            temp = cur.next
            cur.next = temp.next
            temp.next = pre.next
            pre.next = temp
        
        return dummy.next
            
~~~

## 分析:
- Time: O(n) 
- Space: O(1) 
