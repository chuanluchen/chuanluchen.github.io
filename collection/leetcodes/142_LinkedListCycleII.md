---
layout: project
title: '142-Linked List Cycle II'
date: 01 July 2020

---
## 题意
> Given a linked list, return the node where the cycle begins. If there is no cycle, return null.
> There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.
> Notice that you should not modify the linked list.
> Follow up: Can you solve it using O(1) (i.e. constant) memory?

~~~python
Example 1:
Input: head = [3,2,0,-4], pos = 1
Output: tail connects to node index 1
Explanation: There is a cycle in the linked list, where tail connects to the second node.

Example 2:
Input: head = [1,2], pos = 0
Output: tail connects to node index 0
Explanation: There is a cycle in the linked list, where tail connects to the first node.
~~~


## 思路
- 链表 + 快慢针
<img src="/assets/img/projects/code/142_LinkedListCycleII.jpeg"/>


~~~python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def detectCycle(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        if not head or not head.next: return None
        
        # 先用快慢针判断环：找相遇点
        slow, fast = head, head
        while fast and fast.next:
            slow =  slow.next
            fast = fast.next.next
            if slow == fast: # 在相遇点再放一个slow
                slow2 = head
                while slow and slow.next:
                    if slow == slow2:return slow # 判断写前面
                    slow = slow.next
                    slow2 = slow2.next
                    
        return None
            
~~~

## 分析:
- Time: O(n) 
- Space: O(1) 
