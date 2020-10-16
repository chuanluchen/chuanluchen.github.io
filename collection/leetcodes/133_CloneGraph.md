---
layout: project
title: '133-Clone Graph'
date: 01 July 2020

---
## 题意
> Given a reference of a node in a connected undirected graph.
> Return a deep copy (clone) of the graph.
> Each node in the graph contains a val (int) and a list (List[Node]) of its neighbors.

~~~python
class Node {
    public int val;
    public List<Node> neighbors;
}
~~~

## 思路
- Deep copy: 以某种方式遍历[BFS]所有点 -> 先用node.val new一个新的点，再copy对应的neighbors列表（需要hashmap找到对应的新点）
- 用queue实现BFS遍历
- Hashmap存放旧点：新点映射

~~~python
"""
# Definition for a Node.
class Node(object):
    def __init__(self, val = 0, neighbors = None):
        self.val = val
        self.neighbors = neighbors if neighbors is not None else []
"""

class Solution(object):
    def cloneGraph(self, node):
        """
        :type node: Node
        :rtype: Node
        """
        if not node: return node
        
        hashmap = dict() # 存放oldNode:newNode
        queue = []
        visited = set()
        
        queue.append(node)
        visited.add(node)
        
        while queue:
            size = len(queue)
            for i in range(size):
                curNode = queue.pop(0)
                copy  = Node(curNode.val) # 用pop出来的node val新建一个node -> 作为copy
                hashmap[curNode] = copy # 建立旧：新node的对照
                for n in curNode.neighbors: # BFS继续遍历
                    if n not in visited:
                        queue.append(n)
                        visited.add(n)
        # copy neighbors
        for oldNode, newNode in hashmap.items():
            for neighbor in oldNode.neighbors:# 旧点-> 旧neighbors 
                newNode.neighbors.append(hashmap[neighbor]) # 在hashmap中找对应新点，加入新点Neighbors列表
                
        return hashmap[node]
                
~~~

## 分析
- Time: O(n)
- Space: O(n)
