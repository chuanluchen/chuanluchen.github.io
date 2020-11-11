---
layout: project
title: '算法总结'
date: 01 May 2020
screenshot: /assets/img/projects/code/sort.jpeg
---
- [递归](#递归)
- [排序](#排序)
- [二分法查找](#二分法查找)
- [链表](#链表)
- [回溯法](#回溯法)
- [图](#图)
- [树](#树)
- [贪心算法](#贪心算法)
- [HashMap](#HashMap)
- [动态规划](#动态规划)
{:toc}

## 递归
- Fibonacci 

  ~~~python
  '''
  0 1 1 2 3 5 8 13 20...
  '''
  
  # 递归
  def fibonacci1(num):
      if num<=1: return num
      return fibonacci1(num-1) + fibonacci1(num-2)
  
  
  # 迭代
  def fibonacci2(num):
      a, b = 0, 1
      for i in range(num):
          a, b = b, a + b # 生成序列 1, 1
      return a
  
  # 记忆化搜索:Memorization
  # 把递归的中间结果记录下来，避免重复计算
  memo={}
  def fibonacci3(num):
      memo = {0:0, 1:1}
      if num not in memo:
          memo[num] = fibonacci3(num-1) + fibonacci3(num-2)
      return memo[num]
  
  # 动态规划
  # 将原问题拆解尘个若干子问题
  # 自下而上，对每个子问题求解，记录结果
  # 通过之前结果推导新问题的解
  def fibonacci4(num):
      if num <= 1: return num
      dp =[0] *(num + 1)
      dp[0] = 0
      dp[1] = 1
      for i in range(2,num+1):
          dp[i] = dp[i-1] + dp[i-2]
      return dp[num]
  
  ~~~

- 递归的时间复杂度：元素个数
- 递归的空间复杂度：层数


## 排序
#### 冒泡排序 
- 核心：每次找未排序部分的最大值，两两swap,顶到最后面排好序的头部
- 方法
  - 外部遍历i：头->尾
  - 内部遍历j：未排序部分【排好序部分在尾部i个】
  - 比较相邻两个元素nums[j], nums[j+1]-> 顺序不对， swap
- Time
  - 最好：O(n) 已排好序的序列
  - 最差：O(n^2)两层loop
  - 平均：O(n^2) <- 两层loop
- Space
  - O(1)
- 稳定性
  - 相邻swap:Stable

![img](https://chuanluchen.github.io/assets/img/projects/code/sort/BubbleSort.gif)

~~~Python
def bubbleSort(nums):
    for i in range(len(nums)-1): # 全部长度
        for j in range(len(nums)-i-1): # 尾部已排好序部分不参与
            if nums[j]> nums[j+1]:
                nums[j], nums[j+1] = nums[j+1],nums[j]
    return nums
~~~

#### 选择排序

- 核心：遍历元素，每次找未排序部分的最小值，跟当前元素swap
- 方法
  - 外部遍历i：头->尾
  - 内部遍历j：i+1 -> 尾
  - 找到j部分最小值，swap到i位置
- Time
  - O(n^2)无论如何都要两层loop
- Space
  - O(1)
- 稳定性
  - 任意swap:Not Stable

![img](https://chuanluchen.github.io/assets/img/projects/code/sort/SelectionSort.gif)

~~~python
# 选择排序
def selectionSort(nums):
    for i in range(len(nums) - 1):
        minIndex  = i
        for j in range(i+1, len(nums)):
            if nums[j] < nums[minIndex]:
                minIndex = j
        nums[i], nums[minIndex] = nums[minIndex], nums[i]
    return nums
~~~

#### 插入排序 

- 核心：每次从未排序序列中移除一个，插入到前面已排序序列中
- 方法
  - 外部遍历i：头->尾-1
  - 内部遍历j：i+1 -> 0
  - 通过swap将nums[j]插入到合适位置
- Time
  - 最好：O(n)内部循环都不需要走
  - 最坏：O（n^2）
  - 平均：O（n^2）
- Space
  - O(1)
- 稳定性
  - 相邻swap:Stable

![img](https://chuanluchen.github.io/assets/img/projects/code/sort/InsertionSort.gif)

~~~python
# 插入排序
def insertionSort(nums):
    for i in range(len(nums)-1):
        for j in range(i+1, 0, -1):
            if nums[j] < nums[j-1]:
                nums[j-1],nums[j] = nums[j],nums[j-1]
            else: break
    return nums
~~~

#### 归并排序 
- 核心：分治 + 归并
- 方法
  - 分治过程：将一个序列递归进行二分，直到每个部分只有一个元素
  - 归并：两两合并，按顺序排序 -> 合并已排好的序列成为更大的序列
- Time
  - O(nlogn)
- Space
  - O(n)
- 稳定性
  - 分解到1， 相邻swap:Stable

![img](https://chuanluchen.github.io/assets/img/projects/code/sort/MergeSort.gif)

~~~python
# 归并排序
def mergeSort(nums):
    # 归并过程
    def merge(left, right):
        res = []
        i = j = 0
        while i < len(left) and j < len(right):
            if left[i] <= right[j]:
                res.append(left[i])
                i += 1
            else:
                res.append(right[j])
                j += 1
        res = res + left[i:] + right[j:] # left或right有剩余，加到最后
        return res
    # 分治过程
    if len(nums) <= 1:return nums
    mid = len(nums) // 2
    left = mergeSort(nums[:mid])
    right = mergeSort(nums[mid:])
    return merge(left, right)
~~~

#### 快速排序
- 核心：分治 + 递归
- 方法
  - 分治：指定pivot（一般为最左边），找到合适的index-> 分为两部分：左边全小于pivot，右边全大于pivot
  - 递归：针对左右两边分别递归调用quickSort
- Time
  - 最好O(nlogn)
  - 最坏O(n^2)
  - 平均O(nlogn)
- Space
  - O(n)
- 稳定性
  - 任意swap:Not Stable

![img](https://chuanluchen.github.io/assets/img/projects/code/sort/QuickSort.gif)

~~~python
def quickSort(nums, left, right):
    # 分治
    def partition(nums, left, right):
        pivot = nums[left]
        while left < right:
            while left < right and nums[right] >= pivot:
                right -= 1
            nums[left] = nums[right]  # 此时right走到的位置，比pivot小
            while left < right and nums[left] <= pivot:
                left += 1
            nums[right]  = nums[left]  # 此时left走到位置，比pivot大
        nums[left] = pivot  # Pivot应该出现的位置， left, 也可以为 nums[right] = pivot
        return left 

    # 递归
    if left < right:
        pivotIndex = partition(nums, left, right)
        quickSort(nums, left, pivotIndex - 1)  # 左序列
        quickSort(nums, pivotIndex + 1, right)  # 右序列
    return nums
~~~


## 二分法查找
- 时间复杂度要求为O(logn)的：考虑二分查找 or Heap(Priority Queue)
~~~python
'''
找法1: left/right重合
判断条件left <= right
向左向右闭区间：[left, mid - 1], [mid + 1, right]
找到target: target = mid = left, right = left + 1
找不到target: right < target < left, left = right + 1
'''
def binarySearch1(nums, target):
    left, right= 0, len(nums) - 1
    while left <= right:
        mid = left + (right - left) //2
        if target == nums[mid]: return mid
        elif target < nums[mid]: right = mid - 1
        else: left = mid + 1
    return -1
'''
找法2：left/ right永不重合，找range
判断条件 left + 1 < right
左右找区间：[left, mid],[mid, right]
找到target: target = mid, 或者在[left, right]区间中-> 需要额外判断
找不到target: left+1 = right, left < target < right
'''
def binarySearch2(nums, target):
    left, right = 0,len(nums) - 1
    while left + 1 < right:
        mid = left + (right - left) //2
        if target == nums[mid]: return mid
        elif target < nums[mid]: right = mid
        else: left = mid
    if target == nums[left]: return left
    if target == nums[right]: return right
    return -1
~~~


## 链表

- 更改头节点，需要创建dummy
- 判断链表是否有环：快慢针


## 回溯法

**需要枚举所有结果：用回溯法**

- Backtrack必备参数：res, temp, nums
- 结果中不能有重复组合：加start /index控制可选元素的index
  - 排列问题：需要每次递归index +1
  - 其它[组合]问题：若允许元素重复，不必index+1
- 结果指定元素个数：加k控制层次，递归一次k-1, 结束条件k = 0
- 备选中有重复元素：
  - 预先对数组排序 + 用boolean数组 used 控制
  - 每个元素只用一次：预先对数组排序 + 遇相同数字跳过【if i>0 and nums[i] == nums[i-1]: continue】
- 有附加条件【sum】：加target

~~~python
res = []

if not nums: return res

backtrack(res, temp, nums, start/index):
    if ...: # 结束条件：len(temp) == len(nums)
        res.append(temp[:])
        return
      
    for i in range(start/index, len(nums))： # 控制遍历条件:是否走重复路线
    		temp.append(nums[i])
        backtrack(res, temp, nums, i + 1) # 不走回头的写法
        temp.pop() # 退回一层
  
backtrack(res, [], nums, 0)
return res
~~~


## 图

- BFS：用于最短路径
- DFS：是否连通，连通分量，路径，环

#### BFS

- 从根节点开始，逐层遍历（类似数的层次遍历），直到所有节点被走完
- 使用queue实现
- 一层一层遍历

~~~python
graph = {
    "A":["B", "C"],   # 与A相连的节点是B,C
    "B":["A", "C", "D"], # 与B相连的节点是A,C,D
    "C":["A", "B", "D", "E"],
    "D":["B", "C", "E", "F"],
    "E":["C", "D"],
    "F":["D"]
 }

def BFS(graphNode, root):
    queue = []  #用数组定义queue
    visited = set() # 用set定义set,备选集合，不走重复路

    # 访问一个节点：加入queue, visited
    queue.append(root)
    visited.add(root)

    while queue:
        size = len(queue)  #### optional: 可加入size控制每一层次的信息
        for i in range(size):####optional
            node = queue.pop(0)
            print(node)
            neighbors= graph[node]
            for n in neighbors: # 遍历某个点的子节点
                if c not in visited: # 如果子节点还没有被访问过，加入queue, 加入visited
                    queue.append(n)
                    visited.add(n)

BFS(graph,'E')
~~~

#### DFS

- 从根节点开始，沿着某个节点路径往深层遍历（类似树的先序遍历），走到头退回
- 一条道走到黑
- 用stack实现

~~~python
graph = {
    "A":["B", "C"],
    "B":["A", "C", "D"],
    "C":["A", "B", "D", "E"],
    "D":["B", "C", "E", "F"],
    "E":["C", "D"],
    "F":["D"]
 }

def DFS(graph, root):
    stack = [] #用数组实现栈
    visited  = set() # 用set定义visited
    # 加入根节点
    stack.append(root)
    visited.add(root)

    while stack:
        node = stack.pop()
        neighbors = graph[node]
        for n in neighbors:
            if n not in visited:
                stack.append(n)
                visited.add(n)
        print(node)

DFS(graph,'E')
~~~


## 树

- PreOrder是所有遍历方式中最通用的方式，经常与backtracking结合
- InOrder与BST有关

~~~python
class TreeNode(object):
    def __init__(self, val = 0, left = None, right= None):
        self.val = val
        self.left = left
        self.right = right

''' 构建一棵树
      1
    ↙︎  ↘︎
   2    3
  ↙︎↘︎    ↙︎↘︎
4   5  6   7
'''
a = TreeNode(1)
b = TreeNode(2)
c = TreeNode(3)
d = TreeNode(4)
e = TreeNode(5)
f = TreeNode(6)
g = TreeNode(7)

a.left = b
a.right = c
b.left = d
b.right = e
c.left = f
c.right = g

# 前序遍历-递归:中左右
def preOrder(root):
    if not root: return []
    return [root.val] + preOrder(root.left) + preOrder(root.right)


# 前序遍历-迭代:中左右
# stack：先append根节点，然后按先右后左入栈
def preOrder2(root):
    res = []
    if root == None: return res
    stack = [root] # stack实现：后进后出，先放右再放左
    while stack:
        #print(root.val)
        cur = stack.pop()
        res.append(cur.val)
        if cur.right: stack.append(cur.right)
        if cur.left: stack.append(cur.left)
    return res


# 中序遍历-递归：左中右
def inOrder(root):
    if not root: return []
    return inOrder(root.left) + [root.val] + inOrder(root.right)

# 中序遍历-迭代：左中右
# stack:不断地找左子树 cur = cur.left, 走到头pop出cur,找右边
def inOrder2(root):
    res = []
    if root == None: return res
    stack =[]
    cur = root # 把当前root提取出来
    while stack or cur:
        if cur:# 当前root不为空的前提下，不断把左子树加入stack
            stack.append(cur)
            cur  = cur.left
        else: # 左边走到头，pop出node, 打印node.val, 往右
            cur = stack.pop()
            #print(cur.val)
            res.append(cur.val)
            cur = cur.right
    return res


# 后序遍历-递归：左右中
def postOrder(root):
    if not root: return []
    return postOrder(root.left) + postOrder(root.right) + [root.val]

# 后序遍历-递归：左右中
# stack:先中-左-右入栈，res inset index 0
def postOrder2(root):
    stack = [root]
    res = []
    while stack:
        cur = stack.pop()
        res.insert(0,cur.val)
        if cur.left: stack.append(cur.left)
        if cur.right: stack.append(cur.right)
    return res


# 层次遍历
# queue实现：每层pop出，加入level
def levelOrder(root):
    res = []
    if not root: return res
    queue = [root]

    while queue:
        size = len(queue)
        level = []
        for i in range(size):
            cur = queue.pop(0)
            if cur.left: queue.append(cur.left)
            if cur.right: queue.append(cur.right)
            level.append(cur.val)
        res.extend(level)
    return res
~~~

## 贪心算法

- 解决：最大，最小，极值问题

- 不看整体结果，只看局部最优。由局部最优推测整体最优

~~~python
# 贪心算法没有模型，应用的是贪心思想
# res or 排序处理
for / while:
  	max/min() # 求局部极值
    # 前进一步
~~~

## HashMap
~~~python
from collections import defaultdict
hashmap = defaultdict(int) # key不存在的时候返回默认值，可以是int/ str/ list

from colelctions import OrderedDict
hashmap = OrderedDict() # 默认按输入顺序排序
hashmap.popitem(last=False) # last=False FIFO / last=True LIFO

# 按key排序
kd = collections.OrderedDict(sorted(dd.items(), key=lambda t: t[0]))
# 按value排序
vd = collections.OrderedDict(sorted(dd.items(),key=lambda t:t[1]))
~~~


## 动态规划

- 自下而上求解

- 先求简单情况下的结果，用dp数组存起来 -> 初始化状态矩阵

- 找状态转移函数 -> 画矩阵，求复杂问题的解

