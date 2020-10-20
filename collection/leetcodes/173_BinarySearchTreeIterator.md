---
layout: project
title: '173-Binary Search Tree Iterator'
date: 01 July 2020

---
## 题意
> Implement an iterator over a binary search tree (BST). Your iterator will be initialized with the root node of a BST.
> Calling next() will return the next smallest number in the BST.

~~~python
Example:

BSTIterator iterator = new BSTIterator(root);
iterator.next();    // return 3
iterator.next();    // return 7
iterator.hasNext(); // return true
iterator.next();    // return 9
iterator.hasNext(); // return true
iterator.next();    // return 15
iterator.hasNext(); // return true
iterator.next();    // return 20
iterator.hasNext(); // return false
~~~

## 思路
- 树：中序遍历

~~~python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class BSTIterator(object):

    def __init__(self, root):
        """
        :type root: TreeNode
        """
        self.stack=[]
        self.cur = root
        

    def next(self):
        """
        @return the next smallest number
        :rtype: int
        """
        while cur and stack:
            if self.cur:
                stack.stack.append(self.cur)
                self.cur = cur.left
            else:
                self.cur = self.stack.pop()
                res = self.cur.val
                self.cur = self.cur.right
        return res

    def hasNext(self):
        """
        @return whether we have a next smallest number
        :rtype: bool
        """
        return self.cur or self.stack


# Your BSTIterator object will be instantiated and called as such:
# obj = BSTIterator(root)
# param_1 = obj.next()
# param_2 = obj.hasNext()
~~~

## 分析:
- Time: next()和 hasNext() 为O(1)
- Space: O(h)
