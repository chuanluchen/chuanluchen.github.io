---
layout: project
title: '237-Delete Node in a Linked List'
date: 01 July 2020

---
## 题意
> Write a function to delete a node in a singly-linked list. You will not be given access to the head of the list, instead you will be given access to the node to be deleted directly.
> It is guaranteed that the node to be deleted is not a tail node in the list.

~~~python
Example 1
Input: head = [4,5,1,9], node = 5
Output: [4,1,9]
Explanation: You are given the second node with value 5, the linked list should become 4 -> 1 -> 9 after calling your function.

Example 2
Input: head = [4,5,1,9], node = 1
Output: [4,5,9]
Explanation: You are given the third node with value 1, the linked list should become 4 -> 5 -> 9 after calling your function.
~~~

## 思路
- 链表删除
- 常规思路：找前一个节点->跳过当前节点连下一个
- 本题：不允许找上一个节点 -> 当期节点复制下一个节点，然后跳过下一节点

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Fchuanluchen%2FLeetCode%2Fblob%2Fmain%2F_237_DeleteNodeInALinkedList.py&style=hopscotch&showBorder=on&showFileMeta=on"></script>

## 分析:
- Time: O(1) 
- Space: O(1) 
