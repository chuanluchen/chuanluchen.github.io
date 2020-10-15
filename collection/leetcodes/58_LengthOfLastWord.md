---
layout: project
title: '58-Length of Last Word'
date: 01 July 2020

---
## 题意
> Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word (last word means the last appearing word if we loop from left to right) in the string.
> If the last word does not exist, return 0.
> Note: A word is defined as a maximal substring consisting of non-space characters only.
> Example:
> - Input: "Hello World"
> - Output: 5

~~~python
class Solution(object):
    def lengthOfLastWord(self, s):
        """
        :type s: str
        :rtype: int
        """
        s = s.strip()
        return len(s.split(' ')[-1])   
~~~
