---
layout: project
title: '187-Repeated DNA Sequences'
date: 01 July 2020

---
## 题意
> All DNA is composed of a series of nucleotides abbreviated as A, C, G, and T, for example: "ACGAATTCCG". When studying DNA, it is sometimes useful to identify repeated sequences within the DNA.
> Write a function to find all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule.
> Example:
> - Input: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
> - Output: ["AAAAACCCCC", "CCCCCAAAAA"]

## 思路
- 维护两个HashSet： seen, res
- 遍历字符串：以每一个字符为起点，截取长度为10个字母的字符串 cur
  - seen中没有cur,存入seen
  - seen中存在cur,存入res
 - res转成list输出

~~~python
class Solution(object):
    def findRepeatedDnaSequences(self, s):
        """
        :type s: str
        :rtype: List[str]
        """
        res = set()
        seen = set()
        for i in range(len(s)-9):
            cur = s[i:i+10]
            if cur in seen:
                res.add(cur)
            else:
                seen.add(cur)
        return list(res)
~~~

## 分析
- Time: O(n)
- Space: O(n)
