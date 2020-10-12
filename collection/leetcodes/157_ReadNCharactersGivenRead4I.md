---
layout: project
title: '157-Read N Characters Given Read4 I'
date: 01 July 2020

---
## 题意
> The API: int read4(char *buf) reads 4 characters at a time from a file.
> The return value is the actual number of characters read.
> For example, it returns 3 if there is only 3 characters left in the file.
> By using the read4 API, implement the function int read(char *buf, int n) that reads n characters from the file.

## 思路
- 任务：将能读的字符串读进buf, 返回读的数量
- 从空间角度考虑
  - read4空间为4，可以多次run：返回值为4或<4的数
  - readn空间为n, 只能run一次：返回值为n或<n的数
  - index记录当前读入的数量
  - read4每run一次之后，要查看buf还剩多少空间 n-index -> 把read4读进的东西能放多少放多少

~~~python
class Solution(object):
    def read(self, buf, n):
        """
        :type buf: Destination buffer (List[str])
        :type n: Number of characters to read (int)
        :rtype: The number of actual characters read (int)
        """
        # n:当前方法一次读多少个字符，end_buf的长度
        # buf4: read4的buffer
        # buf: readn的buffer
        # count：read4的计数
        # index：readn的计数
        buf4 = ['']*4
        index = 0
        while True:
            count = read4(buf4)
            count = min(count, n-index) #read4可读入的数量 vs. readn缓存还有多少剩余
            # 根据空间大小：把字符逐个从buf4拷进buf
            for i in range(count):
                buf[index] = buf4[i]
                index += 1
            if count < 4 or index == n:  #结束条件：全部读完 or 到达buf上限
                return index
~~~
