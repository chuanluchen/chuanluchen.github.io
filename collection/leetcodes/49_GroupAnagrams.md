---
layout: project
title: '49-Group Anagrams'
date: 01 July 2020

---
## 题意
> Given an array of strings strs, group the anagrams together. You can return the answer in any order.
> An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
>
> Example 1:
>- Input: strs = ["eat","tea","tan","ate","nat","bat"]
>- Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
>
> Example 2:
>- Input: strs = [""]
>- Output: [[""]]
>
> Example 3:
> - Input: strs = ["a"]
> - Output: [["a"]]
>
> Constraints:
>- 1 <= strs.length <= 104
>- 0 <= strs[i].length <= 100
>- strs[i] consists of lower-case English letters.

## 思路
- Anagram
- 遍历list, 对当前str排序-> sorted_str提取共同的字符
- HashMap <sort_str>:<list>
- 查看当前sorted_str是否存在hashmap中
  - 不存在：作为list加入
  - 存在: append List

~~~python
class Solution(object):
    def groupAnagrams(self, strs):
        """
        :type strs: List[str]
        :rtype: List[List[str]]
        """
        
        hashmap = dict()
        for s in strs:
            sorted_str = ''.join(sorted(s)) # 按字母排序产出的是list
            if sorted_str in hashmap:
                hashmap[sorted_str].append(s)
            else:
                hashmap[sorted_str] = [s]
        return hashmap.values()
~~~

## 分析
- Time: O(nmlog(m)) n list长度，m字符串长度
- Space: O(n)
