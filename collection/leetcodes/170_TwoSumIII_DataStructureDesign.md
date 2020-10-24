---
layout: project
title: '170-Two Sum III- Data structure design'
date: 01 July 2020

---
## 题意
> Design a data structure that accepts a stream of integers and checks if it has a pair of integers that sum up to a particular value.
> Implement the TwoSum class:
> - TwoSum() Initializes the TwoSum object, with an empty array initially.
> - void add(int number) Adds number to the data structure.
> - boolean find(int value) Returns true if there exists any pair of numbers whose sum is equal to value, otherwise, it returns false.

~~~python
Example 1:
Input
["TwoSum", "add", "add", "add", "find", "find"]
[[], [1], [3], [5], [4], [7]]
Output
[null, null, null, null, true, false]

Explanation
TwoSum twoSum = new TwoSum();
twoSum.add(1);   // [] --> [1]
twoSum.add(3);   // [1] --> [1,3]
twoSum.add(5);   // [1,3] --> [1,3,5]
twoSum.find(4);  // 1 + 3 = 4, return true
twoSum.find(7);  // No two integers sum up to 7, return false
~~~

## 思路
- 实现题：HashMap

~~~python
class TwoSum(object):

    def __init__(self):
        """
        Initialize your data structure here.
        """
        from collections import defaultdict
        self.hashmap =  defaultdict(int)

    def add(self, number):
        """
        Add the number to an internal data structure..
        :type number: int
        :rtype: None
        """
        self.hashmap[number] += 1
                

    def find(self, value):
        """
        Find if there exists any pair of numbers which sum is equal to the value.
        :type value: int
        :rtype: bool
        """
        for key in self.hashmap.keys():
            num2 = value - key
            if num2==key and self.hashmap[key] >1: return True
            if num2!= key and num2 in self.hashmap: return True
        return False      


# Your TwoSum object will be instantiated and called as such:
# obj = TwoSum()
# obj.add(number)
# param_2 = obj.find(value)
~~~
