---
layout: project
title: '147-Insertion Sort List'
date: 01 July 2020

---
## 题意
> Sort a linked list using insertion sort.
> A graphical example of insertion sort. The partial sorted list (black) initially contains only the first element in the list.
> With each iteration one element (red) is removed from the input data and inserted in-place into the sorted list


~~~python
Example 1:
Input: 4->2->1->3
Output: 1->2->3->4

Example 2:
Input: -1->5->3->4->0
Output: -1->0->3->4->5
~~~

## 思路
- 链表实现insertion sort
- 找升序序列的结尾cur, 将后一个元素temp插入到前面合适位置
  - 找pre位置
  - 使用pre, cur, temp改变指针
 <img src="/assets/img/projects/code/147_InsertionSortList.jpeg"/>


~~~python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def insertionSortList(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        
        if not head or not head.next: return head
        
        dummy = ListNode(0)
        dummy.next = head
        cur = head
        
        # 找升序的最后一个位置cur
        # temp: 需要插入到前面
        while cur and cur.next: 
            if cur.val <= cur.next.val:cur = cur.next
            else:
                temp = cur.next
                cur.next = temp.next
                # 找插入的前一个位置：pre
                pre = dummy
                while pre.next.val <= temp.val: # !!!找Pre.next.val
                    pre = pre.next
                temp.next = pre.next
                pre.next = temp
        return dummy.next
~~~

## 分析:
- Time: O(n^2) 
- Space: O(1) 
