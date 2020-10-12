---
layout: project
title: '125-Valid Palindrome'
date: 01 July 2020

---
## 题意
> Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
> Note: For the purpose of this problem, we define empty string as valid palindrome.
> Example 1:
> - Input: "A man, a plan, a canal: Panama"
> - Output: true
> 
> Example 2:
> - Input: "race a car"
> - Output: false
>
> Constraints: s consists only of printable ASCII characters.

## 思路
- 只考虑小写
- 提取所有字母数字 isalnum()
- 判断正向==反向

~~~python
# Solution 1
class Solution(object):
    def isPalindrome(self, s):
        """
        :type s: str
        :rtype: bool
        """
        temp=''
        for c in s.lower():
            if c.isalnum():
                temp += c
        return temp == temp[::-1]
        
# Solution 2  
def isPalindrome(self, s):
        """
        :type s: str
        :rtype: bool
        """
        left, right = 0, len(s) - 1
        s = s.lower()
        while left < right: # 双指针
            while left<right and not s[left].isalnum(): left += 1
            while left< right and not s[right].isalnum():right -= 1
            if s[left] != s[right]: return False
            left += 1
            right -= 1
        return True
~~~

## 分析:考虑Counter的复杂度
- Time: O(n)  O(n)
- Space: O(n)  O(1)
