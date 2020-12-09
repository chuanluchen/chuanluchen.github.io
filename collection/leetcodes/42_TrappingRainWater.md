---
layout: project
title: '42-Trapping Rain Water'
date: 01 July 2020

---
## 题意
> Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.


~~~python
Example 1:
Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.

Example 2:
Input: height = [4,2,0,3,2,5]
Output: 9
~~~

## 思路
- 栈：极值迭代

~~~python
class Solution(object):
    def trap(self, height):
        """
        :type height: List[int]
        :rtype: int
        """
        # 每个位置积水的高度： min(左边最高的柱子高度，右边最高的柱子高度) - 当前位置的柱子高度
        # 栈：极值迭代思路，栈里面保存当前最大值
        
        left_max = [0 for _ in height]
        right_max = [0 for _ in height]
        water  = [0 for _ in height]
        
        # 更新左边最高柱子
        for i in range(len(height)):
            if i>=1:
                left_max[i] = max(left_max[i-1], height[i])
            else:
                left_max[i] = height[i]
                
        # 更新右边最高柱子
        for i in range(len(height)-1, -1, -1):
            if i < len(height)-1:
                right_max[i] = max(right_max[i+1], height[i])
            else:
                right_max[i] = height[i]
        
        # 更新当前水位
        for i in range(len(height)):
            temp = min(left_max[i], right_max[i]) - height[i]
            if temp >0: water[i] = temp
        
        return sum(water)
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
