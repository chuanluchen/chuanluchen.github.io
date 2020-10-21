---
layout: project
title: '116-Populating Next Right Pointers in Each Node'
date: 01 July 2020

---
## 题意
> Given two binary trees, write a function to check if they are the same or not.
> Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

~~~python

struct Node {
  int val;
  Node *left;
  Node *right;
  Node *next;
}

Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.
Initially, all next pointers are set to NULL.

Example 
           1  -> Null
          /  \
         2 -> 3-> Null
        / \   / \
       4->5->6->7-> Null
~~~

> Follow up:
> - You may only use constant extra space.
> - Recursive approach is fine, you may assume implicit stack space does not count as extra space for this problem.

## 思路
- 树 + 链表
- 分情况讨论
- 递归处理每一层

~~~python
"""
# Definition for a Node.
class Node(object):
    def __init__(self, val=0, left=None, right=None, next=None):
        self.val = val
        self.left = left
        self.right = right
        self.next = next
"""

class Solution(object):
    def connect(self, root):
        """
        :type root: Node
        :rtype: Node
        """
        if not root or not root.left: return root
        
        # 对于每个root的左孩子：next指向右孩子
        root.left.next = root.right
        
        # 对于每个root的右孩子：
        # root有next: 指向相邻节点的左孩子
        # root没有next:Null
        if root.next:
            root.right.next = root.next.left
        else:
            root.right.next = None
            
        # 递归处理下一层
        self.connect(root.left)
        self.connect(root.right)
        
        return root
~~~

## 分析:
- Time: O(n) 
- Space: O(1) 递归用栈 
