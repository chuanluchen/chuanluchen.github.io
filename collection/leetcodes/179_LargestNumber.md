---
layout: project
title: '179-Largest Number'
date: 01 July 2020

---
## 题意
> Given a list of non-negative integers nums, arrange them such that they form the largest number.
> Note: The result may be very large, so you need to return a string instead of an integer.
> Example 1:
> - Input: nums = [10,2]
> - Output: "210"
> 
> Example 2:
> - Input: nums = [3,30,34,5,9]
> - Output: "9534330"
>
> Example 3:
> - Input: nums = [1]
> - Output: "1"
>
>Example 4:
> - Input: nums = [10]
> - Output: "10"
>
> Constraints:
> - 1 <= nums.length <= 100
> - 0 <= nums[i] <= 109

## 思路
- check range： 处理全是0的情况
- 将int数组转换成string数组处理
- 自定义string 排序函数
- 将结果连接成string


~~~python
class Solution(object):        
    def largestNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: str
        """
        
        def compare(a,b):
            return int(b + a) - int(a + b)

        # 处理全部是0的情况
        if not nums or sum(nums) == 0:
            return "0" 
        nums = sorted([str(i) for i in nums],cmp = compare)
        return "".join(nums)
~~~

## 分析
- Time: O(nlogn)
- Space: O(n)
