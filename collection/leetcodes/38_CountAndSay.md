---
layout: project
title: '38-Count and Say'
date: 01 July 2020

---
## 题意
> The count-and-say sequence is the sequence of integers with the first five terms as following:
> - 1-> 1
> - 2-> 11
> - 3-> 21
> - 4-> 1211
> - 5-> 111221
>
> 1 is read off as "one 1" or 11.
> 11 is read off as "two 1s" or 21.
> 21 is read off as "one 2, then one 1" or 1211.
>
> Given an integer n where 1 ≤ n ≤ 30, generate the nth term of the count-and-say sequence. You can do so recursively, in other words from the previous member read off the digits, counting the number of digits in groups of the same digit.
> Note: Each term of the sequence of integers will be represented as a string.
>
> Example 1:
> - Input: 1
> - Output: "1"
> - Explanation: This is the base case.
>
> Example 2:
> - Input: 4
> - Output: "1211"
> -Explanation: For n = 3 the term was "21" in which we have two groups "2" and "1", "2" can be read as "12" which means frequency = 1 and value = 2, the same way "1" is read as "11", so the answer is the concatenation of "12" and "11" which is "1211".

## 理解题意
- 数上个字符串有几个2，几个1
- 前10个数字的序列：
     * 1. 1
     * 2. 11
     * 3. 21
     * 4. 1211
     * 5. 111221
     * 6. 312211
     * 7. 13112221
     * 8. 1113213211
     * 9. 31131211131221
     * 10. 13211311123113112211
     *
     * n=1时，输出字符串1；
     * n=2时，数上次字符串中各个数值的个数，因为上个数字字符串中有1个1，所以输出11；
     * n=3时，由于上个字符串是11，有2个1，所以输出21；
     * n=4时，由于上个数字的字符串是21，有1个2和1个1，所以输出1211，依次类推......

## 思路
- 递归找到上一个字符串
- 遍历前一个字符串
- 按数位进行count+ char输出

~~~python
class Solution(object):
    def countAndSay(self, n):
        """
        :type n: int
        :rtype: str
        """
        # 递归找到上一个数
        # base： n=1 ->1
        
        if n == 1: return '1'
        pre = self.countAndSay(n-1)
        
        # 遍历上一个数：查构成，有几个2、几个1
        res = ''
        count = 1
        for index, char in enumerate(pre):
            # count部分：下一个数与当前数一样
            if index < len(pre) - 1 and pre[index] == pre[index + 1]:
                count += 1
            # 结束count: 下一个数不一致
            else:
                res += str(count)
                res += char
                count = 1
        return res
~~~
