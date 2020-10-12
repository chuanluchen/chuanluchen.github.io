---
layout: project
title: '186. Reverse Words in a String II'
date: 01 July 2020

---
## 题意
> Given an input string , reverse the string word by word. 
> 
> Example:
> - Input:  ["t","h","e"," ","s","k","y"," ","i","s"," ","b","l","u","e"]
> - Output: ["b","l","u","e"," ","i","s"," ","s","k","y"," ","t","h","e"]
> Note: 
> - A word is defined as a sequence of non-space characters.
> - The input string does not contain leading or trailing spaces.
> - The words are always separated by a single space.
> - Follow up: Could you do it in-place without allocating extra space?

## 思路1
- 调库：转换成str[::-1], 再换回list
## 思路2
- 先完全反转，再单词内部反转【找空格】
-                  "sky blue"
- ->1.完全反转      "eulb yks"
- ->2.单词内部调换   "blue sky"


~~~python
# Solution 1
class Solution(object):
    def reverseWords(self, s):
        """
        :type s: List[str]
        :rtype: None Do not return anything, modify s in-place instead.
        """
        s[:] = list(" ".join(''.join(s).split(' ')[::-1]))
        
# Solution 2  
class Solution(object):
    def reverseWords(self, s):
        """
        :type s: List[str]
        :rtype: None Do not return anything, modify s in-place instead.
        """
        def reverse(s, start, end):
            left, right = start, end
            while(left < right):
                s[left], s[right] = s[right], s[left]
                left += 1
                right -= 1
        
        # 完全反转
        reverse(s, 0, len(s)-1)
        # 定位空格的位置，单词内部反转
        l = 0
        for r, char in enumerate(s):
            if char ==' ': 
                reverse(s, l, r-1)
                l = r + 1
        
        #把最后一个单词翻转
        reverse(s, l, len(s)-1)
~~~

## 分析:
- Time: O(n)
- Space: O(1)
