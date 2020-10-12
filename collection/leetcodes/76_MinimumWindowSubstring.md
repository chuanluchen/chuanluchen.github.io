---
layout: project
title: '76-Minimum Window Substring'
date: 01 July 2020

---
## 题意
> Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).
> 
> Example:
> - Input: S = "ADOBECODEBANC", T = "ABC"
> - Output: "BANC"
> Note:
> - If there is no such window in S that covers all characters in T, return the empty string "".
> - If there is such window, you are guaranteed that there will always be only one unique minimum window in S.

## 思路
- 用双指针 left 和 right 表示一个窗口。
- right 向右移增大窗口，直到窗口包含了所有要求的字母。进行第二步。
- left 向右移动，开始减少长度，每减少一次，就更新最小长度。直到当前窗口不包含所有字母，回到第 1 步。


~~~python
class Solution:
    def minWindow(self, s, t):
        # 对t进行count sort
        count_t= collections.Counter(t)
        # 控制t中字母是否都包含
        len_t = len(t)
        left = ans_left = ans_right = 0
        # 遍历s
        for right, c in enumerate(s, 1): # 右窗口要从1找起
            # 确定right: s中出现t中的字母-> 从count sort中减去,len_t
            len_t -= count_t[c] > 0
            count_t[c] -= 1
            
            # t中字母全部找到:缩小窗口，向右移动left
            if not len_t:
                while left < right and count_t[s[left]] < 0:
                    count_t[s[left]] += 1 # 窗口移出left字母，count sort中加回
                    left += 1
                # update 最小窗口
                if not ans_right or right - left <= ans_right - ans_left:
                    ans_left, ans_right = left, right
        return s[ans_left:ans_right]

~~~

## 分析
- Time: O(n)   s：right走一遍，left走一遍
- Space: O(n)   t: count sort
