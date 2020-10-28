---
layout: project
title: '88-Merge Sorted Array'
date: 01 July 2020

---
## 题意
> Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
> Note:
> - The number of elements initialized in nums1 and nums2 are m and n respectively.
> - You may assume that nums1 has enough space (size that is equal to m + n) to hold additional elements from nums2.

~~~python
Example:
Input:
nums1 = [1,2,3,0,0,0], m = 3
nums2 = [2,5,6],       n = 3

Output: [1,2,2,3,5,6]
~~~

## 思路
- 排序
- 相当于mergeSort的merge部分

~~~python
class Solution(object):
    def merge(self, nums1, m, nums2, n):
        """
        :type nums1: List[int]
        :type m: int
        :type nums2: List[int]
        :type n: int
        :rtype: None Do not return anything, modify nums1 in-place instead.
        """
        temp = []
        i = 0
        j = 0
        while i < m and j < n:
            if (nums1[i] <= nums2[j]):
                temp.append(nums1[i])
                i += 1
            else:
                temp.append(nums2[j])
                j += 1
        
        # nums1或nums2有剩余，将剩余加在尾部
        while(i < m):
            temp.append(nums1[i])
            i += 1
        while(j < n):
            temp.append(nums2[j])
            j += 1
        
        # deep copy to nums1
        for i in range(0, m + n ):
            nums1[i] = temp[i]            
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
