---
layout: project
title: '114-Flatten Binary Tree to Linked List'
date: 01 July 2020

---
## 题意
> Given a binary tree, flatten it to a linked list in-place.

~~~python
For example, given the following tree:

    1
   / \
  2   5
 / \   \
3   4   6
The flattened tree should look like:

1
 \
  2
   \
    3
     \
      4
       \
        5
         \
          6
~~~

## 思路
- 树的实现题
- 要求原地转换：不能遍历，再输出数组
- preOrder遍历，每次将stack最上面一个元素接上cur.right, cur.left置为空

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def flatten(self, root):
        """
        :type root: TreeNode
        :rtype: None Do not return anything, modify root in-place instead.
        """
        # 用stack实现原地转换
        # 把树按照preOrder放入stack:先右后左
        # 每次把stack最上边的接上cur.right, 截断cur.left
        
        if not root: return None
        stack = [root]
        while stack:
            cur = stack.pop()
            if cur.right:
                stack.append(cur.right)
            if cur.left: 
                stack.append(cur.left)
            if stack:
                cur.right = stack[-1]
                cur.left = None
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
