---
layout: project
title: '2-Add Two Numbers'
date: 01 July 2020

---
## 题意
> You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
> You may assume the two numbers do not contain any leading zero, except the number 0 itself.

~~~python
Example 1:
Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807.

Example 2:
Input: l1 = [0], l2 = [0]
Output: [0]
~~~

## 思路
- 链表 + 数组
- 链表按照个，十，百...顺序储存数字
- 按此顺序将数位各自相加，进行进位处理，形成链表
- 最后处理进位特殊情况： 10000

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Fchuanluchen%2FLeetCode%2Fblob%2Fmain%2F_2_AddTwoNumbers.py&style=hopscotch&showBorder=on&showFileMeta=on"></script>

## 分析:
- Time: O(n) 
- Space: O() 
