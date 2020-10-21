---
layout: project
title: '117-Populating Next Right Pointers in Each Node II'
date: 01 July 2020

---
## 题意
> Given a binary tree

~~~python
struct Node {
  int val;
  Node *left;
  Node *right;
  Node *next;
}
~~~
> Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.
> Initially, all next pointers are set to NULL.
> 
> Follow up:
> - You may only use constant extra space.
> - Recursive approach is fine, you may assume implicit stack space does not count as extra space for this problem.


## 思路
- 树+ 链表
- 与106区别：不是完全二叉树
- 定义function找叔叔
- 注意递归时：先找右边，再找左边

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
        
        if not root or (not root.left and not root.right): return root
        
        # 两子双全
        if root.left and root.right:
            root.left.next = root.right
            self.helper(root.right, root)
        # 只有左
        elif root.left:
            self.helper(root.left, root)
        # 只有右
        elif root.right:
            self.helper(root.right, root)
            
            
        # 递归处理下一层: ！！！！必须先处理右子树，再处理左子树
        # 先搞定右边，才能找叔叔
        self.connect(root.right)
        self.connect(root.left)
    
        return root
    
    # 找叔叔
    def helper(self, child, root):  
        temp = root.next # 叔叔
        while temp:
            if temp.left:
                child.next = temp.left
                break
            elif temp.right:
                child.next = temp.right
                break
            else:
                temp = temp.next # 叔叔没有孩子-> 找下一个叔叔
~~~

## 分析:
- Time: O(n) 
- Space: O(1) 
