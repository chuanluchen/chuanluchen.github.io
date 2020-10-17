---
layout: project
title: '199-Binary Tree Right Side View'
date: 01 July 2020

---
## 题意
> Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

~~~python
Example:

Input: [1,2,3,null,5,null,4]
Output: [1, 3, 4]
Explanation:

   1            <---
 /   \
2     3         <---
 \     \
  5     4       <---
~~~

## 思路
- 树的层次遍历
- res储存每一层最后一个

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def rightSideView(self, root):
        """
        :type root: TreeNode
        :rtype: List[int]
        """
        res = []
        if not root: return res
        
        queue = [root]
        while queue:
            size = len(queue)
            level=[]
            for i in range(size):
                cur = queue.pop(0)
                level.append(cur.val)
                if cur.left: queue.append(cur.left)
                if cur.right: queue.append(cur.right)
            res.append(level[-1])
        return res
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
