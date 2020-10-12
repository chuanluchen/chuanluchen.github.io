---
layout: project
title: '9-Palindrome Number'
date: 01 July 2020

---
## 题意
> Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
> Follow up: Could you solve it without converting the integer to a string?
>
> Example 1:
> - Input: x = 121
> - Output: true
>
> Example 2:
> - Input: x = -121
> - Output: false
> Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
>
> Example 3:
> - Input: x = 10
> - Output: false
> Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
> 
> Example 4:
> - Input: x = -101
> - Output: false
>
>Constraints:-231 <= x <= 231 - 1

## 思路1
- 数字转成str
- 判断正向==反向
## 思路2
- 手动计算reverse 
- 数位反转模板
  ~~~python
  reverse = 0
  while x > 0:
    reverse = reverse*10 + x % 10
    x = x/10
  ~~~


~~~python
# Solution 1
class Solution(object):
    def isPalindrome(self, x):
        """
        :type x: int
        :rtype: bool
        """
        return str(x) ==  str(x)[::-1]
        
# Solution 2  
class Solution(object):
    def isPalindrome(self, x):
        """
        :type x: int
        :rtype: bool
        """
        if x < 0: return False
        original = x
        reverse = 0
        while x > 0:
            reverse = reverse*10 + x % 10
            x = x/10
        return reverse == original
~~~

## 分析:
- Time: O(n)
- Space: O(1)
