---
layout: project
title: '146-LRU Cache'
date: 01 July 2020

---
## 题意
> Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.
> Implement the LRUCache class:
> - LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
> - int get(int key) Return the value of the key if the key exists, otherwise return -1.
> - void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
> Follow up:
> - Could you do get and put in O(1) time complexity?

~~~python
Example 1:
Input
["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
Output
[null, null, null, 1, null, -1, null, -1, 3, 4]

Explanation
LRUCache lRUCache = new LRUCache(2);
lRUCache.put(1, 1); // cache is {1=1}
lRUCache.put(2, 2); // cache is {1=1, 2=2}
lRUCache.get(1);    // return 1
lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
lRUCache.get(2);    // returns -1 (not found)
lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
lRUCache.get(1);    // return -1 (not found)
lRUCache.get(3);    // return 3
lRUCache.get(4);    // return 4
~~~

## 思路
- 使用OrderedDict()实现hashmap
- 根据输入的顺序排序，可选择pop出第一个或最后一个

~~~python
class LRUCache(object):

    def __init__(self, capacity):
        """
        :type capacity: int
        """
        from collections import OrderedDict
        self.capacity = capacity
        self.cache = OrderedDict()

    def get(self, key):
        """
        :type key: int
        :rtype: int
        """
        # 每次get：remove再重新加一次 -> 改变在dict中的顺序
        # 返回更新的值
        if key in self.cache:
            temp = self.cache.pop(key)
            self.cache[key] = temp
            return self.cache[key]
        else:
            return -1

    def put(self, key, value):
        """
        :type key: int
        :type value: int
        :rtype: None
        """
        
        if key in self.cache: #先pop,再更新
            self.cache.pop(key)
            self.cache[key] = value
        else: # 判断capactiy是否满：如果满了，pop出最先进来的
            if len(self.cache.keys()) == self.capacity:
                self.cache.popitem(last = False)    
            
            self.cache[key] = value
       

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache(capacity)
# param_1 = obj.get(key)
# obj.put(key,value)
~~~
