---
layout: project
title: '23-Merge k Sorted Lists'
date: 01 July 2020

---
## 题意
> You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
> Merge all the linked-lists into one sorted linked-list and return it.


~~~python
Example 1:
Input: lists = [[1,4,5],[1,3,4],[2,6]]
Output: [1,1,2,3,4,4,5,6]
Explanation: The linked-lists are:
[
  1->4->5,
  1->3->4,
  2->6
]
merging them into one sorted list:
1->1->2->3->4->4->5->6

Example 2:
Input: lists = []
Output: []
~~~

## 思路
- 链表
- 不断将list pop出来，进行MergeTwoSortedList -> LeetCode 21
- merge结果insert into list

~~~python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def mergeKLists(self, lists):
        """
        :type lists: List[ListNode]
        :rtype: ListNode
        """
        
        
        if not lists: return None
        
        while len(lists) >1:
            a = lists.pop() if len(lists) > 0 else None
            b = lists.pop() if len(lists) > 0 else None
            lists.insert(0,self.mergeTwoLists(a, b))
            
        return lists[0]
    
    def mergeTwoLists(self, l1, l2):
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
            
        if l1: cur.next = l1
        if l2: cur.next = l2
        return dummy.next
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
