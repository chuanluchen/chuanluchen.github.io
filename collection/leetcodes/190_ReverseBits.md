---
layout: project
title: '190-Reverse Bits'
date: 01 July 2020

---
## 题意
> Reverse bits of a given 32 bits unsigned integer.

~~~python
Example 1:
Input: n = 00000010100101000001111010011100
Output:    964176192 (00111001011110000010100101000000)
Explanation: The input binary string 00000010100101000001111010011100 represents the unsigned integer 43261596, so return 964176192 which its binary representation is 00111001011110000010100101000000.

Example 2:
Input: n = 11111111111111111111111111111101
Output:   3221225471 (10111111111111111111111111111111)
Explanation: The input binary string 11111111111111111111111111111101 represents the unsigned integer 4294967293, so return 3221225471 which its binary representation is 10111111111111111111111111111111.
~~~

> Constraints:The input must be a binary string of length 32

## 思路
- 位运算：按位与
  - n不断右移：判断是否是1 
  - 加入res, res左移
- 调库
  - 使用str[::-1]反转
  - 把数字转换成Binary str,取index 2之后的【二进制的数字以0b开头】
  - 用zfill把前面填充为0，保持32位
  - 用str[::-1]实现反转
  - 用int(xx, 2) 转换为十进制


~~~python
class Solution:
    # @param n, an integer
    # @return an integer
    def reverseBits(self, n):
        res = 0
        for i in range(32):
            res <<=1
            res += n&1
            n >>= 1
        return res
        
    def reverseBits(self, n):
        return int(bin(n)[2:].zfill(32)[::-1], 2)

~~~

## 分析:
- Time: O(1)
- Space: O(1) 
