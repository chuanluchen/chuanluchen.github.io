---
layout: project
title: '151-Reverse Words in a String'
date: 01 July 2020

---
## 题意
> Given an input string s, reverse the order of the words.
> A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.
> Return a string of the words in reverse order concatenated by a single space.
> Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.
>
> Example 1:
> - Input: s = "the sky is blue"
> - Output: "blue is sky the"
>
> Example 2:
> - Input: s = "  hello world  "
> - Output: "world hello"
> - Explanation: Your reversed string should not contain leading or trailing spaces.
>
> Example 3:
> - Input: s = "a good   example"
> - Output: "example good a"
> - Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
> Example 4:
> -Input: s = "  Bob    Loves  Alice   "
> -Output: "Alice Loves Bob"
>
> Example 5:
> - Input: s = "Alice does not even like bob"
> - Output: "bob like even not does Alice"
> 
> Constraints:
> - 1 <= s.length <= 104
> - s contains English letters (upper-case and lower-case), digits, and spaces ' '.
> - There is at least one word in s.

## 思路
- 拆成列表，倒序，join
- 去除多个space

~~~python
class Solution(object):
    def reverseWords(self, s):
        """
        :type s: str
        :rtype: str
        """
        s = s.rstrip()
        s = s.lstrip()
        l = s.split(' ')
        l = l[::-1]
        return ' '.join(i for i in l if i!='' ) # reduce multiple space
~~~

## 分析
- Time: O(n)
- Space: O(n)
