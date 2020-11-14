---
layout: project
title: '67. Add Binary'
date: 01 July 2020

---
## 题意
> Given two binary strings a and b, return their sum as a binary string.

~~~python
Example 1:
Input: a = "11", b = "1"
Output: "100"

Example 2:
Input: a = "1010", b = "1011"
Output: "10101"
~~~

## 思路
- 数学题：str-int转换
- 调库：int(xx,2) / bin()

~~~python
class Solution(object):
    def addBinary(self, a, b):
        """
        :type a: str
        :type b: str
        :rtype: str
        """
        res =''
        i, j = len(a)-1, len(b)-1
        remainder = 0
        
        # 双指针倒序遍历
        while i>=0 or j>=0:
            temp_sum = remainder
            if i>=0: temp_sum += ord(a[i])-ord('0')
            if j>=0: temp_sum += ord(b[j])-ord('0')
            
            # 处理进位/ remainder
            remainder = temp_sum // 2
            res += str(temp_sum % 2)
            
            # 更新指针
            i -= 1
            j -= 1
            
        # 最后仍有进位
        if remainder>0: res += str(remainder)
        
        # str倒序输出
        return res[::-1]
        
    def addBinary(self, a, b):
        # int(xx, 2) str转换为二进制数字
        # bin() 转换为str, 0b开头
        return bin(int(a, 2) +  int(b, 2))[2:]
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
