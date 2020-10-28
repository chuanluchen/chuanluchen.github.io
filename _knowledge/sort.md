---
layout: project
title: '排序算法'
date: 01 May 2020
screenshot: /assets/img/projects/code/sort.jpeg
---

## 冒泡排序

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

<img src="/assets/img/projects/code/sort/BubbleSort.gif"/>

~~~python
def bubbleSort(nums):
    for i in range(len(nums)-1): # 全部长度
        for j in range(len(nums)-i-1): # 尾部已排好序部分不参与
            if nums[j]> nums[j+1]:
                nums[j], nums[j+1] = nums[j+1],nums[j]
    return nums
~~~



## 选择排序

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

<img src="/assets/img/projects/code/sort/SelectionSort.gif"/>

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



##  插入排序

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

<img src="/assets/img/projects/code/sort/InsertionSort.gif"/>

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



## 归并排序

- 核心：分治 +  归并
- 方法
  - 分治过程：将一个序列递归进行二分，直到每个部分只有一个元素
  - 归并：两两合并，按顺序排序 -> 合并已排好的序列成为更大的序列
- Time
  - O(nlogn)
- Space
  - O(n)
- 稳定性
  - 分解到1， 相邻swap:Stable

<img src="/assets/img/projects/code/sort/MergeSort.gif"/>

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



## 快速排序

- 核心：分治 +  递归
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

<img src="/assets/img/projects/code/sort/QuickSort.gif"/>

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

