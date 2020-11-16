---
layout: project
title: '43-Multiply Strings'
date: 01 July 2020

---
## 题意
> Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.
> Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.

~~~python
Example 1:
Input: num1 = "2", num2 = "3"
Output: "6"

Example 2:
Input: num1 = "123", num2 = "456"
Output: "56088"
~~~

## 思路
- 数学题：数位运算
- 找规律竖位相乘

~~~python
class Solution(object):
    def multiply(self, num1, num2):
        """
        :type num1: str
        :type num2: str
        :rtype: str
        """
        '''
            1 2 3    i   长度m
              4 5    j   长度n
        ----------
              1 5
            1 0      
          0 5
            1 2      i = 2 j=0 => [2, 3]=>[i + j, i + j + 1]
          0 8
        0 4
        ----------
        0 5 5 3 5   length: m + n
      
        '''
    
        if num1=='0' or num2=='0': return '0'
        m, n = len(num1), len(num2)
        digit = [0] *(m+n)
        for i in range(m-1, -1, -1):
            for j in range(n-1, -1, -1):
                mul = (ord(num1[i]) - ord('0')) *(ord(num2[j]) - ord('0')) 
                temp_sum =  mul + digit[i+j+1]
                digit[i+j] += temp_sum // 10 # 注意十位、个位更新方式不同
                digit[i+j+1] = temp_sum % 10
                
        if digit[0] !=0: res = ''.join(str(i) for i in digit)
        else: res = ''.join(str(i) for i in digit[1:])
        return res
~~~


## 分析:
- Time: O(m*n) 
- Space: O(m+n) 
