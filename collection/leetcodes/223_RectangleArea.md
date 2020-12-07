---
layout: project
title: '223-Rectangle Area'
date: 01 July 2020

---
## 题意
> Find the total area covered by two rectilinear rectangles in a 2D plane.
> Each rectangle is defined by its bottom left corner and top right corner as shown in the figure.

~~~python
Example:
Input: A = -3, B = 0, C = 3, D = 4, E = 0, F = -1, G = 9, H = 2
Output: 45
~~~

## 思路
- 暴力解：
- 求并集面积：areaA + areaB-overlap
- 如果没有交集: overop = 0

~~~python
class Solution(object):
    def computeArea(self, A, B, C, D, E, F, G, H):
        """
        :type A: int
        :type B: int
        :type C: int
        :type D: int
        :type E: int
        :type F: int
        :type G: int
        :type H: int
        :rtype: int
        """

        areaA = (C-A) * (D-B)
        areaB = (G-E) * (H-F)
        
        # 找重叠部分坐标
        left = max(A, E)
        right = min(C, G)
        top = min(D, H)
        bottom = max(B, F)
        
        overlap = 0
        if left < right and top > bottom:
            overlap = (right-left) *(top - bottom)
            
        return areaA +  areaB - overlap
~~~

## 分析:
- Time: O(1) 
- Space: O(1) 
