---
layout: project
title: '4-Median of Two Sorted Arrays'
date: 01 July 2020

---
## 题意
> Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
> Follow up: The overall run time complexity should be O(log (m+n)).

~~~python
Example 1:
Input: nums1 = [1,3], nums2 = [2]
Output: 2.00000
Explanation: merged array = [1,2,3] and median is 2.

Example 2:
Input: nums1 = [1,2], nums2 = [3,4]
Output: 2.50000
Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

Example 3:
Input: nums1 = [0,0], nums2 = [0,0]
Output: 0.00000

Example 4:
Input: nums1 = [], nums2 = [1]
Output: 1.00000

Example 5:
Input: nums1 = [2], nums2 = []
Output: 2.00000
~~~

## 思路
- 麻瓜思路：先merge,再sort,再找中位数
- 要求logn,考虑二分法

~~~python
class Solution(object):
    def findMedianSortedArrays(self, nums1, nums2):
        """
        :type nums1: List[int]
        :type nums2: List[int]
        :rtype: float
        """
        
        nums1 = sorted(nums1 + nums2)
        l = len(nums1)
	    
        if l%2==0:
            return (nums1[l//2] + nums1[l//2-1]) / 2.0
        else:
            return nums1[l//2]
            
class Solution(object):
    def findMedianSortedArrays(self, nums1, nums2):
        """
        :type nums1: List[int]
        :type nums2: List[int]
        :rtype: float
        """
        
        '''
        num1:  3   5  |  8   9                   4
                   L1    R1
        num2:  1   2   7 | 10   11   12          6
                      L2   R2
        
        num3:  1   2   3   5   7  |  8   9   10   11   12
        整体的cut:在总长度len 1/2， 中位数为cut左边的数或左右平均值
        重点找cut1, cut2= len/2-cut1
        二分法找cut1:使得左右数量相等或左边多一个; 左边最大值小于右边最小值
        '''
        minValue = -float('inf')
        maxValue = float('inf')
        len1, len2 = len(nums1), len(nums2)
        total_len = len1 + len2

        if len1 > len2: # 保证num1长度 < num2
            len1, len2, nums1, nums2 = len2, len1, nums2, nums1
        left = 0
        right = len1
        cut1 = 0
        cut2 = 0
        while cut1 <= len1:
            cut1 = (right - left) / 2 + left; # cut1在nums1中找mid
            cut2 = total_len / 2 - cut1 
            L1 = minValue if cut1 == 0 else nums1[cut1 - 1]
            R1 = maxValue if cut1 == len1 else nums1[cut1]
            L2 = minValue if cut2 == 0 else nums2[cut2 - 1]
            R2 = maxValue if cut2 == len2 else nums2[cut2]
            # 判断左边最大值L1/L2与R1/R2的关系
            if L1 > R2: right = cut1 - 1
            elif L2 > R1:left = cut1 + 1
            else: # 中间出现相等情况     3 | 4       1  2| 3
                if total_len % 2 == 0:
                    l = max(L1, L2)
                    r = min(R1, R2)
                    return (l + r) / 2.0
                else:
                    return min(R1, R2)
            
        return -1
~~~

## 分析:
- Time: O(nlogn)  O(log(m+n)) 
- Space: O(1)     O(1)
