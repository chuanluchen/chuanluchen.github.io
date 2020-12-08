---
layout: project
title: '225-Implement Stack using Queues'
date: 01 July 2020

---
## 题意
> Implement a last in first out (LIFO) stack using only two queues. The implemented stack should support all the functions of a normal queue (push, top, pop, and empty).
> Implement the MyStack class:
> - void push(int x) Pushes element x to the top of the stack.
> - int pop() Removes the element on the top of the stack and returns it.
> - int top() Returns the element on the top of the stack.
> - boolean empty() Returns true if the stack is empty, false otherwise.
> Notes:
> - You must use only standard operations of a queue, which means only push to back, peek/pop from front, size, and is empty operations are valid.
> - Depending on your language, the queue may not be supported natively. You may simulate a queue using a list or deque (double-ended queue), as long as you use only a queue's standard operations.
> - Follow-up: Can you implement the stack such that each operation is amortized O(1) time complexity? In other words, performing n operations will take overall O(n) time even if one of those operations may take longer.

~~~python
Example 1:
Input
["MyStack", "push", "push", "top", "pop", "empty"]
[[], [1], [2], [], [], []]
Output
[null, null, null, 2, 2, false]

Explanation
MyStack myStack = new MyStack();
myStack.push(1);
myStack.push(2);
myStack.top(); // return 2
myStack.pop(); // return 2
myStack.empty(); // return False
~~~

## 思路
- 栈：基本应用
- stack 一头进出，先进后出
- queue 一头进，一头出，先进先出
- 每次push进来之后，倒序 stack 1<-2<-3<-4 queue 1->2->3->4 把pop出来的重新append一遍

~~~python
class MyStack(object):
   

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.queue = []

    def push(self, x):
        """
        Push element x onto stack.
        :type x: int
        :rtype: None
        """
        self.queue.append(x)
        for i in range(len(self.queue)-1):
            self.queue.append(self.queue.pop(0))

    def pop(self):
        """
        Removes the element on top of the stack and returns that element.
        :rtype: int
        """
        return self.queue.pop(0)

    def top(self):
        """
        Get the top element.
        :rtype: int
        """
        return self.queue[0]

    def empty(self):
        """
        Returns whether the stack is empty.
        :rtype: bool
        """
        return not self.queue


# Your MyStack object will be instantiated and called as such:
# obj = MyStack()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.empty()
~~~
