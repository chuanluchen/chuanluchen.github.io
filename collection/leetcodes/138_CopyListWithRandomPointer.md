---
layout: project
title: '138-Copy List with Random Pointer'
date: 01 July 2020

---
## 题意
> A linked list is given such that each node contains an additional random pointer which could point to any node in the list or null.
> Return a deep copy of the list.
> The Linked List is represented in the input/output as a list of n nodes. Each node is represented as a pair of [val, random_index] where:
> - val: an integer representing Node.val
> - random_index: the index of the node (range from 0 to n-1) where random pointer points to, or null if it does not point to any node.

~~~python
Example 1:
Input: 4->2->1->3
Output: 1->2->3->4

Example 2:
Input: head = [[1,1],[2,1]]
Output: [[1,1],[2,1]]
~~~

## 思路
- 链表 + Hashmap
- Deep copy of a linkedlist: 先用node.val创造node放入hashmap, 再update next/ random

~~~python
"""
# Definition for a Node.
class Node:
    def __init__(self, x, next=None, random=None):
        self.val = int(x)
        self.next = next
        self.random = random
"""

class Solution(object):
    def copyRandomList(self, head):
        """
        :type head: Node
        :rtype: Node
        """
        # 把node放入hashmap
        if not head: return head
        
        hashmap = dict()
        
        # 遍历链表, 把node放入hashmap:用cur.val make a new node
        cur = head
        while cur:
            hashmap[cur] = Node(cur.val, None, None)
            cur = cur.next
        
        # 再次遍历：更新next, random
        cur = head
        while cur:
            if cur.next: hashmap[cur].next = hashmap[cur.next]
            if cur.random: hashmap[cur].random = hashmap[cur.random]
            cur = cur.next  
        return hashmap[head]
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
