---
layout: project
title: '56-Merge Intervals'
date: 01 July 2020

---
## 题意
> Given a collection of intervals, merge all overlapping intervals.
> Example 1:
> - Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
> - Output: [[1,6],[8,10],[15,18]]
> - Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
> 
> Example 2:
> - Input: intervals = [[1,4],[4,5]]
> - Output: [[1,5]]
> - Explanation: Intervals [1,4] and [4,5] are considered overlapping.
> - NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.


## 思路
- 扫描线思想
- 先把intervals按照interval.start从小到大的顺序排好序，
- start, end 作为当前的左端点和右端点，
- 每扫描到一个新元素item，如果item.s比end小，interval可以合并 ->新的合并区间的右端点应该为item.end和end的最大值，
- 反之，区间不能合并，需要将当前start和end添加到答案里，重置为item.start, item.end
- 加入最后一个start, end

~~~python
class Solution(object):
    def merge(self, intervals):
        """
        :type intervals: List[List[int]]
        :rtype: List[List[int]]
        """
        if not intervals: return intervals
        
        # intervals 按照start从小到大排序
        intervals  = sorted(intervals, key = lambda x:x[0])
        
        res = []
        start, end = intervals[0]
        for i in intervals:
            s, e = i[0], i[1]
            if s<= end: # 可以合并：新的interval start < 当前end 
                end = max(end, e)
            else: # 不合并，当前start/ end 加入res
                res.append([start, end]) 
                start, end = s, e
        
        # 加入最后一个start, end
        res.append([start, end])
        return res
~~~

## 分析
- Time: O(nlogn)
- Space: O(n)
