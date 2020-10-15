---
layout: project
title: '93-Restore IP Addresses'
date: 01 July 2020

---
## 题意
> Given a string s containing only digits, return all possible valid IP addresses that can be obtained from s. You can return them in any order.
> A valid IP address consists of exactly four integers, each integer is between 0 and 255, separated by single dots and cannot have leading zeros. For example, "0.1.2.201" and "192.168.1.1" are valid IP addresses and "0.011.255.245", "192.168.1.312" and "192.168@1.1" are invalid IP addresses. 
> Example 1:
> - Input: s = "25525511135"
> - Output: ["255.255.11.135","255.255.111.35"]
>
> Example 2:
> - Input: s = "0000"
> - Output: ["0.0.0.0"]
>
> Example 3:
> - Input: s = "1111"
> - Output: ["1.1.1.1"]
>
> Example 4:
> - Input: s = "010010"
> - Output: ["0.10.0.10","0.100.1.0"]
>
> Example 5:
> - Input: s = "101023"
> - Output: ["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"]
>
> Constraints:
> - 0 <= s.length <= 3000
> - s consists of digits only.

## 思路
- 回溯法
- 输出4段数字：count控制，每count一次加'.', 末尾不加
- i控制每段内部数位：1~3， 总体<256

~~~python
class Solution(object):
    def restoreIpAddresses(self, s):
        """
        :type s: str
        :rtype: List[str]
        """
        res = []
        
        def backtrack(res, temp_s, s, index, count):
            if count > 4: return
            if count == 4 and index == len(s):
                res.append(temp_s[:])
                return
            
            for i in range(1, 4): # 每段数字的位置：1~3
                if index + i > len(s): break
                temp = s[index:index + i]
                if temp[0] =='0' and len(temp) > 1: continue
                if i==3 and int(temp) > 255: continue
                backtrack(res, temp_s+temp +('' if count ==3 else '.'), s, index + i, count +1)
                
        backtrack(res, '', s, 0, 0)
        return res
~~~
