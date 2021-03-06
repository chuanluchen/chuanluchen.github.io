---
layout: project
title: '100-Same Tree'
date: 01 July 2020

---
## 题意
> Given two binary trees, write a function to check if they are the same or not.
> Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

~~~python
Example 1:
Input:     1         1
          / \       / \
         2   3     2   3

        [1,2,3],   [1,2,3]

Output: true

Example 2:
Input:     1         1
          /           \
         2             2

        [1,2],     [1,null,2]

Output: false

Example 3:
Input:     1         1
          / \       / \
         2   1     1   2

        [1,2,1],   [1,1,2]

Output: false
~~~

## 思路
- 树：双pre，同时走两边
- 递归调用


<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Fchuanluchen%2FLeetCode%2Fblob%2Fmain%2F_100_SameTree.py&style=hopscotch&showBorder=on&showFileMeta=on"></script>


## 分析:
- Time: O(n) 
- Space: O(n) 
