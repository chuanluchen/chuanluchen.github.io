---
layout: project
title: '84-Largest Rectangle in Histogram'
date: 01 July 2020

---
## 题意
> Given n non-negative integers representing the histogram's bar height where the width of each bar is 1, find the area of largest rectangle in the histogram.

~~~python
Example:
Input: [2,1,5,6,2,3]
Output: 10
~~~

## 思路
- 栈：极值迭代

~~~python
class Solution(object):
    def largestRectangleArea(self, heights):
        """
        :type heights: List[int]
        :rtype: int
        """
        
       # 遍历：比当前高的bar, 将index放入stack
       # bar的高度一直升序不管
       # bar高度突然降低-> 求前面的max area: 前一个bar高度 * (index之差-1)
        
        res = 0
        stack = []
        heights = [0] + heights + [0] # 前后加0， 方便pop算面积
        
        for i in range(len(heights)):
            # bar高度降低: 求前面max面积 用while取最大
            while stack and heights[stack[-1]] > heights[i]: 
                top = stack.pop()
                res = max(res, (i - stack[-1] - 1)*heights[top]) 
            # bar升高情况下: 将index放入stack
            stack.append(i)
        return res
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
