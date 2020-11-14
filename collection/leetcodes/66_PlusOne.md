---
layout: project
title: '66-Plus One'
date: 01 July 2020

---
## 题意
> Given a non-empty array of decimal digits representing a non-negative integer, increment one to the integer.
> The digits are stored such that the most significant digit is at the head of the list, and each element in the array contains a single digit.
> You may assume the integer does not contain any leading zero, except the number 0 itself.

~~~python
Example 1:
Input: digits = [1,2,3]
Output: [1,2,4]
Explanation: The array represents the integer 123.

Example 2:
Input: digits = [4,3,2,1]
Output: [4,3,2,2]
Explanation: The array represents the integer 4321.

Example 3:
Input: digits = [0]
Output: [1]
~~~

## 思路
- 数学题：加法进位
- 倒序遍历：讨论当前数位是否<9

~~~python
class Solution(object):
    def plusOne(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        if not digits: return []
        
        # 数位倒序遍历
        # 遇到<9的数位 + 1
        # 遇到9的数位 -> 0,前一位加1 -> 所有数位都为0，最前面加1 10000
        for i in range(len(digits)-1, -1, -1):
            if digits[i] < 9: 
                digits[i] += 1
                return digits
            else:
                digits[i] = 0    
        
        digits.insert(0,1)
        return digits
~~~

## 分析:
- Time: O(n)  遍历数字位数
- Space: O(1) 
