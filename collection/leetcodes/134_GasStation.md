---
layout: project
title: '134-Gas Station'
date: 01 July 2020

---
## 题意
> There are N gas stations along a circular route, where the amount of gas at station i is gas[i].
> You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from station i to its next station (i+1). You begin the journey with an empty tank at one of the gas stations.
> Return the starting gas station's index if you can travel around the circuit once in the clockwise direction, otherwise return -1.
> Note:
> - If there exists a solution, it is guaranteed to be unique.
> - Both input arrays are non-empty and have the same length.
> - Each element in the input arrays is a non-negative integer.

~~~python
Example 1:
Input: 
gas  = [1,2,3,4,5]
cost = [3,4,5,1,2]

Output: 3

Explanation:
Start at station 3 (index 3) and fill up with 4 unit of gas. Your tank = 0 + 4 = 4
Travel to station 4. Your tank = 4 - 1 + 5 = 8
Travel to station 0. Your tank = 8 - 2 + 1 = 7
Travel to station 1. Your tank = 7 - 3 + 2 = 6
Travel to station 2. Your tank = 6 - 4 + 3 = 5
Travel to station 3. The cost is 5. Your gas is just enough to travel back to station 3.
Therefore, return 3 as the starting index.

Example 2:
Input: 
gas  = [2,3,4]
cost = [3,4,3]

Output: -1

Explanation:
You can't start at station 0 or 1, as there is not enough gas to travel to the next station.
Let's start at station 2 and fill up with 4 unit of gas. Your tank = 0 + 4 = 4
Travel to station 0. Your tank = 4 - 3 + 2 = 3
Travel to station 1. Your tank = 3 - 3 + 3 = 3
You cannot travel back to station 2, as it requires 4 unit of gas but you only have 3.
Therefore, you can't travel around the circuit once no matter where you start.
~~~

## 思路
- 贪心算法
- 数学定理：如果一个数组总和非负，那么一定可以找到一个起始位置，从此处开始遍历一圈，累加和一直都是非负的
- 找连续和>0：把全部的油耗情况计算出来看看是否大于等于0即可

~~~python
class Solution(object):
    def canCompleteCircuit(self, gas, cost):
        """
        :type gas: List[int]
        :type cost: List[int]
        :rtype: int
        """
        if not gas or not cost or len(gas)!= len(cost): return -1
        start = 0 # 记录当前起点
        remain = 0 # 当前tank剩余
        debt = 0 # 从0开始走的欠债
        
        for i in range(len(gas)):
            remain += gas[i] - cost[i] # 这一站加油 - 到下一站花费 -> 没站积累
            if remain < 0:
                start = i + 1 # 从下一站开始继续验证
                debt += remain # 把前面欠债记录下来，避免重复计算
                remain = 0 # 重置邮箱
        
        return start if remain + debt >= 0 else -1
~~~

## 分析:
- Time: O(n) 
- Space: O(1) 
