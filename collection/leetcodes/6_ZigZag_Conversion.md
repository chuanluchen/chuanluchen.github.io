---
layout: project
title: '6-ZigZag Conversion'
date: 01 July 2020

---
## 题意
> The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
> P   A   H   N
> A P L S I I G
> Y   I   R
> And then read line by line: "PAHNAPLSIIGYIR"
>
> Write the code that will take a string and make this conversion given a number of rows:string convert(string s, int numRows);
>
> Example 1:
> - Input: s = "PAYPALISHIRING", numRows = 3
> - Output: "PAHNAPLSIIGYIR"
>
> Example 2:
> - Input: s = "PAYPALISHIRING", numRows = 4
> - Output: "PINALSIGYAHRPI"
> - Explanation:
> P     I    N
> A   L S  I G
> Y A   H R
> P     I
>
> Example 3:
> - Input: s = "A", numRows = 1
> - Output: "A"
>
> Constraints:
> - 1 <= s.length <= 1000
> - s consists of English letters (lower-case and upper-case), ',' and '.'.
> - 1 <= numRows <= 1000

## 思路
- 暴力找规律
- 找到每个字母相应的行号，放入对应的行string里
<img src= '/assets/img/projects/code/6_zigzagpattern.jpeg'>

~~~python
class Solution(object):
    def convert(self, s, numRows):
        """
        :type s: str
        :type numRows: int
        :rtype: str
        """
        res = [''] * numRows
        if numRows <= 1: return s
        
        for index, char in enumerate(s):
            rowIndex = index % (2* numRows -2)
            if rowIndex >= numRows:
                rowIndex = 2* numRows -2 - rowIndex
            res[rowIndex] += char
        
        return ''.join(res)
~~~

## 分析
- Time: O(n)
- Space: O(n)
