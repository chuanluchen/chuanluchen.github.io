---
layout: project
title: '155-Min Stack'
date: 01 July 2020

---
## 题意
> Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
> - push(x) -- Push element x onto stack.
> - pop() -- Removes the element on top of the stack.
> - top() -- Get the top element.
> - getMin() -- Retrieve the minimum element in the stack.

~~~python
Example:
Input
["MinStack","push","push","push","getMin","pop","top","getMin"]
[[],[-2],[0],[-3],[],[],[],[]]

Output
[null,null,null,null,-3,null,0,-2]

Explanation
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin(); // return -3
minStack.pop();
minStack.top();    // return 0
minStack.getMin(); // return -2
~~~

## 思路
- 栈：基本应用
- 单独维护一个栈：放当前最小值

~~~python
class MinStack(object):

    def __init__(self):
        """
        initialize your data structure here.
        """
        self.stack=[]
        self.minStack =[]

    def push(self, x):
        """
        :type x: int
        :rtype: None
        """
        self.stack.append(x)
        
        if self.minStack and x>= self.minStack[-1]:
            self.minStack.append(self.minStack[-1])  # 如果不是最小值，把当前最小值再加一遍
        else:
            self.minStack.append(x)
        

    def pop(self):
        """
        :rtype: None
        """ 
        self.stack.pop()
        self.minStack.pop()
        

    def top(self):
        """
        :rtype: int
        """
        return self.stack[-1]
        

    def getMin(self):
        """
        :rtype: int
        """
        return self.minStack[-1]


# Your MinStack object will be instantiated and called as such:
# obj = MinStack()
# obj.push(x)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.getMin()
~~~
