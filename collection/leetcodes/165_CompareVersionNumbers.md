---
layout: project
title: '165-Compare Version Numbers'
date: 01 July 2020

---
## 题意
> Given two version numbers, version1 and version2, compare them.
> Return the following:
> - If version1 < version2, return -1.
> - If version1 > version2, return 1.
> -Otherwise, return 0.

~~~python
Example 1:
Input: version1 = "1.01", version2 = "1.001"
Output: 0
Explanation: Ignoring leading zeroes, both "01" and "001" represent the same integer "1".

Example 2:
Input: version1 = "1.0", version2 = "1.0.0"
Output: 0
Explanation: version1 does not specify revision 2, which means it is treated as "0".

Example 3:
Input: version1 = "0.1", version2 = "1.1"
Output: -1
Explanation: version1's revision 0 is "0", while version2's revision 0 is "1". 0 < 1, so version1 < version2.

Example 4:
Input: version1 = "1.0.1", version2 = "1"
Output: 1

Example 5:
Input: version1 = "7.5.2.4", version2 = "7.5.3"
Output: -1
~~~

## 思路
- 字符串
- 把version按.split
- 从左到右，提取数字逐个比较

~~~python
class Solution(object):
    def compareVersion(self, version1, version2):
        """
        :type version1: str
        :type version2: str
        :rtype: int
        """
        
        
        v1 = version1.split('.')
        v2 = version2.split('.')
        
        for i in range(max(len(v1), len(v2))):
            if i < len(v1): num1 = int(v1[i])
            else: num1 = 0
            if i < len(v2): num2 = int(v2[i])
            else: num2 = 0
            if num1 < num2: return -1
            elif num1 > num2: return 1
        return 0
~~~

## 分析:
- Time: O(n) 
- Space: O(1) 
