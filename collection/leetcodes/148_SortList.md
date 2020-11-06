---
layout: project
title: '148-Sort List'
date: 01 July 2020

---
## 题意
> Given the head of a linked list, return the list after sorting it in ascending order.
> Follow up: Can you sort the linked list in O(n logn) time and O(1) memory (i.e. constant space)?

~~~python
Example 1:
Input: head = [4,2,1,3]
Output: [1,2,3,4]

Example 2:
Input: head = [-1,5,3,4,0]
Output: [-1,0,3,4,5]
~~~

## 思路
- 链表 + 数组
- 链表版的MergeSort
  - 快慢针找中点
  - 对前一半/ 后一半递归sort
  - merge Sorted list


<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Fchuanluchen%2FLeetCode%2Fblob%2Fmain%2F_148_SortList.py&style=hopscotch&showBorder=on&showFileMeta=on"></script>

## 分析:
- Time: O(nlogn) 
- Space: O(1) 
