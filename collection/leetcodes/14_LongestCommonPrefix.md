---
layout: project
title: '14-Longest Common Prefix'
date: 01 July 2020

---
## 题意
> Write a function to find the longest common prefix string amongst an array of strings.
> If there is no common prefix, return an empty string "".
> Example 1:
> - Input: strs = ["flower","flow","flight"]
> - Output: "fl"
>
> Example 2:
> - Input: strs = ["dog","racecar","car"]
> - Output: ""
> - Explanation: There is no common prefix among the input strings.

## 思路
- 方法1：调包
- 方法2
  - 遍历第一个字符串的每个字母
  - 嵌套遍历后续字符串:看相应位置的字符是否一致
  - 终止条件：当前字符串走到头或char不匹配

~~~python
class Solution(object):
    def longestCommonPrefix(self, strs):
        """
        :type strs: List[str]
        :rtype: str
        """
        return os.path.commonprefix(strs)
        
class Solution(object):
    def longestCommonPrefix(self, strs):
        """
        :type strs: List[str]
        :rtype: str
        """
        if not strs: return ''
        
        for i, c in enumerate(strs[0]):
            for s in strs[1:]:
                if i == len(s) or s[i] != c: # 当前字符串走到头或不匹配
                    return strs[0][:i]
        return strs[0] #走完strs[0],全部匹配上的情况
~~~

## 分析
- Time: unknown O(m*n)
- Space: unknown O(1)
