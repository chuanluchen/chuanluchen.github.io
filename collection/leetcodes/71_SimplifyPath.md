---
layout: project
title: '71-Simplify Path'
date: 01 July 2020

---
## 题意
> Given an absolute path for a file (Unix-style), simplify it. Or in other words, convert it to the canonical path.
> In a UNIX-style file system, a period '.' refers to the current directory. Furthermore, a double period '..' moves the directory up a level.
> Note that the returned canonical path must always begin with a slash '/', and there must be only a single slash '/' between two directory names. The last directory name (if it exists) must not end with a trailing '/'. Also, the canonical path must be the shortest string representing the absolute path.

~~~python
Example 1:
Input: path = "/home/"
Output: "/home"
Explanation: Note that there is no trailing slash after the last directory name.

Example 2:
Input: path = "/../"
Output: "/"
Explanation: Going one level up from the root directory is a no-op, as the root level is the highest level you can go.

Example 3:
Input: path = "/home//foo/"
Output: "/home/foo"
Explanation: In the canonical path, multiple consecutive slashes are replaced by a single one.

Example 4:
Input: path = "/a/./b/../../c/"
Output: "/c"
~~~

## 思路
- 栈：压栈匹配
- 将原始路径简化

~~~python
class Solution(object):
    def simplifyPath(self, path):
        """
        :type path: str
        :rtype: str
        """
        stack =[]
        if not path: return ''
        
        # 建原路径split成list: 有可能'', ., .., xx
        pathList = path.split('/')
        
        for p in pathList:
            if p !='' and p!='.' and p!='..':
                stack.append(p)
            
            # 遇.., 回上一级
            if p == '..' and stack: 
                stack.pop()
                
        return '/' + '/'.join(stack)
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
