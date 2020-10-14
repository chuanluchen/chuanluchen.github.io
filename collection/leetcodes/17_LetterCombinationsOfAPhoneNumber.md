---
layout: project
title: '17-Letter Combinations of a Phone Number'
date: 01 July 2020

---
## 题意
> Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
> A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
> Example 1:
> - Input: digits = "23"
> - Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
>
> Example 2:
> - Input: digits = ""
> - Output: []
> 
> Example 3:
> - Input: digits = "2"
> - Output: ["a","b","c"]
> 
> Constraints:
> - 0 <= digits.length <= 4
> - digits[i] is a digit in the range ['2', '9'].

## 思路
- 回溯法: 不能有重复元素，加index
- 预先定义数字和字符串的mapping

~~~python
class Solution(object):
    def letterCombinations(self, digits):
        """
        :type digits: str
        :rtype: List[str]
        """
        # 预先定义可选元素
        mapping = ['0','1','abc','def','ghi','jkl','mno','pqrs','tuv','wxyz']
        
        # 回溯法模板：不重复 ->加index控制digits走到的位置
        res = []
        if digits=='': return res
        
        def backtrack(res, temp, digits, index):
            if len(temp) == len(digits):
                res.append(temp[:])
                return
            
            # 取出当前
            letters = mapping[int(digits[index])]
            for s in letters:
                temp += s
                backtrack(res, temp, digits, index+1)
                temp = temp[:-1]
                
        backtrack(res, '', digits, 0) # temp在本题中是字符串
        return res
~~~

## 分析
- Time: O(3^n) <-数学思路：第一位取法3* 第二位取法3*....
- Space:O(n) <-只用了一个list
