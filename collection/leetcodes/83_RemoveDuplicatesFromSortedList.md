---
layout: project
title: '83-Remove Duplicates From Sorted List'
date: 01 July 2020

---
## 题意
> Given a sorted linked list, delete all duplicates such that each element appear only once.

~~~python
Example 1:
Input: 1->1->2
Output: 1->2

Example 2:
Input: 1->1->2->3->3
Output: 1->2->3
~~~

## 思路
- 链表
- 遍历：判断cur.val == cur.next.val
  - 重复：连到下一个点
  - 不重复：往后走

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Fchuanluchen%2FLeetCode%2Fblob%2Fmain%2F_83_RemoveDuplicatesFromSortedList.py&style=hopscotch&showBorder=on&showFileMeta=on"></script>

## 分析:
- Time: O(n) 
- Space: O(1) 
